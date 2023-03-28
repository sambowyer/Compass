#include "part1.h"

using namespace part1;

int main(int argc, char **argv)
{
    auto a = std::vector<Point>( { Point(1.0,1.0,1.0), Point(2.0,2.0,2.0), Point(3.0,3.0,3.0) } );
    auto b = std::vector<Point>( { Point(4.0,4.0,4.0), Point(5.0,5.0,5.0), Point(6.0,6.0,6.0) } );

    auto distances = map( calc_distance, a, b );

    print_vector(distances);

    return 0;
}