#include "crandom.h"

CRandom::CRandom() {}

QString CRandom::choose(std::stack<QString>& movie_stack, const int seed) {
    QString result = "";
    std::stack<QString> temp_stack;
    qDebug() << "Seed: " << seed; // DEBUG - remove
    qDebug() << "Stack Size: " << movie_stack.size(); // DEBUG - remove
    qDebug() << "Stack Top: " << movie_stack.top(); //DEBUG - remove

    // TODO - Use seed to generate a random number between 0 and stack.size() - 1

    // TODO - While count < random number, push top of movie_stack to temp_stack

    // Set result
    result = movie_stack.top();
    movie_stack.pop();

    // TODO - Push contents of temp_stack to movie_stack

    return result;
}
