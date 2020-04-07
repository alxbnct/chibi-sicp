! Time-stamp: <2020-04-07 17:00:30 lockywolf>
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
    integer :: reason
    ! this function is broken and doesn't support comments
    reader: do
       read (input_unit, '(a1)', iostat=reason, advance='no') buffer
       if (is_iostat_end(reason))  then
          ! print *, "debug: end of input (EOF)"          
          exit reader
       else if (is_iostat_eor(reason)) then
          ! print *, "debug: end of record (newline)"
          exit reader
       else if (reason > 0) then
          print*, "Fortran:read error"
          error stop "reading problems"
       else
          !print *, "debug:read:char=", buffer, " code=", iachar(buffer)
          retval = retval//buffer;
       end if
    end do reader
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
     procedure :: eq_symbol_symbol
     procedure :: eq_symbol_string
!     generic, public :: eq =>  eq_symbol_symbol, eq_symbol_string
     generic, public :: operator(==) => eq_symbol_symbol, eq_symbol_string
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
     character(len=:), pointer :: name
     procedure(packageable_procedure), pointer, nopass :: proc_pointer
   contains
     procedure, pass :: generic_scheme_print => print_scheme_primitive_procedure
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

  class(scheme_object), pointer :: exp => null()
  class(scheme_object), pointer :: env => null()
  class(scheme_object), pointer :: val => null()

  class(scheme_object), pointer :: proc => null()
  class(scheme_object), pointer :: argl => null()
  class(scheme_object), pointer :: unev => null()

  class(scheme_object), pointer :: the_global_environment => null()
  class(scheme_object), pointer :: the_stack => the_null

  class(scheme_symbol), pointer :: reg_continue
  !  character(len=:), allocatable :: reg_continue
  
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

  ! continue is a special register. It keeps labels rather than scheme objects

  interface save_scheme
     module procedure scheme_save_reg
     module procedure scheme_save_continue
  end interface save_scheme

contains
  function eq_symbol_symbol( this, that ) result( retval )
    class(scheme_symbol), intent(in) :: this
    class(scheme_symbol), intent(in) :: that
    logical :: retval
    if ( this%value .eq. that%value ) then
       retval = .true.
    else
       retval = .false.
    end if
  end function eq_symbol_symbol

  function eq_symbol_string( this, that ) result( retval )
    class(scheme_symbol), intent(in) :: this
    character, intent(in) :: that
    logical :: retval
    if ( this%value .eq. that ) then
       retval = .true.
    else
       retval = .false.
    end if
  end function eq_symbol_string

  
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

  subroutine print_scheme_primitive_procedure(this, unit, iotype, v_list,&
       iostat, iomsg)
    class(scheme_primitive_procedure), intent(in) :: this
    integer, intent(in)         :: unit
    character(*), intent(in)    :: iotype
    integer, intent(in)         :: v_list (:)
    integer, intent(out)        :: iostat
    character(*), intent(inout) :: iomsg
    write (unit, fmt=*, iostat=iostat, iomsg=iomsg) "#<opcode ", this%name, ">"
  end subroutine print_scheme_primitive_procedure


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
    character(len=*), intent(in) :: string
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
    character(len=*), intent(in) :: string
    type(scheme_symbol), pointer :: retval
    integer :: strlen
    strlen = len(string)
    allocate( scheme_symbol :: retval )
    allocate( retval%value, source=string )
  end function make_symbol

  function parse_symbol( arg ) result( token )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: token
    integer :: caret = 1
    character, parameter, dimension(*) :: allowed_chars = (/ 'a', 'b', 'c', &
         'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', &
         'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '-', '!', '*', &
         '+', '/' /)
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

  function ll_read() result( parsed_expression )
    use system_interface, only : read_until_eof
    class(scheme_object), pointer :: parsed_expression  
    character(len=:), allocatable, target :: test_string
    character(len=:), pointer     :: test_string_pointer

    test_string =  read_until_eof()

    test_string = remove_junk( test_string ) ! test_string should be a string
!        print *, "ll_read: got ", test_string
    test_string_pointer => test_string
    parsed_expression => parse_sexp( test_string_pointer ) 
  end function ll_read

  subroutine ll_initialize_stack()
    print *, "initialize-stack not implemented"
    !   nullify(env)
    !   nullify(exp)
    !   nullify(val)
    !   nullify(proc)
    !   nullify(argl)
    !   nullify(reg_continue)
    !   nullify(unev)
  end subroutine ll_initialize_stack

  function ll_make_frame( vars, vals ) result( retval )
    class(scheme_object), pointer, intent(in) :: vars
    class(scheme_object), pointer, intent(in) :: vals
    type(scheme_pair), pointer  :: retval
    retval => cons( vars, vals )
  end function ll_make_frame

  function ll_extend_environment( names, objects, base_env ) result( retval )
    ! used to create an initial environment, as well as when running a
    ! compound procedure
    class(scheme_object), pointer, intent(in) :: names
    class(scheme_object), pointer, intent(in) :: objects
    class(scheme_object), pointer, intent(in) :: base_env
    type(scheme_pair), pointer :: retval
!    class(scheme_object), pointer :: intermediate_object
    !intermediate_object => ll_make_frame(names,objects) ! why the hell do I need this?
    !answer to myself one day later: you need to mark a as pointer, intent(in)!
    !retval => cons( intermediate_object, base_env )
    retval => cons( ll_make_frame(names,objects) , base_env )
  end function ll_extend_environment

  ! function packaged_ll_extend_environment( argl, env) result(retval)
  !   class(scheme_object), pointer :: argl
  !   class(scheme_object), pointer :: env
  !   class(scheme_object), pointer :: retval
  !   retval => ll_extend_environment( car(argl), car(car(argl)), car(car(car(argl))) )
  ! end function packaged_ll_extend_environment

  function make_primitive_procedure_object( proc1, name ) result( retval )
    character(len=*) :: name
    procedure(packageable_procedure), pointer, intent(in) :: proc1
    type(scheme_primitive_procedure), pointer :: retval
    allocate( retval )
    allocate( retval%name, source=name )
    retval%proc_pointer => proc1
  end function make_primitive_procedure_object


  function ll_setup_global_environment() result(retval)
    character(len=:), allocatable, target :: function_name
    procedure(packageable_procedure), pointer :: proc
    type(scheme_symbol), pointer :: symbol_primitive
    type(scheme_pair), pointer :: list_primitive_names
    type(scheme_pair), pointer :: list_primitive_objects
    class(scheme_object), pointer :: retval
    allocate( symbol_primitive )
    allocate( symbol_primitive%value, source="primitive" )

    ! cons
    allocate( function_name, source="cons")
    proc => packaged_cons
    list_primitive_names => cons( make_symbol(function_name), the_null )
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_cons" ) ), the_null)
    ! car
    function_name = "car"    ! automatic reallocation
    proc => packaged_car
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_car" ) ), &
         list_primitive_objects)
    ! cdr    
    function_name="cdr" ! automatic reallocation?
    proc => packaged_cdr
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_cdr" ) ), &
         list_primitive_objects)
    ! blurb
    function_name="blurb" ! automatic reallocation?
    proc => packaged_blurb
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_blurb" ) ), &
         list_primitive_objects)
    ! extend initial_environment
    ! env => cons( cons( list_primitive_names, list_primitive_objects ), &
    !              the_null )
    retval => ll_extend_environment( list_primitive_names, &
         list_primitive_objects, the_null)
  end function ll_setup_global_environment

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
  !parsed_expression => ll_read()
  !call parsed_expression%debug_display()
  !fake = c_exit(0)

  logical function is_self_evaluating_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (arg)
    class is (scheme_string)
       retval = .true.
    class is (scheme_number)
       retval = .true.
    class is (scheme_boolean)
       retval = .true.
    class default
       retval = .false.
    end select
  end function is_self_evaluating_p

  logical function is_symbol_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (arg)
    class is (scheme_symbol)
       retval = .true.
    class default
       retval = .false.
    end select
  end function is_symbol_p

  logical function is_tagged_list_p( arg, tag ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_symbol), pointer, intent(in) :: tag
    select type (arg)
    class is (scheme_pair)
       select type (sym => car(arg))
       class is (scheme_symbol)
          if ( sym == tag ) then ! TODO: double check that this works
             retval = .true.
          end if
       class default
          retval = .false.
       end select
    class default
       retval = .false.
    end select
  end function is_tagged_list_p

  logical function is_quoted_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "quote" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_quoted_p
  
  logical function is_assignment_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "set!" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_assignment_p

  logical function is_definition_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "define" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_definition_p

  logical function is_if_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "if" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_if_p

  logical function is_lambda_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "lambda" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_lambda_p

  logical function is_begin_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "begin" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_begin_p

  logical function is_let_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "let" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_let_p

  logical function is_cond_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    character(:), allocatable :: tag
    tag = "cond" ! what the hell am I doing?
    retval = is_tagged_list_p( exp, make_symbol(tag) )
  end function is_cond_p

  logical function is_application_p( exp ) result( retval )
    class(scheme_object), pointer, intent(in) :: exp
    select type (exp)
    class is (scheme_pair)
       retval = .true.
    class default
       retval = .false.
    end select
  end function is_application_p

  subroutine scheme_save_reg( val )
    class(scheme_object), pointer, intent(in) :: val
    the_stack => cons(val, the_stack)
  end subroutine scheme_save_reg
  subroutine scheme_save_continue( val )
    character(len=*), intent(in) :: val
    !    the_stack => cons(make_string( val ), the_stack) ! auto-boxing
    error stop "save should not be used"
  end subroutine scheme_save_continue

  function scheme_restore() result( retval )
    class(scheme_object), pointer :: retval
    retval => car(the_stack)
    the_stack => cdr(the_stack)
  end function scheme_restore
    
  recursive subroutine main_loop()
    ! procedure(packageable_procedure), pointer :: proc
    ! class(scheme_object), pointer :: retval
    ! type(scheme_primitive_procedure), pointer :: proc_holder
    ! not sure it is the best place for it
    character(len=:), allocatable :: label_value
    !type(scheme_symbol), pointer :: mysym
!    character(len=:), allocatable :: quote_string
    the_global_environment => ll_setup_global_environment()
!    quote_string = "quote"
    
    ! TODO: (perform (op initialize-stack))
    !mysym => make_symbol( "quote" )

    label_value = "read-eval-print-loop"
001 label_selector: select case (label_value)
    case ("read-eval-print-loop")
       ! (perform (op prompt-for-input) (const "\n;;EC-Eval input:"))
       write (*,fmt='(a)', advance='no') "SCHEMETRAN-Input: " !
       ! (assign exp (op read))
       exp => ll_read()
       ! (perform (op user-print) (reg exp))
       write (*, fmt='(a)', advance='no') "debug: I parsed as: "
       call exp%debug_display() ;     write (*,*) new_line('a')
       !(assign env (op get-global-environment))
       env => the_global_environment
       !(assign continue (label print-result))
       reg_continue => make_symbol("print-result")
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
    case ("print-result") ! ec-label: print-result
       print *, "TODO: implement print-result"
       !(perform (op announce-output) (const ";;EC-Eval value:"))
       write (*,fmt='(a)', advance='no') "SCHEMETRAN-Output: "
       !(perform (op user-print) (reg val))
       call val%debug_display(); write (*, fmt='(a)') new_line('a')
       !TODO: (perform (op print-stack-statistics))
       print *, "TODO: (perform (op print-stack-statistics))"
       !(goto (label read-eval-print-loop))
       label_value = "read-eval-print-loop"
       goto 001
    case ("unknown-expression-type")
       print *, "TODO: "
       !(assign val (const unknown-expression-type-error))
       !(goto (label signal-error))
       error stop "unknown-expression-type not implemented"
    case ("unknown-procedure-type")
       !(restore continue) ; clean up stack (from apply-dispatch )
       !(assign val (const unknown-procedure-type-error))
       !(goto (label signal-error))
       error stop "unknown-procedure-type not implemented"
    case ("signal-error")
       !(perform (op user-print) (reg val))
       !(goto (label read-eval-print-loop))
       error stop "signal-error not implemented"
    case ("ev-definition")
       !(assign unev (op definition-variable) (reg exp))
       !(save unev) ; save variable for later
       !(assign exp (op definition-value) (reg exp))
       !(save env)
       !(save continue)
       !(assign continue (label ev-definition-1))
       !(goto (label eval-dispatch)) ; evaluate the definition value
       error stop "ev-definition not implemented"
    case ("ev-definition-1")
       !(restore continue)
       !(restore env)
       !(restore unev)
       !(perform (op define-variable!) (reg unev) (reg val) (reg env))
       !(assign val (const ok))
       !(goto (reg continue))
       error stop "ev-definition-1 not implemented"
    case ("ev-self-eval")
       !(assign val (reg exp))
       val => exp
       !(goto (reg continue))
       label_value = reg_continue%value
       goto 001
    case ("ev-quoted")
       !(assign val (op text-of-quotation) (reg exp))
       !(goto (reg continue))
       error stop "ev-quoted not implemented"
    case ("ev-lambda")
       !(assign unev (op lambda-parameters) (reg exp))
       !(assign exp (op lambda-body) (reg exp))
       !(assign val (op make-procedure) (reg unev) (reg exp) (reg env))
       !(goto (reg continue))
       error stop "ev-lambda not implemented"
    case ("ev-variable")
       !(assign val (op lookup-variable-value) (reg exp) (reg env))
       !(save exp)
       !(assign exp (op car) (reg val))
       !(test (op eq?) (reg exp) (const unbound))
       !(branch (label error-unbound-variable))
       !(restore exp)
       !(assign val (op cdr) (reg val))
       !(goto (reg continue))
       error stop "ev-variable not implemented"
    case ("error-unbound-variable")
       !(restore exp)
       !(assign val (op cons) (const unbound-variable-error) (reg exp))
       !(goto (label signal-error))
       error stop "error-unbound-variable not implemented"
    case ("ev-assignment")
       ! (assign unev (op assignment-variable) (reg exp))
       ! (save unev) ; save variable for later
       ! (assign exp (op assignment-value) (reg exp))
       ! (save env)
       ! (save continue)
       ! (assign continue (label ev-assignment-1))
       ! (goto (label eval-dispatch)) ; evaluate the assignment value
       error stop "ev-assignment not implemented"
    case ("ev-assignment-1")
       ! (restore continue)
       ! (restore env)
       ! (restore unev)
       ! (assign val (op set-variable-value!) (reg unev) (reg val) (reg env))
       ! (assign val (op car) (reg val))
       ! (test (op eq?) (reg val) (const unbound))
       ! (branch (label assignment-failed))
       ! (assign val (const ok))
       ! (goto (reg continue))
       error stop "ev-assignment-1 not implemented"
    case ("assignment-failed")
       ! (assign exp (reg unev))
       ! (save exp)
       ! (goto (label error-unbound-variable))
       error stop "assignment-failed not implemented"
    case ("ev-if")
       ! (save exp) ; save expression for later
       ! (save env)
       ! (save continue)
       ! (assign continue (label ev-if-decide))
       ! (assign exp (op if-predicate) (reg exp))
       ! (goto (label eval-dispatch)) ; evaluate the predicate
       error stop "ev-if not implemented"
    case ("ev-if-decide")
       ! (restore continue)
       ! (restore env)
       ! (restore exp)
       ! (test (op true?) (reg val))
       ! (branch (label ev-if-consequent))
       error stop "ev-if-decide not implemented"
    case ("ev-if-alternative")
       ! (assign exp (op if-alternative) (reg exp))
       ! (goto (label eval-dispatch))
    case ("ev-if-consequent")
       ! (assign exp (op if-consequent) (reg exp))
       ! (goto (label eval-dispatch))
       error stop "ev-if-consequent not implemented"
    case ("ev-sequence")
       ! (assign exp (op first-exp) (reg unev))
       ! (test (op last-exp?) (reg unev))
       ! (branch (label ev-sequence-last-exp))
       ! (save unev)
       ! (save env)
       ! (assign continue (label ev-sequence-continue))
       ! (goto (label eval-dispatch))
       error stop "ev-sequence not implemented"
    case ("ev-sequence-continue")
       ! (restore env)
       ! (restore unev)
       ! (assign unev (op rest-exps) (reg unev))
       ! (goto (label ev-sequence))
       error stop "ev-sequence-continue not implemented"
    case ("ev-sequence-last-exp")
       ! (restore continue)
       ! (goto (label eval-dispatch))
       error stop "ev-sequence-last-exp not implemented"
    case ("ev-begin")
       ! (assign unev (op begin-actions) (reg exp))
       ! (save continue)
       ! (goto (label ev-sequence))
       error stop "ev-begin not implemented"
    case ("compound-apply")
       ! (assign unev (op procedure-parameters) (reg proc))
       ! (assign env (op procedure-environment) (reg proc))
       ! (assign env (op extend-environment)
       ! (reg unev) (reg argl) (reg env))
       ! (assign unev (op procedure-body) (reg proc))
       ! (goto (label ev-sequence))
       error stop "compound-apply not implemented"
    case ("primitive-apply")
       ! (assign val (op apply-primitive-procedure-with-errors) (reg proc) (reg argl))
       ! (save val)
       ! (assign val (op car) (reg val)) ; error or not
       ! (test (op eq?) (const error) (reg val))
       ! (branch (label primitive-error))
       ! (restore val)
       ! (assign val (op cdr) (reg val))
       ! (restore continue)
       ! (goto (reg continue))
       error stop "primitive-apply not implemented"
    case ("primitive-error")
       ! (restore val)
       ! (assign val (op cdr) (reg val)) ; error-code
       ! (assign val (op cons) (const primitive-application-error) (reg val))
       ! (goto (label signal-error))
       error stop "primitive-error not implemented"
    case ("ev-application")
       ! (save continue)
       ! (save env)
       ! (assign unev (op operands) (reg exp))
       ! (save unev)
       ! (assign exp (op operator) (reg exp))
       ! (assign continue (label ev-appl-did-operator))
       ! (goto (label eval-dispatch))
       error stop "ev-application not implemented"
    case ("ev-appl-did-operator")
       ! (restore unev) ; the operands
       ! (restore env)
       ! (assign argl (op empty-arglist))
       ! (assign proc (reg val)) ; the operator
       ! (test (op no-operands?) (reg unev))
       ! (branch (label apply-dispatch))
       ! (save proc)
       error stop "ev-appl-did-operator not implemented"
    case ("ev-appl-operand-loop")
       ! (save argl)
       ! (assign exp (op first-operand) (reg unev))
       ! (test (op last-operand?) (reg unev))
       ! (branch (label ev-appl-last-arg))
       ! (save env)
       ! (save unev)
       ! (assign continue (label ev-appl-accumulate-arg))
       ! (goto (label eval-dispatch))
       error stop "ev-appl-operand-loop not implemented"
    case ("ev-appl-accumulate-arg")
       ! (restore unev)
       ! (restore env)
       ! (restore argl)
       ! (assign argl (op adjoin-arg) (reg val) (reg argl))
       ! (assign unev (op rest-operands) (reg unev))
       ! (goto (label ev-appl-operand-loop))
       error stop "ev-appl-accumulate-arg not implemented"
    case ("ev-appl-last-arg")
       ! (assign continue (label ev-appl-accum-last-arg))
       ! (goto (label eval-dispatch))
       error stop "ev-appl-last-arg not implemented"
    case ("ev-appl-accum-last-arg")
       ! (restore argl)
       ! (assign argl (op adjoin-arg) (reg val) (reg argl))
       ! (restore proc)
       ! (goto (label apply-dispatch))
       error stop "ev-appl-accum-last-arg not implemented"
    case ("apply-dispatch")
       ! (test (op primitive-procedure?) (reg proc))
       ! (branch (label primitive-apply))
       ! (test (op compound-procedure?) (reg proc))
       ! (branch (label compound-apply))
       ! (goto (label unknown-procedure-type))
       error stop "apply-dispatch not implemented"
    case ("eval-dispatch")
       print *, "TODO: implement eval-dispatch"
       ! (test (op self-evaluating?) (reg exp))
       if (is_self_evaluating_p(exp)) then
          ! (branch (label ev-self-eval))
          label_value = "ev-self-eval"
          goto 001
       end if
       ! (test (op variable?) (reg exp))
       if (is_symbol_p(exp)) then
          ! (branch (label ev-variable))
          label_value = "ev-variable"
          goto 001
       end if
       ! (test (op quoted?) (reg exp))
       if (is_quoted_p(exp)) then
          ! (branch (label ev-quoted))
          label_value = "ev-quoted"
          goto 001
       end if
       ! (test (op assignment?) (reg exp))
       if (is_assignment_p(exp)) then
          ! (branch (label ev-assignment))
          label_value = "ev-assignment"
          goto 001
       end if
       ! (test (op definition?) (reg exp))
       if (is_definition_p(exp)) then
          ! (branch (label ev-definition))
          label_value = "ev-definition"
          goto 001
       end if
       ! (test (op if?) (reg exp))
       if (is_if_p(exp)) then
          ! (branch (label ev-if))
          label_value = "ev-if"
          goto 001
       end if
       ! (test (op lambda?) (reg exp))
       if (is_lambda_p(exp)) then
          ! (branch (label ev-lambda))
          label_value = "ev-lambda"
          goto 001
       end if
       ! (test (op begin?) (reg exp))
       if (is_begin_p(exp)) then
          ! (branch (label ev-begin))
          label_value = "ev-begin"
          goto 001
       end if
       ! (test (op let?) (reg exp))
       if (is_let_p(exp)) then
          ! (branch (label ev-let))
          label_value = "ev-let"
          goto 001
       end if
       ! (test (op cond?) (reg exp))
       if (is_cond_p(exp)) then
          ! (branch (label ev-cond))   
          label_value = "ev-cond"
          goto 001
       end if
       ! (test (op application?) (reg exp))
       if (is_application_p(exp)) then
          ! (branch (label ev-application))
          label_value = "ev-application"
          goto 001
       end if
       ! (goto (label unknown-expression-type))
       label_value = "unknown-expression-type"
       goto 001
       error stop "You need to implement here"

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
       
       error stop "eval-dispatch not implemented"
    case ("ev-let")
       ! (assign exp (op let->combination) (reg exp))
       ! ;(save continue)
       ! (goto (label eval-dispatch))
       error stop "ev-let not implemented"
    case ("ev-cond")
       ! (assign exp (op cond->if) (reg exp))
       ! (goto (label eval-dispatch))
       error stop "ev-cond not implemented"
    case default
       error stop "default case should never be reached"
    end select label_selector
    error stop "The end of main loop should never be reached"
  end subroutine main_loop


end module scheme

program main
  use :: scheme, only : main_loop
  use, intrinsic :: iso_fortran_env
  !  use, non_intrinsic :: system_interface, only: read_until_eof
  implicit none
  !  integer :: fake = 0
  !  class(scheme_object), pointer :: parsed_expression
  print *, "Welcome to the rudimentary scheme in fortran" ! hello, world  
  call main_loop()
  stop 0

end program main

