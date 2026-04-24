import QtQuick
import QtQuick.Controls

// 示例2: 鼠标悬停和按下
Rectangle {
    width: parent.width
    height: 200
    color: '#e0e0e0'
    radius: 10

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: "示例2: 鼠标悬停和按下"
        font.pixelSize: 18
        font.bold: true
    }

    Row {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            id: hoverBox
            width: 150
            height: 100
            color: hoverArea.containsMouse ? '#a29bfe' : '#6c5ce7'
            radius: 8

            Behavior on color {
                ColorAnimation { duration: 200 }
            }

            MouseArea {
                id: hoverArea
                anchors.fill: parent
                hoverEnabled: true

                onEntered: console.log("鼠标进入")
                onExited: console.log("鼠标离开")
            }

            Text {
                anchors.centerIn: parent
                text: hoverArea.containsMouse ? "鼠标在上面" : "悬停试试"
                color: "white"
                font.pixelSize: 16
                font.bold: true
            }
        }

        Rectangle {
            id: pressBox
            width: 150
            height: 100
            color: pressArea.pressed ? '#e17055' : '#fdcb6e'
            radius: 8
            scale: pressArea.pressed ? 0.95 : 1.0

            Behavior on color {
                ColorAnimation { duration: 100 }
            }

            Behavior on scale {
                NumberAnimation { duration: 100 }
            }

            MouseArea {
                id: pressArea
                anchors.fill: parent

                onPressed: console.log("鼠标按下")
                onReleased: console.log("鼠标释放")
            }

            Text {
                anchors.centerIn: parent
                text: pressArea.pressed ? "按下中..." : "按住我"
                color: "white"
                font.pixelSize: 16
                font.bold: true
            }
        }
    }
}
