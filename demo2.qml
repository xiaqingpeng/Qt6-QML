import QtQuick
import QtQuick.Controls
import demo

Item {
    id: root

    Column {
        anchors.centerIn: parent
        spacing: 20
        width: 300

        Text {
            text: "Backend 单例示例"
            font.pixelSize: 20
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            text: "Counter: " + Backend.counter
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "增加计数"
            width: 200
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: Backend.increment()
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#cccccc"
        }

        Text {
            text: "DataModel 列表示例"
            font.pixelSize: 20
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ListView {
            width: parent.width
            height: 150
            model: DataModel {}
            delegate: Rectangle {
                width: ListView.view.width
                height: 40
                color: index % 2 === 0 ? "#f0f0f0" : "#ffffff"
                
                Text {
                    anchors.centerIn: parent
                    text: "Name: " + itemName
                    font.pixelSize: 14
                }
            }
        }
    }
}
