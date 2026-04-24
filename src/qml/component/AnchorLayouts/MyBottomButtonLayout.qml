import QtQuick
import QtQuick.Controls

Rectangle {
    id: bottomButtonLayout
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
