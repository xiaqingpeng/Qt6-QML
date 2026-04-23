import QtQuick
import QtQuick.Controls

// 示例6: 组合事件（点击+拖拽+悬停）
Rectangle {
    width: parent.width
    height: 250
    color: '#e0e0e0'
    radius: 10

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        text: "示例6: 组合事件（点击+拖拽+悬停）"
        font.pixelSize: 18
        font.bold: true
    }

    Rectangle {
        id: comboBox
        width: 120
        height: 120
        x: 150
        y: 80
        color: comboArea.containsMouse ? '#fd79a8' : '#e84393'
        radius: 60
        scale: comboArea.pressed ? 0.9 : 1.0

        property int clickCount: 0

        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Behavior on scale {
            NumberAnimation { duration: 100 }
        }

        MouseArea {
            id: comboArea
            anchors.fill: parent
            hoverEnabled: true
            drag.target: comboBox
            drag.axis: Drag.XAndYAxis
            drag.minimumX: 0
            drag.maximumX: parent.parent.width - comboBox.width
            drag.minimumY: 40
            drag.maximumY: parent.parent.height - comboBox.height

            onClicked: {
                comboBox.clickCount++
                console.log("组合框点击:", comboBox.clickCount)
            }

            onEntered: console.log("鼠标进入组合框")
            onExited: console.log("鼠标离开组合框")
        }

        Column {
            anchors.centerIn: parent
            spacing: 5

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "🎯"
                font.pixelSize: 32
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "点击: " + comboBox.clickCount
                color: "white"
                font.pixelSize: 12
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        text: "可以拖拽、点击、悬停"
        font.pixelSize: 12
        color: "#666666"
    }
}
