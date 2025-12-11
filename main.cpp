#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "enum_defines.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterUncreatableMetaObject(
        EnumDefines::staticMetaObject, "EnumDefines", 1, 0, "EnumDefines", "Error: only enums");

    const QUrl url(QStringLiteral("qrc:/QMLLearning/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
