import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string name: "Demo 3 - 锚点布局示例"

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

                // 示例1: 三栏布局（顶部+左侧+中间）
                MyThreeColumnLayout {
                    id: threeColumnLayout
                }

                // 示例2: 居中布局
                MyCenterLayout {
                    id: centerLayout
                }

                // 示例3: 填充布局
                MyFillLayout {
                    id: fillLayout
                }

                // 示例4: 相对定位
                MyRelativeLayout {
                    id: relativeLayout
                }

                // 示例5: 顶部工具栏 + 内容区
                MyToolbarLayout {
                    id: toolbarLayout
                }

                // 示例6: 侧边栏布局
                MySidebarLayout {
                    id: sidebarLayout
                }

                // 示例7: 底部固定按钮
                MyBottomButtonLayout {
                    id: bottomButtonLayout
                }

                // 示例8: 网易云音乐三栏布局
                MyMusicLayout {
                    id: musicLayout
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
