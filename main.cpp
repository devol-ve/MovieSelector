#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtDebug>
#include <QQuickView>
#include "cfantasymovies.h"
#include "creadfile.h"

int main(int argc, char *argv[])
{
    const QString filename = QStringLiteral(":/MovieSelector/input.txt");
    CFantasyMovies movies;
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Read input file into movie stacks
    CReadFile(filename, movies);
    qDebug() << "Even: " << movies.stack_even.top();
    qDebug() << "Odd: " << movies.stack_odd.top();

    // Main screen
    const QUrl url(QStringLiteral("qrc:/MovieSelector/Main.qml"));
    QObject::connect(
        // Wait for application window to be created
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [&movies, &url](QObject *obj, const QUrl &objUrl) {
            // If application window not created
            // and objUrl matches target url, exit application
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);

            // Get application window
            QObject *topLevel = obj;

            // Connect - QML to C++
            QObject::connect(
                topLevel,
                SIGNAL(qmlRequireData(QString)),
                &movies,
                SLOT(cppGetRequest(QString)));

            // Connect - C++ to QML
            QObject::connect(
                &movies,
                SIGNAL(cppReturnAnswer(QString)),
                topLevel,
                SLOT(qmlUpdateData(QString)));
        },
        Qt::QueuedConnection);
    engine.load(url);


    return app.exec();
}
