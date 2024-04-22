#ifndef CREADFILE_H
#define CREADFILE_H

#include <QFile>
#include <QTextStream>
#include <QRegularExpression>
#include "cfantasymovies.h"

class CReadFile
{
public:
    CReadFile(const QString& filename, CFantasyMovies& movies);
};

#endif // CREADFILE_H
