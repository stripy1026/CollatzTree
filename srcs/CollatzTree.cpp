#include "CollatzTree.hpp"

CollatzTree::CollatzTree() : m_value(1), m_left(nullptr), m_right(nullptr)
{
}

CollatzTree::~CollatzTree()
{
    if (m_left != nullptr)
        delete m_left;
    if (m_right != nullptr)
        delete m_right;
}

CollatzTree::CollatzTree(ull_t val) : m_value(val), m_left(nullptr), m_right(nullptr)
{
}

void CollatzTree::makeLeaf()
{
    if (m_left != nullptr)
        m_left->makeLeaf();
    else
        m_left = new CollatzTree(m_value * 2);
    if (m_right != nullptr)
        m_right->makeLeaf();
    else if ((m_right == nullptr) && (m_value > 4) && ((m_value - 1) % 3 == 0))
        m_right = new CollatzTree((m_value - 1) / 3);
}

void CollatzTree::makeLeafs(unsigned int time)
{
    for (unsigned int i = 0; i < time; ++i)
        makeLeaf();
}

void CollatzTree::printTree() const
{
    std::cout << m_value << " ";
    if (m_left != nullptr)
        m_left->printTree();
    if (m_right != nullptr)
        m_right->printTree();
}

std::ostream &operator<<(std::ostream &o, const CollatzTree &tree)
{
    tree.printTree();
    return (o);
}
