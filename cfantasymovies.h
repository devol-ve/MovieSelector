#ifndef CFANTASYMOVIES_H
#define CFANTASYMOVIES_H

#include <QObject>
#include <QDebug>
#include <stack>

class CFantasyMovies : public QObject
{
    Q_OBJECT
public:
    explicit CFantasyMovies(QObject *parent = nullptr);
    std::stack<QString> stack_odd;
    std::stack<QString> stack_even;

signals:
    void cppReturnAnswer(QString data);
public slots:
    void cppGetRequest(const QString& msg);
};

#endif // CFANTASYMOVIES_H
