#include "part1.h"

using namespace part1;

int find_smallest(int x, int y, int z)
{
    return std::min( x, std::min(y,z) );
}

int main(int argc, char **argv)
{
    auto a = std::vector<int>( { 1, 2, 3, 4, 5 } );
    auto b = std::vector<int>( { 5, 4, 3, 2, 1 } );
    auto c = std::vector<int>( { 1, 2, 1, 2, 1 } );

    auto result = map( find_smallest, a, b, c );

    print_vector( result );

    return 0;
}