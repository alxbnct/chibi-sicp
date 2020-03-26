! Time-stamp: <2020-03-26 14:35:04 lockywolf>
! Author: lockywolf gmail.com
! A rudimentary scheme interpreter

module system_interface
  use, intrinsic :: iso_c_binding, only: c_int
  use, intrinsic :: iso_fortran_env, only: input_unit
  implicit none
  interface
     integer (c_int) function c_exit(x) bind(c, name="exit")
       import :: c_int
       integer(c_int), value :: x
     end function c_exit
  end interface
contains
  function read_until_eof() result( retval )
    character(len=:), allocatable :: retval
    character(len=1) :: buffer
    integer :: dummy
    integer :: reason
    do
       read (input_unit, '(1a)', iostat=reason, advance='no') buffer
       if (is_iostat_end(reason))  then
          !print *, "end of file"
          exit
       else if (reason > 0) then
          print*, "Fortran:read error"
          dummy = c_exit(1) 
       else
          retval = retval//buffer;
       end if
    end do
    !print *, "debug:", retval, new_line('a')
  end function read_until_eof
end module system_interface

module scheme
  use, non_intrinsic :: system_interface, only: c_exit
  implicit none
  integer, parameter :: memory_size = 1024
  integer, parameter :: strings_pool_size = 1024
  integer, parameter :: symbol_pool_size = 1024

  type, abstract :: scheme_object
     class(*), allocatable :: value
   contains
     procedure, pass :: generic_scheme_print => print_scheme_object
     generic, public :: write (formatted) => generic_scheme_print
     !final :: deallocate_scheme_object_value
  end type scheme_object

  !  abstract interface
  !     subroutine scheme_object_printer(this, unit, iotype, v_list,
  !     iostat, iomsg)
  !       import :: scheme_object
  !          class(scheme_object), intent(in) :: this
  !          integer, intent(in)         :: unit
  !          character(*), intent(in)    :: iotype
  !          integer, intent(in)         :: v_list (:)
  !          integer, intent(out)        :: iostat
  !          character(*), intent(inout) :: iomsg
  !    end subroutine scheme_object_printer
  ! end interface


  type, extends( scheme_object ) :: scheme_string
   contains
     procedure :: generic_scheme_print => print_scheme_string
     !      generic :: write (formatted) => print_scheme_string
  end type scheme_string
  type, extends( scheme_object ) :: scheme_number
  end type scheme_number

  type, extends( scheme_object ) :: scheme_pair
  end type scheme_pair

  type, extends( scheme_object ) :: scheme_symbol
   contains
     procedure :: generic_scheme_print => print_scheme_symbol
  end type scheme_symbol

  type, extends( scheme_object ) :: scheme_empty_list
  end type scheme_empty_list

  type, extends( scheme_object ) :: scheme_false
  end type scheme_false

  type, extends( scheme_object ) :: scheme_true
  end type scheme_true

  type, extends( scheme_object ) :: scheme_primitive_procedure
  end type scheme_primitive_procedure

  type scheme_pointer
     class(scheme_object), pointer :: contents
  end type scheme_pointer
  
  type(scheme_pointer), dimension(memory_size) :: the_cars
  type(scheme_pointer), dimension(memory_size) :: the_cdrs
  integer :: free

  
  !  type(scheme_pointer), dimension(strings_pool_size) :: the_strings
  !  type(scheme_pointer), dimension(symbol_pool_size) :: the_symbols ! obarray?
  
  ! interface ! TODO:I want to use something like this for primitive
  !    ! procedures, but not sure
  !    function func( arguments ) result( retval )
  !      import scheme_object
  !      class(scheme_object), pointer :: retval
  !      class(scheme_object), dimension(:), pointer :: arguments
  !    end function func
  ! end interface
  

contains

    
  subroutine print_scheme_object(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_object), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    write (unit, fmt=*, iostat=iostat, iomsg=iomsg) "#<unknown scheme object>"
  end subroutine print_scheme_object

  subroutine print_scheme_string(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_string), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    select type ( temp => this%value )
    type is (character(len=*))
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) &
            '#<scheme_string "' // temp // '">'
    class default
       print *, 'error'
       iostat = c_exit(1)
    end select
  end subroutine print_scheme_string

  subroutine print_scheme_symbol(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_symbol), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    select type ( temp => this%value )
    type is (character(len=*))
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) '#<scheme_symbol "' // temp // '">'
    class default
       print *, 'error'
       iostat = c_exit(1)
    end select
  end subroutine print_scheme_symbol
  
  
  function remove_junk( arg ) result( intermediate )
    character(:), intent(in), allocatable :: arg
    character(:), allocatable :: intermediate
    integer :: i
    logical :: comment_flag = .false.
    character, parameter :: newline = new_line('a')
    print *, new_line('a'), "trace:remove_junk"
    print *, new_line('a'), "remove_junk:arg=", arg
    intermediate = ""
    do i=1,len(arg)
       if (arg(i:i) == ';') then
          comment_flag = .true.
       else if (arg(i:i) == newline) then
          comment_flag = .false.
       end if
       if ((arg(i:i) == newline) .or. comment_flag) then
          cycle
       end if
       intermediate = intermediate//arg(i:i)
    end do
    !print *, new_line('a'), "remove_junk:result=", intermediate
  end function remove_junk

  subroutine parse_string( arg, token, rest )
    character(:), pointer, intent(in) :: arg
    character(:), pointer, intent(out) :: rest
    class(scheme_object), pointer, intent(out) :: token
    integer :: caret = 1
    character(:), allocatable :: interim_string
    interim_string = ""
    allocate( scheme_string :: token )
    allocate( character :: token%value )
    token%value = "BUG1"
    caret = 2 ! skipping the first quotation mark '"'
    do
       if (arg(caret:caret) == '"') then
          exit
       end if
       interim_string = interim_string // arg(caret:caret)
       caret = caret + 1
    end do
    token%value = interim_string
    rest => arg(caret+1:) ! skipping the second quotation mark '"'
  end subroutine parse_string

  subroutine parse_symbol( arg, token, rest )
    character(:), pointer, intent(in) :: arg
    character(:), pointer, intent(out) :: rest
    class(scheme_object), pointer, intent(out) :: token
    integer :: caret = 1
    character(:), allocatable :: interim_string
    interim_string = ""
    allocate( scheme_symbol :: token )
    allocate( character :: token%value )
    token%value = "BUG1"
    caret = 0
    do
       caret = caret + 1
       if (arg(caret:caret) == ' ' .or. arg(caret:caret) == new_line('a')) then
          exit
       end if
       interim_string = interim_string // arg(caret:caret) ! does it reallocate every assignment?
    end do
    token%value = interim_string
    rest => arg(caret+1:) ! at the end will be beyond the 
  end subroutine parse_symbol


  function parse_sexp( arg ) result( retval )
    character(:), allocatable, target :: arg
    character(:), pointer :: arg_pointer 
    class(scheme_object), pointer :: retval
    class(scheme_object), pointer :: token

    select case (arg(1:1))
    case ('(')
       print *, "debug: parsing list"
    case ('"')
!       print *, new_line('a'), "debug: parse string"
       arg_pointer => arg
       call parse_string( arg_pointer, token, arg_pointer )
       retval => token
    case ("'")
       print *, "debug: parse quote"
    case ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
       print *, "debug: parse number"   
    case default
       arg_pointer => arg
!       print *, new_line('a'), "debug: parse symbol"
       call parse_symbol( arg_pointer, token, arg_pointer )
       retval => token
    end select

  end function parse_sexp

  ! function cons( x, y ) result( retval )
  !   type(scheme_object) :: x
  !   type(scheme_object) :: y
  !   type(scheme_pair)   :: retval
    
  !   the_cars(free) = x
  !   the_cars(free) = y
  !   free = free + 1
  ! end function cons
  
  
  subroutine test1() ! does (cons 1 2)
    type(scheme_number), pointer :: a
    type(scheme_number), pointer :: b
    
    type(scheme_pair) :: retval
    
    allocate(scheme_number :: a)
    allocate(scheme_number :: b)
    allocate( integer :: a%value )
    a%value = 1
    allocate( integer :: b%value )
    b%value = 2
    the_cars(free)%contents => a
    the_cdrs(free)%contents => b
    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
  end subroutine test1
  
  
end module scheme

program main
  use :: scheme, only : scheme_object, scheme_string, scheme_pair, &
       scheme_symbol, remove_junk, parse_sexp
  use, intrinsic :: iso_fortran_env
  use, non_intrinsic :: system_interface, only: c_exit, read_until_eof
  implicit none
  integer :: fake = 0
  class(scheme_object), pointer :: parsed_expression  
  character(len=:), allocatable :: test_string
  !class(scheme_object), pointer :: test_object
  !test_object => read_sexp()
  ! 001 write (output_unit,'(a,i1)') "Hello, world, ", counter
  !   allocate(scheme_string :: test_object) ! memory leak?
  !   counter = counter + 1
  !   nullify( test_object )
  !   if (counter < 3) goto 001
  
  test_string =  read_until_eof()
  !print *, "debug", test_string
  test_string = remove_junk( test_string )
  parsed_expression => parse_sexp( test_string ) ! test 1, should return a scheme_string
  print *, parsed_expression
  fake = c_exit(0)
  stop 0
contains

end program main

