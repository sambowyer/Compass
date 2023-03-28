#include "part1.h"

using namespace part1;

int sum(int x, int y)
{
    return x + y;
}

int multiply(int x, int y)
{
    return x * y;
}

int main(int argc, char **argv)
{
    auto a = std::vector<int>( { 1, 2, 3, 4, 5 } );
    auto b = std::vector<int>( { 6, 7, 8, 9, 10 } );

    auto result = mapReduce( multiply, sum, a, b );

    std::cout << result << std::endl;

    auto map_result = map( multiply, a, b );

    print_vector(map_result);

    auto reduce_result = reduce( sum, map_result );

    std::cout << reduce_result << std::endl;

    return 0;
}