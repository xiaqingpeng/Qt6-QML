import QtQuick
import QtQuick.Controls

Rectangle {
    id: musicLayout
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
        text: "示例8: 网易云音乐三栏布局"
        font.pixelSize: 18
        font.bold: true
        color: '#333333'
    }

    // 左侧导航栏
    Rectangle {
        id: leftNav
        width: 180
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: bottomPlayer.top
        color: '#f5f5f7'
    }

    // 中间内容区
    Rectangle {
        id: mainContent
        anchors.left: leftNav.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.bottom: bottomPlayer.top
        color: '#ccc'
        opacity: 0.1
    }

    // 底部播放器
    Rectangle {
        id: bottomPlayer
        width: parent.width
        height: 70
        anchors.bottom: parent.bottom
        color: '#f0f0f0'
        border.color: '#e0e0e0'
        border.width: 1
    }
}
