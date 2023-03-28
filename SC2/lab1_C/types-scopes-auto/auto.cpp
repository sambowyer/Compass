#include <iostream>

double square(double x)
{
    return x * x;
}

int sum(int a, int b)
{
    return a + b;
}

int main()
{
    //r is automatically declared as a 'double' as the compiler
    //can see that 'square' returns a double
    auto r = square(5.3);

    //s is automatically declared as a 'int' as the compiler
    //can see that 'sum' returns an int
    auto s = sum(4, 7);

    //t is automatically declared as a 'float' as the value on the
    //right hand side of '=' is a float
    auto t = 3.141;

    std::cout << "r = " << r << std::endl;
    std::cout << "s = " << s << std::endl;
    std::cout << "t = " << t << std::endl;

    //note that you can't change the type of an 'auto' variable. Like
    //all other variables, it can only be declared once. The below
    //line is an error
    //auto r = sum(10,12);

    return 0;
}