import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string name: "Demo 7 - State 和 Transition"

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

                // 示例1: 基础状态切换
                MyBasicState {
                    id: basicState
                }

                // 示例2: 颜色和位置过渡
                MyColorPositionTransition {
                    id: colorPositionTransition
                }

                // 示例3: 旋转和缩放动画
                MyRotationScale {
                    id: rotationScale
                }

                // 示例4: 多状态切换
                MyMultiState {
                    id: multiState
                }

                // 示例5: 交通信号灯
                MyTrafficLight {
                    id: trafficLight
                }

                // 示例6: 卡片翻转效果
                MyCardFlip {
                    id: cardFlip
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
