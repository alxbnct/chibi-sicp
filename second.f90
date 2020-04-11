! Time-stamp: <2020-04-11 15:53:25 lockywolf>
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
  !integer, parameter :: strings_pool_size = 1024
  !integer, parameter :: symbol_pool_size = 1024

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
   contains
     procedure :: debug_display => debug_display_boolean
  end type scheme_boolean

  type(scheme_boolean), target :: the_false = scheme_boolean( .false. )
  type(scheme_boolean), target :: the_true  = scheme_boolean( .true.  )

  type, extends( scheme_object ) :: scheme_broken_heart
  end type scheme_broken_heart

  type, extends( scheme_object ) :: scheme_forwarding_address
     integer :: moved_to
  end type scheme_forwarding_address
  
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

  interface
     recursive function mappable_proc( arg ) result(retval)
       import scheme_object
       class(scheme_object), pointer, intent(in) :: arg
       class(scheme_object), pointer :: retval
     end function mappable_proc
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

  integer :: stack_number_pushes = 0
  integer :: stack_max_depth = 0
  integer :: stack_current_depth = 0
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
     !module procedure scheme_save_continue
  end interface save_scheme

contains
  function eq_symbol_symbol( this, that ) result( retval )
    class(scheme_symbol), intent(in) :: this
    class(scheme_symbol), intent(in) :: that
    logical :: retval
!    write (*,*) "this%value=", this%value, " that%value=", that%value
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
    write (unit, fmt='(a,a,a)', iostat=iostat, iomsg=iomsg, advance='no') &
         "#<opcode ", this%name, ">"
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
    write (unit, fmt='(a)', iostat=iostat, iomsg=iomsg, advance='no') &
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
    write (unit, fmt='(a,i0)', iostat=iostat, iomsg=iomsg, advance='no') &
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
         '+', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' /)
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
       arg => arg(2:) ! is this correct?
       return
    end if
    retval => cons( parse_sexp(arg), parse_list( arg ) )
  end function parse_list

  recursive function parse_sexp( arg ) result( retval )
    character(:), pointer, intent(inout) :: arg
    class(scheme_object), pointer :: retval

    sexp_detector: select case (arg(1:1))
    case ('(')
!       print *, "debug: parsing list"
       arg => arg(2:)
       retval => parse_list( arg )
    case ( "'" )
       print *, "parse_sexp: parsing quote"
       arg => arg(2:)
       retval => cons( make_symbol("quote"), cons( parse_sexp(arg), the_null ))
    case ('"')
       print *, "parse_sexp: parsing string"
       retval => parse_string( arg ) ! returns sexp and moves arg
    case ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
       print *, "parse_sexp: parsing number"
       retval => parse_number( arg )
    case ( ')' )
       error stop "Closing parenthesis should be processed in parse_list"
       retval => the_null
    case ( '#')
       hashed_select: select case (arg(2:2))
       case ('t')
          retval => the_true
       case ('f')
          retval => the_false
       case default
          error stop "Additional read syntax not implemented."
       end select hashed_select
       arg => arg(3:)
    case default
       !       print *, new_line('a'), "debug: parse symbol"

       retval => parse_symbol( arg )
    end select sexp_detector

  end function parse_sexp


  function cons( a, b) result( retval )
    class(scheme_object), pointer, intent(in) :: a
    class(scheme_object), pointer, intent(in) :: b
    type(scheme_pair), pointer :: retval
    !the_cars(free)%contents => a ! allocate? structure-copying?
    allocate( the_cars(free)%contents, source=a )
    !the_cdrs(free)%contents => b ! allocate? structure-copying?
    allocate( the_cdrs(free)%contents, source=b )
    allocate( retval )
    !    allocate( integer :: retval%value )
    retval%value = free
    free = free + 1
    !print *, "garbage collection not implemented yet"

  end function cons

  function packaged_cons( argl, env ) result( retval )
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env
    class(scheme_object), pointer :: retval
    retval => cons( car(argl), car(cdr(argl)) )
  end function packaged_cons

  function car( pair ) result( retval )
    class(scheme_object), intent(in) :: pair
    class(scheme_object), pointer :: retval
    select type (pair)
    class is (scheme_pair)
       if (.not. associated(the_cars(pair%value)%contents)) then
          write (*, fmt='(a,i0)') "error:car:disassociated pointer: address=", pair%value
          error stop "disassociated pointer"
       end if
       retval => the_cars(pair%value)%contents
    class default
       write (*,fmt='(a,a)', advance='no') new_line('a'), "argument is: "
       call pair%debug_display()
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
       if (.not. associated(the_cdrs(pair%value)%contents)) then
          write (*, fmt='(a,i0)') "error:cdr:disassociated pointer: address=", pair%value
          error stop "disassociated pointer"
       end if
       retval => the_cdrs(pair%value)%contents
    class default
       write (*,fmt='(a,a)', advance='no') new_line('a'), "argument is: "
       call pair%debug_display()
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

  integer function run_garbage_collector( oldfree ) result(retval)
    integer :: dstat
    character(:), allocatable :: derr
    integer :: oldfree 
    class(scheme_object), pointer, save :: root => null()
    type(scheme_pointer), dimension(memory_size) :: new_cars
    type(scheme_pointer), dimension(memory_size) :: new_cdrs
    type(scheme_broken_heart), target :: the_broken_heart
    type(scheme_forwarding_address), pointer :: &
         new_forwarding_address_holder  ! this place may be wrong. m.b. pointer?
    integer :: newfree
    integer :: scan
    newfree = 1
    scan = 1
    if (.not.(newfree == 1)) then
       write(*,fmt='(a,a,i0)') new_line(''), "error:gc:free=", newfree
       error stop "assertion failed"
    end if

    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:exp="; call exp%debug_display()
    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:env="; call env%debug_display()
    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:val="; call val%debug_display()
    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:proc="; call proc%debug_display()
    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:argl="; call argl%debug_display()
    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:unev="; call unev%debug_display()
    write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:reg_continue="; call reg_continue%debug_display()
    if (.not.(newfree == 1)) then
       write(*,fmt='(a,a,i0)') new_line(''), "error:gc:free=", newfree
       error stop "assertion failed"
    end if
    
    
    root => cons(  exp, &
            cons(  env, &
            cons(  val, &
            cons( proc, &
            cons( argl, &
            cons( unev, &
            cons( the_global_environment, &
            cons( the_stack, &
            cons( reg_continue, the_null))))))))) ! do we even need "continue"?
    if (.not.(newfree == 1)) then
       write(*,fmt='(a,a,i0)') new_line(''), "error:gc:free=", newfree
       error stop "assertion failed"
    end if

    allocate( new_cars(newfree)%contents, source=car(root)) 
    allocate( new_cdrs(newfree)%contents, source=cdr(root))

    if (.not.(newfree == 1)) then
       write(*,fmt='(a,a,i0)') new_line(''), "error:gc:free=", newfree
       error stop "assertion failed"
    end if
    
    select type (root)
    class is (scheme_pair)
       allocate( the_cars(root%value)%contents, source=the_broken_heart )
       allocate(new_forwarding_address_holder) ! if it deallocates, I'm wrong
       new_forwarding_address_holder%moved_to = newfree
       the_cdrs(root%value)%contents => new_forwarding_address_holder
       root%value = newfree ! in the new memory
    class default
       error stop "run_garbage_collector: root not a pair."
    end select
    newfree = newfree + 1
    scanning: do
       if ( scan >= newfree) exit scanning
       ! move car
       select type (scan_car => new_cars(scan)%contents)
       class is (scheme_pair) ! update the pair
          select type (scan_car_pointee => the_cars(scan_car%value)%contents)
          class is (scheme_broken_heart) ! actualize the pointer
             select type (new_address => the_cdrs(scan_car%value)%contents)
             class is (scheme_forwarding_address)
                scan_car%value = new_address%moved_to
             class default
                error stop "gc: broken heart with no address"
             end select
          class default ! not broken heart, copy contents
             ! m.b. transfer? copy? =?
             !new_cars(free)%contents => scan_car_pointee
             allocate( new_cars(newfree)%contents, &
               source=the_cars(scan_car%value)%contents)
             deallocate( the_cars(scan_car%value)%contents )

             ! m.b. transfer? copy? =?
             !new_cdrs(free)%contents => the_cdrs(scan_car%value)%contents
             allocate( new_cdrs(newfree)%contents, &
                  source=the_cdrs(scan_car%value)%contents)
             deallocate( the_cdrs(scan_car%value)%contents )
             
             !the_cars(scan_car%value)%contents => the_broken_heart
             allocate( the_cars(scan_car%value)%contents, source=the_broken_heart)
             allocate(new_forwarding_address_holder) ! if it deallocates, I'm wrong
             new_forwarding_address_holder%moved_to = newfree
             the_cdrs(scan_car%value)%contents => new_forwarding_address_holder
             ! record where to moved
             scan_car%value = newfree
             newfree = newfree + 1
          end select
       class default
          ! no need to actualize the pointer for a non-pair
       end select
       ! move cdr
       select type (scan_cdr => new_cdrs(scan)%contents)
       class is (scheme_pair) ! update the pair
          select type (scan_cdr_pointee => the_cars(scan_cdr%value)%contents)
          class is (scheme_broken_heart) ! actualize the pointer
             select type (new_address => the_cdrs(scan_cdr%value)%contents)
             class is (scheme_forwarding_address)
                scan_cdr%value = new_address%moved_to
             class default
                error stop "gc: broken heart with no address"
             end select
          class default ! not broken heart, copy contents
             ! m.b. transfer? copy? =?
             !new_cars(free)%contents => scan_car_pointee
             allocate( new_cars(newfree)%contents, source=the_cars(scan_cdr%value)%contents)
             deallocate( the_cars(scan_cdr%value)%contents )
             ! m.b. transfer? copy? =?
             !new_cdrs(free)%contents => the_cdrs(scan_car%value)%contents
             allocate( new_cdrs(newfree)%contents, source=the_cdrs(scan_cdr%value)%contents)
             deallocate( the_cdrs(scan_cdr%value)%contents )
             
             !the_cars(scan_cdr%value)%contents => the_broken_heart
             allocate( the_cars(scan_cdr%value)%contents, source=the_broken_heart )
             allocate(new_forwarding_address_holder) ! if it deallocates, I'm wrong
             new_forwarding_address_holder%moved_to = newfree
             the_cdrs(scan_cdr%value)%contents => new_forwarding_address_holder
             ! record where to moved
             scan_cdr%value = newfree
             newfree = newfree + 1
          end select
       class default
          ! no need to actualize the pointer for a non-pair
       end select
       scan = scan + 1
    end do scanning
    write (*, fmt='(a,a,i0)') new_line(''), "Collected garbage. newfree=", newfree

    scan = 1
    deallocation: do
       if ( scan == (oldfree-1)) exit deallocation
       if (associated(the_cars(scan)%contents)) then
          !deallocate(the_cars(scan)%contents, stat=dstat, errmsg=derr)
          deallocate( the_cars(scan)%contents )
       end if
       if (associated(the_cdrs(scan)%contents)) then
          !deallocate(the_cdrs(scan)%contents, stat=dstat, errmsg=derr)
          deallocate( the_cdrs(scan)%contents )
       end if
       scan = scan + 1
    end do deallocation

    the_cars = new_cars
    the_cdrs = new_cdrs
    ! root => cons(  exp, &
    !         cons(  env, &
    !         cons(  val, &
    !         cons( proc, &
    !         cons( argl, &
    !         cons( unev, &
    !         cons( the_global_environment, &
    !         cons( the_stack, &
    !         cons( reg_continue, the_null))))))))) ! do we even need "continue"?

    exp =>  car(root)
    env =>  car(cdr(root))
    val =>  car(cdr(cdr(root)))
    proc => car(cdr(cdr(cdr(root))))
    argl => car(cdr(cdr(cdr(cdr(root)))))
    unev => car(cdr(cdr(cdr(cdr(cdr(root))))))
    the_global_environment => &
            car(cdr(cdr(cdr(cdr(cdr(cdr(root)))))))
    the_stack => &
            car(cdr(cdr(cdr(cdr(cdr(cdr(cdr(root))))))))
    ! write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:exp="; call exp%debug_display()
    ! write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:env="; call env%debug_display()
    ! write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:val="; call val%debug_display()
    ! write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:proc="; call proc%debug_display()
    ! write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:argl="; call argl%debug_display()
    ! write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:unev="; call unev%debug_display()

    select type (tmp2 => car(cdr(cdr(cdr(cdr(cdr(cdr(cdr(cdr(root))))))))))
    class is (scheme_symbol)
       reg_continue => tmp2
    class is (scheme_object)
       write (*,fmt='(a,a)', advance='no') new_line('a'), "argument is: "
       call tmp2%debug_display()
       error stop "garbage collection failed"
    class default
       error stop "garbage collection failed even more"
    end select
    !write (*,fmt='(a,a)', advance='no') new_line(''), "gc:debug:reg_continue="; call reg_continue%debug_display()
    retval = newfree
  end function run_garbage_collector

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
       retval => cons( make_symbol("unbound"), the_false)
    class is (scheme_pair)
       retval => frame_loop( car(car(env)), cdr(car(env)))
    class default
       write (*, "(a)", advance='no') "error:irritant:var="
       call var%debug_display()
       write (*, "(a)", advance='no') "irritant:env="
       call env%debug_display()
       write (*,*) ""
       error stop "lookup_variable_value: wrong object in an env"
    end select
  contains

    recursive function frame_loop( vars, vals ) result( retval )
      class(scheme_object), pointer, intent(in) :: vars
      class(scheme_object), pointer, intent(in) :: vals
      class(scheme_object), pointer :: retval
      select type (vars)
      type is (scheme_empty_list) ! frame empty
         retval => lookup_variable_value( var, cdr(env) )
      class is (scheme_pair) ! frame is a list
         select type ( name => car(vars) )
         class is (scheme_symbol)
            if ( name == var ) then
               retval => cons( make_symbol("bound"), car(vals))
            else
               retval => frame_loop( cdr(vars), cdr(vals))
            end if
         class default
            error stop "lookup_variable_value::frame_loop: variable name not a symbol"
         end select
      class default ! frame is not a list
         error stop "lookup_variable_value::frame_loop: frame-vars is not a list"
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

  subroutine debug_display_boolean( this )
    class(scheme_boolean), intent(in):: this
    !    select type (temp => this%value )
    !      type is ( character(len=*) )
    character(len=:), allocatable :: marker
    marker = 'fixme'
    if ( this%value .eqv. .true.) then
       marker = 't'
    else if ( this%value .eqv. .false. ) then
       marker = 'f'
    else
       error stop "Wrong logical contents"
    end if
    write (output_unit, fmt='(a,a)', advance='no') '#', marker
    !      end select
  end subroutine debug_display_boolean

  
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

  function packaged_exit( argl, env ) result(retval)
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env 
    class(scheme_object), pointer :: retval
    stop 0
  end function packaged_exit

  function packaged_display( argl, env ) result(retval)
    class(scheme_object), pointer :: argl
    class(scheme_object), pointer :: env 
    class(scheme_object), pointer :: retval
    retval => the_null
    select type (tmp => car(argl))
    class is (scheme_object)
       call tmp%debug_display()
    class default
       error stop "Critical error. This should never get executed."
    end select
  end function packaged_display

  
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
    ! ersatz-display
    function_name = "display"
    proc => packaged_display
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_blurb" ) ), &
         list_primitive_objects)
    ! blurb
    function_name = "blurb" ! automatic reallocation?
    proc => packaged_blurb
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_blurb" ) ), &
         list_primitive_objects)
    function_name = "exit" ! automatic reallocation?
    proc => packaged_exit
    list_primitive_names => cons( make_symbol(function_name), &
         list_primitive_names)
    list_primitive_objects => cons( cons( symbol_primitive, &
         make_primitive_procedure_object( proc, "packaged_exit" ) ), &
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

  logical function is_null_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (arg)
    class is (scheme_empty_list)
       retval = .true.
    class default
       retval = .false.
    end select
  end function is_null_p

  logical function ll_last_operand_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (arg)
    class is (scheme_pair)
       retval = is_null_p( cdr(arg) )
    class default
       error stop "ll_last_operand_p: expected a pair"
    end select
  end function ll_last_operand_p
    
  subroutine scheme_save_reg( val )
    class(scheme_object), pointer, intent(in) :: val
    stack_number_pushes = stack_number_pushes + 1
    stack_current_depth = stack_current_depth + 1
    stack_max_depth = max( stack_current_depth, stack_max_depth )
    the_stack => cons(val, the_stack)
  end subroutine scheme_save_reg

  function scheme_restore() result( retval )
    class(scheme_object), pointer :: retval
    stack_current_depth = stack_current_depth - 1
    retval => car(the_stack)
    the_stack => cdr(the_stack)
  end function scheme_restore

  subroutine print_stack_statistics()
    write (*,fmt='(a,a,i0,a,i0,a,i0)', advance='no') new_line('a'), "total-pushes=", stack_number_pushes, &
         " maximum-depth=", stack_max_depth, " free=", free
  end subroutine print_stack_statistics
  
  subroutine initialize_stack()
    the_stack => the_null
    stack_number_pushes = 0
    stack_max_depth = 0
    stack_current_depth = 0
  end subroutine initialize_stack

  function ll_operator(exp) result(retval)
    class(scheme_object), pointer, intent(in) :: exp
    class(scheme_object), pointer :: retval
    retval => car(exp)
  end function ll_operator
  
  function ll_operands(exp) result(retval)
    class(scheme_object), pointer, intent(in) :: exp
    class(scheme_object), pointer :: retval
    retval => cdr(exp)
  end function ll_operands

  function ll_first_operand_p(exp) result(retval)
    class(scheme_object), pointer, intent(in) :: exp
    class(scheme_object), pointer :: retval
    retval => car(exp)
  end function ll_first_operand_p
    
  function ll_rest_operands(exp) result(retval)
    class(scheme_object), pointer, intent(in) :: exp
    class(scheme_object), pointer :: retval
    retval => cdr(exp)
  end function ll_rest_operands

  
  logical function is_primitive_procedure_p( arg ) result(retval)
    class(scheme_object), pointer, intent(in) :: arg
    retval = is_tagged_list_p( arg, make_symbol("primitive"))
  end function is_primitive_procedure_p

  logical function is_compound_procedure_p( arg ) result(retval)
    class(scheme_object), pointer, intent(in) :: arg
    retval = is_tagged_list_p( arg, make_symbol("procedure"))
  end function is_compound_procedure_p

  ! Is this even remotely going to work?
  ! (define (append list1 list2)
  ! (if (null? list1)
  !     list2
  !     (cons (car list1) (append (cdr list1) list2))))
  recursive function ll_append( list1, list2 ) result(retval)
    class(scheme_object), pointer, intent(in) :: list1
    class(scheme_object), pointer, intent(in) :: list2
    class(scheme_object), pointer :: retval
    if (is_null_p(list1)) then
       retval => list2
    else
       retval => cons( car(list1), ll_append( cdr(list1), list2))
    end if
  end function ll_append

  !(define (adjoin-arg arg arglist) (append arglist (list arg)))
  function ll_adjoin_arg(arg, arglist) result(retval)
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer, intent(in) :: arglist
    class(scheme_object), pointer :: retval
    retval => ll_append( arglist, cons( arg, the_null ) )
  end function ll_adjoin_arg

  function ll_if_predicate( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr( arg ))
  end function ll_if_predicate

  function ll_if_alternative( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    select type (tmp => cdr(cdr(cdr(arg))))
    class is (scheme_empty_list)
       retval => the_false
    class is (scheme_pair)
       retval => car( tmp )
    class default
       error stop "Critical error. If structure is malformed."
    end select
  end function ll_if_alternative

  function ll_if_consequent( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(cdr(arg)))
  end function ll_if_consequent
  
  logical function ll_true_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (arg)
    class is (scheme_boolean)
       if (arg%value .eqv. the_false%value) then
          retval = .false.
       else
          retval = .true.
       end if
    class default
       retval = .true.
    end select
    
  end function ll_true_p

  function ll_begin_actions( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => cdr(arg)
  end function ll_begin_actions

  function ll_first_exp( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(arg)
  end function ll_first_exp

  logical function ll_last_exp_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (arg)
    class is (scheme_pair)
       retval = is_null_p( cdr(arg) )
    class default
       error stop "ll_last_exp_p: expected a pair"
    end select
  end function ll_last_exp_p

  function ll_rest_exps( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => cdr(arg)
  end function ll_rest_exps

  function ll_text_of_quotation( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(arg))
  end function ll_text_of_quotation

  function ll_lambda_parameters( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(arg))
  end function ll_lambda_parameters

  function ll_lambda_body( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => cdr(cdr(arg))
  end function ll_lambda_body

  ! (define (make-procedure parameters body env)
  !    (list 'procedure parameters body env))
  function ll_make_procedure( parameters, body, env ) result( retval )
    class(scheme_object), pointer, intent(in) :: parameters
    class(scheme_object), pointer, intent(in) :: body
    class(scheme_object), pointer, intent(in) :: env
    class(scheme_object), pointer :: retval
    retval => cons( make_symbol("procedure"), cons( parameters, &
       cons( body, cons( env, the_null))))
  end function ll_make_procedure

  function ll_assignment_variable( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(arg))
  end function ll_assignment_variable

  function ll_assignment_value( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(cdr(arg)))
  end function ll_assignment_value

      ! (define (set-variable-value! var val env)
      ! (define (env-loop env)
      !   (define (scan vars vals)
      !     (cond ((null? vars)
      !   	 (env-loop (enclosing-environment env)))
      !   	((eq? var (car vars))
      !   	 (set-car! vals val))
      !   	(else (scan (cdr vars) (cdr vals)))))
      !   (if (eq? env the-empty-environment)
      !       (cons 'unbound 'error)
      !       (let ((frame (first-frame env)))
      !         (scan (frame-variables frame)
      !   	    (frame-values frame)))))
      ! (env-loop env))
  function ll_set_variable_value_b( var, val, env ) result( retval )
    type(scheme_symbol), pointer, intent(in) :: var
    class(scheme_object), pointer, intent(in) :: val
    class(scheme_object), pointer, intent(in) :: env
    class(scheme_object), pointer :: retval
    select type( env )
    class is ( scheme_empty_list )
       retval => cons( make_symbol("unbound"), make_symbol("error"))
    class is (scheme_pair)
       retval => frame_loop( car(car(env)), cdr(car(env)))
    class default
       error stop "set_variable_value_b: wrong object in an env"
    end select
    !error stop "set-variable-value! not implemented"
  contains

    recursive function frame_loop( vars, vals ) result( retval )
      class(scheme_object), pointer, intent(in) :: vars
      class(scheme_object), pointer, intent(in) :: vals
      class(scheme_object), pointer :: retval

      select type (vars)
      type is (scheme_empty_list) ! frame empty
         retval => ll_set_variable_value_b( var, val, cdr(env) )
      class is (scheme_pair) ! frame is a list
         select type ( name => car(vars) )
         class is (scheme_symbol)
            if ( name == var ) then
               !retval => cons( make_symbol("bound"), car(vals))
               !(set-car! vals val)
               select type( vals )
               class is (scheme_pair)
                  ! todo: implement set-car!
                  ! the following line is creepy
                  the_cars(vals%value)%contents => val !do I actually need = ?
                  retval => cons(make_symbol("ok"), make_symbol("no-error"))
                  ! cons( make_symbol("bound"), )
               class default
                  error stop "set_variable_value_b: weird error"
               end select
            else
               retval => frame_loop( cdr(vars), cdr(vals))
            end if
         class default
            error stop "set_variable_value_b::frame_loop: variable name not a symbol"
         end select
      class default ! frame is not a list
         error stop "set_variable_value_b::frame_loop: frame-vars is not a list"
      end select
    end function frame_loop
  end function ll_set_variable_value_b

  function ll_definition_variable( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    select type (tmp => car(cdr(arg)))
    class is (scheme_symbol)
       retval => tmp
    class default
       retval => car( tmp )
    end select
  end function ll_definition_variable

  ! (define (definition-value exp)
  !       	(if (symbol? (cadr exp))
  !       	    (caddr exp)
  !       	    (make-lambda (cdadr exp)
  !       			 (cddr exp))))
  function ll_definition_value( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    select type (tmp => car(cdr(arg)))
    class is (scheme_symbol)
       retval => car(cdr(cdr( exp )))
    class default
       retval => ll_make_lambda( cdr(car(cdr(exp))), cdr(cdr(exp)))
    end select
  end function ll_definition_value

  function ll_make_lambda( parameters, body ) result( retval )
    class(scheme_object), pointer, intent(in) :: parameters
    class(scheme_object), pointer, intent(in) :: body
    class(scheme_object), pointer :: retval
    retval => cons( make_symbol("lambda"), cons( parameters, body ) )
  end function ll_make_lambda

      ! (define (define-variable! var val env)
      ! (let ((frame (first-frame env)))
      !   (define (scan vars vals)
      !     (cond ((null? vars)
      !   	 (add-binding-to-frame! var val frame))
      !   	((eq? var (car vars))
      !   	 (set-car! vals val))
      !   	(else (scan (cdr vars) (cdr vals)))))
      !   (scan (frame-variables frame)
      !         (frame-values frame))))
  subroutine ll_define_variable_b( var, val, env)
    type(scheme_symbol), pointer, intent(in) :: var
    class(scheme_object), pointer, intent(in) :: val
    class(scheme_object), pointer, intent(in) :: env
    select type( env )
    class is (scheme_pair)
      call frame_loop( car(car(env)), cdr(car(env)))
    class default
       error stop "ll_define_variable_b: wrong object in an env"
    end select
    !error stop "set-variable-value! not implemented"
  contains
    recursive subroutine frame_loop( vars, vals )
      class(scheme_object), pointer, intent(in) :: vars
      class(scheme_object), pointer, intent(in) :: vals
      select type (vars)
      type is (scheme_empty_list) ! frame empty
        call ll_add_binding_to_frame_b( var, val, car(env))
      class is (scheme_pair) ! frame is a list
         select type ( name => car(vars) )
         class is (scheme_symbol)
            if ( name == var ) then
               !(set-car! vals val)
               select type( vals )
               class is (scheme_pair)
                  ! todo: implement set-car!
                  ! the following line is creepy
                  the_cars(vals%value)%contents => val !do I actually need = ?
               class default
                  error stop "ll_define_variable_b: vals not a list"
               end select
            else
               call frame_loop( cdr(vars), cdr(vals))
            end if
         class default
            error stop "ll_define_variable_b::frame_loop: variable name not a symbol"
         end select
      class default ! frame is not a list
         error stop "set_variable_value_b::frame_loop: frame-vars is not a list"
      end select
    end subroutine frame_loop
      !   (define (add-binding-to-frame! var val frame)
      !      (set-car! frame (cons var (car frame)))
      !      (set-cdr! frame (cons val (cdr frame))))
    subroutine ll_add_binding_to_frame_b( var, val, frame)
      class(scheme_object), pointer, intent(in) :: var
      class(scheme_object), pointer, intent(in) :: val
      class(scheme_object), pointer, intent(in) :: frame
      select type (frame)
      class is (scheme_pair)
         the_cars(frame%value)%contents => cons( var, car(frame))
         the_cdrs(frame%value)%contents => cons( val, cdr(frame))
      class default
         error stop "ll_add_binding_to_frame_b: Error. Frame not a pair."
      end select
    end subroutine ll_add_binding_to_frame_b
  end subroutine ll_define_variable_b

  function ll_procedure_parameters( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(arg)) 
  end function ll_procedure_parameters

  function ll_procedure_body( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(cdr(arg)))
  end function ll_procedure_body
  
  function ll_procedure_environment( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(cdr(cdr(arg))))
  end function ll_procedure_environment

  ! (define (let-bindings exp)
  !   (cadr exp))
  function ll_let_bindings( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(arg))
  end function ll_let_bindings
  
  recursive function ll_map( proc1, lst ) result( retval )
    class(scheme_object), pointer, intent(in) :: lst
    class(scheme_object), pointer :: retval
    procedure(mappable_proc), pointer :: proc1
    select type (lst)
    class is (scheme_empty_list)
       retval => the_null
    class is (scheme_pair)
       retval => cons( proc1( car(lst) ), ll_map( proc1, cdr(lst) ) )
    end select
  end function ll_map
  ! (define (let-bindings-variables l)
  !   (map car l))
  recursive function ll_let_bindings_variables( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    procedure(mappable_proc), pointer :: tmp => car
    retval => ll_map( tmp, arg)
  end function ll_let_bindings_variables

  function cadr( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car(cdr(arg))
  end function cadr
    ! (define (let-bindings-expressions l)
    !   (map cadr l))
  function ll_bindings_expressions( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    procedure(mappable_proc), pointer :: tmp => cadr
    retval => ll_map( tmp, arg)
  end function ll_bindings_expressions
  
  ! (define (let-contents exp)
  !     (cddr exp))
  function ll_let_contents( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => cdr(cdr(arg))
  end function ll_let_contents
  
    ! (define (let->combination exp)
    !   (cons
    !      (make-lambda 
    !           (let-bindings-variables (let-bindings exp))
    !           (let-contents exp)) 
    !      (let-bindings-expressions (let-bindings exp))))
  function ll_let_to_combination( arg ) result(retval)
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => &
         cons( &
         ll_make_lambda( &
         ll_let_bindings_variables( ll_let_bindings( arg )), &
         ll_let_contents( arg )), &
         ll_bindings_expressions( ll_let_bindings( arg )))
  end function ll_let_to_combination

  ! (define (cond-clauses exp) (cdr exp))
  function ll_cond_clauses( arg ) result (retval)
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => cdr( arg )
  end function ll_cond_clauses
  
  ! (define (cond-else-clause? clause)
  !   (eq? (cond-predicate clause) 'else))
  logical function ll_cond_else_clause_p( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    select type (tmp => ll_cond_predicate(arg))
    class is (scheme_symbol)
       if (tmp == make_symbol( "else") ) then
          retval = .true.
       else
          retval = .false.
       end if
    class default
       retval = .false.
    end select
  end function ll_cond_else_clause_p
  
  ! (define (cond-predicate clause) (car clause))
  function ll_cond_predicate( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => car( arg )
  end function ll_cond_predicate
  
  ! (define (cond-actions clause) (cdr clause))
  function ll_cond_actions( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => cdr(arg)
  end function ll_cond_actions
  
    ! (define (cond->if exp)
    !   (expand-clauses (cond-clauses exp)))
  function ll_cond_to_if( arg ) result (retval)
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    retval => ll_expand_clauses( ll_cond_clauses( arg ) )
  end function ll_cond_to_if

  ! (define (expand-clauses clauses)
  !   (if (null? clauses)
  !       'false 
  !       (let ((first (car clauses))
  !     	(rest (cdr clauses)))
  !         (if (cond-else-clause? first)
  !     	(if (null? rest)
  !     	    (sequence->exp (cond-actions first))
  !     	    (error "ELSE clause isn't last -- COND->IF"
  !     		   clauses))
  !     	(make-if (cond-predicate first)
  !     		 (sequence->exp (cond-actions first))
  !     		 (expand-clauses rest))))))
  recursive function ll_expand_clauses( arg ) result( retval )
    class(scheme_object), pointer, intent(in) :: arg
    class(scheme_object), pointer :: retval
    class(scheme_object), pointer :: first
    class(scheme_object), pointer :: rest
    select type (arg)
    class is (scheme_empty_list)
       retval => the_false
    class is (scheme_pair)
       first => car(arg)
       rest  => cdr(arg)
       if (ll_cond_else_clause_p(first)) then
          if (is_null_p(rest)) then
             retval => ll_sequence_to_exp( ll_cond_actions( first ))
          else
             error stop "cond->if: else clause is not last"
          end if
       else
          retval => ll_make_if( &
                      ll_cond_predicate(first), &
                      ll_sequence_to_exp( ll_cond_actions(first)), &
                      ll_expand_clauses(rest))
       end if
    class default
       error stop "ll_expand_clauses: malformed sequence"
    end select
  end function ll_expand_clauses

  ! (define (sequence->exp seq)
  !   (cond ((null? seq) seq)
  !         ((last-exp? seq) (first-exp seq))
  !         (else (make-begin seq))))
  function ll_sequence_to_exp(seq) result( retval )
    class(scheme_object), pointer, intent(in) :: seq
    class(scheme_object), pointer :: retval
    if (is_null_p(seq)) then
       retval => seq
    elseif (is_last_exp_p(seq)) then
       retval => ll_first_exp(seq)
    else
       retval => ll_make_begin(seq)
    end if
  end function ll_sequence_to_exp

  !(define (last-exp? seq) (null? (cdr seq)))
  logical function is_last_exp_p(seq) result(retval)
    class(scheme_object), pointer, intent(in) :: seq
    select type( tmp => cdr(seq))
    class is (scheme_empty_list)
       retval = .true.
    class default
       retval = .false.
    end select
  end function is_last_exp_p

  function ll_make_begin( seq ) result(retval)
    class(scheme_object), pointer, intent(in) :: seq
    class(scheme_object), pointer :: retval
    retval => cons( make_symbol("begin"), seq)
  end function ll_make_begin

  function ll_make_if( predicate, consequent, alternative ) result(retval)
    class(scheme_object), pointer, intent(in) :: predicate
    class(scheme_object), pointer, intent(in) :: consequent
    class(scheme_object), pointer, intent(in) :: alternative
    class(scheme_object), pointer :: retval
    retval => cons( make_symbol("if"), &
                cons( predicate, &
                  cons( consequent, &
                    cons( alternative, the_null))))
  end function ll_make_if
  
  
  function apply_primitive_procedure_with_errors( proc, argl, env ) result(retval)
    class(scheme_object), pointer :: retval
    class(scheme_object), pointer, intent(in) :: proc
    class(scheme_object), pointer, intent(in) :: argl
    class(scheme_object), pointer, intent(in) :: env
    select type (proc_object => cdr(proc))
    class is (scheme_primitive_procedure)
       ! TODO: implement type checkers
       retval => cons( make_symbol("no-error"), proc_object%proc_pointer( argl , env ))
    class default
       error stop "apply-primitive-procedure: expected procedure object &
            & not actually a procedure"
    end select
  end function apply_primitive_procedure_with_errors
  
  
  recursive subroutine main_loop()
    ! procedure(packageable_procedure), pointer :: proc
    ! class(scheme_object), pointer :: retval
    ! type(scheme_primitive_procedure), pointer :: proc_holder
    ! not sure it is the best place for it
    character(len=:), allocatable :: label_value
    the_global_environment => ll_setup_global_environment()
    label_value = "read-eval-print-loop"
001 label_selector: select case (label_value)
    case ("read-eval-print-loop")
       ! (perform (op initialize-stack))
       call initialize_stack()
       ! (perform (op prompt-for-input) (const "\n;;EC-Eval input:"))
       write (*,fmt='(a,a)', advance='no') new_line(''), "SCHEMETRAN-Input: " !
       ! (assign exp (op read))
       exp => ll_read()
       ! (perform (op user-print) (reg exp))
       write (*, fmt='(a,a)', advance='no') &
            new_line(''), "debug: I parsed as: "
       call exp%debug_display() ;     write (*,'(a)', advance='no') new_line('a')
       !(assign env (op get-global-environment))
       env => the_global_environment
       !(assign continue (label print-result))
       reg_continue => make_symbol("print-result")
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
    case ("print-result") ! ec-label: print-result
       !(perform (op announce-output) (const ";;EC-Eval value:"))
       write (*,fmt='(a,a)', advance='no') new_line(''), "SCHEMETRAN-Value: "
       !(perform (op user-print) (reg val))
       call val%debug_display() !; write (*, fmt='(a)') new_line('a')
       !(perform (op print-stack-statistics))
       call print_stack_statistics()
       !(goto (label read-eval-print-loop))
       label_value = "read-eval-print-loop"
       goto 001
    case ("unknown-expression-type")
       !(assign val (const unknown-expression-type-error))
       val => make_symbol("unknown-expression-type-error")
       !(goto (label signal-error))
       label_value = "signal-error"
       goto 001
    case ("unknown-procedure-type")
       !(restore continue) ; clean up stack (from apply-dispatch )
       select type (temp => scheme_restore())
       class is (scheme_symbol)
          reg_continue => temp
       class default
          error stop "unknown-procedure-type:&
           & cannot restore reg_continue, wrong type"
       end select
       !(assign val (const unknown-procedure-type-error))
       val => make_symbol("unknown-procedure-type-error")
       !(goto (label signal-error))
       label_value = "signal-error"
       goto 001
    case ("signal-error")
       !(perform (op user-print) (reg val))
       call val%debug_display()
       !(goto (label read-eval-print-loop))
       label_value = "read-eval-print-loop"
       goto 001
    case ("ev-definition")
       !(assign unev (op definition-variable) (reg exp))
       unev => ll_definition_variable( exp )
       !(save unev) ; save variable for later
       call scheme_save_reg( unev )
       !(assign exp (op definition-value) (reg exp))
       exp => ll_definition_value( exp )
       !(save env)
       call scheme_save_reg( env )
       !(save continue)
       call scheme_save_reg( reg_continue )
       !(assign continue (label ev-definition-1))
       reg_continue => make_symbol( "ev-definition-1" )
       !(goto (label eval-dispatch)) ; evaluate the definition value
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-definition guard"
    case ("ev-definition-1")
       !(restore continue)
       select type (temp => scheme_restore())
       class is (scheme_symbol)
          reg_continue => temp
       class default
          error stop "ev-definition-1:&
           & cannot restore reg_continue, wrong type"
       end select
       !(restore env)
       env => scheme_restore()
       !(restore unev)
       unev => scheme_restore()
       !(perform (op define-variable!) (reg unev) (reg val) (reg env))
       select type (unev)
       class is (scheme_symbol)
          call ll_define_variable_b( unev, val, env )
       class default
          error stop "ev-definition-1: Error. Definition variable not a symbol."
       end select
       !(assign val (const ok))
       val => make_symbol( "ok" )
       !(goto (reg continue))
       label_value = reg_continue%value
       goto 001
       error stop "ev-definition-1 guard"
    case ("ev-self-eval")
       !(assign val (reg exp))
       val => exp
       !(goto (reg continue))
       label_value = reg_continue%value
       goto 001
    case ("ev-quoted")
       !(assign val (op text-of-quotation) (reg exp))
       val => ll_text_of_quotation( exp )
       !(goto (reg continue))
       label_value = reg_continue%value
       goto 001
       error stop "ev-quoted guard"
    case ("ev-lambda")
       !(assign unev (op lambda-parameters) (reg exp))
       unev => ll_lambda_parameters( exp )
       !(assign exp (op lambda-body) (reg exp))
       exp => ll_lambda_body( exp )
       !(assign val (op make-procedure) (reg unev) (reg exp) (reg env))
       val => ll_make_procedure( unev, exp, env)
       !(goto (reg continue))
       label_value = reg_continue%value
       goto 001
       error stop "ev-lambda guard"
    case ("ev-variable")
       !(assign val (op lookup-variable-value) (reg exp) (reg env))
       select type (exp)
       class is (scheme_symbol)
          val => lookup_variable_value( exp, env )
       class default
          error stop "ev-variable: variable name is not a symbol"
       end select
       !(save exp)
       call scheme_save_reg( exp )
       !(assign exp (op car) (reg val))
       exp => car( val )
       !(test (op eq?) (reg exp) (const unbound))
       select type (exp)
       class is (scheme_symbol)
          if ( exp == make_symbol("unbound")) then
             !(branch (label error-unbound-variable))
             label_value = "error-unbound-variable"
             goto 001
          end if
       class default
          error stop "ev-variable: lookup-variable-value returned rubbish"
       end select
       !(restore exp)
       exp => scheme_restore()
       !(assign val (op cdr) (reg val))
       val => cdr(val)
       !(goto (reg continue))
       label_value = reg_continue%value
       goto 001
    case ("error-unbound-variable")
       !(restore exp)
       exp => scheme_restore()
       !(assign val (op cons) (const unbound-variable-error) (reg exp))
       val => cons( make_symbol("unbound-variable-error"), exp)
       !(goto (label signal-error))
       label_value = "signal-error"
       goto 001
       error stop "error-unbound-variable guard"
    case ("ev-assignment")
       ! (assign unev (op assignment-variable) (reg exp))
       unev => ll_assignment_variable( exp )
       ! (save unev) ; save variable for later
       call scheme_save_reg( unev )
       ! (assign exp (op assignment-value) (reg exp))
       exp => ll_assignment_value( exp )
       ! (save env)
       call scheme_save_reg(env)
       ! (save continue)
       call scheme_save_reg(reg_continue)
       ! (assign continue (label ev-assignment-1))
       reg_continue => make_symbol( "ev-assignment-1" )
       ! (goto (label eval-dispatch)) ; evaluate the assignment value
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-assignment guard"
    case ("ev-assignment-1")
       ! (restore continue)
       select type (temp => scheme_restore())
       class is (scheme_symbol)
          reg_continue => temp
       class default
          error stop "ev-assignment-1:&
               & cannot restore reg_continue, wrong type"
       end select
       ! (restore env)
       env => scheme_restore()
       ! (restore unev)
       unev => scheme_restore()
       ! (assign val (op set-variable-value!) (reg unev) (reg val) (reg env))
       select type( unev )
       class is (scheme_symbol)
          val => ll_set_variable_value_b( unev, val, env )
       class default
          error stop "ev-assignment-1: Non-symbol passed as a variable name."
       end select
       ! (assign val (op car) (reg val))
       val => car(val)
       ! (test (op eq?) (reg val) (const unbound))
       select type (val)
       class is (scheme_symbol)
          if ( val == make_symbol("unbound")) then
             ! (branch (label assignment-failed))
             label_value = "assignment-failed"
             goto 001
          end if
       class default
          error stop "ev-assignment-1: Error. assignment return not a symbol"
       end select
       ! (assign val (const ok))
       val => make_symbol( "ok" )
       ! (goto (reg continue))
       label_value = reg_continue%value
       goto 001
       error stop "ev-assignment-1 guard"
    case ("assignment-failed")
       ! (assign exp (reg unev))
       exp => unev
       ! (save exp)
       call scheme_save_reg( exp )
       ! (goto (label error-unbound-variable))
       label_value = "error-unbound-variable"
       goto 001
       error stop "assignment-failed guard"
    case ("ev-if")
       ! (save exp) ; save expression for later
       call scheme_save_reg( exp )
       ! (save env)
       call scheme_save_reg( env )
       ! (save continue)
       call scheme_save_reg( reg_continue )
       ! (assign continue (label ev-if-decide))
       reg_continue => make_symbol( "ev-if-decide" )
       ! (assign exp (op if-predicate) (reg exp))
       exp => ll_if_predicate( exp )
       ! (goto (label eval-dispatch)) ; evaluate the predicate
       label_value = "eval-dispatch"
       goto 001
    case ("ev-if-decide")
       ! (restore continue)
       select type (temp => scheme_restore())
       class is (scheme_symbol)
          reg_continue => temp
       class default
          error stop "ev-if-decide:&
           & cannot restore reg_continue, wrong type"
       end select
       ! (restore env)
       env => scheme_restore()
       ! (restore exp)
       exp => scheme_restore()
       ! (test (op true?) (reg val))
       if (ll_true_p(val)) then
          ! (branch (label ev-if-consequent))
          label_value = "ev-if-consequent"
          goto 001
       end if
       label_value = "ev-if-alternative"
       goto 001
       error stop "ev-if-decide guard"
    case ("ev-if-alternative")
       ! (assign exp (op if-alternative) (reg exp))
       exp => ll_if_alternative( exp )
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
    case ("ev-if-consequent")
       ! (assign exp (op if-consequent) (reg exp))
       exp => ll_if_consequent( exp )
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-if-consequent guard"
    case ("ev-sequence")
       ! (assign exp (op first-exp) (reg unev))
       exp => ll_first_exp( unev )
       ! (test (op last-exp?) (reg unev))
       if (ll_last_exp_p(unev)) then
          ! (branch (label ev-sequence-last-exp))
          label_value = "ev-sequence-last-exp"
          goto 001
       end if
       ! (save unev)
       call scheme_save_reg( unev )
       ! (save env)
       call scheme_save_reg( env  )
       ! (assign continue (label ev-sequence-continue))
       reg_continue => make_symbol( "ev-sequence-continue" )
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-sequence guard"
    case ("ev-sequence-continue")
       ! (restore env)
       env => scheme_restore()
       ! (restore unev)
       unev => scheme_restore()
       ! (assign unev (op rest-exps) (reg unev))
       unev => ll_rest_exps( unev )
       ! (goto (label ev-sequence))
       label_value = "ev-sequence"
       goto 001
       error stop "ev-sequence-continue guard"
    case ("ev-sequence-last-exp")
       ! (restore continue)
       select type (temp => scheme_restore())
       class is (scheme_symbol)
          reg_continue => temp
       class default
          error stop "ev-sequence-last-exp:&
               & cannot restore reg_continue, wrong type"
       end select
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-sequence-last-exp guard"
    case ("ev-begin")
       ! (assign unev (op begin-actions) (reg exp))
       unev => ll_begin_actions( exp )
       ! (save continue)
       call scheme_save_reg( reg_continue )
       ! (goto (label ev-sequence))
       label_value = "ev-sequence"
       goto 001
       error stop "ev-begin guard"
    case ("compound-apply")
       ! (assign unev (op procedure-parameters) (reg proc))
       unev => ll_procedure_parameters( proc )
       ! (assign env (op procedure-environment) (reg proc))
       env => ll_procedure_environment( proc )
       ! (assign env (op extend-environment)
       !     (reg unev) (reg argl) (reg env))
       env => ll_extend_environment( unev, argl, env )
       ! (assign unev (op procedure-body) (reg proc))
       unev => ll_procedure_body( proc )
       ! (goto (label ev-sequence))
       label_value = "ev-sequence"
       goto 001
       error stop "compound-apply guard"
    case ("primitive-apply")
       ! (assign val (op apply-primitive-procedure-with-errors) (reg proc) (reg argl))
       val => apply_primitive_procedure_with_errors( proc, argl, env )
       ! (save val)
       call scheme_save_reg( val )
       ! (assign val (op car) (reg val)) ; error or not
       val => car(val)
       ! (test (op eq?) (const error) (reg val))
       select type (val)
       class is (scheme_symbol)
          if ( val == make_symbol("error")) then
             ! (branch (label primitive-error))
             label_value = "primitive-error"
             goto 001
          end if
       class default
          error stop "primitive-apply: apply-primitive-procedure returned garbage"
       end select
       ! (restore val)
       val => scheme_restore()
       ! (assign val (op cdr) (reg val))
       val => cdr(val)
       ! (restore continue)
       select type (temp => scheme_restore())
       class is (scheme_symbol)
          reg_continue => temp
       class default
          error stop "primitive-apply: cannot restore reg_continue, wrong type"
       end select
       ! (goto (reg continue))
       label_value = reg_continue%value
       goto 001
    case ("primitive-error")
       ! (restore val)
       val => scheme_restore()
       ! (assign val (op cdr) (reg val)) ; error-code
       val => cdr(val)
       ! (assign val (op cons) (const primitive-application-error) (reg val))
       val => cons( make_symbol( "primitive-application-error" ), val)
       ! (goto (label signal-error))
       label_value = "signal-error"
       goto 001
    case ("ev-application")
       ! (save continue)
       call scheme_save_reg(reg_continue)
       ! (save env)
       call scheme_save_reg( env )
       ! (assign unev (op operands) (reg exp))
       unev => ll_operands(exp)
       ! (save unev)
       call scheme_save_reg(unev)
       ! (assign exp (op operator) (reg exp))
       exp => ll_operator(exp)
       ! (assign continue (label ev-appl-did-operator))
       reg_continue => make_symbol("ev-appl-did-operator")
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
    case ("ev-appl-did-operator")
       ! (restore unev) ; the operands
       unev => scheme_restore()
       ! (restore env)
       env => scheme_restore()
       ! (assign argl (op empty-arglist))
       argl => the_null
       ! (assign proc (reg val)) ; the operator
       proc => val
       ! (test (op no-operands?) (reg unev))
       if (is_null_p(unev)) then
          ! (branch (label apply-dispatch))
          label_value = "apply-dispatch"
          goto 001
       end if
       ! (save proc)
       call scheme_save_reg( proc )
       label_value = "ev-appl-operand-loop"
       goto 001
    case ("ev-appl-operand-loop")
       ! (save argl)
       call scheme_save_reg( argl )
       ! (assign exp (op first-operand) (reg unev))
       exp => ll_first_operand_p(unev)
       ! (test (op last-operand?) (reg unev))
       if (ll_last_operand_p(unev)) then
          ! (branch (label ev-appl-last-arg))
          label_value = "ev-appl-last-arg"
          goto 001
       end if
       ! (save env)
       call scheme_save_reg( env )
       ! (save unev)
       call scheme_save_reg( unev )
       ! (assign continue (label ev-appl-accumulate-arg))
       reg_continue => make_symbol("ev-appl-accumulate-arg")
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
    case ("ev-appl-accumulate-arg")
       ! (restore unev)
       unev => scheme_restore()
       ! (restore env)
       env => scheme_restore()
       ! (restore argl)
       argl => scheme_restore()
       ! (assign argl (op adjoin-arg) (reg val) (reg argl))
       argl => ll_adjoin_arg( val, argl )
       ! (assign unev (op rest-operands) (reg unev))
       unev => ll_rest_operands( unev )
       ! (goto (label ev-appl-operand-loop))
       label_value = "ev-appl-operand-loop"
       goto 001
    case ("ev-appl-last-arg")
       ! (assign continue (label ev-appl-accum-last-arg))
       reg_continue => make_symbol( "ev-appl-accum-last-arg" )
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
    case ("ev-appl-accum-last-arg")
       ! (restore argl)
       argl => scheme_restore()
       ! (assign argl (op adjoin-arg) (reg val) (reg argl))
       argl => ll_adjoin_arg( val, argl )
       ! (restore proc)
       proc => scheme_restore()
       ! (goto (label apply-dispatch))
       label_value = "apply-dispatch"
       goto 001
    case ("apply-dispatch")
       ! (test (op primitive-procedure?) (reg proc))
       if (is_primitive_procedure_p(proc)) then
          ! (branch (label primitive-apply))
          label_value = "primitive-apply"
          goto 001
       end if
       ! (test (op compound-procedure?) (reg proc))
       if (is_compound_procedure_p(proc)) then
          ! (branch (label compound-apply))
          label_value = "compound-apply"
          goto 001
       end if
       ! (goto (label unknown-procedure-type))
       label_value = "unknown-procedure-type"
       goto 001
    case ("eval-dispatch")
       if (free >= memory_size/4) then ! is this a good place?
          free = run_garbage_collector(free)
       end if
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
    case ("ev-let")
       ! (assign exp (op let->combination) (reg exp))
       exp => ll_let_to_combination( exp )
       !write (*,*) "debug"
       !call exp%debug_display()
       ! ;(save continue)
       !call scheme_save_reg( reg_continue )
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-let guard"
    case ("ev-cond")
       ! (assign exp (op cond->if) (reg exp))
       exp => ll_cond_to_if( exp )
       ! (goto (label eval-dispatch))
       label_value = "eval-dispatch"
       goto 001
       error stop "ev-cond guard"
    case default
       error stop "Critical error. Default case should never be reached."
    end select label_selector
    error stop "Critical error. The end of main loop should never be reached."
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

