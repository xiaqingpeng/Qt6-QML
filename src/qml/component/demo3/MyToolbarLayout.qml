import QtQuick
import QtQuick.Controls

Rectangle {
    id: toolbarLayout
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
