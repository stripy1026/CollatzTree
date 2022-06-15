#include <algorithm>
#include <iostream>

#include "CollatzTree.hpp"

int main()
{
    CollatzTree root;
    root.makeLeafs(10);
    std::cout << root << std::endl;
    return (EXIT_SUCCESS);
}
