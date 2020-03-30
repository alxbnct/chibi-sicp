! Time-stamp: <2020-03-30 23:08:55 lockywolf>
! Author: lockywolf gmail.com
! A rudimentary scheme interpreter

module system_interface
!  use, intrinsic :: iso_c_binding, only: c_int
  use, intrinsic :: iso_fortran_env, only: input_unit
  implicit none
!   interface
!      integer (c_int) function c_exit(x) bind(c, name="exit")
!        import :: c_int
!        integer(c_int), value :: x
!      end function c_exit
!   end interface
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
          !dummy = c_exit(1)
          error stop "reading problems"
       else
          retval = retval//buffer;
       end if
    end do
    !print *, "debug:", retval, new_line('a')
  end function read_until_eof
end module system_interface

module scheme
!  use, non_intrinsic :: system_interface, only: c_exit
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
     procedure(packageable_procedure), pointer, nopass :: proc_pointer
  end type scheme_primitive_procedure

  abstract interface
     function packageable_procedure( argl, env ) result( retval )
       import :: scheme_object
       class(scheme_object), pointer :: retval
       class(scheme_object), pointer :: argl
       class(scheme_object), pointer :: env
     end function packageable_procedure
     
  end interface

  type scheme_pointer
     class(scheme_object), pointer :: contents
  end type scheme_pointer

  type(scheme_pointer), dimension(memory_size) :: the_cars
  type(scheme_pointer), dimension(memory_size) :: the_cdrs
  integer :: free = 1

  class(scheme_object), pointer :: exp
  class(scheme_object), pointer :: env
  class(scheme_object), pointer :: val
  class(scheme_object), pointer :: reg_continue
  class(scheme_object), pointer :: proc
  class(scheme_object), pointer :: argl
  class(scheme_object), pointer :: unev
  
  
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
    print *, "de-allocating string"
  end subroutine scheme_string_deallocate
  
  subroutine scheme_pair_deallocate( this )
    type(scheme_pair) :: this
    deallocate( this%value )
    print *, "de-allocating pair"
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
       ! iostat = c_exit(1)
       error stop "wrong string contents"
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
       error stop "wrong pair contents"
       ! iostat = c_exit(1)
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
       error stop "wrong scheme symbol contents"
       ! iostat = c_exit(1)
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

  function make_string( string ) result( retval )
    character(:), allocatable, intent(in) :: string
    type(scheme_string), pointer :: retval
    integer :: strlen
    strlen = len(string)
    allocate( scheme_string :: retval )
    allocate( character(len=strlen) :: retval%value )
    select type( temp => retval%value )
    type is (character(*))
       temp = string
    class default
       error stop "wrong string contents"
    end select
  end function make_string

  
  function parse_string( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
    integer :: caret = 1
    character(:), allocatable :: interim_string
    allocate(interim_string, source="")
    caret = 1 ! skipping the first quotation mark '"'
    do
       caret = caret + 1
       if (arg(caret:caret) == '"') then
          caret = caret + 1
          exit
       end if
       interim_string = interim_string // arg(caret:caret)
    end do
    token => make_string( interim_string )
    arg => arg(caret:)
  end function parse_string

  function make_symbol( string ) result( retval )
    character(:), allocatable, intent(in) :: string
    type(scheme_symbol), pointer :: retval
    integer :: strlen
    strlen = len(string)
    allocate( scheme_symbol :: retval )
    allocate( character(len=strlen) :: retval%value )
    select type( temp => retval%value )
    type is (character(*))
       temp = string
    class default
       error stop "wrong string contents"
    end select
  end function make_symbol
  
  function parse_symbol( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
    integer :: caret = 1
    character, parameter, dimension(*) :: allowed_chars = (/ 'a', 'b', 'c', &
         'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', &
         'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'/)
    character(:), allocatable, target :: interim_string
    allocate( interim_string, source="")
    !token%value = "BUG1"
    caret = 0
    do
       caret = caret + 1
       if (.not.any( arg(caret:caret) == allowed_chars )) then
          exit
       end if
       interim_string = interim_string // arg(caret:caret) ! does it reallocate every assignment?
    end do
    !    token%value = interim_string
    token => make_symbol( interim_string )
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
    character(:), pointer, intent(inout) :: arg
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


  function cons( a, b) result( retval )
    class(scheme_object), pointer, intent(in) :: a
    class(scheme_object), pointer, intent(in) :: b
    type(scheme_pair), pointer :: retval
    the_cars(free)%contents => a
    the_cdrs(free)%contents => b
    allocate( retval )
    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
  end function cons

  function car( pair ) result( retval )
    class(scheme_object), intent(in) :: pair
    class(scheme_object), pointer :: retval
    select type (pair)
    class is (scheme_pair)
    class default
       error stop "pair is not a pair"
    end select
    select type( temp => pair%value )
    type is (integer)
       retval => the_cars(temp)%contents
    class default
       error stop "wrong pair contents"
    end select
  end function car

  function cdr( pair ) result( retval )
    class(scheme_object), intent(in) :: pair
    class(scheme_object), pointer :: retval
    select type (pair)
    class is (scheme_pair)
    class default
       error stop "pair is not a pair"
    end select
    select type( temp => pair%value )
    type is (integer)
       retval => the_cdrs(temp)%contents
    class default
       error stop "wrong pair contents"
    end select
  end function cdr

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

  function low_level_read() result( parsed_expression )
    use system_interface, only : read_until_eof
    class(scheme_object), pointer :: parsed_expression  
    character(len=:), allocatable, target :: test_string
    character(len=:), pointer     :: test_string_pointer

    test_string =  read_until_eof()
    test_string = remove_junk( test_string ) ! test_string should be a string
    test_string_pointer => test_string
    parsed_expression => parse_sexp( test_string_pointer ) 
  end function low_level_read

  subroutine low_level_initialize_stack()
    print *, "initialize-stack not implemented"
    !   nullify(env)
    !   nullify(exp)
    !   nullify(val)
    !   nullify(proc)
    !   nullify(argl)
    !   nullify(reg_continue)
    !   nullify(unev)
  end subroutine low_level_initialize_stack

  function ll_make_frame( vars, vals ) result( retval )
    class(scheme_object), pointer, intent(in) :: vars
    class(scheme_object), pointer, intent(in) :: vals
    type(scheme_pair), pointer  :: retval
    retval => cons( vars, vals )
  end function ll_make_frame

  function ll_extend_environment( names, objects, base_env ) result( retval )
    class(scheme_object), pointer, intent(in) :: names
    class(scheme_object), pointer, intent(in) :: objects
    class(scheme_object), pointer, intent(in) :: base_env
    type(scheme_pair), pointer :: retval
    class(scheme_object), pointer :: intermediate_object
    !intermediate_object => ll_make_frame(names,objects) ! why the hell do I need this?
    !answer to myself one day later: you need to mark a as pointer, intent(in)!
    !retval => cons( intermediate_object, base_env )
    retval => cons( ll_make_frame(names,objects) , base_env )
  end function ll_extend_environment

  function packaged_ll_extend_environment( argl, env) result(retval)
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env
    class(scheme_object), pointer :: retval
    retval => ll_extend_environment( car(argl), car(car(argl)), car(car(car(argl))) )
  end function packaged_ll_extend_environment
  
  function make_primitive_procedure_object() result( retval )
    type(scheme_primitive_procedure), allocatable, target :: retval
    allocate( retval )
    retval%proc_pointer => packaged_ll_extend_environment
    
  end function make_primitive_procedure_object
  
  
  subroutine ll_setup_global_environment()
    type(scheme_pair), pointer :: test
    character(len=:), allocatable, target :: function_name
    allocate( function_name, source="extend_environment")
    test => cons( make_symbol( function_name ), &
                  make_primitive_procedure_object( ))
    error stop "not implemented"
  end subroutine ll_setup_global_environment
  
  
  subroutine main_loop()
    integer :: i
001 print *, "Welcome to the rudimentary scheme in fortran" ! hello, world
    exp => low_level_read()
    i = 001

  end subroutine main_loop
  
  
end module scheme

program main
  use :: scheme, only : scheme_object, scheme_string, scheme_pair, &
       scheme_symbol, remove_junk, parse_sexp, low_level_read
  use, intrinsic :: iso_fortran_env
  use, non_intrinsic :: system_interface, only: read_until_eof
  implicit none
!  integer :: fake = 0
  class(scheme_object), pointer :: parsed_expression  
!  character(len=:), allocatable, target :: test_string
!  character(len=:), pointer     :: test_string_pointer
!  logical :: useless_retval
!  allocate( the_null%value, source="empty list" )
  !class(scheme_object), pointer :: test_object
  !test_object => read_sexp()
  ! 001 write (output_unit,'(a,i1)') "Hello, world, ", counter
  !   allocate(scheme_string :: test_object) ! memory leak?
  !   counter = counter + 1
  !   nullify( test_object )
  !   if (counter < 3) goto 001
  
!  test_string =  read_until_eof()
!  test_string = remove_junk( test_string ) ! test_string should be a string
!  test_string_pointer => test_string
!  parsed_expression => parse_sexp( test_string_pointer ) 
  !  print *, parsed_expression
  !useless_retval =  lowLevelDisplay( parsed_expression )
  parsed_expression => low_level_read()
  call parsed_expression%debug_display()
  !fake = c_exit(0)
  stop 0
  
end program main

