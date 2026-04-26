#include "MarkdownConverter.h"
#include <QTextDocument>

MarkdownConverter::MarkdownConverter(QObject *parent)
    : QObject{parent}
{
}

QString MarkdownConverter::toHtml(const QString &markdown)
{
    // 使用 Qt 内置的 Markdown 转换功能（Qt 5.14+）
    QTextDocument doc;
    doc.setMarkdown(markdown);
    return doc.toHtml();
}
