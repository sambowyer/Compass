#include <iostream>

int main(int argc, const char **argv)
{
    #pragma omp parallel
    {
        std::cout << "Hello OpenMP!\n";
        std::cout << "1\n";
        std::cout << "2\n";
        std::cout << "3\n";

    }

    return 0;
}