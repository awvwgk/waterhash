! This is free and unencumbered software released into the public domain.
! SPDX-Identifier: Unlicense

!> Example driver to hash strings
program main
   use stdlib_hash
   implicit none
   integer, parameter :: i8 = selected_int_kind(18)
   character(len=512) :: arg
   integer :: i
   integer(i8) :: seed = 433494437_i8

   do i = 0, command_argument_count()
      call get_command_argument(i, arg)
      write(*, '(z0.8, 1x, a)') hash(trim(arg), seed), trim(arg)
   end do
end program main
