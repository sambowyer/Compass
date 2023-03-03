#include <iostream>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_num_threads() 0
    #define omp_get_thread_num() 0
#endif

int main(int argc, const char **argv)
{
    std::cout << "I am the main thread.\n";

    #pragma omp parallel
    {
        #pragma omp critical
        {
            int nthreads = omp_get_num_threads();
            int thread_id = omp_get_thread_num();

            std::cout << "Hello. I am thread " << thread_id
                    << " out of a team of " << nthreads 
                    << std::endl;
        }
    }

    std::cout << "Here I am, back to the main thread.\n";

    return 0;
}