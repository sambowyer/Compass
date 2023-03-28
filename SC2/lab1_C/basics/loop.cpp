#include <iostream>

int main()
{
    for (int i=1; i<=10; ++i)
    {
        std::cout << i << " times 5 equals " << (i*5) << std::endl;
    }

    int i = 0;
    std::cout << i++ << std::endl << i << std::endl << ++i << std::endl << i << std::endl;

    i = 0;
    std::cout << ++i << std::endl << i << std::endl << i++ << std::endl << i << std::endl;

    return 0;
}