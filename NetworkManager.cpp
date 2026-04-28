#include "NetworkManager.h"
#include <QNetworkRequest>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

NetworkManager::NetworkManager(QObject *parent)
    : QObject(parent)
    , m_manager(new QNetworkAccessManager(this))
    , m_currentReply(nullptr)
{
    connect(m_manager, &QNetworkAccessManager::finished,
            this, &NetworkManager::onFinished);
}

NetworkManager::~NetworkManager()
{
    if (m_currentReply) {
        m_currentReply->abort();
        m_currentReply->deleteLater();
    }
}

void NetworkManager::get(const QString &url)
{
    qDebug() << "GET 请求:" << url;
    
    // 取消之前的请求
    if (m_currentReply) {
        m_currentReply->disconnect();
        m_currentReply->abort();
        m_currentReply->deleteLater();
        m_currentReply = nullptr;
    }
    
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    
    // 设置超时（10秒）
    request.setTransferTimeout(10000);
    
    m_currentReply = m_manager->get(request);
    
    // 连接进度信号
    if (m_currentReply) {
        connect(m_currentReply, &QNetworkReply::downloadProgress,
                this, &NetworkManager::onDownloadProgress);
    }
}

void NetworkManager::post(const QString &url, const QString &jsonData)
{
    qDebug() << "POST 请求:" << url;
    qDebug() << "数据:" << jsonData;
    
    // 取消之前的请求
    if (m_currentReply) {
        m_currentReply->disconnect();
        m_currentReply->abort();
        m_currentReply->deleteLater();
        m_currentReply = nullptr;
    }
    
    QNetworkRequest request;
    request.setUrl(QUrl(url));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setTransferTimeout(10000);
    
    QByteArray data = jsonData.toUtf8();
    m_currentReply = m_manager->post(request, data);
    
    if (m_currentReply) {
        connect(m_currentReply, &QNetworkReply::downloadProgress,
                this, &NetworkManager::onDownloadProgress);
    }
}

void NetworkManager::cancelRequest()
{
    if (m_currentReply) {
        qDebug() << "取消请求";
        m_currentReply->disconnect();
        m_currentReply->abort();
        m_currentReply->deleteLater();
        m_currentReply = nullptr;
    }
}

void NetworkManager::onFinished(QNetworkReply *reply)
{
    // 延迟删除 reply
    reply->deleteLater();
    
    // 确保是当前的请求
    if (reply != m_currentReply) {
        return;
    }
    
    m_currentReply = nullptr;
    
    // 检查错误
    if (reply->error() != QNetworkReply::NoError) {
        QString errorMsg = reply->errorString();
        qDebug() << "❌ 请求错误:" << errorMsg;
        emit requestError(errorMsg);
        return;
    }
    
    // 读取响应数据
    QByteArray responseData = reply->readAll();
    QString responseString = QString::fromUtf8(responseData);
    
    qDebug() << "✅ 请求成功，数据长度:" << responseData.size() << "字节";
    
    // 尝试格式化 JSON
    QJsonParseError parseError;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(responseData, &parseError);
    
    if (parseError.error == QJsonParseError::NoError) {
        // JSON 解析成功，格式化输出
        QString formattedJson = jsonDoc.toJson(QJsonDocument::Indented);
        
        qDebug() << "📋 格式化的 JSON 数据:";
        qDebug().noquote() << "----------------------------------------";
        
        // 如果数据太长，只打印前面部分
        if (formattedJson.length() > 2000) {
            qDebug().noquote() << formattedJson.left(2000);
            qDebug().noquote() << "... (数据太长，已截断，共" << formattedJson.length() << "字符)";
        } else {
            qDebug().noquote() << formattedJson;
        }
        
        qDebug().noquote() << "----------------------------------------";
        
        // 如果是数组，打印数组信息
        if (jsonDoc.isArray()) {
            QJsonArray array = jsonDoc.array();
            qDebug() << "📊 数组包含" << array.size() << "个元素";
            
            // 打印第一个元素的详细信息
            if (array.size() > 0 && array[0].isObject()) {
                QJsonObject firstObj = array[0].toObject();
                qDebug() << "🔍 第一个元素的字段:";
                for (auto it = firstObj.begin(); it != firstObj.end(); ++it) {
                    qDebug() << "  -" << it.key() << ":" << it.value();
                }
            }
        } else if (jsonDoc.isObject()) {
            QJsonObject obj = jsonDoc.object();
            qDebug() << "📊 对象包含" << obj.size() << "个字段";
        }
    } else {
        // JSON 解析失败，打印原始数据
        qDebug() << "⚠️  JSON 解析失败:" << parseError.errorString();
        qDebug() << "📄 原始数据 (前500字符):" << responseString.left(500);
    }
    
    emit requestFinished(responseString);
}

void NetworkManager::onDownloadProgress(qint64 bytesReceived, qint64 bytesTotal)
{
    emit downloadProgress(bytesReceived, bytesTotal);
}
