#include <iostream>
#include <vector>

template <typename T, typename F>
std::vector<T> map(const std::vector<T> &input, F func)
{
    std::vector<T> output(input.size());

    for (size_t i=0; i<input.size(); ++i)
    {
        output[i] = func(input[i]);
    }

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