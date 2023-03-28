#include <iostream>
#include <vector>

int main()
{
    // create a new vector that is initialised to contain the
    // values on the right (held between curly brackets)
    std::vector<int> v = { 1, 4, 9, 16, 25, 36, 49, 64, 81, 100 };

    // loop over every item in the vector using an iterator for loop
    for (auto x : v)
    {
        std::cout << x << " ";
    }

    std::cout << std::endl;

    return 0;
}