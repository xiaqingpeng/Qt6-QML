import QtQuick
import QtQuick.Controls

// 示例5: ComboBox 下拉框
Rectangle {
    width: parent.width
    height: 180
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "示例5: ComboBox 下拉框"
            font.pixelSize: 18
            font.bold: true
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 30

            Column {
                spacing: 10

                Text {
                    text: "基础下拉框"
                    font.pixelSize: 14
                }

                ComboBox {
                    id: comboBox1
                    width: 200
                    model: ["选项 1", "选项 2", "选项 3", "选项 4"]
                    onCurrentIndexChanged: console.log("选择:", currentText)
                }
            }

            Column {
                spacing: 10

                Text {
                    text: "可编辑下拉框"
                    font.pixelSize: 14
                }

                ComboBox {
                    width: 200
                    editable: true
                    model: ["北京", "上海", "广州", "深圳"]
                    onAccepted: console.log("输入:", editText)
                }
            }

            Column {
                spacing: 10

                Text {
                    text: "当前选择: " + comboBox1.currentText
                    font.pixelSize: 12
                    color: "#666666"
                }

                Text {
                    text: "索引: " + comboBox1.currentIndex
                    font.pixelSize: 12
                    color: "#666666"
                }
            }
        }
    }
}
