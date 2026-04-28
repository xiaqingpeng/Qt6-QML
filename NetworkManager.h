#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class NetworkManager : public QObject
{
    Q_OBJECT
public:
    explicit NetworkManager(QObject *parent = nullptr);
    ~NetworkManager();

    // HTTP GET 请求
    Q_INVOKABLE void get(const QString &url);
    
    // HTTP POST 请求
    Q_INVOKABLE void post(const QString &url, const QString &jsonData);
    
    // 取消当前请求
    Q_INVOKABLE void cancelRequest();

signals:
    // 请求成功
    void requestFinished(const QString &response);
    
    // 请求失败
    void requestError(const QString &error);
    
    // 下载进度
    void downloadProgress(qint64 bytesReceived, qint64 bytesTotal);

private slots:
    void onFinished(QNetworkReply *reply);
    void onDownloadProgress(qint64 bytesReceived, qint64 bytesTotal);

private:
    QNetworkAccessManager *m_manager;
    QNetworkReply *m_currentReply;
};

#endif // NETWORKMANAGER_H
