#ifndef DATAMODEL_H
#define DATAMODEL_H


#pragma once
#include <QAbstractListModel>
#include <QtQml/qqmlregistration.h>

class DataModel : public QAbstractListModel {
    Q_OBJECT
    QML_ELEMENT
public:
    enum Roles { NameRole = Qt::UserRole + 1 };
    explicit DataModel(QObject *parent = nullptr) : QAbstractListModel(parent) {
        m_items << "Item 1" << "Item 2";
    }

    int rowCount(const QModelIndex &parent = QModelIndex()) const override { return m_items.size(); }
    QVariant data(const QModelIndex &index, int role) const override {
        if (index.isValid() && role == NameRole) return m_items[index.row()];
        return {};
    }
    QHash<int, QByteArray> roleNames() const override { return {{NameRole, "itemName"}}; }

private:
    QStringList m_items;
};



#endif // DATAMODEL_H
