import QtQuick
import QtQuick.Controls

Rectangle {
    id: relativeLayout
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
