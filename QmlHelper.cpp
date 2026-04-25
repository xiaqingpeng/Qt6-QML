#include "QmlHelper.h"
#include <QQmlProperty>
#include <QDebug>
#include <QMetaObject>
#include <QVariant>

void cplus(QQmlApplicationEngine &engine)
{
    QList<QObject*> list = engine.rootObjects();

    QObject *obj = list.first();

    qDebug() << "list size is" << list.size();

    qDebug() << "list first is" << obj;
    QQmlProperty(obj, "title").write("我是QQmlProperty");

    QObject *rect = obj->findChild<QObject*>("examplesConfig");

    QQmlProperty(rect, "color").write("cyan");

    qDebug() << "rect is" << rect;

    QMetaObject::invokeMethod(obj, "sig");
    QVariant ret;

    QMetaObject::invokeMethod(obj, "testArg", Q_RETURN_ARG(QVariant, ret), Q_ARG(QVariant, "dddddddddddd"));

    qDebug() << "ret is" << ret;
}
