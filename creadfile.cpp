#include "creadfile.h"

CReadFile::CReadFile(const QString& filename, CFantasyMovies& movies) {

    // Open file
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Unable to open file: " << qPrintable(file.errorString());
        return;
    }

    // Push contents onto stack_odd and stack_even
    QTextStream in(&file);

    // Regular Expression used to split line entry
    // Matches a period followed by 2 or more whitespace characters
    static const QRegularExpression regex("\\.\\s{2,}");

    while (!in.atEnd()) {
        QString line = in.readLine();
        // Split line into number and movie title
        QStringList entries = line.split(regex, Qt::SkipEmptyParts);

        // If number is odd, push movie title to stack_odd
        if (entries[0].toInt() % 2)
            movies.stack_odd.push(entries[1]);
        // If number is even, push movie title to stack_even
        else
            movies.stack_even.push(entries[1]);
    }


    // Close file
    file.close();
}
