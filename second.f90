! Time-stamp: <2020-03-26 23:27:49 lockywolf>
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
     final :: scheme_string_deallocate
  end type scheme_string
  type, extends( scheme_object ) :: scheme_number
  end type scheme_number

  type, extends( scheme_object ) :: scheme_pair
     contains
     final :: scheme_pair_deallocate
  end type scheme_pair

  type, extends( scheme_object ) :: scheme_symbol
   contains
     procedure :: generic_scheme_print => print_scheme_symbol
  end type scheme_symbol

  type, extends( scheme_object ) :: scheme_empty_list
  end type scheme_empty_list

  type(scheme_empty_list), target :: the_null
  
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
  subroutine scheme_string_deallocate( this )
    type(scheme_string) :: this
    deallocate( this%value )
  end subroutine scheme_string_deallocate
  
  subroutine scheme_pair_deallocate( this )
    type(scheme_pair) :: this
    deallocate( this%value )
  end subroutine scheme_pair_deallocate
    
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

  function parse_string( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
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
    arg => arg(caret:)
  end function parse_string

  function parse_symbol( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
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
    arg => arg(caret:)
  end function parse_symbol

  function cons( a, b) result( retval )
    class(scheme_object), target :: a
    class(scheme_object), target :: b
    type(scheme_pair), pointer :: retval
    the_cars(free)%contents => a
    the_cdrs(free)%contents => b
    allocate( retval )
    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
  end function cons
  
  
  recursive function parse_list( arg ) result( retval )
    character(:), pointer :: arg
    class(scheme_object), pointer :: retval
    do while (arg(1:1) == ' ')
       arg => arg(2:)
    end do
    if (arg(1:1) == ")") then
       retval => the_null
       return
    end if
    retval => cons( parse_sexp(arg), parse_list( arg ) )
  end function parse_list
  
  function parse_sexp( arg ) result( retval )
    character(:), pointer :: arg
    class(scheme_object), pointer :: retval

    select case (arg(1:1))
    case ('(')
       print *, "debug: parsing list"
       arg => arg(2:)
       retval => parse_list( arg )
    case ('"')
       retval => parse_string( arg ) ! returns sexp and moves arg
    case ("'")
       print *, "debug: parse quote"
    case ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
       print *, "debug: parse number"
    case ( ')' )
       error stop "Closing parenthesis should be processed in parse_list"
       retval => the_null
    case default
!       print *, new_line('a'), "debug: parse symbol"
      
       retval => parse_symbol( arg )
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

  subroutine test2() ! does (cons 1 "hello")
    type(scheme_number), pointer :: a
    type(scheme_string), pointer :: b
    
    type(scheme_pair) :: retval
    character(len=*), parameter :: teststring = "hello"
    allocate(scheme_number :: a)
    allocate(scheme_string :: b)
    allocate( integer :: a%value )
    a%value = 1
    b%value = teststring ! does automatic allocation work?
    the_cars(free)%contents => a
    the_cdrs(free)%contents => b
    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
  end subroutine test2

  ! the idea of the following is like this: the only case when the
  ! cons-memory garbage collector cannot reach for the string is when
  ! this value is returned from a call. 
  subroutine test3(retval) ! does make-string
    type(scheme_string), intent(out) :: retval
    allocate( retval%value, source="hello" ) ! when this object dies,
    ! the finaliser should kill the string itself
  end subroutine test3
  
  
end module scheme

program main
  use :: scheme, only : scheme_object, scheme_string, scheme_pair, &
       scheme_symbol, remove_junk, parse_sexp
  use, intrinsic :: iso_fortran_env
  use, non_intrinsic :: system_interface, only: c_exit, read_until_eof
  implicit none
  integer :: fake = 0
  class(scheme_object), pointer :: parsed_expression  
  character(len=:), allocatable, target :: test_string
  character(len=:), pointer     :: test_string_pointer
  !class(scheme_object), pointer :: test_object
  !test_object => read_sexp()
  ! 001 write (output_unit,'(a,i1)') "Hello, world, ", counter
  !   allocate(scheme_string :: test_object) ! memory leak?
  !   counter = counter + 1
  !   nullify( test_object )
  !   if (counter < 3) goto 001
  
  test_string =  read_until_eof()
  !print *, "debug", test_string
  test_string = remove_junk( test_string ) ! test_string should be a string
  test_string_pointer => test_string
  parsed_expression => parse_sexp( test_string_pointer ) 
  print *, parsed_expression
  fake = c_exit(0)
  stop 0
contains

end program main

