#include <iostream>
#include <vector>

int main()
{
    //create a vector that can hold integers
    std::vector<int> v;

    //append values onto the end of the vector
    v.push_back( 4 );
    v.push_back( 2 );

    //the vector can only hold integers, so if you append
    //a float, it will be converted to an integer
    v.push_back(10.5);

    //loop through every item in the vector and print out
    //the value
    std::cout << "std::vector{ ";

    for (int i=0; i<v.size(); ++i)
    {
        std::cout << v[i] << " ";
    }

    std::cout << "}" << std::endl;

    return 0;
}