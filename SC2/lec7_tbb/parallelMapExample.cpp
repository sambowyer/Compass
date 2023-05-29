#include <iostream>
#include <vector>
#include <tbb/parallel_for.h>

template <typename T, typename F>
std::vector<T> map(const std::vector<T> &input, F func)
{
    std::vector<T> output(input.size());

    tbb::parallel_for(tbb::blocked_range<int>(0,input.size()), [&](tbb::blocked_range<int> r)
    {
        for (int i=r.begin(); i<r.end(); ++i)
        {
            output[i] = func(input[i]);
        }
    });

    return output;
}

int main(int argc, char **argv)
{
    std::vector<int> input = {1, 2, 3, 4, 5};

    auto output = map(input, [](int x){ return x * x; });

    for (auto x : output)
    {
        std::cout << x << std::endl;
    }

    return 0;
}