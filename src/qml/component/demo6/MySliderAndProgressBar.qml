import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Rectangle {
    id:sliderandprogressBar
    width: parent.width
    height: 300
    color: '#ffffff'
    radius: 10
    border.color: '#e0e0e0'
    border.width: 1
    
    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        
        Text {
            text: "示例3: Slider 和 ProgressBar"
            font.pixelSize: 18
            font.bold: true
        }
        
        Column {
            width: parent.width
            spacing: 30
            
            Column {
                width: parent.width
                spacing: 10
                
                Text {
                    text: "Slider 滑块: " + slider1.value.toFixed(1)
                    font.pixelSize: 14
                }
                
                Slider {
                    id: slider1
                    width: parent.width
                    from: 0
                    to: 100
                    value: 50
                    onValueChanged: console.log("Slider值:", value)
                }
            }
            
            Column {
                width: parent.width
                spacing: 10
                
                Text {
                    text: "步进 Slider: " + slider2.value
                    font.pixelSize: 14
                }
                
                Slider {
                    id: slider2
                    width: parent.width
                    from: 0
                    to: 10
                    stepSize: 1
                    value: 5
                    snapMode: Slider.SnapAlways
                }
            }
            
            Column {
                width: parent.width
                spacing: 10
                
                Text {
                    text: "ProgressBar 进度条: " + Math.round(slider1.value) + "%"
                    font.pixelSize: 14
                }
                
                ProgressBar {
                    width: parent.width
                    from: 0
                    to: 100
                    value: slider1.value
                }
            }
        }
    }
}
