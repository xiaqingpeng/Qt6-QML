import QtQuick
import QtQuick.Controls

Rectangle {
    id: fillLayout
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
