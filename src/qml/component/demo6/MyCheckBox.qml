import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    id: checkBox
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
            text: "示例2: CheckBox"
            font.pixelSize: 18
            font.bold: true
        }
        
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50
            
            Column {
                spacing: 10
                
                Text {
                    text: "CheckBox（多选）"
                    font.pixelSize: 14
                    font.bold: true
                }
                
                CheckBox {
                    text: "选项 1"
                    checked: true
                    onCheckedChanged: console.log("选项1:", checked)
                }
                
                CheckBox {
                    text: "选项 2"
                    onCheckedChanged: console.log("选项2:", checked)
                }
                
                CheckBox {
                    text: "选项 3"
                    onCheckedChanged: console.log("选项3:", checked)
                }
                
                CheckBox {
                    text: "禁用选项"
                    enabled: false
                }
            }
        }
    }
}
