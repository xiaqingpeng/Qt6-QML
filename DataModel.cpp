#include "DataModel.h"

DataModel::DataModel(QObject *parent) : QAbstractListModel(parent) {
    m_items << "Item 1" << "Item 2";
}

int DataModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_items.size();
}

QVariant DataModel::data(const QModelIndex &index, int role) const {
    if (index.isValid() && role == static_cast<int>(Roles::NameRole)) {
        return m_items[index.row()];
    }
    return {};
}

QHash<int, QByteArray> DataModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[static_cast<int>(Roles::NameRole)] = "itemName";
    return roles;
}
