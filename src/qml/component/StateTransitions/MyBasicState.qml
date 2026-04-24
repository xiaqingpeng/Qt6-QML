import QtQuick
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: 250
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例1: 基础状态切换"
            font.pixelSize: 18
            font.bold: true
        }

        Rectangle {
            id: box
            width: 100
            height: 100
            color: "lightblue"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.centerIn: parent
                text: box.state === "" ? "默认" : "激活"
                font.pixelSize: 14
            }

            states: [
                State {
                    name: "active"
                    PropertyChanges {
                        box.color: "orange"
                        box.width: 120
                        box.height: 120
                    }
                }
            ]

            transitions: [
                Transition {
                    from: ""
                    to: "active"
                    PropertyAnimation {
                        properties: "width,height,color"
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                },
                Transition {
                    from: "active"
                    to: ""
                    PropertyAnimation {
                        properties: "width,height,color"
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                }
            ]
        }

        Button {
            text: "切换状态"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                box.state = box.state === "" ? "active" : ""
            }
        }
    }
}
