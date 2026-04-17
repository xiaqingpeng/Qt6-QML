#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStringLiteral>

int main(int argc, char *argv[]) {
  qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
      []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
 // engine.loadFromModule("demo", "demo1");

  // 改为
  engine.load(QUrl(QStringLiteral("qrc:/qt/qml/demo/Main.qml")));

  return app.exec();
}
