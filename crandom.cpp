#include "crandom.h"

CRandom::CRandom() {}

QString CRandom::choose(std::stack<QString>& movie_stack) {
    QString result = "";
    std::random_device r;
    std::mt19937 gen;
    std::stack<QString> temp_stack;
    std::uniform_int_distribution<> distrib(0, movie_stack.size() - 1);

    // Generate a random number between 0 and movie_stack.size() - 1
    gen.seed(r());
    int rand = distrib(gen);

    // While count < random number, push top of movie_stack to temp_stack
    for (int count = 0; count < rand; count++) {
        temp_stack.push(movie_stack.top());
        movie_stack.pop();
    }

    // Set result
    result = movie_stack.top();
    movie_stack.pop();

    // Push contents of temp_stack to movie_stack
    while (!temp_stack.empty()) {
        movie_stack.push(temp_stack.top());
        temp_stack.pop();
    }

    return result;
}
