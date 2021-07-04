# waterhash

Fortran portation of the [waterhash](https://github.com/tommyettinger/waterhash) algorithm for the Fortran standard library ([stdlib](https://github.com/fortran-lang/stdlib)).


## Test

This project supports the Fortran package manager ([fpm](https://github.com/fortran-lang/fpm)) as build system.
To run the testsuite use

```
fpm test
```

There is also command line driver available which hashes the provided command line arguments with

```
fpm run -- hash-me
```


## Usage

To use this hash in your project add `waterhash` as dependency to your package manifest.

```toml
[dependencies]
waterhash.git = "https://github.com/awvwgk/waterhash"
```

The `stdlib_hash` module becomes available and the `hash` function can be imported.

```f90
program demo_hash
   use iso_fortran_env, only : i8 => int64
   use stdlib_hash, only : hash
   implicit none
   print '(z0.8)', hash("Value", 433494437_i8)  ! return "B5E5E913"
end program demo_hash
```


## (Un)license

This is free and unencumbered software released into the public domain.
