import QtQuick
import QtQuick.Controls

// 示例12: Card 卡片（自定义组件）
Rectangle {
    width: parent.width
    height: 400
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例12: Card 卡片布局"
            font.pixelSize: 18
            font.bold: true
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            // Card 1
            Rectangle {
                width: 180
                height: 250
                color: '#ffffff'
                radius: 8
                border.color: '#e0e0e0'
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Rectangle {
                        width: parent.width
                        height: 100
                        color: '#3498db'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "图片区域"
                            color: "white"
                            font.pixelSize: 14
                        }
                    }

                    Text {
                        text: "卡片标题"
                        font.pixelSize: 16
                        font.bold: true
                    }

                    Text {
                        text: "这是卡片的描述内容，可以显示更多信息。"
                        font.pixelSize: 12
                        color: "#666666"
                        wrapMode: Text.WordWrap
                        width: parent.width
                    }

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "查看详情"
                        flat: true
                        onClicked: console.log("卡片1点击")
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = '#3498db'
                    onExited: parent.border.color = '#e0e0e0'
                    onClicked: {} // 防止穿透
                }
            }

            // Card 2
            Rectangle {
                width: 180
                height: 250
                color: '#ffffff'
                radius: 8
                border.color: '#e0e0e0'
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Rectangle {
                        width: parent.width
                        height: 100
                        color: '#e74c3c'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "封面"
                            color: "white"
                            font.pixelSize: 14
                        }
                    }

                    Text {
                        text: "产品卡片"
                        font.pixelSize: 16
                        font.bold: true
                    }

                    Text {
                        text: "价格: ¥99.00"
                        font.pixelSize: 14
                        color: "#e74c3c"
                        font.bold: true
                    }

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "立即购买"
                        highlighted: true
                        onClicked: console.log("卡片2点击")
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = '#e74c3c'
                    onExited: parent.border.color = '#e0e0e0'
                    onClicked: {}
                }
            }

            // Card 3
            Rectangle {
                width: 180
                height: 250
                color: '#ffffff'
                radius: 8
                border.color: '#e0e0e0'
                border.width: 1

                Column {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Rectangle {
                        width: parent.width
                        height: 100
                        color: '#2ecc71'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "缩略图"
                            color: "white"
                            font.pixelSize: 14
                        }
                    }

                    Text {
                        text: "用户卡片"
                        font.pixelSize: 16
                        font.bold: true
                    }

                    Text {
                        text: "在线状态: 活跃"
                        font.pixelSize: 12
                        color: "#2ecc71"
                    }

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "关注"
                        onClicked: console.log("卡片3点击")
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.border.color = '#2ecc71'
                    onExited: parent.border.color = '#e0e0e0'
                    onClicked: {}
                }
            }
        }
    }
}
