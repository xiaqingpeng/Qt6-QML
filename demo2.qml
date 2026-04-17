import QtQuick

Item {
    id: root

    property string name: "QML Global Object"

    Row {
        anchors.centerIn: parent

        Rectangle {
            id: page1
            width: 200
            height: 200
            color: 'pink'

            border.color: "cyan"
            border.width: 2
            radius: 100
            
            MouseArea {
                id: mouseArea1
                anchors.fill: parent

                onClicked: {
                    console.log("打印了数据")
                    parent.color = "black"
                }
            }

            Text {
                anchors.centerIn: parent
                color: Qt.rgba(1, 0, 0, 1)
                text: Qt.md5("hello, world")
                font.pointSize: 6
            }
        }

        Rectangle {
            id: page2
            width: 200
            height: 200
            color: 'pink'

            border.color: "cyan"
            border.width: 2
            radius: 100
            
            MouseArea {
                id: mouseArea2
                anchors.fill: parent

                onClicked: {
                    console.log("打印当前平台", Qt.platform.os)
                    Qt.quit()
                }
            }

            Text {
                anchors.centerIn: parent
                color: Qt.rgba(1, 0, 0, 1)
                text: Qt.md5("hello, world")
                font.pointSize: 6
            }
        }
    }
}
