import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string name: "Demo 5 - 鼠标键盘事件"

    Rectangle {
        anchors.fill: parent
        color: '#f5f5f5'

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 10
            clip: true

            Column {
                width: scrollView.width - 20
                spacing: 30

                // 示例1: 鼠标点击事件
                MyClickEvent {
                    id: myClickEvent
                }

                // 示例2: 鼠标悬停和按下
                MyHoverAndPress {
                    id: myHoverAndPress
                }

                // 示例3: 鼠标拖拽
                MyDragEvent {
                    id: myDragEvent
                }

                // 示例4: 键盘事件
                MyKeyboardEvent {
                    id: myKeyboardEvent
                }

                // 示例5: 鼠标滚轮事件
                MyWheelEvent {
                    id: myWheelEvent
                }

                // 示例6: 组合事件
                MyComboEvent {
                    id: myComboEvent
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
