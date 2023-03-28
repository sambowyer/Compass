#include "part1.h"

using namespace part1;

int main(int argc, char **argv)
{
    auto a = std::vector<int>( { 1, 2, 3, 4, 5} );

    auto squares = map( [](int x){ return x*x; }, a );

    print_vector(squares);

    return 0;
}