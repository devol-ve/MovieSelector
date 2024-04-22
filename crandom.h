#ifndef CRANDOM_H
#define CRANDOM_H

#include <stack>
#include <QDebug>

class CRandom
{
public:
    CRandom();
    static QString choose(std::stack<QString>& movie_stack, const int seed = 123);
};

#endif // CRANDOM_H
