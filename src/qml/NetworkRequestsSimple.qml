import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 使用 XMLHttpRequest 的简化版本（更稳定）
Item {
    id: root

    function makeRequest(url) {
        busyIndicator.running = true
        statusText.text = "正在请求..."
        statusText.color = "#2196F3"
        progressText.text = ""
        
        var xhr = new XMLHttpRequest()
        
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                busyIndicator.running = false
                
                if (xhr.status === 200) {
                    try {
                        var data = JSON.parse(xhr.responseText)
                        handleResponse(data)
                        statusText.text = "✅ 请求成功"
                        statusText.color = "#4CAF50"
                    } catch (e) {
                        statusText.text = "❌ 数据解析失败: " + e.message
                        statusText.color = "#f44336"
                    }
                } else {
                    statusText.text = "❌ 请求失败: HTTP " + xhr.status
                    statusText.color = "#f44336"
                }
            }
        }
        
        xhr.open("GET", url)
        xhr.send()
    }
    
    function makePostRequest(url, jsonData) {
        busyIndicator.running = true
        statusText.text = "正在发送..."
        statusText.color = "#2196F3"
        
        var xhr = new XMLHttpRequest()
        
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                busyIndicator.running = false
                
                if (xhr.status === 200 || xhr.status === 201) {
                    try {
                        var data = JSON.parse(xhr.responseText)
                        handleResponse(data)
                        statusText.text = "✅ 发送成功"
                        statusText.color = "#4CAF50"
                    } catch (e) {
                        statusText.text = "❌ 响应解析失败"
                        statusText.color = "#f44336"
                    }
                } else {
                    statusText.text = "❌ 发送失败: HTTP " + xhr.status
                    statusText.color = "#f44336"
                }
            }
        }
        
        xhr.open("POST", url)
        xhr.setRequestHeader("Content-Type", "application/json")
        xhr.send(jsonData)
    }

    function handleResponse(data) {
        dataListModel.clear()
        
        if (Array.isArray(data)) {
            for (var i = 0; i < Math.min(data.length, 20); i++) {
                var item = data[i]
                dataListModel.append({
                    "title": item.name || item.title || "Item " + (i + 1),
                    "subtitle": item.email || item.body || "",
                    "detail": String(item.phone || item.userId || item.postId || "")
                })
            }
        } else if (typeof data === 'object') {
            dataListModel.append({
                "title": data.name || "Response",
                "subtitle": JSON.stringify(data).substring(0, 100),
                "detail": ""
            })
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // 标题
        Label {
            text: "网络请求示例 (XMLHttpRequest)"
            font.pixelSize: 24
            font.bold: true
        }

        // 示例按钮区域
        GroupBox {
            title: "API 请求示例"
            Layout.fillWidth: true
            
            GridLayout {
                anchors.fill: parent
                columns: 2
                rowSpacing: 10
                columnSpacing: 10
                
                Button {
                    text: "📥 获取用户列表"
                    Layout.fillWidth: true
                    highlighted: true
                    onClicked: {
                        makeRequest("https://jsonplaceholder.typicode.com/users")
                    }
                }
                
                Button {
                    text: "📰 获取文章列表"
                    Layout.fillWidth: true
                    onClicked: {
                        makeRequest("https://jsonplaceholder.typicode.com/posts")
                    }
                }
                
                Button {
                    text: "💬 获取评论"
                    Layout.fillWidth: true
                    onClicked: {
                        makeRequest("https://jsonplaceholder.typicode.com/comments")
                    }
                }
                
                Button {
                    text: "📋 获取待办事项"
                    Layout.fillWidth: true
                    onClicked: {
                        makeRequest("https://jsonplaceholder.typicode.com/todos")
                    }
                }
            }
        }

        // POST 请求示例
        GroupBox {
            title: "POST 请求示例"
            Layout.fillWidth: true
            
            ColumnLayout {
                anchors.fill: parent
                spacing: 10
                
                RowLayout {
                    spacing: 10
                    Layout.fillWidth: true
                    
                    TextField {
                        id: nameField
                        placeholderText: "输入用户名"
                        Layout.fillWidth: true
                    }
                    
                    TextField {
                        id: emailField
                        placeholderText: "输入邮箱"
                        Layout.fillWidth: true
                    }
                    
                    Button {
                        text: "📤 发送"
                        enabled: nameField.text.length > 0 && emailField.text.length > 0
                        onClicked: {
                            var userData = {
                                "name": nameField.text,
                                "email": emailField.text
                            }
                            makePostRequest(
                                "https://jsonplaceholder.typicode.com/users",
                                JSON.stringify(userData)
                            )
                        }
                    }
                }
            }
        }

        // 状态显示
        Rectangle {
            Layout.fillWidth: true
            height: 60
            color: "#f5f5f5"
            radius: 8
            
            RowLayout {
                anchors.centerIn: parent
                spacing: 15
                
                BusyIndicator {
                    id: busyIndicator
                    running: false
                    implicitWidth: 32
                    implicitHeight: 32
                }
                
                ColumnLayout {
                    spacing: 5
                    
                    Label {
                        id: statusText
                        text: "等待请求..."
                        font.pixelSize: 14
                    }
                    
                    Label {
                        id: progressText
                        text: ""
                        font.pixelSize: 12
                        color: "#666"
                    }
                }
            }
        }

        // 数据列表
        GroupBox {
            title: "📋 响应数据 (共 " + dataListModel.count + " 条)"
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            ListView {
                id: dataListView
                anchors.fill: parent
                clip: true
                spacing: 5
                
                model: ListModel {
                    id: dataListModel
                }
                
                delegate: ItemDelegate {
                    width: dataListView.width
                    
                    contentItem: ColumnLayout {
                        spacing: 5
                        
                        Label {
                            text: model.title
                            font.pixelSize: 16
                            font.bold: true
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                        
                        Label {
                            text: model.subtitle
                            font.pixelSize: 14
                            color: "#666"
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                            visible: model.subtitle.length > 0
                        }
                        
                        Label {
                            text: model.detail
                            font.pixelSize: 12
                            color: "#999"
                            visible: model.detail.length > 0
                        }
                    }
                    
                    background: Rectangle {
                        color: parent.hovered ? "#f0f0f0" : "white"
                        radius: 4
                        border.color: "#e0e0e0"
                        border.width: 1
                    }
                }
                
                ScrollBar.vertical: ScrollBar {}
                
                Label {
                    anchors.centerIn: parent
                    text: "暂无数据\n点击上方按钮获取数据"
                    font.pixelSize: 14
                    color: "#999"
                    horizontalAlignment: Text.AlignHCenter
                    visible: dataListModel.count === 0
                }
            }
        }

        // 操作按钮
        RowLayout {
            spacing: 10
            
            Button {
                text: "🔄 刷新"
                onClicked: {
                    makeRequest("https://jsonplaceholder.typicode.com/users")
                }
            }
            
            Button {
                text: "🗑️ 清空"
                onClicked: {
                    dataListModel.clear()
                    statusText.text = "列表已清空"
                    statusText.color = "#666"
                }
            }
            
            Item { Layout.fillWidth: true }
            
            Label {
                text: "💡 使用 XMLHttpRequest (更稳定)"
                font.pixelSize: 12
                color: "#666"
            }
        }
    }
}
