import QtQuick
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: 360
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 10

        Text {
            text: "示例4: 多状态切换"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            id: animationContainer
            width: parent.width - 40
            height: 130
            color: '#f0f0f0'
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: multiBox
                width: 50
                height: 50
                color: "red"
                x: 10
                y: 10

                Text {
                    anchors.centerIn: parent
                    text: multiBox.state || "1"
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                }

                states: [
                    State {
                        name: "state2"
                        PropertyChanges {
                            multiBox.x: animationContainer.width / 2 - multiBox.width / 2
                            multiBox.y: 10
                            multiBox.color: "blue"
                        }
                    },
                    State {
                        name: "state3"
                        PropertyChanges {
                            multiBox.x: animationContainer.width - multiBox.width - 10
                            multiBox.y: 10
                            multiBox.color: "green"
                        }
                    },
                    State {
                        name: "state4"
                        PropertyChanges {
                            multiBox.x: animationContainer.width - multiBox.width - 10
                            multiBox.y: animationContainer.height - multiBox.height - 10
                            multiBox.color: "orange"
                        }
                    },
                    State {
                        name: "state5"
                        PropertyChanges {
                            multiBox.x: 10
                            multiBox.y: animationContainer.height - multiBox.height - 10
                            multiBox.color: "purple"
                        }
                    }
                ]

                transitions: [
                    Transition {
                        NumberAnimation {
                            properties: "x,y"
                            duration: 500
                            easing.type: Easing.InOutQuad
                        }
                        ColorAnimation {
                            duration: 500
                        }
                    }
                ]
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 8

                Button {
                    text: "1"
                    width: 50
                    onClicked: multiBox.state = ""
                }
                Button {
                    text: "2"
                    width: 50
                    onClicked: multiBox.state = "state2"
                }
                Button {
                    text: "3"
                    width: 50
                    onClicked: multiBox.state = "state3"
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 8

                Button {
                    text: "4"
                    width: 50
                    onClicked: multiBox.state = "state4"
                }
                Button {
                    text: "5"
                    width: 50
                    onClicked: multiBox.state = "state5"
                }
            }
        }
    }
}
