import QtQuick
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: 400
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例5: 交通信号灯"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            width: 150
            height: 250
            color: '#333333'
            radius: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                anchors.centerIn: parent
                spacing: 15

                Rectangle {
                    id: redLight
                    width: 80
                    height: 80
                    radius: 40
                    color: "#400000"
                    border.color: "#666666"
                    border.width: 2
                }

                Rectangle {
                    id: yellowLight
                    width: 80
                    height: 80
                    radius: 40
                    color: "#404000"
                    border.color: "#666666"
                    border.width: 2
                }

                Rectangle {
                    id: greenLight
                    width: 80
                    height: 80
                    radius: 40
                    color: "#004000"
                    border.color: "#666666"
                    border.width: 2
                }
            }

            states: [
                State {
                    name: "red"
                    PropertyChanges { redLight.color: "#ff0000" }
                    PropertyChanges { yellowLight.color: "#404000" }
                    PropertyChanges { greenLight.color: "#004000" }
                },
                State {
                    name: "yellow"
                    PropertyChanges { redLight.color: "#400000" }
                    PropertyChanges { yellowLight.color: "#ffff00" }
                    PropertyChanges { greenLight.color: "#004000" }
                },
                State {
                    name: "green"
                    PropertyChanges { redLight.color: "#400000" }
                    PropertyChanges { yellowLight.color: "#404000" }
                    PropertyChanges { greenLight.color: "#00ff00" }
                }
            ]

            state: "red"

            transitions: [
                Transition {
                    ColorAnimation { duration: 300 }
                }
            ]
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Button {
                text: "红灯"
                onClicked: parent.parent.children[1].state = "red"
            }
            Button {
                text: "黄灯"
                onClicked: parent.parent.children[1].state = "yellow"
            }
            Button {
                text: "绿灯"
                onClicked: parent.parent.children[1].state = "green"
            }
        }

        Button {
            text: "自动循环"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: timer.running = !timer.running
        }

        Timer {
            id: timer
            interval: 2000
            repeat: true
            running: false
            onTriggered: {
                var light = parent.children[1]
                if (light.state === "red") {
                    light.state = "green"
                } else if (light.state === "green") {
                    light.state = "yellow"
                } else {
                    light.state = "red"
                }
            }
        }
    }
}
