#include "FileManager.h"
#include <QFile>
#include <QFileInfo>
#include <QTextStream>
#include <QDateTime>
#include <QDir>
#include <QDebug>

FileManager::FileManager(QObject *parent)
    : QObject(parent)
{
}

QString FileManager::readTextFile(const QUrl &fileUrl)
{
    QString filePath = fileUrl.toLocalFile();
    
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QString error = "无法打开文件: " + file.errorString();
        qDebug() << error;
        emit fileOperationError(error);
        return QString();
    }
    
    QTextStream in(&file);
    in.setEncoding(QStringConverter::Utf8);
    QString content = in.readAll();
    file.close();
    
    qDebug() << "读取文件成功:" << filePath << "大小:" << content.length();
    emit fileOperationSuccess("文件读取成功");
    
    return content;
}

bool FileManager::writeTextFile(const QUrl &fileUrl, const QString &content)
{
    QString filePath = fileUrl.toLocalFile();
    
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QString error = "无法写入文件: " + file.errorString();
        qDebug() << error;
        emit fileOperationError(error);
        return false;
    }
    
    QTextStream out(&file);
    out.setEncoding(QStringConverter::Utf8);
    out << content;
    file.close();
    
    qDebug() << "写入文件成功:" << filePath;
    emit fileOperationSuccess("文件保存成功");
    
    return true;
}

QVariantMap FileManager::getFileInfo(const QUrl &fileUrl)
{
    QString filePath = fileUrl.toLocalFile();
    
    // 如果路径为空，返回用户主目录
    if (filePath.isEmpty()) {
        filePath = QDir::homePath();
    }
    
    QFileInfo fileInfo(filePath);
    
    QVariantMap info;
    info["fileName"] = fileInfo.fileName();
    info["filePath"] = fileInfo.absoluteFilePath();
    info["fileSize"] = fileInfo.size();
    info["isFile"] = fileInfo.isFile();
    info["isDir"] = fileInfo.isDir();
    info["isReadable"] = fileInfo.isReadable();
    info["isWritable"] = fileInfo.isWritable();
    info["created"] = fileInfo.birthTime().toString("yyyy-MM-dd HH:mm:ss");
    info["modified"] = fileInfo.lastModified().toString("yyyy-MM-dd HH:mm:ss");
    info["suffix"] = fileInfo.suffix();
    
    return info;
}

bool FileManager::fileExists(const QUrl &fileUrl)
{
    QString filePath = fileUrl.toLocalFile();
    return QFile::exists(filePath);
}

bool FileManager::deleteFile(const QUrl &fileUrl)
{
    QString filePath = fileUrl.toLocalFile();
    
    if (!QFile::exists(filePath)) {
        emit fileOperationError("文件不存在");
        return false;
    }
    
    if (QFile::remove(filePath)) {
        qDebug() << "删除文件成功:" << filePath;
        emit fileOperationSuccess("文件删除成功");
        return true;
    } else {
        emit fileOperationError("删除文件失败");
        return false;
    }
}

bool FileManager::copyFile(const QUrl &sourceUrl, const QUrl &destUrl)
{
    QString sourcePath = sourceUrl.toLocalFile();
    QString destPath = destUrl.toLocalFile();
    
    if (!QFile::exists(sourcePath)) {
        emit fileOperationError("源文件不存在");
        return false;
    }
    
    // 如果目标文件存在，先删除
    if (QFile::exists(destPath)) {
        QFile::remove(destPath);
    }
    
    if (QFile::copy(sourcePath, destPath)) {
        qDebug() << "复制文件成功:" << sourcePath << "->" << destPath;
        emit fileOperationSuccess("文件复制成功");
        return true;
    } else {
        emit fileOperationError("复制文件失败");
        return false;
    }
}

QString FileManager::getFileExtension(const QUrl &fileUrl)
{
    QString filePath = fileUrl.toLocalFile();
    QFileInfo fileInfo(filePath);
    return fileInfo.suffix();
}
