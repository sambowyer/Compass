#include <iostream>

int main()
{
    //declare 'a' - this is visible from this point in
    //the program onwards, until the closing '}' of main()
    int a = 84;

    if (a == 84)
    {
        // a is visible here, as this is a nested scope of main()
        std::cout << "a = " << a << std::endl;

        // declare 'b' - this is visible from this point in
        // the program onwards, until the closing '}' of this
        // if statement (the end of the if statement's scope)
        int b = 102;

        std::cout << "b = " << b << std::endl;
    }

    // we have now left the scope of the if statement. This means
    // that 'b' no longer exists and is not visible here.

    // if you uncomment this code, it is an error
    // std::cout << "b = " << b << std::endl;

    // however, 'a' is still visible as it was declared in the
    // scope of 'main()' and we are still in this scope
    std::cout << "a = " << a << std::endl;

    return 0;
}