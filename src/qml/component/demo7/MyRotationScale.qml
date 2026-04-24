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
            text: "示例3: 旋转和缩放动画"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            width: parent.width - 40
            height: 150
            color: '#f0f0f0'
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: rotatingBox
                width: 80
                height: 80
                color: "green"
                anchors.centerIn: parent

                Text {
                    anchors.centerIn: parent
                    text: "旋转"
                    color: "white"
                    font.pixelSize: 12
                }

                states: [
                    State {
                        name: "rotated"
                        PropertyChanges {
                            rotatingBox.rotation: 360
                            rotatingBox.scale: 1.3
                            rotatingBox.color: "purple"
                        }
                    }
                ]

                transitions: [
                    Transition {
                        RotationAnimation {
                            duration: 1000
                            direction: RotationAnimation.Clockwise
                        }
                        NumberAnimation {
                            property: "scale"
                            duration: 1000
                            easing.type: Easing.OutElastic
                        }
                        ColorAnimation {
                            duration: 1000
                        }
                    }
                ]
            }
        }

        Button {
            text: "旋转并放大"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                rotatingBox.state = rotatingBox.state === "" ? "rotated" : ""
            }
        }
    }
}
