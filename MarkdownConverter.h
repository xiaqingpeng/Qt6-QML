#ifndef MARKDOWNCONVERTER_H
#define MARKDOWNCONVERTER_H

#include <QObject>
#include <QString>

// Markdown 转换器类 - 用于在 QML 中调用
class MarkdownConverter : public QObject
{
    Q_OBJECT
public:
    explicit MarkdownConverter(QObject *parent = nullptr);

    // 将 Markdown 文本转换为 HTML
    // 使用 Qt 内置的 QTextDocument 进行转换（需要 Qt 5.14+）
    Q_INVOKABLE QString toHtml(const QString &markdown);
};

#endif // MARKDOWNCONVERTER_H
