#ifndef DATAMODEL_H
#define DATAMODEL_H

#pragma once
#include <QAbstractListModel>
#include <QtQml/qqmlregistration.h>

class DataModel : public QAbstractListModel {
  Q_OBJECT
  QML_ELEMENT
public:
  enum class Roles { NameRole = Qt::UserRole + 1 };
  explicit DataModel(QObject *parent = nullptr);

  int rowCount(const QModelIndex &parent = QModelIndex()) const override;
  QVariant data(const QModelIndex &index, int role) const override;
  QHash<int, QByteArray> roleNames() const override;

private:
  QStringList m_items;
};

#endif // DATAMODEL_H
