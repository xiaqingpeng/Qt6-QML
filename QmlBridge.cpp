#include "QmlBridge.h"
#include <QQmlProperty>
#include <QDebug>
#include <QMetaObject>
#include <QVariant>

// ============================================================================
// QmlSignalHandler 类实现
// ============================================================================

QmlSignalHandler::QmlSignalHandler(QObject *parent)
    : QObject{parent}
{}

void QmlSignalHandler::print()
{
    qDebug() << "QmlSignalHandler::print() - QML 信号被触发";
}

// ============================================================================
// QML 交互函数实现
// ============================================================================

void cplus(QQmlApplicationEngine &engine)
{
    // 获取 QML 引擎加载的所有根对象
    QList<QObject*> list = engine.rootObjects();

    // 获取第一个根对象（Main.qml 中的 Window）
    QObject *obj = list.first();

    qDebug() << "list size is" << list.size();

    qDebug() << "list first is" << obj;
    
    // 使用 QQmlProperty 从 C++ 修改 QML 对象的属性
    // 将 Window 的 title 属性改为 "我是QQmlProperty"
    QQmlProperty(obj, "title").write("我是QQmlProperty");

    // 通过 objectName 查找子对象
    // 查找名为 "examplesConfig" 的 QML 对象（红色矩形）
    QObject *rect = obj->findChild<QObject*>("examplesConfig");

    // 修改矩形的颜色属性为青色
    QQmlProperty(rect, "color").write("cyan");

    qDebug() << "rect is" << rect;

    // 从 C++ 调用 QML 中定义的方法（无参数，无返回值）
    QMetaObject::invokeMethod(obj, "sig");
    
    QVariant ret;

    // 从 C++ 调用 QML 方法，传递参数并接收返回值
    // Q_ARG 用于传递参数，Q_RETURN_ARG 用于接收返回值
    QMetaObject::invokeMethod(obj, "testArg", Q_RETURN_ARG(QVariant, ret), Q_ARG(QVariant, "dddddddddddd"));

    qDebug() << "ret is" << ret;
}

void setupQmlSignalConnections(QQmlApplicationEngine &engine)
{
    // 获取 QML 引擎加载的所有根对象
    QList<QObject*> list = engine.rootObjects();

    // 获取第一个根对象（Main.qml 中的 Window）
    QObject *obj = list.first();

    // 创建 QmlSignalHandler 对象，设置 obj 为父对象
    // Qt 对象树机制：当 obj 被销毁时会自动删除此对象
    // 注意：这不是内存泄漏，静态分析器的警告是误报
    QmlSignalHandler *handler = new QmlSignalHandler(obj);  // NOLINT(clang-analyzer-cplusplus.NewDeleteLeaks)

    // 连接 QML 的 sig 信号到 C++ 的 print 槽函数
    QObject::connect(obj, SIGNAL(sig()), handler, SLOT(print()));

    // 从 C++ 调用 QML 的 sig 方法（会触发信号）
    QMetaObject::invokeMethod(obj, "sig");
}
