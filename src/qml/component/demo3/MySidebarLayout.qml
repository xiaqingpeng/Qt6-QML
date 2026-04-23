import QtQuick
import QtQuick.Controls

Rectangle {
    id: sidebarLayout
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
