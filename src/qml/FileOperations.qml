import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import com.example 1.0

Item {
    id: root

    FileManager {
        id: fileManager
        
        onFileOperationSuccess: function(message) {
            statusLabel.text = "✅ " + message
            statusLabel.color = "#4CAF50"
        }
        
        onFileOperationError: function(error) {
            statusLabel.text = "❌ " + error
            statusLabel.color = "#f44336"
        }
    }

    FileDialog {
        id: openFileDialog
        title: "选择要打开的文件"
        fileMode: FileDialog.OpenFile
        nameFilters: ["文本文件 (*.txt)", "Markdown 文件 (*.md)", "所有文件 (*)"]
        
        onAccepted: {
            console.log("✅ 选择的文件:", selectedFile)
            const content = fileManager.readTextFile(selectedFile)
            if (content.length >= 0) {
                textEditor.text = content
                root.currentFileUrl = selectedFile
                const fileName = selectedFile.toString().split('/').pop()
                fileInfoText.text = "当前文件: " + fileName
                
                const info = fileManager.getFileInfo(selectedFile)
                root.updateFileInfo(info)
            }
        }
        
        onRejected: {
            console.log("❌ 取消打开文件")
        }
    }

    FileDialog {
        id: saveFileDialog
        title: "保存文件"
        fileMode: FileDialog.SaveFile
        nameFilters: ["文本文件 (*.txt)", "Markdown 文件 (*.md)", "所有文件 (*)"]
        defaultSuffix: "txt"
        
        onAccepted: {
            console.log("✅ 保存到:", selectedFile)
            if (fileManager.writeTextFile(selectedFile, textEditor.text)) {
                root.currentFileUrl = selectedFile
                const fileName = selectedFile.toString().split('/').pop()
                fileInfoText.text = "当前文件: " + fileName
            }
        }
        
        onRejected: {
            console.log("❌ 取消保存文件")
        }
    }

    property var currentFileUrl: null

    function updateFileInfo(info) {
        fileInfoDetails.text = 
            "文件名: " + info.fileName + "\n" +
            "大小: " + formatFileSize(info.fileSize) + "\n" +
            "修改时间: " + info.modified
    }

    function formatFileSize(bytes) {
        if (bytes < 1024) return bytes + " B"
        else if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(2) + " KB"
        else return (bytes / (1024 * 1024)).toFixed(2) + " MB"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // 标题
        Label {
            text: "文件操作示例"
            font.pixelSize: 24
            font.bold: true
        }

        // 文件操作按钮
        GroupBox {
            title: "📁 文件操作"
            Layout.fillWidth: true
            
            ColumnLayout {
                anchors.fill: parent
                spacing: 10
                
                RowLayout {
                    spacing: 10
                    
                    Button {
                        text: "📂 打开文件"
                        highlighted: true
                        onClicked: {
                            console.log("点击打开文件按钮")
                            openFileDialog.open()
                        }
                    }
                    
                    Button {
                        text: "💾 保存"
                        enabled: textEditor.text.length > 0
                        onClicked: {
                            if (currentFileUrl) {
                                fileManager.writeTextFile(currentFileUrl, textEditor.text)
                            } else {
                                saveFileDialog.open()
                            }
                        }
                    }
                    
                    Button {
                        text: "📝 另存为"
                        enabled: textEditor.text.length > 0
                        onClicked: {
                            console.log("点击另存为按钮")
                            saveFileDialog.open()
                        }
                    }
                    
                    Button {
                        text: "🗑️ 删除"
                        enabled: currentFileUrl !== null
                        onClicked: deleteDialog.open()
                    }
                    
                    Item { Layout.fillWidth: true }
                }
                
                Label {
                    id: fileInfoText
                    text: "未打开文件"
                    font.pixelSize: 12
                    color: "#666666"
                }
            }
        }

        // 快速模板
        GroupBox {
            title: "⚡ 快速模板"
            Layout.fillWidth: true
            
            RowLayout {
                anchors.fill: parent
                spacing: 10
                
                Button {
                    text: "📄 TODO"
                    Layout.fillWidth: true
                    onClicked: {
                        textEditor.text = 
                            "# TODO 列表\n\n" +
                            "## 今天\n" +
                            "- [ ] 完成项目文档\n" +
                            "- [ ] 代码审查\n" +
                            "- [ ] 团队会议\n\n" +
                            "## 本周\n" +
                            "- [ ] 学习 Qt Quick\n" +
                            "- [ ] 优化性能\n"
                        statusLabel.text = "✅ 已创建 TODO 模板"
                        statusLabel.color = "#4CAF50"
                    }
                }
                
                Button {
                    text: "📋 会议"
                    Layout.fillWidth: true
                    onClicked: {
                        var today = new Date().toLocaleDateString()
                        textEditor.text = 
                            "# 会议记录\n\n" +
                            "日期: " + today + "\n" +
                            "参会人员: \n" +
                            "会议主题: \n\n" +
                            "## 讨论内容\n\n" +
                            "## 行动项\n"
                        statusLabel.text = "✅ 已创建会议记录模板"
                        statusLabel.color = "#4CAF50"
                    }
                }
                
                Button {
                    text: "📝 日记"
                    Layout.fillWidth: true
                    onClicked: {
                        var today = new Date().toLocaleDateString()
                        textEditor.text = 
                            "# 日记\n\n" +
                            "日期: " + today + "\n\n" +
                            "## 今天发生的事\n\n" +
                            "## 心情\n\n" +
                            "## 明天计划\n"
                        statusLabel.text = "✅ 已创建日记模板"
                        statusLabel.color = "#4CAF50"
                    }
                }
            }
        }

        // 文本编辑器
        GroupBox {
            title: "📝 文本编辑器"
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            ColumnLayout {
                anchors.fill: parent
                spacing: 10
                
                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    TextArea {
                        id: textEditor
                        placeholderText: "在此输入或编辑文本...\n\n支持的操作:\n- 打开文本文件\n- 编辑内容\n- 保存文件\n- 另存为新文件"
                        wrapMode: TextArea.Wrap
                        font.pixelSize: 14
                        font.family: "Menlo, Monaco, Courier New, monospace"
                        selectByMouse: true
                    }
                }
                
                RowLayout {
                    spacing: 10
                    
                    Label {
                        text: "字数: " + textEditor.text.length
                        font.pixelSize: 12
                        color: "#666666"
                    }
                    
                    Label {
                        text: "行数: " + textEditor.lineCount
                        font.pixelSize: 12
                        color: "#666666"
                    }
                    
                    Item { Layout.fillWidth: true }
                    
                    Button {
                        text: "清空"
                        flat: true
                        onClicked: {
                            textEditor.text = ""
                            currentFileUrl = null
                            fileInfoText.text = "未打开文件"
                        }
                    }
                }
            }
        }

        // 文件信息
        GroupBox {
            title: "ℹ️ 文件信息"
            Layout.fillWidth: true
            visible: currentFileUrl !== null
            
            Label {
                id: fileInfoDetails
                font.pixelSize: 12
                color: "#666666"
                anchors.fill: parent
            }
        }

        // 状态栏
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            color: "#f5f5f5"
            radius: 8
            
            Label {
                id: statusLabel
                anchors.centerIn: parent
                text: "就绪"
                font.pixelSize: 14
            }
        }
    }

    // 删除确认对话框
    Dialog {
        id: deleteDialog
        title: "确认删除"
        modal: true
        anchors.centerIn: parent
        standardButtons: Dialog.Yes | Dialog.No
        
        Label {
            text: "确定要删除当前文件吗？\n此操作无法撤销！"
            wrapMode: Text.WordWrap
        }
        
        onAccepted: {
            if (fileManager.deleteFile(currentFileUrl)) {
                textEditor.text = ""
                currentFileUrl = null
                fileInfoText.text = "未打开文件"
            }
        }
    }
}
