pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// QML 动画示例集合
Page {
    id: root
    title: "QML 动画示例"

    background: Rectangle {
        color: "#f5f5f5"
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        contentWidth: availableWidth

        ColumnLayout {
            width: root.width - 40
            anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined
            spacing: 20

            Item { Layout.preferredHeight: 20 } // 顶部间距

            // 标题
            Label {
                text: "QML 动画示例"
                font.pixelSize: 28
                font.bold: true
                color: "#333333"
            }

            // 1. PropertyAnimation - 属性动画
            GroupBox {
                Layout.fillWidth: true
                title: "1. PropertyAnimation - 属性动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击方块触发位置和颜色动画"
                        color: "#666666"
                    }

                    Rectangle {
                        id: propAnimContainer
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: propAnimRect
                            width: 80
                            height: 80
                            color: "#4CAF50"
                            radius: 8
                            x: 20
                            y: 35

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    propAnim.start()
                                }
                            }

                            PropertyAnimation {
                                id: propAnim
                                target: propAnimRect
                                properties: "x,color"
                                to: propAnimRect.x === 20 ? propAnimContainer.width - 100 : 20
                                duration: 1000
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }
            }

            // 2. NumberAnimation - 数字动画
            GroupBox {
                Layout.fillWidth: true
                title: "2. NumberAnimation - 数字动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击按钮触发旋转动画"
                        color: "#666666"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: rotateRect
                            width: 80
                            height: 80
                            color: "#2196F3"
                            radius: 8
                            anchors.centerIn: parent

                            Text {
                                anchors.centerIn: parent
                                text: "🔄"
                                font.pixelSize: 40
                            }

                            NumberAnimation {
                                id: rotateAnim
                                target: rotateRect
                                property: "rotation"
                                from: 0
                                to: 360
                                duration: 1000
                                easing.type: Easing.InOutCubic
                            }
                        }
                    }

                    Button {
                        text: "旋转"
                        onClicked: rotateAnim.start()
                    }
                }
            }

            // 3. ColorAnimation - 颜色动画
            GroupBox {
                Layout.fillWidth: true
                title: "3. ColorAnimation - 颜色动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击方块触发颜色渐变"
                        color: "#666666"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: colorRect
                            width: 120
                            height: 120
                            color: "#FF5722"
                            radius: 60
                            anchors.centerIn: parent

                            MouseArea {
                                anchors.fill: parent
                                onClicked: colorAnim.start()
                            }

                            ColorAnimation {
                                id: colorAnim
                                target: colorRect
                                property: "color"
                                from: "#FF5722"
                                to: "#9C27B0"
                                duration: 1500
                            }
                        }
                    }
                }
            }

            // 4. SequentialAnimation - 顺序动画
            GroupBox {
                Layout.fillWidth: true
                title: "4. SequentialAnimation - 顺序动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击按钮触发一系列连续动画"
                        color: "#666666"
                    }

                    Rectangle {
                        id: seqContainer
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: seqRect
                            width: 60
                            height: 60
                            color: "#FF9800"
                            radius: 8
                            x: 20
                            y: 45
                        }

                        SequentialAnimation {
                            id: seqAnim
                            NumberAnimation {
                                target: seqRect
                                property: "x"
                                to: seqContainer.width - 80
                                duration: 800
                                easing.type: Easing.InOutQuad
                            }
                            NumberAnimation {
                                target: seqRect
                                property: "y"
                                to: 5
                                duration: 400
                            }
                            NumberAnimation {
                                target: seqRect
                                property: "x"
                                to: 20
                                duration: 800
                                easing.type: Easing.InOutQuad
                            }
                            NumberAnimation {
                                target: seqRect
                                property: "y"
                                to: 45
                                duration: 400
                            }
                        }
                    }

                    Button {
                        text: "开始顺序动画"
                        onClicked: seqAnim.start()
                    }
                }
            }

            // 5. ParallelAnimation - 并行动画
            GroupBox {
                Layout.fillWidth: true
                title: "5. ParallelAnimation - 并行动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "同时执行多个动画"
                        color: "#666666"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: paraRect
                            width: 80
                            height: 80
                            color: "#00BCD4"
                            radius: 8
                            anchors.centerIn: parent
                            scale: 1
                            opacity: 1
                        }

                        ParallelAnimation {
                            id: paraAnim
                            NumberAnimation {
                                target: paraRect
                                property: "scale"
                                to: 1.5
                                duration: 1000
                                easing.type: Easing.OutElastic
                            }
                            NumberAnimation {
                                target: paraRect
                                property: "rotation"
                                to: 360
                                duration: 1000
                            }
                            NumberAnimation {
                                target: paraRect
                                property: "opacity"
                                to: 0.3
                                duration: 1000
                            }
                            onFinished: {
                                paraRect.scale = 1
                                paraRect.rotation = 0
                                paraRect.opacity = 1
                            }
                        }
                    }

                    Button {
                        text: "开始并行动画"
                        onClicked: paraAnim.start()
                    }
                }
            }

            // 6. Behavior - 行为动画
            GroupBox {
                Layout.fillWidth: true
                title: "6. Behavior - 行为动画（自动触发）"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "拖动滑块，方块会平滑移动"
                        color: "#666666"
                    }

                    Rectangle {
                        id: behaviorContainer
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: behaviorRect
                            width: 60
                            height: 60
                            color: "#E91E63"
                            radius: 30
                            x: behaviorSlider.value
                            y: 45

                            Behavior on x {
                                NumberAnimation {
                                    duration: 500
                                    easing.type: Easing.OutBounce
                                }
                            }
                        }
                    }

                    Slider {
                        id: behaviorSlider
                        Layout.fillWidth: true
                        from: 20
                        to: behaviorContainer.width - 100
                        value: 20
                    }
                }
            }

            // 7. SpringAnimation - 弹簧动画
            GroupBox {
                Layout.fillWidth: true
                title: "7. SpringAnimation - 弹簧动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击方块触发弹性动画"
                        color: "#666666"
                    }

                    Rectangle {
                        id: springContainer
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: springRect
                            width: 80
                            height: 80
                            color: "#8BC34A"
                            radius: 40
                            x: 20
                            y: 35

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    springRect.x = springRect.x === 20 ? springContainer.width - 100 : 20
                                }
                            }

                            Behavior on x {
                                SpringAnimation {
                                    spring: 2
                                    damping: 0.2
                                    epsilon: 0.25
                                }
                            }
                        }
                    }
                }
            }

            // 8. PathAnimation - 路径动画
            GroupBox {
                Layout.fillWidth: true
                title: "8. PathAnimation - 路径动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击按钮沿路径移动"
                        color: "#666666"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        color: "#e0e0e0"
                        radius: 8

                        // 显示路径
                        Canvas {
                            anchors.fill: parent
                            onPaint: {
                                var ctx = getContext("2d")
                                ctx.strokeStyle = "#999999"
                                ctx.lineWidth = 2
                                ctx.setLineDash([5, 5])
                                ctx.beginPath()
                                ctx.moveTo(50, 100)
                                ctx.bezierCurveTo(150, 20, 250, 180, 350, 100)
                                ctx.stroke()
                            }
                        }

                        Rectangle {
                            id: pathRect
                            width: 40
                            height: 40
                            color: "#FF5722"
                            radius: 20
                            x: 30
                            y: 80
                        }

                        PathAnimation {
                            id: pathAnim
                            target: pathRect
                            duration: 2000
                            easing.type: Easing.InOutQuad

                            path: Path {
                                startX: 50
                                startY: 100
                                PathCubic {
                                    x: 350
                                    y: 100
                                    control1X: 150
                                    control1Y: 20
                                    control2X: 250
                                    control2Y: 180
                                }
                            }
                        }
                    }

                    Button {
                        text: "沿路径移动"
                        onClicked: pathAnim.start()
                    }
                }
            }

            // 9. PauseAnimation - 暂停动画
            GroupBox {
                Layout.fillWidth: true
                title: "9. PauseAnimation - 暂停动画"

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "动画中间会暂停 1 秒"
                        color: "#666666"
                    }

                    Rectangle {
                        id: pauseContainer
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Rectangle {
                            id: pauseRect
                            width: 60
                            height: 60
                            color: "#673AB7"
                            radius: 8
                            x: 20
                            y: 45
                        }

                        SequentialAnimation {
                            id: pauseAnim
                            NumberAnimation {
                                target: pauseRect
                                property: "x"
                                to: pauseContainer.width / 2 - 30
                                duration: 800
                            }
                            PauseAnimation {
                                duration: 1000
                            }
                            NumberAnimation {
                                target: pauseRect
                                property: "x"
                                to: pauseContainer.width - 80
                                duration: 800
                            }
                        }
                    }

                    Button {
                        text: "开始（中间暂停）"
                        onClicked: pauseAnim.start()
                    }
                }
            }

            // 10. 组合动画示例
            GroupBox {
                id: loadingBox
                Layout.fillWidth: true
                title: "10. 综合示例 - 加载动画"

                property bool isAnimating: false

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15

                    Label {
                        text: "点击按钮查看加载动画效果"
                        color: "#666666"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        color: "#e0e0e0"
                        radius: 8

                        Row {
                            anchors.centerIn: parent
                            spacing: 15

                            Repeater {
                                model: 5
                                delegate: Rectangle {
                                    id: dotRect
                                    required property int index
                                    width: 20
                                    height: 20
                                    radius: 10
                                    color: "#3F51B5"
                                    
                                    SequentialAnimation on y {
                                        running: loadingBox.isAnimating
                                        loops: Animation.Infinite
                                        NumberAnimation {
                                            from: 0
                                            to: -30
                                            duration: 400
                                            easing.type: Easing.OutQuad
                                        }
                                        NumberAnimation {
                                            from: -30
                                            to: 0
                                            duration: 400
                                            easing.type: Easing.InQuad
                                        }
                                        PauseAnimation {
                                            duration: dotRect.index * 100
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Button {
                        text: loadingBox.isAnimating ? "停止" : "开始"
                        onClicked: {
                            loadingBox.isAnimating = !loadingBox.isAnimating
                        }
                    }
                }
            }

            Item { Layout.preferredHeight: 20 }
        }
    }
}
