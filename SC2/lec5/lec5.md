openmp: for C/C++/fortran --- low level stuff b/c its sort of old (1997)
    - OpenMP is a standard for shared memory parallel programming, lets you use multiple cores on one machine (MPI is for multiple machines)

Add in the flag `#pragma omp parallel{...}` to run `...` on multiple cores (default for me was 16)---no. of cores to use can be set by `export OMP_NUM_THREADS=4`
NOTE: you can set `OMP_NUM_THREADS` to a larger number than cores in your machine, it will just allocate the desired number of threads across as many cores as your machine does have 