#include "part1.h"

using namespace part1;

std::string join_strings(std::string x, std::string y)
{
    return x + " " + y;
}

int main(int argc, char **argv)
{
    auto a = std::vector<std::string>( { "cat", "dog", "mouse", "fish" } );

    auto result = reduce( join_strings, a );

    std::cout << result << std::endl;
}