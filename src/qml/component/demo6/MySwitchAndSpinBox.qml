import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    id:switchAndSpinBox
    width: parent.width
    height: 250
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1
    
    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        
        Text {
            text: "示例4: Switch 和 SpinBox"
            font.pixelSize: 18
            font.bold: true
        }
        
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 50
            
            Column {
                spacing: 15
                
                Row {
                    spacing: 10
                    
                    Switch {
                        id: switch1
                        checked: true
                        onCheckedChanged: console.log("开关1:", checked)
                    }
                    
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: switch1.checked ? "开启" : "关闭"
                        font.pixelSize: 14
                    }
                }
                
                Row {
                    spacing: 10
                    
                    Switch {
                        id: switch2
                        onCheckedChanged: console.log("开关2:", checked)
                    }
                    
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "通知"
                        font.pixelSize: 14
                    }
                }
                
                Row {
                    spacing: 10
                    
                    Switch {
                        enabled: false
                    }
                    
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "禁用开关"
                        font.pixelSize: 14
                        color: "#999999"
                    }
                }
            }
            
            Column {
                spacing: 15
                
                Text {
                    text: "SpinBox 数字输入"
                    font.pixelSize: 14
                    font.bold: true
                }
                
                SpinBox {
                    id: spinBox1
                    from: 0
                    to: 100
                    value: 50
                    onValueChanged: console.log("SpinBox值:", value)
                }
                
                SpinBox {
                    from: 0
                    to: 10
                    stepSize: 2
                    value: 4
                }
            }
        }
    }
}
