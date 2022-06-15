#ifndef _COLLATZ_TREE_HPP_
#define _COLLATZ_TREE_HPP_

#include <iostream>

typedef unsigned long long ull_t;

class CollatzTree
{
  private:
    ull_t m_value;
    CollatzTree *m_left;
    CollatzTree *m_right;

    CollatzTree(const CollatzTree &src)
    {
        (void)src;
    };
    CollatzTree &operator=(const CollatzTree &rhs)
    {
        (void)rhs;
        return *this;
    };

  public:
    CollatzTree();
    ~CollatzTree();

    CollatzTree(ull_t val);

    void makeLeaf();
    void makeLeafs(unsigned int time);
    void printTree() const;
};

std::ostream &operator<<(std::ostream &o, const CollatzTree &tree);

#endif // _COLLATZ_TREE_HPP_
