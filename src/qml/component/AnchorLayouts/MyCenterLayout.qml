import QtQuick
import QtQuick.Controls

Rectangle {
    id: centerLayout
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
