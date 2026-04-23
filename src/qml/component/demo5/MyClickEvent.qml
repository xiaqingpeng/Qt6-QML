import QtQuick
import QtQuick.Controls

// 示例1: 鼠标点击事件
Rectangle {
    width: parent.width
    height: 200
    color: '#e0e0e0'
    radius: 10

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: "示例1: 鼠标点击事件"
        font.pixelSize: 18
        font.bold: true
    }

    Row {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            id: clickBox
            width: 150
            height: 100
            color: '#4ecdc4'
            radius: 8

            property int clickCount: 0

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clickBox.clickCount++
                    console.log("点击次数:", clickBox.clickCount)
                }
            }

            Column {
                anchors.centerIn: parent
                spacing: 5

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "点击我"
                    color: "white"
                    font.pixelSize: 16
                    font.bold: true
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "点击次数: " + clickBox.clickCount
                    color: "white"
                    font.pixelSize: 14
                }
            }
        }

        Rectangle {
            id: doubleClickBox
            width: 150
            height: 100
            color: '#ff6b6b'
            radius: 8

            property int doubleClickCount: 0

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: {
                    doubleClickBox.doubleClickCount++
                    console.log("双击次数:", doubleClickBox.doubleClickCount)
                }
            }

            Column {
                anchors.centerIn: parent
                spacing: 5

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "双击我"
                    color: "white"
                    font.pixelSize: 16
                    font.bold: true
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "双击次数: " + doubleClickBox.doubleClickCount
                    color: "white"
                    font.pixelSize: 14
                }
            }
        }
    }
}
