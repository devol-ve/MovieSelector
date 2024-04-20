#include "cfantasymovies.h"

CFantasyMovies::CFantasyMovies(QObject *parent)
    : QObject{parent}
{}

void CFantasyMovies::cppGetRequest(const QString &msg) {
    qDebug() << "msg from QML: " << msg;
    int num = msg.toInt();
    std::string movie;
    if(num % 2)
        movie = "Treasure Planet";
    else
        movie = "Ready Player One";
    emit cppReturnAnswer(QString::fromStdString(movie));
}
