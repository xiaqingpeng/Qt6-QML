import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import demo

// Markdown 编辑器页面
Page {
    id: root
    title: "Markdown 编辑器"

    // 创建 Markdown 转换器实例
    MarkdownConverter {
        id: markdownConverter
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        // 左侧：Markdown 编辑区
        Rectangle {
            SplitView.fillWidth: true
            SplitView.minimumWidth: 300
            color: "#f5f5f5"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5

                Label {
                    text: "Markdown 编辑器"
                    font.bold: true
                    font.pixelSize: 16
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true

                    TextArea {
                        id: markdownEditor
                        placeholderText: "在这里输入 Markdown 文本..."
                        wrapMode: TextEdit.Wrap
                        selectByMouse: true
                        font.family: "Courier New"
                        font.pixelSize: 14

                        // 初始示例文本
                        text: "# 欢迎使用 Markdown 编辑器\n\n" +
                              "这是一个基于 **QML** 的 Markdown 编辑器。\n\n" +
                              "## 主要特性\n\n" +
                              "- 实时预览\n" +
                              "- 支持标准 Markdown 语法\n" +
                              "- 简洁的界面\n\n" +
                              "## 代码示例\n\n" +
                              "```cpp\n" +
                              "#include <iostream>\n" +
                              "int main() {\n" +
                              "    std::cout << \"Hello, Markdown!\" << std::endl;\n" +
                              "    return 0;\n" +
                              "}\n" +
                              "```\n\n" +
                              "## 文本格式\n\n" +
                              "**粗体文本**  \n" +
                              "*斜体文本*  \n" +
                              "~~删除线~~\n\n" +
                              "> 这是一个引用块\n\n" +
                              "## 链接\n\n" +
                              "[访问 Qt 官网](https://www.qt.io)\n\n" +
                              "## 列表\n\n" +
                              "1. 第一项\n" +
                              "2. 第二项\n" +
                              "3. 第三项\n\n" +
                              "---\n\n" +
                              "*实时编辑，右侧即时预览！*"

                        // 文本改变时更新预览
                        onTextChanged: {
                            updateTimer.restart()
                        }
                    }
                }

                Label {
                    text: "字数: " + markdownEditor.text.length
                    font.pixelSize: 12
                    color: "#666"
                }
            }
        }

        // 右侧：HTML 预览区
        Rectangle {
            SplitView.fillWidth: true
            SplitView.minimumWidth: 300
            color: "white"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5

                Label {
                    text: "预览"
                    font.bold: true
                    font.pixelSize: 16
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true

                    TextArea {
                        id: previewArea
                        readOnly: true
                        wrapMode: TextEdit.Wrap
                        textFormat: TextEdit.RichText
                        selectByMouse: true
                        font.pixelSize: 14

                        // 添加一些基本样式
                        background: Rectangle {
                            color: "white"
                            border.color: "#ddd"
                            border.width: 1
                        }
                    }
                }
            }
        }
    }

    // 延迟更新定时器，避免频繁转换
    Timer {
        id: updateTimer
        interval: 300  // 300ms 延迟
        repeat: false
        onTriggered: {
            // 调用 C++ 转换器将 Markdown 转为 HTML
            var html = markdownConverter.toHtml(markdownEditor.text)
            previewArea.text = html
        }
    }

    // 组件加载完成后立即更新预览
    Component.onCompleted: {
        updateTimer.start()
    }
}
