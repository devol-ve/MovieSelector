#include "cfantasymovies.h"
#include "crandom.h"

CFantasyMovies::CFantasyMovies(QObject *parent)
    : QObject{parent}
{}

// Slot function
void CFantasyMovies::cppGetRequest(const QString &msg) {
    int num = msg.toInt();
    QString movie;

    // Select random movie, using num as seed value
    // If both stacks are empty, return default statement
    if(stack_even.empty() && stack_odd.empty())
        movie = QStringLiteral("No other films available.");
    // If num is odd or stack_even is empty, select from stack_odd
    else if(!stack_odd.empty() && (num % 2 || stack_even.empty()))
        movie = CRandom::choose(stack_odd);
    // If num is even or stack_odd is empty, select from stack_even
    else
        movie = CRandom::choose(stack_even);

    // Return movie to GUI
    emit cppReturnAnswer(movie.toUpper());
}
