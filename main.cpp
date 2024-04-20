#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtDebug>
#include <QQuickView>
#include "cfantasymovies.h"

int main(int argc, char *argv[])
{
    CFantasyMovies movies;
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/MovieSelector/Main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [&movies, &url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
            QObject *topLevel = obj;
            QObject::connect(
                topLevel,
                SIGNAL(qmlRequireData(QString)),
                &movies,
                SLOT(cppGetRequest(QString)));
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
