#include "creadfile.h"

CReadFile::CReadFile(const QString& filename, CFantasyMovies& movies) {
    movies.stack_even.push(filename + "2"); // DEBUG - remove
    movies.stack_odd.push(filename + "1");  // DEBUG - remove

    // Open file
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Unable to open file: " << qPrintable(file.errorString());
        return;
    }

    // Push contents onto stack_odd and stack_even
    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        qDebug() << line; // DEBUG - remove
        // TODO - Split line into number and movie title

        // TODO - If number is odd, push movie title to stack_odd
        // TODO - If number is even, push movie title to stack_even
    }


    // Close file
    file.close();
}
