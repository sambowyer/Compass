#include "part1.h"

using namespace part1;

int multiply(int x, int y)
{
    return x * y;
}

int main(int argc, char **argv)
{
    auto a = std::vector<int>( { 1, 2, 3, 4, 5} );

    auto two_times_a = map( [](int x){ return multiply(x, 2); }, a );

    print_vector(two_times_a);

    return 0;
}