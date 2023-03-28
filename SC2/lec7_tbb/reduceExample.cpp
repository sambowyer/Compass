#include <iostream>
#include <vector>

template <typename T, typename F>
T reduce(const std::vector<T> &input, F func, T init)
{
    T output = init;

    for (size_t i=0; i<input.size(); ++i)
    {
        output = func(output, input[i]);
    }

    return output;
}

int main(int argc, char **argv)
{
    std::vector<int> input = {1, 2, 3, 4, 5};

    auto output = reduce(input, [](int x, int y){ return x + y; }, 0);

    std::cout << output << std::endl;

    return 0;
}