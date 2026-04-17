import QtQuick

Item {
    id: root

    property string name: "Demo 5 示例"

    Rectangle {
        id: main
        anchors.fill: parent
        color: '#cccccc'

        // 左上角
        Rectangle {
            id: leftTopRectangle
            width: 200
            height: parent.height / 10
            anchors.left: parent.left
            anchors.top: parent.top
            color: '#0665d0'
            opacity:0.8
            
            Text {
                anchors.centerIn: parent
                text: "左上"
                color: "white"
                font.pixelSize: 20
            }
        }

        // 左下角
        Rectangle {
            id: leftBottomRectangle
            width: 200
            anchors.top: leftTopRectangle.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            color: 'white'
            
            Text {
                anchors.centerIn: parent
                text: "左下"
                color: "black"
                font.pixelSize: 20
            }
        }

        // 右上角
        Rectangle {
            id: rightTopRectangle
            height: parent.height / 10
            anchors.left: leftTopRectangle.right
            anchors.right: parent.right
            anchors.top: parent.top
            color: '#0665d0'
            
            Text {
                anchors.centerIn: parent
                text: "右上"
                color: "white"
                font.pixelSize: 20
            }
        }

        // 右下角
        Rectangle {
            id: rightBottomRectangle
            anchors.top: rightTopRectangle.bottom
            anchors.bottom: parent.bottom
            anchors.left: leftBottomRectangle.right
            anchors.right: parent.right
            color: '#ffffff'
            opacity: 0.8
            
            Text {
                anchors.centerIn: parent
                text: "右下"
                color: "black"
                font.pixelSize: 20
            }
        }
    }
}
