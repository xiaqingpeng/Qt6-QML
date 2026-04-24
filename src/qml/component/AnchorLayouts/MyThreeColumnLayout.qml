import QtQuick
import QtQuick.Controls

Rectangle {
    id: threeColumnLayout
    width: parent.width
    height: 500
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: "示例1: 三栏布局（顶部+左侧+中间）"
        font.pixelSize: 18
        font.bold: true
    }

    // 顶部导航栏
    Rectangle {
        id: topBar
        width: parent.width
        height: 60
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.right: parent.right
        color: '#1976d2'
    }

    // 左侧菜单
    Rectangle {
        id: leftMenu
        width: 180
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        color: '#fafafa'
    }

    // 中间内容区
    Rectangle {
        id: mainArea
        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: leftMenu.right
        anchors.right: parent.right
        anchors.margins: 10

        color: '#f5f5f7'
    }
}
