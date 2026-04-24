import QtQuick
import QtQuick.Controls

// 示例5: 鼠标滚轮事件
Rectangle {
    width: parent.width
    height: 250
    color: '#e0e0e0'
    radius: 10

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: "示例5: 鼠标滚轮事件"
        font.pixelSize: 18
        font.bold: true
    }

    Rectangle {
        width: parent.width - 40
        height: 180
        anchors.centerIn: parent
        color: '#ffffff'
        radius: 8
        border.color: '#cccccc'
        border.width: 2

        property int wheelDelta: 0
        property int scale: 100

        MouseArea {
            anchors.fill: parent

            onWheel: (wheel) => {
                parent.wheelDelta += wheel.angleDelta.y
                parent.scale = Math.max(50, Math.min(200, parent.scale + wheel.angleDelta.y / 12))
                console.log("滚轮:", wheel.angleDelta.y, "缩放:", parent.scale)
            }
        }

        Column {
            anchors.centerIn: parent
            spacing: 15

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "🖱️"
                font.pixelSize: parent.parent.scale / 2
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "在这里滚动鼠标滚轮"
                font.pixelSize: 16
                font.bold: true
                color: "#333333"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "缩放: " + parent.parent.scale + "%"
                font.pixelSize: 14
                color: "#666666"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "滚轮累计: " + parent.parent.wheelDelta
                font.pixelSize: 12
                color: "#999999"
            }
        }
    }
}
