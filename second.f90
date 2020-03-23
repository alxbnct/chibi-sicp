  ! Time-stamp: <2020-03-23 13:13:37 lockywolf>
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
          print*, "read error"
          dummy = c_exit(1) 
       else
          retval = retval//buffer;
       end if
    end do
    print *, "debug:", retval, new_line('a')
  end function read_until_eof
end module system_interface

module scheme
  integer, parameter :: memory_size = 1024
  integer, parameter :: strings_pool_size = 1024
  integer, dimension(memory_size) :: the_cars
  integer, dimension(memory_size) :: the_cdrs
  character, dimension(strings_pool_size) :: strings_pool


  type, abstract :: scheme_object
     integer :: value
  end type scheme_object

  
  type, extends( scheme_object ) :: scheme_string
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
     procedure (func), pointer, nopass :: operation => null()
  end type scheme_primitive_procedure
   
  interface
     function func( arguments ) result( retval )
       import scheme_object
       class(scheme_object), pointer :: retval
       class(scheme_object), dimension(:), pointer :: arguments
     end function func
  end interface

 
contains


  

end module scheme

program main
  use :: scheme, only : scheme_object, scheme_string, scheme_pair, &
       scheme_symbol
  use, intrinsic :: iso_fortran_env
  use, non_intrinsic :: system_interface, only: c_exit, read_until_eof
  implicit none
  integer :: counter = 0
  integer :: fake = 0
  character(len=:), allocatable :: test_string
  !class(scheme_object), pointer :: test_object
  !test_object => read_sexp()
  ! 001 write (output_unit,'(a,i1)') "Hello, world, ", counter
  !   allocate(scheme_string :: test_object) ! memory leak?
  
  !   counter = counter + 1
  !   nullify( test_object )
  !   if (counter < 3) goto 001
  test_string =  read_until_eof()
  print *, "debug", test_string
  fake = c_exit(0)
  stop 0
contains
  
end program main

