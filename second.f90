! Time-stamp: <2020-03-29 17:13:56 lockywolf>
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
  use, intrinsic :: iso_fortran_env
  implicit none
  integer, parameter :: memory_size = 1024
  integer, parameter :: strings_pool_size = 1024
  integer, parameter :: symbol_pool_size = 1024

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

  
  type, abstract :: scheme_object
     class(*), allocatable :: value
   contains
     procedure, pass :: generic_scheme_print => print_scheme_object
     procedure, pass :: debug_display => debug_display_object
     generic, public :: write (formatted) => generic_scheme_print
     !final :: deallocate_scheme_object_value
  end type scheme_object

  type, extends( scheme_object ) :: scheme_string
   contains
     procedure :: debug_display => debug_display_string
     procedure :: generic_scheme_print => print_scheme_string
     !      generic :: write (formatted) => print_scheme_string
     final :: scheme_string_deallocate
  end type scheme_string
  type, extends( scheme_object ) :: scheme_number
   contains
     procedure :: debug_display => debug_display_number
  end type scheme_number

  type, extends( scheme_object ) :: scheme_pair
   contains
     procedure :: debug_display  => debug_display_pair
     procedure :: generic_scheme_print => print_scheme_pair
     final :: scheme_pair_deallocate
  end type scheme_pair

  type, extends( scheme_object ) :: scheme_symbol
   contains
     procedure :: debug_display => debug_display_symbol
     procedure :: generic_scheme_print => print_scheme_symbol
  end type scheme_symbol

  type, extends( scheme_object ) :: scheme_empty_list
   contains
     procedure :: debug_display => debug_display_empty_list
     procedure :: generic_scheme_print => print_scheme_empty_list
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
  integer :: free = 1

  
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

  subroutine print_scheme_pair(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_pair), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    select type ( temp => this%value )
    type is (integer)
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) &
            '#<scheme_pair address=', temp, '>'
    class default
       print *, 'error'
       iostat = c_exit(1)
    end select
  end subroutine print_scheme_pair

    subroutine print_scheme_empty_list(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_empty_list), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) &
            '#<scheme_empty_list', '>'
     end subroutine print_scheme_empty_list

  
  subroutine print_scheme_symbol(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_symbol), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    select type ( temp => this%value )
    type is (character(len=*))
       write (unit, fmt='(A)', iostat=iostat, iomsg=iomsg, advance='no') '#<scheme_symbol "' // temp // '">'
    class default
       print *, 'error'
       iostat = c_exit(1)
    end select
  end subroutine print_scheme_symbol


  
  subroutine debug_display_object( this ) ! for the root object
    class(scheme_object), intent(in) :: this
    write (output_unit, fmt='(dt)', advance='no') this
  end
  
  function remove_junk( arg ) result( intermediate )
    character(:), intent(in), allocatable :: arg
    character(:), allocatable :: intermediate
    integer :: i
    logical :: comment_flag = .false.
    character, parameter :: newline = new_line('a')
!    print *, "trace:remove_junk"
!    print *, "remove_junk:arg=", arg
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
    write (*,*) "debug:parse_string", arg
    allocate(interim_string, source="")
    allocate( scheme_string :: token )
    allocate( character :: token%value )
    token%value = "BUG1"
    caret = 1 ! skipping the first quotation mark '"'
    do
       caret = caret + 1
       if (arg(caret:caret) == '"') then
          caret = caret + 1
          exit
       end if
       interim_string = interim_string // arg(caret:caret)
    end do
    token%value = interim_string
    arg => arg(caret:)
  end function parse_string

  function parse_symbol( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
    integer :: caret = 1
    character, parameter, dimension(*) :: allowed_chars = (/ 'a', 'b', 'c', &
         'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', &
         'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'/)
    character(:), allocatable :: interim_string
    allocate( scheme_symbol :: token )
    allocate( character :: token%value )
    allocate( interim_string, source="")
    token%value = "BUG1"
    caret = 0
    do
       caret = caret + 1
       if (.not.any( arg(caret:caret) == allowed_chars )) then
          exit
       end if
       interim_string = interim_string // arg(caret:caret) ! does it reallocate every assignment?
    end do
    token%value = interim_string
    arg => arg(caret:)
  end function parse_symbol

  function parse_number( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
    integer :: caret = 1
    character, parameter, dimension(*) :: allowed_chars = (/ '1', '2', '3', &
         '4', '5', '6', '7', '8', '9', '0' /)
    character(:), allocatable :: interim_string
    allocate( scheme_number :: token )
    allocate( integer :: token%value )
    allocate( interim_string, source="")
    token%value = int(z"DEAD")
    caret = 0
    do
       caret = caret + 1
       if (.not.any( arg(caret:caret) == allowed_chars )) then
          exit
       end if
       interim_string = interim_string // arg(caret:caret) ! does it reallocate every assignment?
    end do
    !token%value = interim_string
    select type (temp => token%value)
    type is (integer)
       read (interim_string, *) temp
    class default
       error stop "wrong number contents"
    end select
    arg => arg(caret:)
  end function parse_number

  
  
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
       retval => parse_number( arg )
    case ( ')' )
       error stop "Closing parenthesis should be processed in parse_list"
       retval => the_null
    case default
!       print *, new_line('a'), "debug: parse symbol"
      
       retval => parse_symbol( arg )
    end select

  end function parse_sexp

  ! subroutine test1() ! does (cons 1 2)
  !   type(scheme_number), pointer :: a
  !   type(scheme_number), pointer :: b
    
  !   type(scheme_pair) :: retval
    
  !   allocate(scheme_number :: a)
  !   allocate(scheme_number :: b)
  !   allocate( integer :: a%value )
  !   a%value = 1
  !   allocate( integer :: b%value )
  !   b%value = 2
  !   the_cars(free)%contents => a
  !   the_cdrs(free)%contents => b
  !   allocate( integer :: retval%value )
  !   retval%value = free
  !   free = free + 1
  ! end subroutine test1

  ! subroutine test2() ! does (cons 1 "hello")
  !   type(scheme_number), pointer :: a
  !   type(scheme_string), pointer :: b
    
  !   type(scheme_pair) :: retval
  !   character(len=*), parameter :: teststring = "hello"
  !   allocate(scheme_number :: a)
  !   allocate(scheme_string :: b)
  !   allocate( integer :: a%value )
  !   a%value = 1
  !   b%value = teststring ! does automatic allocation work?
  !   the_cars(free)%contents => a
  !   the_cdrs(free)%contents => b
  !   allocate( integer :: retval%value )
  !   retval%value = free
  !   free = free + 1
  ! end subroutine test2

  ! the idea of the following is like this: the only case when the
  ! cons-memory garbage collector cannot reach for the string is when
  ! this value is returned from a call. 
  ! subroutine test3(retval) ! does make-string
  !   type(scheme_string), intent(out) :: retval
  !   allocate( retval%value, source="hello" ) ! when this object dies,
  !   ! the finaliser should kill the string itself
  ! end subroutine test3

  function cons( a, b) result( retval )
    class(scheme_object), pointer :: a
    class(scheme_object), pointer :: b
    type(scheme_pair), pointer :: retval
    the_cars(free)%contents => a
    the_cdrs(free)%contents => b
    allocate( retval )
    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
  end function cons

  recursive subroutine debug_display_pair( this )
    class(scheme_pair), intent(in) :: this
!    class(scheme_object), pointer :: arg
!    associate ( temp => x%value ) 
      select type (temp => this%value )
      type is ( integer )
         !print *,"("
         write (output_unit, fmt='(1a)', advance='no') "("
         !arg => the_cars(temp)%contents
         call the_cars(temp)%contents%debug_display()
         !retval = lowLevelDisplay( arg )
         !call arg%debug_display
         !print *, " . "
         write (output_unit, fmt='(1a)', advance='no') " . "
         !arg => the_cdrs(temp)%contents
         !call arg%debug_display
         call the_cdrs(temp)%contents%debug_display()
         !retval = lowLevelDisplay( arg )
         !print *, ")"
         write (output_unit, fmt='(1a)', advance='no') ")"
      class default
         error stop "wrong pair contents"
      end select
!    end associate
  end subroutine debug_display_pair

  subroutine debug_display_string( this )
    class(scheme_string), intent(in):: this
    select type (temp => this%value )
      type is ( character(len=*) )
         write (output_unit, fmt='(a,a,a)', advance='no') '"', temp, '"'
      end select
  end subroutine debug_display_string

  subroutine debug_display_symbol( this )
    class(scheme_symbol), intent(in) :: this
    select type (temp => this%value )
    type is ( character(len=*) )
       write (output_unit, fmt='(a)', advance='no') temp
    class default
       error stop "non-character symbol value"
    end select
  end subroutine debug_display_symbol
  subroutine debug_display_number( this )
    class(scheme_number), intent(in) :: this
    select type (temp => this%value )
    type is (integer)
       write (output_unit, fmt='(i0)', advance='no') temp
    end select
  end subroutine debug_display_number
  

  subroutine debug_display_empty_list( this )
    class(scheme_empty_list), intent(in) :: this
    write (output_unit, fmt='(a)', advance='no') '()'
  end subroutine debug_display_empty_list

  
end module scheme

program main
  use :: scheme, only : scheme_object, scheme_string, scheme_pair, &
       scheme_symbol, remove_junk, parse_sexp, the_null
  use, intrinsic :: iso_fortran_env
  use, non_intrinsic :: system_interface, only: c_exit, read_until_eof
  implicit none
  integer :: fake = 0
  class(scheme_object), pointer :: parsed_expression  
  character(len=:), allocatable, target :: test_string
  character(len=:), pointer     :: test_string_pointer
  logical :: useless_retval
  allocate( the_null%value, source="empty list" )
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
  !  print *, parsed_expression
  !useless_retval =  lowLevelDisplay( parsed_expression )
  call parsed_expression%debug_display()
  fake = c_exit(0)
  stop 0
  
end program main

