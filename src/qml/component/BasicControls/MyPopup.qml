import QtQuick
import QtQuick.Controls

// 示例9: Popup 弹出层
Rectangle {
    width: parent.width
    height: 180
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例9: Popup 弹出层"
            font.pixelSize: 18
            font.bold: true
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15

            Button {
                text: "打开 Popup"
                onClicked: popup.open()
            }

            Button {
                text: "底部 Popup"
                onClicked: bottomPopup.open()
            }

            Button {
                text: "模态 Popup"
                onClicked: modalPopup.open()
            }
        }
    }

    Popup {
        id: popup
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 300
        height: 200
        modal: false
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        Rectangle {
            anchors.fill: parent
            color: '#ffffff'
            border.color: '#3498db'
            border.width: 2
            radius: 8

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "这是一个 Popup"
                    font.pixelSize: 16
                    font.bold: true
                }

                Text {
                    text: "点击外部或按 ESC 关闭"
                    font.pixelSize: 12
                    color: "#666666"
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "关闭"
                    onClicked: popup.close()
                }
            }
        }
    }

    Popup {
        id: bottomPopup
        x: (parent.width - width) / 2
        y: parent.height - height - 20
        width: 250
        height: 150
        modal: false

        Rectangle {
            anchors.fill: parent
            color: '#2ecc71'
            radius: 8

            Column {
                anchors.centerIn: parent
                spacing: 15

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "底部弹出"
                    font.pixelSize: 14
                    color: "white"
                    font.bold: true
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "关闭"
                    onClicked: bottomPopup.close()
                }
            }
        }
    }

    Popup {
        id: modalPopup
        anchors.centerIn: parent
        width: 300
        height: 200
        modal: true
        dim: true
        closePolicy: Popup.CloseOnEscape

        Rectangle {
            anchors.fill: parent
            color: '#ffffff'
            border.color: '#e74c3c'
            border.width: 2
            radius: 8

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "模态弹出层"
                    font.pixelSize: 16
                    font.bold: true
                    color: '#e74c3c'
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "背景变暗，必须关闭才能操作"
                    font.pixelSize: 12
                    color: "#666666"
                }

                Button {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "关闭"
                    highlighted: true
                    onClicked: modalPopup.close()
                }
            }
        }
    }
}
