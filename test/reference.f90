! This is free and unencumbered software released into the public domain.
! SPDX-Identifier: Unlicense

!> Provides interfaces and implementations for hashing algorithms.
module reference_waterhash
   use, intrinsic :: iso_c_binding, only : c_loc, c_long
   implicit none
   private

   public :: c_waterhash


   !> Hash function to obtain a hashed value of the provided variable
   interface c_waterhash
      !> Interface to the waterhash implementation in C
      pure function c_waterhash(ptr, len, seed) result(val) bind(C)
         use, intrinsic :: iso_c_binding, only : c_ptr, c_int, c_long
         type(c_ptr), value, intent(in) :: ptr
         integer(c_int), value, intent(in) :: len
         integer(c_long), value, intent(in) :: seed
         integer(c_int) :: val
      end function c_waterhash
      module procedure :: c_hash_character
   end interface c_waterhash

contains

   !> Hash a character value
   pure function c_hash_character(var, seed) result(val)
      !> Variable to hash
      character(len=*), target, intent(in) :: var
      !> Seed for the hashing function
      integer(c_long), intent(in) :: seed
      !> Hash value
      integer :: val

      val = c_waterhash(c_loc(var), len(var), seed)

   end function c_hash_character

end module reference_waterhash
