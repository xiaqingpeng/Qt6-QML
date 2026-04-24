import QtQuick
import QtQuick.Controls

// 示例3: 鼠标拖拽
Rectangle {
    width: parent.width
    height: 300
    color: '#e0e0e0'
    radius: 10

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: "示例3: 鼠标拖拽"
        font.pixelSize: 18
        font.bold: true
    }

    Rectangle {
        id: dragBox
        width: 100
        height: 100
        x: 100
        y: 100
        color: '#00b894'
        radius: 8

        MouseArea {
            anchors.fill: parent
            drag.target: dragBox
            drag.axis: Drag.XAndYAxis
            drag.minimumX: 0
            drag.maximumX: parent.parent.width - dragBox.width
            drag.minimumY: 40
            drag.maximumY: parent.parent.height - dragBox.height

            onPressed: {
                dragBox.color = '#55efc4'
                console.log("开始拖拽")
            }

            onReleased: {
                dragBox.color = '#00b894'
                console.log("拖拽结束，位置:", dragBox.x, dragBox.y)
            }
        }

        Text {
            anchors.centerIn: parent
            text: "拖动我"
            color: "white"
            font.pixelSize: 14
            font.bold: true
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        text: "位置: X=" + Math.round(dragBox.x) + ", Y=" + Math.round(dragBox.y)
        font.pixelSize: 12
        color: "#666666"
    }
}
