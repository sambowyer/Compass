#include <iostream>
#include <string>
#include <map>
#include <vector>

float bmi(float height, float weight){
    return weight/(height*height);
}

int main()
{
    //declare the map that uses a person's name as a key, and looks
    //up a map that stores the person's weight and height
    std::map< std::string, std::map<std::string,float> > database;

    //let's first put the data in three vectors
    std::vector<std::string> names = { "James", "Jane", "Janet", "John" };
    std::vector<float> heights = { 1.7, 1.8, 1.5, 1.4 };
    std::vector<float> weights = { 75.4, 76.5, 56.8, 52.0 };
    std::vector<float> bmis;

    for (int i=0; i<names.size(); ++i){
        bmis.push_back(bmi(heights[i], weights[i]));
    }

    //now put all of the data into the database
    for (int i=0; i<names.size(); ++i)
    {
        std::map<std::string,float> data;

        data["bmi"] = bmis[i];
        data["height"] = heights[i];
        data["weight"] = weights[i];

        database[names[i]] = data;
    }

    //now print out the entire database
    for ( auto item : database )
    {
        //print out the name
        std::cout << item.first << " : ";

        //now print out all of the data about the person
        for ( auto data : item.second )
        {
            std::cout << data.first << "=" << data.second << " ";
        }

        std::cout << std::endl;
    }

    return 0;
}