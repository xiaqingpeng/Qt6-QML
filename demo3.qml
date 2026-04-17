import QtQuick

Item {
    id: root

    property string name: "Connections 劫持"
    property int clickCount: 0

    Row {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            id: page1
            width: 150
            height: 150
            color: 'red'
            radius: 100

            MouseArea {
                id: redRectId
                anchors.fill: parent

                onClicked: {
                    root.clickCount++
                    console.log("红色矩形被点击，次数:", root.clickCount)
                }
            }
        }

        Rectangle {
            id: page2
            width: 150
            height: 150
            color: 'green'
            radius: 100
            
            Connections {
                target: redRectId
                function onClicked() {
                    console.log("这是一个绿色的矩形")
                }
            }
        }

        Rectangle {
            id: page3
            width: 150
            height: 150
            color: 'blue'
            radius: 100
            
            Connections {
                target: redRectId
                function onClicked() {
                    console.log("这是一个蓝色的矩形")
                }
            }
        }
    }
}
