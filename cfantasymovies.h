#ifndef CFANTASYMOVIES_H
#define CFANTASYMOVIES_H

#include <QObject>
#include <QDebug>

class CFantasyMovies : public QObject
{
    Q_OBJECT
public:
    explicit CFantasyMovies(QObject *parent = nullptr);

signals:
    void cppReturnAnswer(QString data);
public slots:
    void cppGetRequest(const QString &msg);
};

#endif // CFANTASYMOVIES_H
