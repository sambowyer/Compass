#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

#include <tbb/parallel_for.h>
#include <tbb/parallel_reduce.h>

int main(int argc, char **argv)
{
    auto values = std::vector<double>(10000);
    
    // Generate values to sum over
    tbb::parallel_for( tbb::blocked_range<int>(0,values.size()),
                       [&](tbb::blocked_range<int> r)
    {
        for (int i=r.begin(); i<r.end(); ++i)
        {
            values[i] = std::sin(i * 0.001);
        }
    });

    // Sum the values using parallel_reduce
    auto total = tbb::parallel_reduce( 
                    tbb::blocked_range<int>(0,values.size()),
                    0.0,
                    [&](tbb::blocked_range<int> r, double running_total)
                    {
                        for (int i=r.begin(); i<r.end(); ++i)
                        {
                            running_total += values[i];
                        }
                        return running_total;
                    }, std::plus<double>() );

    std::cout << total << std::endl;

    return 0;
}