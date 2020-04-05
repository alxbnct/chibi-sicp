! Time-stamp: <2020-04-05 12:58:11 lockywolf>
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
   contains
     procedure, pass :: generic_scheme_print => print_scheme_object
     procedure, pass :: debug_display => debug_display_object
     generic, public :: write (formatted) => generic_scheme_print
     !final :: deallocate_scheme_object_value
  end type scheme_object

  type, extends( scheme_object ) :: scheme_string
     character(len=:), pointer :: value
   contains
     procedure :: debug_display => debug_display_string
     procedure :: generic_scheme_print => print_scheme_string
     !      generic :: write (formatted) => print_scheme_string
     final :: scheme_string_deallocate
  end type scheme_string
  type, extends( scheme_object ) :: scheme_number
     integer :: value
   contains
     procedure :: debug_display => debug_display_number
  end type scheme_number

  type, extends( scheme_object ) :: scheme_pair
     integer :: value
   contains
     procedure :: debug_display  => debug_display_pair
     procedure :: generic_scheme_print => print_scheme_pair
     !final :: scheme_pair_deallocate
  end type scheme_pair

  type, extends( scheme_object ) :: scheme_symbol
     character(len=:), pointer :: value
   contains
     procedure :: debug_display => debug_display_symbol
     procedure :: generic_scheme_print => print_scheme_symbol
     procedure :: equal => equalp_symbol_symbol
     generic, public :: operator(==) => equal
  end type scheme_symbol

  type, extends( scheme_object ) :: scheme_empty_list
   contains
     procedure :: debug_display => debug_display_empty_list
     procedure :: generic_scheme_print => print_scheme_empty_list
  end type scheme_empty_list

  type(scheme_empty_list), target :: the_null 
  
  type, extends( scheme_object ) :: scheme_boolean
     logical :: value
  end type scheme_boolean

  type(scheme_boolean), target :: the_false = scheme_boolean( .false. )
  type(scheme_boolean), target :: the_true  = scheme_boolean( .true.  )
  
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
  function equalp_symbol_symbol( this, that ) result( retval )
    class(scheme_symbol), intent(in) :: this
    class(scheme_symbol), intent(in) :: that
    logical :: retval
    if ( this%value .eq. that%value ) then
       retval = .true.
    else
       retval = .false.
    end if
  end function equalp_symbol_symbol

  subroutine scheme_string_deallocate( this )
    type(scheme_string) :: this
    deallocate( this%value )
    print *, "de-allocating string"
  end subroutine scheme_string_deallocate
  
!  subroutine scheme_pair_deallocate( this )
!    type(scheme_pair) :: this
!    deallocate( this%value )
!    print *, "de-allocating pair"
!  end subroutine scheme_pair_deallocate
    
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
!    select type ( temp => this%value )
!    type is (character(len=*))
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) &
            '#<scheme_string "' // this%value // '">'
!    class default
!       print *, 'error'
       ! iostat = c_exit(1)
!       error stop "wrong string contents"
!    end select
  end subroutine print_scheme_string

  subroutine print_scheme_pair(this, unit, iotype, v_list, iostat, iomsg)
    class(scheme_pair), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
!    select type ( temp => this%value )
!    type is (integer)
       write (unit, fmt=*, iostat=iostat, iomsg=iomsg) &
            '#<scheme_pair address=', this%value, '>'
!    class default
!       print *, 'error'
!       error stop "wrong pair contents"
       ! iostat = c_exit(1)
!    end select
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
!    select type ( temp => this%value )
!    type is (character(len=*))
       write (unit, fmt='(A)', iostat=iostat, iomsg=iomsg, advance='no') '#<scheme_symbol "' // this%value // '">'
!    class default
!       print *, 'error'
!       error stop "wrong scheme symbol contents"
       ! iostat = c_exit(1)
!    end select
  end subroutine print_scheme_symbol


  
  subroutine debug_display_object( this ) ! for the root object
    class(scheme_object), intent(in) :: this
    write (output_unit, fmt='(dt)', advance='no') this
  end subroutine debug_display_object
  
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
    allocate( retval%value, source=string )
!    select type( temp => retval%value )
!    type is (character(*))
!       temp = string
!    class default
!       error stop "wrong string contents"
!    end select
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
    allocate( retval%value, source=string )
!    select type( temp => retval%value )
!    type is (character(*))
!       temp = string
!    class default
!       error stop "wrong string contents"
!    end select
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
    class(scheme_number), pointer :: token
    integer :: caret = 1
    character, parameter, dimension(*) :: allowed_chars = (/ '1', '2', '3', &
         '4', '5', '6', '7', '8', '9', '0' /)
    character(:), allocatable :: interim_string
    allocate( scheme_number :: token )
!    allocate( integer :: token%value )
    allocate( interim_string, source="")
!    token%value = int(z"DEAD")
    caret = 0
    do
       caret = caret + 1
       if (.not.any( arg(caret:caret) == allowed_chars )) then
          exit
       end if
       interim_string = interim_string // arg(caret:caret) ! does it reallocate every assignment?
    end do
    !token%value = interim_string
!    select type (temp => token%value)
!    type is (integer)
       read (interim_string, *) token%value
!    class default
!       error stop "wrong number contents"
!    end select
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
!    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
  end function cons

  function packaged_cons( argl, env) result( retval )
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env
    class(scheme_object), pointer :: retval
    retval => cons( car(argl), car(car(argl)) )
  end function packaged_cons
  
  function car( pair ) result( retval )
    class(scheme_object), intent(in) :: pair
    class(scheme_object), pointer :: retval
    select type (pair)
    class is (scheme_pair)
       retval => the_cars(pair%value)%contents
    class default
       write (*,*) new_line('a')
       error stop "car: argument is not a pair"
    end select
!    select type( temp => pair%value )
!    type is (integer)
!    class default
!       error stop "wrong pair contents"
!    end select
  end function car

  function packaged_car( argl, env) result( retval )
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env
    class(scheme_object), pointer :: retval
    retval => car( car(argl) )
  end function packaged_car

  
  function cdr( pair ) result( retval )
    class(scheme_object), intent(in) :: pair
    class(scheme_object), pointer :: retval
    select type (pair)
    class is (scheme_pair)
       retval => the_cdrs(pair%value)%contents
    class default
       write (*,*) new_line('a')
       error stop "cdr: argument is not a pair"
    end select
  !   select type( temp => pair%value )
  !   type is (integer)
  !      retval => the_cdrs(temp)%contents
  !   class default
  !      error stop "wrong pair contents"
  !   end select
  end function cdr

  function packaged_cdr( argl, env) result( retval )
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env
    class(scheme_object), pointer :: retval
    retval => cdr( car(argl) )
  end function packaged_cdr

  function packaged_blurb( argl, env ) result( retval )
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env
    class(scheme_object), pointer :: retval
    retval => the_null
    write (*,*) "packaged_blurb test output"
  end function packaged_blurb

  function lookup_variable_value( var, env ) result( retval )
    type(scheme_symbol), pointer, intent(in) :: var
    class(scheme_object), pointer, intent(in) :: env
    class(scheme_object), pointer :: retval
    select type( env )
    class is ( scheme_empty_list )
       retval => the_false
    class is (scheme_pair)
       retval => frame_loop( car(car(env)), cdr(car(env)))
    end select
  contains

    recursive function frame_loop( vars, vals) result( retval )
      class(scheme_object), pointer, intent(in) :: vars
      class(scheme_object), pointer, intent(in) :: vals
      class(scheme_object), pointer :: retval
      select type (vars)
      type is (scheme_empty_list)
         retval => lookup_variable_value( var, cdr(env) )
      class is (scheme_pair)
         select type ( name => car(vars))
            class is (scheme_symbol)
               if ( name == var ) then
                  retval => car(vals)
               end if
            class default
               error stop "scheme symbol not a symbol"
            end select
      class default
         retval => frame_loop( cdr(vars), cdr(vals))
      end select
    end function frame_loop

  end function lookup_variable_value
  
  recursive subroutine debug_display_pair( this )
    class(scheme_pair), intent(in) :: this
!    class(scheme_object), pointer :: arg
!    associate ( temp => x%value ) 
!      select type (temp => this%value )
!      type is ( integer )
         !print *,"("
         write (output_unit, fmt='(1a)', advance='no') "("
         !arg => the_cars(temp)%contents
         call the_cars(this%value)%contents%debug_display()
         !retval = lowLevelDisplay( arg )
         !call arg%debug_display
         !print *, " . "
         write (output_unit, fmt='(1a)', advance='no') " . "
         !arg => the_cdrs(temp)%contents
         !call arg%debug_display
         call the_cdrs(this%value)%contents%debug_display()
         !retval = lowLevelDisplay( arg )
         !print *, ")"
         write (output_unit, fmt='(1a)', advance='no') ")"
!      class default
!         error stop "wrong pair contents"
!      end select
!    end associate
  end subroutine debug_display_pair

  subroutine debug_display_string( this )
    class(scheme_string), intent(in):: this
!    select type (temp => this%value )
!      type is ( character(len=*) )
         write (output_unit, fmt='(a,a,a)', advance='no') '"', this%value, '"'
!      end select
  end subroutine debug_display_string

  subroutine debug_display_symbol( this )
    class(scheme_symbol), intent(in) :: this
!    select type (temp => this%value )
!    type is ( character(len=*) )
       write (output_unit, fmt='(a)', advance='no') this%value
!    class default
!       error stop "non-character symbol value"
!    end select
  end subroutine debug_display_symbol
  subroutine debug_display_number( this )
    class(scheme_number), intent(in) :: this
!    select type (temp => this%value )
!    type is (integer)
       write (output_unit, fmt='(i0)', advance='no') this%value
!    end select
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

  ! function ll_make_frame( vars, vals ) result( retval )
  !   class(scheme_object), pointer, intent(in) :: vars
  !   class(scheme_object), pointer, intent(in) :: vals
  !   type(scheme_pair), pointer  :: retval
  !   retval => cons( vars, vals )
  ! end function ll_make_frame

  ! function ll_extend_environment( names, objects, base_env ) result( retval )
  !   class(scheme_object), pointer, intent(in) :: names
  !   class(scheme_object), pointer, intent(in) :: objects
  !   class(scheme_object), pointer, intent(in) :: base_env
  !   type(scheme_pair), pointer :: retval
  !   class(scheme_object), pointer :: intermediate_object
  !   !intermediate_object => ll_make_frame(names,objects) ! why the hell do I need this?
  !   !answer to myself one day later: you need to mark a as pointer, intent(in)!
  !   !retval => cons( intermediate_object, base_env )
  !   retval => cons( ll_make_frame(names,objects) , base_env )
  ! end function ll_extend_environment

  ! function packaged_ll_extend_environment( argl, env) result(retval)
  !   class(scheme_object), pointer :: argl
  !   class(scheme_object), pointer :: env
  !   class(scheme_object), pointer :: retval
  !   retval => ll_extend_environment( car(argl), car(car(argl)), car(car(car(argl))) )
  ! end function packaged_ll_extend_environment
  
  function make_primitive_procedure_object( proc1 ) result( retval )
    type(scheme_primitive_procedure), pointer :: retval
    procedure(packageable_procedure), pointer :: proc1
    allocate( retval )
    retval%proc_pointer => proc1
    
  end function make_primitive_procedure_object
  
  
  subroutine ll_setup_global_environment()
    character(len=:), allocatable, target :: function_name
    procedure(packageable_procedure), pointer :: proc
    type(scheme_symbol), pointer :: symbol_primitive
    type(scheme_pair), pointer :: list_primitive_names
    type(scheme_pair), pointer :: list_primitive_objects
    allocate( symbol_primitive )
    allocate( symbol_primitive%value, source="primitive" )

    ! cons
    allocate( function_name, source="cons")
    proc => packaged_cons
    list_primitive_names => cons( make_symbol(function_name), the_null )
    list_primitive_objects => cons( cons( symbol_primitive, &
          make_primitive_procedure_object( proc ) ), the_null)
    ! car
    function_name = "car"    ! automatic reallocation
    proc => packaged_car
    list_primitive_names => cons( make_symbol(function_name), &
                                  list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc ) ), &
         list_primitive_objects)
    ! cdr    
    function_name="cdr" ! automatic reallocation?
    proc => packaged_cdr
    list_primitive_names => cons( make_symbol(function_name), &
                                  list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc ) ), &
         list_primitive_objects)
    ! blurb
    function_name="blurb" ! automatic reallocation?
    proc => packaged_blurb
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc ) ), &
         list_primitive_objects)
    ! extend initial_environment
    env => cons( cons( list_primitive_names, list_primitive_objects ), &
                 the_null )

  end subroutine ll_setup_global_environment
  
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
  !parsed_expression => low_level_read()
  !call parsed_expression%debug_display()
  !fake = c_exit(0)

  recursive subroutine main_loop()
!    procedure(packageable_procedure), pointer :: proc
!    class(scheme_object), pointer :: retval
!    type(scheme_primitive_procedure), pointer :: proc_holder
001 print *, "Welcome to the rudimentary scheme in fortran" ! hello, world
  exp => low_level_read()
  write (*,*) "SCHEMETRAN-Input: "
    call exp%debug_display()
    write (*,*) new_line('a')
    call ll_setup_global_environment()
    select type (procname => car(exp))
    type is (scheme_symbol)
       write (*,fmt='(a,a)', advance='no') "debug: (car exp)="
       call procname%debug_display()
       write (*,fmt='(a)', advance='no') new_line('a')
       proc => lookup_variable_value( procname, env )
       write (*,fmt='(a)', advance='no') "debug: found variable="
       call proc%debug_display()
       write (*, fmt='(a)', advance='no') new_line('a')
       proc => cdr( proc ) ! (primitive obj)
    class default
       error stop "variable name not a symbol"
    end select
    
    select type( proc )
    type is (scheme_primitive_procedure)
       !proc => proc_holder%proc_pointer
       val => proc%proc_pointer( argl, env)
       !retval => proc( argl, env )
    class default
       error stop "primitive procedure not a procedure"
    end select
    
  end subroutine main_loop
  
  
end module scheme

program main
  use :: scheme, only : scheme_object, scheme_string, scheme_pair, &
       scheme_symbol, remove_junk, parse_sexp, low_level_read, main_loop
  use, intrinsic :: iso_fortran_env
  use, non_intrinsic :: system_interface, only: read_until_eof
  implicit none
!  integer :: fake = 0
!  class(scheme_object), pointer :: parsed_expression  
  call main_loop()
  stop 0
  
end program main

