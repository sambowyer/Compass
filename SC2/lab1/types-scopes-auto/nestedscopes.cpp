#include <iostream>

int main()
{
    int a = 105;

    for (int i=0; i<10; ++i)
    {
        int a = 3;
        std::cout << "a = " << a << std::endl;
    }

    std::cout << "a = " << a << std::endl;

    return 0;
}