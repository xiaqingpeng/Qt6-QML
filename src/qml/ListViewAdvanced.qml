import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    ListModel {
        id: contactsModel
        
        Component.onCompleted: {
            var names = [
                "Alice Johnson", "Bob Smith", "Charlie Brown", "David Lee",
                "Emma Wilson", "Frank Zhang", "Grace Chen", "Henry Wang",
                "Ivy Liu", "Jack Ma", "Kate Li", "Leo Sun"
            ]
            var sections = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
            
            for (var i = 0; i < names.length; i++) {
                append({
                    "name": names[i],
                    "phone": "138" + Math.floor(Math.random() * 100000000),
                    "email": names[i].toLowerCase().replace(" ", ".") + "@example.com",
                    "section": sections[i],
                    "favorite": Math.random() > 0.7
                })
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // 标题
        Label {
            text: "ListView 高级用法"
            font.pixelSize: 24
            font.bold: true
        }

        // 搜索和筛选
        GroupBox {
            title: "🔍 搜索和筛选"
            Layout.fillWidth: true
            
            ColumnLayout {
                anchors.fill: parent
                spacing: 10
                
                TextField {
                    id: searchField
                    placeholderText: "搜索联系人..."
                    Layout.fillWidth: true
                    
                    rightPadding: 40
                    
                    Button {
                        text: "✕"
                        flat: true
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        visible: searchField.text.length > 0
                        onClicked: searchField.text = ""
                    }
                }
                
                RowLayout {
                    spacing: 10
                    
                    CheckBox {
                        id: favoriteFilter
                        text: "⭐ 仅显示收藏"
                    }
                    
                    Label {
                        text: "共 " + contactsModel.count + " 个联系人"
                        color: "#666"
                    }
                    
                    Item { Layout.fillWidth: true }
                    
                    Button {
                        text: "➕ 添加"
                        onClicked: addDialog.open()
                    }
                }
            }
        }

        // 联系人列表
        GroupBox {
            title: "📋 联系人列表（分组 + 滑动删除）"
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            ListView {
                id: contactsList
                anchors.fill: parent
                clip: true
                spacing: 0
                
                model: contactsModel
                
                // 分组
                section.property: "section"
                section.criteria: ViewSection.FullString
                section.delegate: Rectangle {
                    width: contactsList.width
                    height: 40
                    color: "#e3f2fd"
                    
                    Label {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: section
                        font.pixelSize: 18
                        font.bold: true
                        color: "#1976d2"
                    }
                }
                
                delegate: SwipeDelegate {
                    id: swipeDelegate
                    width: contactsList.width
                    height: 80
                    
                    contentItem: RowLayout {
                        spacing: 15
                        
                        // 头像
                        Rectangle {
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 50
                            color: "#e0e0e0"
                            radius: 25
                            
                            Label {
                                anchors.centerIn: parent
                                text: "👤"
                                font.pixelSize: 28
                            }
                        }
                        
                        // 信息
                        ColumnLayout {
                            spacing: 5
                            Layout.fillWidth: true
                            
                            RowLayout {
                                spacing: 10
                                
                                Label {
                                    text: model.name
                                    font.pixelSize: 16
                                    font.bold: true
                                }
                                
                                Label {
                                    text: "⭐"
                                    visible: model.favorite
                                }
                            }
                            
                            Label {
                                text: "📱 " + model.phone
                                font.pixelSize: 14
                                color: "#666"
                            }
                            
                            Label {
                                text: "📧 " + model.email
                                font.pixelSize: 12
                                color: "#999"
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }
                        }
                    }
                    
                    background: Rectangle {
                        color: swipeDelegate.pressed ? "#f0f0f0" : "white"
                        border.color: "#e0e0e0"
                        border.width: 1
                    }
                    
                    // 滑动操作
                    swipe.right: Row {
                        anchors.right: parent.right
                        height: parent.height
                        
                        Rectangle {
                            width: 80
                            height: parent.height
                            color: model.favorite ? "#999" : "#FFC107"
                            
                            Label {
                                anchors.centerIn: parent
                                text: model.favorite ? "取消\n收藏" : "收藏"
                                color: "white"
                                font.pixelSize: 14
                                horizontalAlignment: Text.AlignHCenter
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    contactsModel.setProperty(index, "favorite", !model.favorite)
                                    swipeDelegate.swipe.close()
                                }
                            }
                        }
                        
                        Rectangle {
                            width: 80
                            height: parent.height
                            color: "#f44336"
                            
                            Label {
                                anchors.centerIn: parent
                                text: "删除"
                                color: "white"
                                font.pixelSize: 14
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    contactsModel.remove(index)
                                }
                            }
                        }
                    }
                }
                
                ScrollBar.vertical: ScrollBar {}
                
                Label {
                    anchors.centerIn: parent
                    text: "没有找到联系人"
                    font.pixelSize: 16
                    color: "#999"
                    visible: contactsList.count === 0
                }
            }
        }

        // 操作按钮
        RowLayout {
            spacing: 10
            
            Button {
                text: "🔄 重置数据"
                onClicked: {
                    contactsModel.clear()
                    var names = [
                        "Alice Johnson", "Bob Smith", "Charlie Brown", "David Lee",
                        "Emma Wilson", "Frank Zhang", "Grace Chen", "Henry Wang",
                        "Ivy Liu", "Jack Ma", "Kate Li", "Leo Sun"
                    ]
                    var sections = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
                    
                    for (var i = 0; i < names.length; i++) {
                        contactsModel.append({
                            "name": names[i],
                            "phone": "138" + Math.floor(Math.random() * 100000000),
                            "email": names[i].toLowerCase().replace(" ", ".") + "@example.com",
                            "section": sections[i],
                            "favorite": Math.random() > 0.7
                        })
                    }
                }
            }
            
            Item { Layout.fillWidth: true }
        }
    }

    // 添加联系人对话框
    Dialog {
        id: addDialog
        title: "添加联系人"
        modal: true
        anchors.centerIn: parent
        standardButtons: Dialog.Ok | Dialog.Cancel
        
        onAccepted: {
            if (nameInput.text.length > 0) {
                contactsModel.append({
                    "name": nameInput.text,
                    "phone": phoneInput.text,
                    "email": emailInput.text,
                    "section": nameInput.text.charAt(0).toUpperCase(),
                    "favorite": false
                })
                nameInput.text = ""
                phoneInput.text = ""
                emailInput.text = ""
            }
        }
        
        ColumnLayout {
            spacing: 10
            
            TextField {
                id: nameInput
                placeholderText: "姓名"
                Layout.preferredWidth: 300
            }
            
            TextField {
                id: phoneInput
                placeholderText: "手机号"
                Layout.fillWidth: true
            }
            
            TextField {
                id: emailInput
                placeholderText: "邮箱"
                Layout.fillWidth: true
            }
        }
    }
}
