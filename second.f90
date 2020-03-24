  ! Time-stamp: <2020-03-24 23:52:00 lockywolf>
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
  integer, parameter :: memory_size = 1024
  integer, parameter :: strings_pool_size = 1024
  integer, dimension(memory_size) :: the_cars
  integer, dimension(memory_size) :: the_cdrs
  character, dimension(strings_pool_size) :: strings_pool


  type, abstract :: scheme_object
     class(*), allocatable :: value
   contains
     procedure, pass :: generic_scheme_print => print_scheme_object
     generic, public :: write (formatted) => generic_scheme_print
  end type scheme_object

  !  abstract interface
  !     subroutine scheme_object_printer(this, unit, iotype, v_list, iostat, iomsg)
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
  type, extends( scheme_object ) :: scheme_pair
  end type scheme_pair
  type, extends( scheme_object ) :: scheme_symbol
  end type scheme_symbol
  type, extends( scheme_object ) :: scheme_empty_list
  end type scheme_empty_list
  type, extends( scheme_object ) :: scheme_false
  end type scheme_false
  type, extends( scheme_object ) :: scheme_true
  end type scheme_true
  type, extends( scheme_object ) :: scheme_primitive_procedure
  end type scheme_primitive_procedure


  
  interface ! TODO:I want to use something like this for primitive procedures, but not sure
     function func( arguments ) result( retval )
       import scheme_object
       class(scheme_object), pointer :: retval
       class(scheme_object), dimension(:), pointer :: arguments
     end function func
  end interface

 
contains
  subroutine print_scheme_object(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_object), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    write (unit, fmt=*, iostat=iostat, iomsg=iomsg) "#<unknown scheme object>"
    !print *, new_line('a'), "trace:print_scheme_object"
    !print *, new_line('a'), "#<unknown scheme object>"
    ! select type ( temp => this%value )
    ! type is (character(len=*))
    !    write (unit, fmt=*, iostat=iostat, iomsg=iomsg) temp
    ! class default
    !    print *, 'error'
    !    iostat = c_exit(1)
    ! end select
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
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) '#<scheme_string "' // temp // '">'
    class default
       print *, 'error'
       iostat = c_exit(1)
    end select
  end subroutine print_scheme_string
  
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
    implicit none
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
    rest => arg(caret+1:)
  end subroutine parse_string
  
  function parse_sexp( arg ) result( retval )
    character(:), allocatable, target :: arg
    character(:), pointer :: arg_pointer 
    class(scheme_object), pointer :: retval
    class(scheme_object), pointer :: token

    select case (arg(1:1))
    case ('(')
       print *, "debug: parsing list"
    case ('"')
       print *, "debug: parse string", new_line('a')
       arg_pointer => arg
       call parse_string( arg_pointer, token, arg_pointer )
       retval => token
    case ("'")
       print *, "debug: parse quote"
    case ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
       print *, "debug: parse number"   
    case default
       print *, "debug: parse symbol"
    end select
    
  end function parse_sexp


  
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

