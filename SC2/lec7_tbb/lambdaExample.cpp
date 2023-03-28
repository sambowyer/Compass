#include <iostream>

int main(int argc, char **argv)
{
    for (int i=1; i<=10; ++i)
    {
        std::cout << "i == " << i << std::endl;

        auto func = [&](int x){ return x + i; };

        std::cout << "func(5) equals " << func(5) << std::endl;
    }

    return 0;
}