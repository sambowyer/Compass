#include "part1.h"

using namespace part1;

int square(int x)
{
    return x * x;
}

int main(int argc, char **argv)
{
    auto a = std::vector<int>( { 1, 2, 3, 4, 5, 6, 7, 8 } );

    auto result = map( square, a );

    print_vector( result );

    return 0;
}