#include <iostream>

// global variable as it is in the file scope
int a = 35;

/* Function to add the passed value to 'a' */
int add(int x)
{
    //create 'b' which is local to the scope of 'add'
    int b = 35;

    return a + b + x;
}

int main()
{
    for (int i=0; i<10; ++i)
    {
        int c = add(i);

        std::cout << "c = " << c << std::endl;
    }

    // we can see 'a' as it is in the file scope
    std::cout << "a = " << a << std::endl;

    // we cannot see 'b' as it is in the scope of the function 'add'
    // std::cout << "b = " << b << std::endl;

    // we cannot see 'i' or 'c' here as they are in the scope
    // of the for loop
    // std::cout << "i = " << i << std::endl;
    // std::cout << "c = " << c << std::endl;

    return 0;
}