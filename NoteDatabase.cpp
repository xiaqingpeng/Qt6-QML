#include "NoteDatabase.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QDateTime>
#include <QStandardPaths>
#include <QDir>

NoteDatabase::NoteDatabase(QObject *parent)
    : QObject{parent}
{
}

NoteDatabase::~NoteDatabase()
{
    if (m_database.isOpen()) {
        m_database.close();
    }
}

bool NoteDatabase::initDatabase()
{
    // 获取应用数据存储路径
    QString dataPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir dir;
    if (!dir.exists(dataPath)) {
        dir.mkpath(dataPath);
    }

    QString dbPath = dataPath + "/notes.db";
    qDebug() << "数据库路径:" << dbPath;

    // 创建数据库连接
    m_database = QSqlDatabase::addDatabase("QSQLITE");
    m_database.setDatabaseName(dbPath);

    if (!m_database.open()) {
        QString error = "无法打开数据库: " + m_database.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return false;
    }

    qDebug() << "数据库打开成功";
    return createTable();
}

bool NoteDatabase::createTable()
{
    QSqlQuery query(m_database);

    // 创建笔记表（不使用 DEFAULT CURRENT_TIMESTAMP，改为在 C++ 中设置本地时间）
    QString createTableSQL = R"(
        CREATE TABLE IF NOT EXISTS notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            content TEXT,
            created_at DATETIME,
            updated_at DATETIME
        )
    )";

    if (!query.exec(createTableSQL)) {
        QString error = "创建表失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return false;
    }

    qDebug() << "数据表创建成功";
    return true;
}

bool NoteDatabase::createNote(const QString &title, const QString &content)
{
    QSqlQuery query(m_database);
    // 使用本地时间而不是 CURRENT_TIMESTAMP（UTC）
    QString localTime = QDateTime::currentDateTime().toString(Qt::ISODate);
    
    query.prepare("INSERT INTO notes (title, content, created_at, updated_at) VALUES (:title, :content, :created_at, :updated_at)");
    query.bindValue(":title", title);
    query.bindValue(":content", content);
    query.bindValue(":created_at", localTime);
    query.bindValue(":updated_at", localTime);

    if (!query.exec()) {
        QString error = "创建笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return false;
    }

    qDebug() << "笔记创建成功, ID:" << query.lastInsertId();
    return true;
}

QVariantList NoteDatabase::getAllNotes()
{
    QVariantList notesList;
    QSqlQuery query(m_database);

    if (!query.exec("SELECT id, title, content, created_at, updated_at FROM notes ORDER BY updated_at DESC")) {
        QString error = "查询笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return notesList;
    }

    while (query.next()) {
        QVariantMap note;
        note["id"] = query.value(0).toInt();
        note["title"] = query.value(1).toString();
        note["content"] = query.value(2).toString();
        note["created_at"] = query.value(3).toString();
        note["updated_at"] = query.value(4).toString();
        notesList.append(note);
    }

    qDebug() << "查询到" << notesList.size() << "条笔记";
    return notesList;
}

QVariantMap NoteDatabase::getNoteById(int id)
{
    QVariantMap note;
    QSqlQuery query(m_database);
    query.prepare("SELECT id, title, content, created_at, updated_at FROM notes WHERE id = :id");
    query.bindValue(":id", id);

    if (!query.exec()) {
        QString error = "查询笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return note;
    }

    if (query.next()) {
        note["id"] = query.value(0).toInt();
        note["title"] = query.value(1).toString();
        note["content"] = query.value(2).toString();
        note["created_at"] = query.value(3).toString();
        note["updated_at"] = query.value(4).toString();
    }

    return note;
}

bool NoteDatabase::updateNote(int id, const QString &title, const QString &content)
{
    QSqlQuery query(m_database);
    // 使用本地时间
    QString localTime = QDateTime::currentDateTime().toString(Qt::ISODate);
    
    query.prepare("UPDATE notes SET title = :title, content = :content, updated_at = :updated_at WHERE id = :id");
    query.bindValue(":id", id);
    query.bindValue(":title", title);
    query.bindValue(":content", content);
    query.bindValue(":updated_at", localTime);

    if (!query.exec()) {
        QString error = "更新笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return false;
    }

    qDebug() << "笔记更新成功, ID:" << id;
    return true;
}

bool NoteDatabase::deleteNote(int id)
{
    QSqlQuery query(m_database);
    query.prepare("DELETE FROM notes WHERE id = :id");
    query.bindValue(":id", id);

    if (!query.exec()) {
        QString error = "删除笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return false;
    }

    qDebug() << "笔记删除成功, ID:" << id;
    return true;
}

QVariantList NoteDatabase::searchNotes(const QString &keyword)
{
    QVariantList notesList;
    QSqlQuery query(m_database);
    query.prepare("SELECT id, title, content, created_at, updated_at FROM notes WHERE title LIKE :keyword OR content LIKE :keyword ORDER BY updated_at DESC");
    query.bindValue(":keyword", "%" + keyword + "%");

    if (!query.exec()) {
        QString error = "搜索笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return notesList;
    }

    while (query.next()) {
        QVariantMap note;
        note["id"] = query.value(0).toInt();
        note["title"] = query.value(1).toString();
        note["content"] = query.value(2).toString();
        note["created_at"] = query.value(3).toString();
        note["updated_at"] = query.value(4).toString();
        notesList.append(note);
    }

    qDebug() << "搜索到" << notesList.size() << "条笔记";
    return notesList;
}

bool NoteDatabase::isDuplicateNote(const QString &title, const QString &content, int excludeId)
{
    Q_UNUSED(content); // 不再检查内容，只检查标题
    
    QSqlQuery query(m_database);
    
    // 查询是否存在相同标题的笔记（排除指定 ID，用于更新时检查）
    if (excludeId == -1) {
        query.prepare("SELECT COUNT(*) FROM notes WHERE title = :title");
        query.bindValue(":title", title);
    } else {
        query.prepare("SELECT COUNT(*) FROM notes WHERE title = :title AND id != :excludeId");
        query.bindValue(":title", title);
        query.bindValue(":excludeId", excludeId);
    }

    if (!query.exec()) {
        QString error = "检查重复笔记失败: " + query.lastError().text();
        qDebug() << error;
        emit databaseError(error);
        return false;
    }

    if (query.next()) {
        int count = query.value(0).toInt();
        bool isDuplicate = count > 0;
        if (isDuplicate) {
            qDebug() << "发现重复标题:" << title;
        }
        return isDuplicate;
    }

    return false;
}
