import QtQuick

import QtQuick.Controls

Item {
    id: root

    property string name: "Demo 6 示例"

    Rectangle {
        id: main
        anchors.fill: parent
        color: '#cccccc'

        TextField {
            id: textField
            width: 480
            height: 60
            anchors.centerIn: parent
            placeholderText: "搜索歌曲、歌手、专辑"

            placeholderTextColor: "#999999"

            verticalAlignment: TextInput.AlignVCenter

            font.pixelSize: 28

            background: Rectangle {
                color: '#ffffff'
                opacity: 0.9

                radius: 15
            }

            onAccepted: {
                console.log(text,'onAccepted');
            }

            onTextChanged: {
                 console.log(text,'onTextChanged');
            }

            onFocusChanged: {
                console.log(text,'onFocusChanged');
            }
        }
    }
}
