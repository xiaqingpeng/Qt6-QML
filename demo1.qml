import QtQuick

Window {
    id: window

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property string name: "我是一个文本"


    Row {

        anchors.centerIn:parent

        Rectangle {
            id: page1
            width: 200
            height: 200
            color: 'red'

            border.color: "cyan"
            border.width: 2
            radius: 100
            MouseArea {
                id: mouseArea1
                anchors.fill: parent

                onClicked: {
                  console.log("打印了数据");
                  parent.color = "black";  // 直接使用 Rectangle 的 id

                }
            }


            Text {
                anchors.centerIn: parent
                text: "我是qml-demo"
                color: "white"
                font.pointSize: 16
            }
        }


        Rectangle {
            id: page2
            width: 200
            height: 200
            color: 'red'

            border.color: "cyan"
            border.width: 2
            radius: 100
            MouseArea {
                id: mouseArea2
                anchors.fill: parent

                onClicked: {
                  console.log("打印了数据");
                  parent.color = "purple";  // 直接使用 Rectangle 的 id

                }
            }


            Text {
                anchors.centerIn: parent
                text: name
                color: "white"
                font.pointSize: 16
            }
        }

    }


}
