import QtQuick
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: 350
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例6: 卡片翻转效果"
            font.pixelSize: 18
            font.bold: true
        }

        Item {
            width: 250
            height: 180
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: card
                anchors.fill: parent
                color: "#4CAF50"
                radius: 10

                Text {
                    anchors.centerIn: parent
                    text: "正面\n点击翻转"
                    color: "white"
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    visible: card.state === ""
                }

                Text {
                    anchors.centerIn: parent
                    text: "背面\n再次点击"
                    color: "white"
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    visible: card.state === "flipped"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        card.state = card.state === "" ? "flipped" : ""
                    }
                }

                states: [
                    State {
                        name: "flipped"
                        PropertyChanges {
                            card.rotation: 180
                            card.color: "#2196F3"
                        }
                    }
                ]

                transitions: [
                    Transition {
                        RotationAnimation {
                            duration: 600
                            easing.type: Easing.InOutQuad
                        }
                        ColorAnimation {
                            duration: 600
                        }
                    }
                ]

                transform: Rotation {
                    origin.x: card.width / 2
                    origin.y: card.height / 2
                    axis { x: 0; y: 1; z: 0 }
                    angle: card.rotation
                }
            }
        }

        Text {
            text: "点击卡片进行翻转"
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#666666"
            font.pixelSize: 14
        }
    }
}
