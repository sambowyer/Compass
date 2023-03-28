#include <iostream>

#include "timestable.h"

void timestable(int num, int maxMultiple){
    for (int i=1; i<=maxMultiple; i++){
        std::cout << i*num <<std::endl;
    }
}