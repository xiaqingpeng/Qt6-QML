import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    property string name: "Demo 4 - 输入框示例"

    Rectangle {
        anchors.fill: parent
        color: '#f5f5f5'

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 20
            clip: true

            ColumnLayout {
                width: scrollView.width - 40
                spacing: 30

                // 1. 基础搜索框
                MySearchField {
                    id: mySearchField
                    Layout.fillWidth: true
                }

                // 2. 密码输入框
                MyPasswordField {
                    id: myPasswordField
                    Layout.fillWidth: true
                }

                // 3. 数字输入框
                MyNumberField {
                    id: myNumberField
                    Layout.fillWidth: true
                }

                // 4. 邮箱输入框
                MyEmailField {
                    id: myEmailField
                    Layout.fillWidth: true
                }

                // 5. 只读输入框
                MyReadOnlyField {
                    id: myReadOnlyField
                    Layout.fillWidth: true
                }

                // 6. 字符长度限制
                MyLimitedField {
                    id: myLimitedField
                    Layout.fillWidth: true
                }

                // 7. 多行文本框
                MyTextAreaField {
                    id: myTextAreaField
                    Layout.fillWidth: true
                }

                // 8. 带清除按钮的输入框
                MyClearableField {
                    id: myClearableField
                    Layout.fillWidth: true
                }

                // 底部间距
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                }
            }
        }
    }
}
