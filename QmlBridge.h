#ifndef QMLBRIDGE_H
#define QMLBRIDGE_H

#include <QObject>
#include <QQmlApplicationEngine>

// QML 信号处理类
class QmlSignalHandler : public QObject
{
    Q_OBJECT
public:
    explicit QmlSignalHandler(QObject *parent = nullptr);

public slots:
    void print();
};

// QML 属性操作和方法调用
void cplus(QQmlApplicationEngine &engine);

// QML 信号与 C++ 槽的连接
void setupQmlSignalConnections(QQmlApplicationEngine &engine);

#endif // QMLBRIDGE_H
