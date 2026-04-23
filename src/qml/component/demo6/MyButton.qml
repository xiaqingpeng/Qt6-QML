import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    id: button
    width: parent.width
    height: 280
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1
    
    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        
        Text {
            text: "示例1: Button 按钮"
            font.pixelSize: 18
            font.bold: true
        }
        
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15
            
            Button {
                text: "普通按钮"
                onClicked: console.log("普通按钮被点击")
            }
            
            Button {
                text: "禁用按钮"
                enabled: false
            }
            
            Button {
                text: "高亮按钮"
                highlighted: true
                onClicked: console.log("高亮按钮")
            }
            
            Button {
                text: "扁平按钮"
                flat: true
                onClicked: console.log("扁平按钮")
            }
            
            Column {
                
                spacing: 10
                
                Text {
                    text: "RadioButton（单选）"
                    font.pixelSize: 14
                    font.bold: true
                }
                
                ButtonGroup {
                    id: radioGroup
                }
                
                RadioButton {
                    text: "选项 A"
                    checked: true
                    ButtonGroup.group: radioGroup
                    onCheckedChanged: if (checked)
                                          console.log("选择了 A")
                }
                
                RadioButton {
                    text: "选项 B"
                    ButtonGroup.group: radioGroup
                    onCheckedChanged: if (checked)
                                          console.log("选择了 B")
                }
                
                RadioButton {
                    text: "选项 C"
                    ButtonGroup.group: radioGroup
                    onCheckedChanged: if (checked)
                                          console.log("选择了 C")
                }
            }
            
            Column {
                
                spacing: 10
                
                DelayButton {
                    text: "延迟按钮 (长按2秒)"
                    delay: 2000
                    onActivated: {
                        console.log("延迟按钮被激活");
                    }
                }
                
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "长按按钮直到进度条填满才会触发"
                    font.pixelSize: 11
                    color: "#666666"
                }
            }
        }
    }
}
