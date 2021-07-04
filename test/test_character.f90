! This is free and unencumbered software released into the public domain.
! SPDX-Identifier: Unlicense

!> Test hashing for character variables
module test_character
   use testdrive, only : new_unittest, unittest_type, error_type, check
   use reference_waterhash, only : c_waterhash
   use stdlib_hash, only : hash
   implicit none
   private

   public :: collect_character

   !> Long length for integers
   integer, parameter :: i8 = selected_int_kind(18)


contains


   !> Collect all exported unit tests
   subroutine collect_character(testsuite)

      !> Collection of tests
      type(unittest_type), allocatable, intent(out) :: testsuite(:)

      testsuite = [ &
         new_unittest("char1", test_char1), &
         new_unittest("char2", test_char2) &
         ]

   end subroutine collect_character


   subroutine test_char1(error)

      !> Error handling
      type(error_type), allocatable, intent(out) :: error

      integer(i8), parameter :: seed = 433494437_i8

      call check(error, hash("waterhash",  seed),  1441494093)

   end subroutine test_char1


   subroutine test_char2(error)

      !> Error handling
      type(error_type), allocatable, intent(out) :: error

      integer(i8), parameter :: seed = 433494437_i8
      character(len=*), parameter :: string = "hashable-test-string"
      integer :: i

      do i = 1, len(string)
         call check(error, hash(string(1:i), seed), c_waterhash(string(1:i), seed))
         if (allocated(error)) exit
      end do
   end subroutine test_char2


end module test_character
