import QtQuick
import QtQuick.Controls

// 示例8: BusyIndicator 和 Dial
Rectangle {
    width: parent.width
    height: 220
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例8: BusyIndicator 和 Dial"
            font.pixelSize: 18
            font.bold: true
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50

            Column {
                spacing: 10

                BusyIndicator {
                    anchors.horizontalCenter: parent.horizontalCenter
                    running: true
                }

                Text {
                    text: "加载中..."
                    font.pixelSize: 12
                    color: "#666666"
                }
            }

            Column {
                spacing: 10

                Dial {
                    id: dial
                    from: 0
                    to: 100
                    value: 30
                    onValueChanged: console.log("Dial值:", value)
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "旋钮: " + Math.round(dial.value)
                    font.pixelSize: 12
                    color: "#666666"
                }
            }
        }
    }
}
