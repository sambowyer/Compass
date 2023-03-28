#include <iostream>
#include <map>
#include <string>

int main()
{
    //create a map that stores strings indexed by strings
    std::map<std::string, std::string> m;

    //add some items to the map
    m["cat"] = "mieow";
    m["dog"] = "woof";
    m["horse"] = "neigh";
    m["fish"] = "bubble";

    //now loop through all of the key-value pairs
    //in the map and print them out
    for ( auto item : m )
    {
        //item.first is the key
        std::cout << item.first << " goes ";

        //item.second is the value
        std::cout << item.second << std::endl;
    }

    //finally, look up the sound of a cat
    std::cout << "What is the sound of a cat? " << m["cat"] 
              << std::endl;

    return 0;
}