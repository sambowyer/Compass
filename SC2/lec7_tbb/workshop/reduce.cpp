#include "part1.h"

using namespace part1;

int sum(int x, int y)
{
    return x + y;
}

int main(int argc, char **argv)
{
    auto a = std::vector<int>( { 1, 2, 3, 4, 5 } );
    auto b = std::vector<int>( { 6, 7, 8, 9, 10 } );

    auto results = map( sum, a, b );

    auto total = reduce( sum, results , 10);

    std::cout << "Total = " << total << std::endl;

    return 0;
}