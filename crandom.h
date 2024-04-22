#ifndef CRANDOM_H
#define CRANDOM_H

#include <stack>
#include <QDebug>
#include <random>

class CRandom
{
public:
    CRandom();
    static QString choose(std::stack<QString>& movie_stack);
};

#endif // CRANDOM_H
