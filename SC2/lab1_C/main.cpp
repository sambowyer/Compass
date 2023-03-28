#include <iostream>
#include <map>
#include <string>
#include <vector>

#include "persondata.h"

int main()
{
    //declare the map that uses a person's name as a key to look
    //up their personal data stored in the PersonData object
    std::map<std::string,PersonData> database;

    //let's first put the data in three vectors
    std::vector<std::string> names = { "James", "Jane", "Janet", "John" };
    std::vector<float> heights = { 1.7, 1.8, 1.5, 1.4 };
    std::vector<float> weights = { 75.4, 76.5, 56.8, 52.0 };

    //now put all of the data into the database
    for (int i=0; i<names.size(); ++i)
    {
        PersonData data;
        data.setHeight( heights[i] );
        data.setWeight( weights[i] );

        database[names[i]] = data;
    }

    //now print out the entire database
    for ( auto item : database )
    {
        //print out the name
        std::cout << item.first << " : ";

        auto data = item.second;

        std::cout << "height=" << data.height()
                  << " weight=" << data.weight()
                  << " bmi=" << data.bmi() << std::endl;
    }

    return 0;
}