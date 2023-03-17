#include <iostream>

int sum(int x, int y)
{
    return x + y;
}

template<class FUNC, class ARG1, class ARG2>  // could equally use `typename` in place of `class` (aliases)
auto call_function(FUNC func, ARG1 arg1, ARG2 arg2)
{
    auto result = func(arg1, arg2);
    return result;
}

int main(int argc, char **argv)
{
    auto result = call_function( sum, 3, 7 );
    std::cout << result << std::endl;
    return 0;
}