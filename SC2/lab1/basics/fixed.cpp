#include <iostream>

// declare the function
void print_hello();

int main()
{
    print_hello();
    return 0;
}

// define the function
void print_hello()
{
    std::cout << "Hello World!" << std::endl;
}