# Parallelisation in C++ with Intel TBB

## Introduction

In the previous portfolio we looked at the basics of parallelisation in C++ using the OpenMP library. In this portfolio we will look at the Intel Threading Building Blocks (TBB) library. TBB is another library for parallelisation in C++ and is very similar to OpenMP. It is also very widely used and is a good alternative to OpenMP.

In particular, this portfolio will focus on the use of `map` and `reduce` operations in TBB. These are two very common operations in parallel programming and are very useful for parallelising algorithms. However, before we cover these we will also introduce the concept of lambda functions in C++.

## Lambda functions

Lambda functions are a new feature of C++11. They are a way of defining a function without giving it a name. They are very useful for defining simple functions that are only used once. For example, we can define a lambda function that adds two numbers together as follows:

```{c++}
[](int x, int y) { return x + y; }
```

This might be used in a larger program named `lambdaExample.cpp` as follows:

```{c++}
#include <iostream>

int main(int argc, char **argv)
{
    for (int i=1; i<=10; ++i)
    {
        std::cout << "i == " << i << std::endl;

        auto func = [&](int x){ return x + i; };

        std::cout << "func(5) equals " << func(5) << std::endl;
    }

    return 0;
}
```
Below we then compile and run this program:

```{bash}
g++ -std=c++11 lambdaExample.cpp -o lambdaExample
./lambdaExample
```

We can define the lambda function with different levels of closure based on what we put inside the `[]` brackets.
In particular, we can put the following inside the `[]` brackets:

* `&` - Capture all variables by reference
* `=` - Capture all variables by value
* `x` - Capture the variable `x` by value
* `&x` - Capture the variable `x` by reference

By default, if we do not specify anything inside the `[]` brackets then the lambda function will capture all variables by value. 

## Map
It is very common in parallel programming to want to apply a function to each element of a container. For example, we might want to apply a function to each element of a vector. This is known as a `map` operation. 

We can write an example map implementation in C++ as follows:

```{c++}
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
```

We can then compile and run this program as follows:

```{bash}
g++ -std=c++11 mapExample.cpp -o mapExample
./mapExample
```

## Reduce
Reduce is another very common operation in parallel programming. It is used to combine the elements of a container into a single value. For example, we might want to sum all the elements of a vector. This is known as a `reduce` operation.

We can write an example reduce implementation in C++ as follows:

```{c++}
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
```
Note that we not only have to supply our function `func` to reduce two items into one, but also an initial value `init`.
It is important to consider your initial value carefully, for instance if `func` is addition we would probably want `init=0`, but if `func` is instead multiplication we would more likely want `init=1` (since 0 is the identity element for addition and 1 is the identity element for multiplication).

Compiling and running this program may be done as follows:

```{bash}
g++ -std=c++11 reduceExample.cpp -o reduceExample
./reduceExample
```

## Parallel map and reduce

A parallel implementation of `map` and `reduce` can be implemented using the TBB library. The TBB library provides a `parallel_for` function that can be used to parallelise a `for` loop. The `parallel_for` function takes a range of values to iterate over and a lambda function to apply to each value in the range. The lambda function is executed in parallel on multiple threads. The `parallel_for` function will wait until all the threads have finished executing the lambda function before returning.

In C++11, the `parallel_for` function can be used to implement a parallel `map` operation as follows:

```{c++}
#include <iostream>
#include <vector>
#include <tbb/parallel_for.h>

template <typename T, typename F>
std::vector<T> map(const std::vector<T> &input, F func)
{
    std::vector<T> output(input.size());

    tbb::parallel_for(0, input.size(), [&](int i)
    {
        output[i] = func(input[i]);
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
```

This can then be compiled and run as follows:

```{bash}
g++ -std=c++11 -ltbb parallelMapExample.cpp -o parallelMapExample
./parallelMapExample
```

A parallel implementation of `reduce` is given in the TBB library: `parallel_reduce`.
This has the form
```
tbb::parallel_reduce( 
    tbb::blocked_range r,
    initial_value,
    [](tbb::blocked_range<int> r, double running_total){OPERATIONS IN HERE},
    reduce_func
)  
```

```{c++}
#include <iostream>
#include <cmath>

#include <tbb/parallel_for.h>
#include <tbb/parallel_reduce.h>

int main(int argc, char **argv)
{
    auto total = tbb::parallel_reduce( 
                  tbb::blocked_range<int>(0,10000),
                  0.0,
                  [](tbb::blocked_range<int> r, double running_total)
    {
        for (int i=r.begin(); i<r.end(); ++i)
        {
            running_total += std::sin(i * 0.001);
        }

        return running_total;
    }, std::plus<double>());

    std::cout << total << std::endl;

    return 0;
}
```
This works by splitting the range of values to iterate over into smaller chunks. Each chunk is then assigned to a different thread. Each thread then iterates over its assigned chunk and applies the lambda function to each value in the chunk. The results of each thread are then combined together using the `std::plus<double>()` function.

Running and compiling this program, we see the output that we would expect:
```{bash}
g++ -std=c++11 -ltbb parallelReduceExample.cpp -o parallelReduceExample
./parallelReduceExample
```

## Parallel Mapreduce
It is often very useful to combine the `map` and `reduce` operations into a single operation: mapping a function over a collection and then reducing the output of that map operation using another function.
This is known as a `mapreduce` operation.
Below we show a parallel `mapreduce` implementation using Intel-TBB's `parallel_for` and `parallel_reduce` functions.

```{c++}
#include <iostream>
#include <cmath>

#include <tbb/parallel_for.h>
#include <tbb/parallel_reduce.h>

int main(int argc, char **argv)
{
    auto total = tbb::parallel_reduce( 
                  tbb::blocked_range<int>(0,10000),
                  0.0,
                  [](tbb::blocked_range<int> r, double running_total)
    {
        for (int i=r.begin(); i<r.end(); ++i)
        {
            running_total += std::sin(i * 0.001);
        }

        return running_total;
    }, std::plus<double>());

    std::cout << total << std::endl;

    return 0;
}
```