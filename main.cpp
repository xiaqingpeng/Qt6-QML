#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStringLiteral>
#include <QQuickStyle>
#include "QmlBridge.h"
#include "MarkdownConverter.h"
#include "NoteDatabase.h"
#include "NetworkManager.h"
#include "FileManager.h"

int main(int argc, char *argv[]) {
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    // 设置 QML 样式为 Basic，支持自定义控件外观
    QQuickStyle::setStyle("Basic");

    QGuiApplication app(argc, argv);

    // 注册 MarkdownConverter 类到 QML
    qmlRegisterType<MarkdownConverter>("demo", 1, 0, "MarkdownConverter");

    // 注册 NoteDatabase 类到 QML
    qmlRegisterType<NoteDatabase>("demo", 1, 0, "NoteDatabase");

    // 注册 NetworkManager 类到 QML
    qmlRegisterType<NetworkManager>("com.example", 1, 0, "NetworkManager");

    // 注册 FileManager 类到 QML
    qmlRegisterType<FileManager>("com.example", 1, 0, "FileManager");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
        []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    // engine.loadFromModule("demo", "demo1");

    // 改为
    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/demo/Main.qml")));

    cplus(engine);

    // 设置 QML 信号连接
    setupQmlSignalConnections(engine);

    return app.exec();
}
