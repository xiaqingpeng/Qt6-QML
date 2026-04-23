import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string name: "Demo 6 - QML 常用基础控件"

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

                // 示例1: Button 按钮
                MyButton {
                    id: myButton
                }

                // 示例2: CheckBox 和 RadioButton
                MyCheckBox {
                    id: myCheckBox
                }

                // 示例3: Slider 和 ProgressBar
                MySliderAndProgressBar {
                    id: mySliderAndProgressBar
                }

                // 示例4: Switch 和 SpinBox
                MySwitchAndSpinBox {
                    id: mySwitchAndSpinBox
                }

                // 示例5: ComboBox 下拉框
                MyComboBox {
                    id: myComboBox
                }

                // 示例6: TextField 和 TextArea
                MyTextInput {
                    id: myTextInput
                }

                // 示例7: Label 和 ToolTip
                MyLabelAndToolTip {
                    id: myLabelAndToolTip
                }

                // 示例8: BusyIndicator 和 Dial
                MyBusyAndDial {
                    id: myBusyAndDial
                }

                // 示例9: Popup 弹出层
                MyPopup {
                    id: myPopup
                }

                // 示例10: Dialog 对话框
                MyDialog {
                    id: myDialog
                }

                // 示例11: Menu 弹出菜单
                MyMenu {
                    id: myMenu
                }

                // 示例12: Card 卡片布局
                MyCard {
                    id: myCard
                }

                // 底部间距
                Item { height: 20 }
            }
        }
    }
}
          