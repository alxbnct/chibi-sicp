! Time-stamp: <2020-03-22 13:33:41 lockywolf>
! First Fortran hello-world 
!integer, parameter :: k6 = selected_int_kind(6);
!integer :: mu_counter = 0;


program main
  use, intrinsic :: iso_fortran_env, only: output_unit
  type person
     character(len=10) :: name
     real :: age
     integer :: id
  end type person
  integer, parameter :: charkind = selected_char_kind('ISO_10646')
  integer, parameter :: realkind = selected_real_kind(10,10,2)
  integer :: nsexps = 100
  character(len=20,kind=charkind) :: a
  real(kind=realkind) testvar
  type(person), pointer, dimension(:) :: b
  allocate(b(nsexps))
  deallocate(b)
  nullify(b)
  testvar = bessel_j1( 2.0_realkind )
  a = charkind_"Hello, world"
  print *, "Hello, world!"
  write (output_unit, '(a,f8.2)') 'testvar=', testvar
contains

  function test()
    print *, "calling function test"
    test = 1
  end function test
end program main

subroutine externalProgramTest
  print *, "Hello from external program test"
contains
  function externalProgramInternalFunction(a,b)
    externalProgramInternalFunction = 0
  end function externalProgramInternalFunction
  
end subroutine externalProgramTest

