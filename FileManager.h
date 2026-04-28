#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>
#include <QString>
#include <QUrl>

class FileManager : public QObject
{
    Q_OBJECT
public:
    explicit FileManager(QObject *parent = nullptr);

    // 读取文本文件
    Q_INVOKABLE QString readTextFile(const QUrl &fileUrl);
    
    // 写入文本文件
    Q_INVOKABLE bool writeTextFile(const QUrl &fileUrl, const QString &content);
    
    // 获取文件信息
    Q_INVOKABLE QVariantMap getFileInfo(const QUrl &fileUrl);
    
    // 检查文件是否存在
    Q_INVOKABLE bool fileExists(const QUrl &fileUrl);
    
    // 删除文件
    Q_INVOKABLE bool deleteFile(const QUrl &fileUrl);
    
    // 复制文件
    Q_INVOKABLE bool copyFile(const QUrl &sourceUrl, const QUrl &destUrl);
    
    // 获取文件扩展名
    Q_INVOKABLE QString getFileExtension(const QUrl &fileUrl);

signals:
    void fileOperationError(const QString &error);
    void fileOperationSuccess(const QString &message);
};

#endif // FILEMANAGER_H
