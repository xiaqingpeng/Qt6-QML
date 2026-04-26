#ifndef NOTEDATABASE_H
#define NOTEDATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QVariantList>
#include <QVariantMap>

// 笔记数据库管理类
class NoteDatabase : public QObject
{
    Q_OBJECT
public:
    explicit NoteDatabase(QObject *parent = nullptr);
    ~NoteDatabase();

    // 初始化数据库
    Q_INVOKABLE bool initDatabase();

    // 创建笔记
    Q_INVOKABLE bool createNote(const QString &title, const QString &content);

    // 获取所有笔记列表
    Q_INVOKABLE QVariantList getAllNotes();

    // 根据 ID 获取笔记
    Q_INVOKABLE QVariantMap getNoteById(int id);

    // 更新笔记
    Q_INVOKABLE bool updateNote(int id, const QString &title, const QString &content);

    // 删除笔记
    Q_INVOKABLE bool deleteNote(int id);

    // 搜索笔记
    Q_INVOKABLE QVariantList searchNotes(const QString &keyword);

    // 检查是否存在重复笔记（只检查标题）
    Q_INVOKABLE bool isDuplicateNote(const QString &title, const QString &content, int excludeId = -1);

signals:
    void databaseError(const QString &error);

private:
    QSqlDatabase m_database;
    bool createTable();
};

#endif // NOTEDATABASE_H
