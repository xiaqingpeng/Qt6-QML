import QtQuick
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: 300
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例2: 颜色和位置过渡"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            id: container
            width: parent.width - 40
            height: 150
            color: '#f0f0f0'
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: movingBox
                width: 60
                height: 60
                color: "red"
                radius: 5

                Text {
                    anchors.centerIn: parent
                    text: "移动"
                    color: "white"
                    font.pixelSize: 12
                }

                states: [
                    State {
                        name: "right"
                        PropertyChanges {
                            movingBox.x: container.width - movingBox.width
                            movingBox.y: container.height - movingBox.height
                            movingBox.color: "blue"
                            movingBox.rotation: 180
                        }
                    }
                ]

                transitions: [
                    Transition {
                        NumberAnimation {
                            properties: "x,y,rotation"
                            duration: 1000
                            easing.type: Easing.InOutCubic
                        }
                        ColorAnimation {
                            duration: 1000
                        }
                    }
                ]
            }
        }

        Button {
            text: "移动到右下角"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                movingBox.state = movingBox.state === "" ? "right" : ""
            }
        }
    }
}
