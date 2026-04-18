import QtQuick
import QtQuick.Controls

Item {
    id: root

    property string name: "Demo 5 锚点布局示例"

    Rectangle {
        id: main
        anchors.fill: parent
        color: '#f5f5f5'

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 10
            clip: true

            Column {
                width: scrollView.width - 20
                spacing: 30

                // 示例1: 四角布局
                Rectangle {
                    width: parent.width
                    height: 250
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例1: 四角布局"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: topLeft
                        width: 100
                        height: 80
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.margins: 40
                        color: '#ff6b6b'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "左上"
                            color: "white"
                        }
                    }

                    Rectangle {
                        width: 100
                        height: 80
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.margins: 40
                        color: '#4ecdc4'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "右上"
                            color: "white"
                        }
                    }

                    Rectangle {
                        width: 100
                        height: 80
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        anchors.margins: 40
                        color: '#95e1d3'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "左下"
                            color: "white"
                        }
                    }

                    Rectangle {
                        width: 100
                        height: 80
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.margins: 40
                        color: '#f38181'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "右下"
                            color: "white"
                        }
                    }
                }

                // 示例2: 居中布局
                Rectangle {
                    width: parent.width
                    height: 200
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例2: 居中布局"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        width: 150
                        height: 100
                        anchors.centerIn: parent
                        color: '#6c5ce7'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "完全居中"
                            color: "white"
                            font.pixelSize: 16
                        }
                    }

                    Rectangle {
                        width: 80
                        height: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 40
                        color: '#a29bfe'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "水平居中"
                            color: "white"
                            font.pixelSize: 12
                        }
                    }

                    Rectangle {
                        width: 80
                        height: 40
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        color: '#fd79a8'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "垂直居中"
                            color: "white"
                            font.pixelSize: 12
                        }
                    }
                }

                // 示例3: 填充布局
                Rectangle {
                    width: parent.width
                    height: 200
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例3: 填充布局"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 40
                        color: '#00b894'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "填充父元素 (带边距)"
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
                }

                // 示例4: 相对定位
                Rectangle {
                    width: parent.width
                    height: 200
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例4: 相对定位"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: refBox
                        width: 100
                        height: 80
                        anchors.centerIn: parent
                        color: '#0984e3'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "参考元素"
                            color: "white"
                        }
                    }

                    Rectangle {
                        width: 80
                        height: 60
                        anchors.left: refBox.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: refBox.verticalCenter
                        color: '#74b9ff'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "右侧"
                            color: "white"
                        }
                    }

                    Rectangle {
                        width: 80
                        height: 60
                        anchors.right: refBox.left
                        anchors.rightMargin: 10
                        anchors.verticalCenter: refBox.verticalCenter
                        color: '#74b9ff'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "左侧"
                            color: "white"
                        }
                    }

                    Rectangle {
                        width: 80
                        height: 50
                        anchors.top: refBox.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: refBox.horizontalCenter
                        color: '#74b9ff'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "下方"
                            color: "white"
                        }
                    }
                }

                // 示例5: 顶部工具栏 + 内容区
                Rectangle {
                    width: parent.width
                    height: 250
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例5: 顶部工具栏 + 内容区"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: toolbar
                        width: parent.width
                        height: 60
                        anchors.top: parent.top
                        anchors.topMargin: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        color: '#2d3436'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "工具栏"
                            color: "white"
                            font.pixelSize: 16
                        }
                    }

                    Rectangle {
                        anchors.top: toolbar.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        color: '#dfe6e9'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "内容区域"
                            color: "#2d3436"
                            font.pixelSize: 16
                        }
                    }
                }

                // 示例6: 侧边栏布局
                Rectangle {
                    width: parent.width
                    height: 250
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例6: 侧边栏布局"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        id: sidebar
                        width: 120
                        anchors.top: parent.top
                        anchors.topMargin: 40
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        color: '#636e72'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "侧边栏"
                            color: "white"
                            font.pixelSize: 14
                        }
                    }

                    Rectangle {
                        anchors.top: parent.top
                        anchors.topMargin: 40
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.left: sidebar.right
                        anchors.leftMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        color: '#b2bec3'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "主内容区"
                            color: "#2d3436"
                            font.pixelSize: 16
                        }
                    }
                }

                // 示例7: 底部固定按钮
                Rectangle {
                    width: parent.width
                    height: 200
                    color: '#e0e0e0'
                    radius: 10

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.margins: 10
                        text: "示例7: 底部固定按钮"
                        font.pixelSize: 18
                        font.bold: true
                    }

                    Rectangle {
                        anchors.top: parent.top
                        anchors.topMargin: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: bottomButton.top
                        anchors.margins: 10
                        color: '#ffeaa7'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "滚动内容区"
                            color: "#2d3436"
                        }
                    }

                    Rectangle {
                        id: bottomButton
                        width: parent.width - 20
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: '#e17055'
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: "底部固定按钮"
                            color: "white"
                            font.pixelSize: 16
                        }
                    }
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
