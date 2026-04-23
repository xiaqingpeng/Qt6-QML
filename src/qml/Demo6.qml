import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

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

                // 示例2: CheckBox
                Rectangle {
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

                // 示例3: Slider 和 ProgressBar
                Rectangle {
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

                // 示例4: Switch 和 SpinBox
                Rectangle {
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

                // 示例6: TextField 和 TextArea
                Rectangle {
                    width: parent.width
                    height: 350
                    color: '#ffffff'
                    radius: 10
                    border.color: '#e0e0e0'
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 15

                        Text {
                            text: "示例6: TextField 和 TextArea"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Column {
                            width: parent.width
                            spacing: 15

                            TextField {
                                width: parent.width
                                placeholderText: "普通输入框"
                                onTextChanged: console.log("输入:", text)
                            }

                            TextField {
                                width: parent.width
                                placeholderText: "密码输入框"
                                echoMode: TextInput.Password
                            }

                            TextField {
                                width: parent.width
                                placeholderText: "只读输入框"
                                text: "不可编辑"
                                readOnly: true
                            }

                            TextArea {
                                width: parent.width
                                height: 100
                                placeholderText: "多行文本输入框..."
                                wrapMode: TextArea.Wrap
                            }
                        }
                    }
                }

                // 示例7: Label 和 ToolTip
                Rectangle {
                    width: parent.width
                    height: 220
                    color: '#ffffff'
                    radius: 10
                    border.color: '#e0e0e0'
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 20

                        Text {
                            text: "示例7: Label 和 ToolTip"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Column {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 20

                            Label {
                                text: "这是一个 Label 标签"
                                font.pixelSize: 14
                            }

                            Label {
                                text: "粗体 Label"
                                font.pixelSize: 14
                                font.bold: true
                            }

                            Label {
                                text: "彩色 Label"
                                font.pixelSize: 14
                                color: "#e74c3c"
                            }

                            Button {
                                text: "悬停显示提示"
                                ToolTip.visible: hovered
                                ToolTip.text: "这是一个工具提示\n可以显示多行文本"
                                ToolTip.delay: 500
                            }
                        }
                    }
                }

                // 示例8: BusyIndicator 和 Dial
                Rectangle {
                    width: parent.width
                    height: 220
                    color: '#ffffff'
                    radius: 10
                    border.color: '#e0e0e0'
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 20

                        Text {
                            text: "示例8: BusyIndicator 和 Dial"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 50

                            Column {
                                spacing: 10

                                BusyIndicator {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    running: true
                                }

                                Text {
                                    text: "加载中..."
                                    font.pixelSize: 12
                                    color: "#666666"
                                }
                            }

                            Column {
                                spacing: 10

                                Dial {
                                    id: dial
                                    from: 0
                                    to: 100
                                    value: 30
                                    onValueChanged: console.log("Dial值:", value)
                                }

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "旋钮: " + Math.round(dial.value)
                                    font.pixelSize: 12
                                    color: "#666666"
                                }
                            }
                        }
                    }
                }

                // 示例9: Popup 弹出层
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
                            text: "示例9: Popup 弹出层"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 15

                            Button {
                                text: "打开 Popup"
                                onClicked: popup.open()
                            }

                            Button {
                                text: "底部 Popup"
                                onClicked: bottomPopup.open()
                            }

                            Button {
                                text: "模态 Popup"
                                onClicked: modalPopup.open()
                            }
                        }
                    }

                    Popup {
                        id: popup
                        x: (parent.width - width) / 2
                        y: (parent.height - height) / 2
                        width: 300
                        height: 200
                        modal: false
                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

                        Rectangle {
                            anchors.fill: parent
                            color: '#ffffff'
                            border.color: '#3498db'
                            border.width: 2
                            radius: 8

                            Column {
                                anchors.centerIn: parent
                                spacing: 20

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "这是一个 Popup"
                                    font.pixelSize: 16
                                    font.bold: true
                                }

                                Text {
                                    text: "点击外部或按 ESC 关闭"
                                    font.pixelSize: 12
                                    color: "#666666"
                                }

                                Button {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "关闭"
                                    onClicked: popup.close()
                                }
                            }
                        }
                    }

                    Popup {
                        id: bottomPopup
                        x: (parent.width - width) / 2
                        y: parent.height - height - 20
                        width: 250
                        height: 150
                        modal: false

                        Rectangle {
                            anchors.fill: parent
                            color: '#2ecc71'
                            radius: 8

                            Column {
                                anchors.centerIn: parent
                                spacing: 15

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "底部弹出"
                                    font.pixelSize: 14
                                    color: "white"
                                    font.bold: true
                                }

                                Button {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "关闭"
                                    onClicked: bottomPopup.close()
                                }
                            }
                        }
                    }

                    Popup {
                        id: modalPopup
                        anchors.centerIn: parent
                        width: 300
                        height: 200
                        modal: true
                        dim: true
                        closePolicy: Popup.CloseOnEscape

                        Rectangle {
                            anchors.fill: parent
                            color: '#ffffff'
                            border.color: '#e74c3c'
                            border.width: 2
                            radius: 8

                            Column {
                                anchors.centerIn: parent
                                spacing: 20

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "模态弹出层"
                                    font.pixelSize: 16
                                    font.bold: true
                                    color: '#e74c3c'
                                }

                                Text {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "背景变暗，必须关闭才能操作"
                                    font.pixelSize: 12
                                    color: "#666666"
                                }

                                Button {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: "关闭"
                                    highlighted: true
                                    onClicked: modalPopup.close()
                                }
                            }
                        }
                    }
                }

                // 示例10: Dialog 对话框
                Rectangle {
                    width: parent.width
                    height: 320
                    color: '#ffffff'
                    radius: 10
                    border.color: '#e0e0e0'
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 20

                        Text {
                            text: "示例10: Dialog 对话框"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Column {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 15

                            Row {
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 15

                                Button {
                                    text: "确认对话框"
                                    onClicked: confirmDialog.open()
                                }

                                Button {
                                    text: "信息对话框"
                                    onClicked: infoDialog.open()
                                }

                                Button {
                                    text: "自定义对话框"
                                    onClicked: customDialog.open()
                                }
                            }

                            Row {
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 15

                                Button {
                                    text: "文件选择"
                                    onClicked: fileDialog.open()
                                }

                                Button {
                                    text: "多选文件"
                                    onClicked: multiFileDialog.open()
                                }

                                Button {
                                    text: "文件夹选择"
                                    onClicked: folderDialog.open()
                                }

                                Button {
                                    text: "颜色选择"
                                    onClicked: colorDialog.open()
                                }

                                Rectangle {
                                    width: 50
                                    height: 40
                                    color: colorDialog.selectedColor
                                    border.color: "#cccccc"
                                    border.width: 1
                                    radius: 4
                                }
                            }

                            Row {
                                anchors.horizontalCenter: parent.horizontalCenter
                                spacing: 15

                                Button {
                                    text: "字体选择"
                                    onClicked: fontDialog.open()
                                }

                                Button {
                                    text: "消息对话框"
                                    onClicked: messageDialog.open()
                                }

                                Text {
                                    width: 60
                                    height: 40
                                    text: "字体"
                                    font: fontDialog.selectedFont
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                }
                            }
                        }
                    }

                    Dialog {
                        id: confirmDialog
                        anchors.centerIn: parent
                        title: "确认操作"
                        modal: true
                        standardButtons: Dialog.Ok | Dialog.Cancel

                        Label {
                            text: "确定要执行此操作吗？"
                        }

                        onAccepted: console.log("用户点击了确定")
                        onRejected: console.log("用户点击了取消")
                    }

                    Dialog {
                        id: infoDialog
                        anchors.centerIn: parent
                        title: "提示信息"
                        modal: true
                        standardButtons: Dialog.Close

                        Column {
                            spacing: 10

                            Label {
                                text: "这是一条重要信息"
                                font.bold: true
                            }

                            Label {
                                text: "Dialog 提供标准化的对话框样式"
                                color: "#666666"
                            }
                        }
                    }

                    Dialog {
                        id: customDialog
                        anchors.centerIn: parent
                        title: "用户登录"
                        modal: true
                        standardButtons: Dialog.Ok | Dialog.Cancel

                        Column {
                            spacing: 15
                            width: 250

                            TextField {
                                id: usernameField
                                width: parent.width
                                placeholderText: "用户名"
                            }

                            TextField {
                                id: passwordField
                                width: parent.width
                                placeholderText: "密码"
                                echoMode: TextInput.Password
                            }
                        }

                        onAccepted: {
                            console.log("登录:", usernameField.text);
                            usernameField.text = "";
                            passwordField.text = "";
                        }
                    }

                    // 文件选择对话框（单选）
                    FileDialog {
                        id: fileDialog
                        title: "请选择文件"
                        fileMode: FileDialog.OpenFile
                        nameFilters: ["图片文件 (*.png *.jpg *.jpeg)", "所有文件 (*)"]
                        onAccepted: {
                            console.log("选择的文件:", fileDialog.selectedFile);
                        }
                        onRejected: {
                            console.log("取消选择文件");
                        }
                    }

                    // 文件选择对话框（多选）
                    FileDialog {
                        id: multiFileDialog
                        title: "请选择多个文件"
                        fileMode: FileDialog.OpenFiles
                        nameFilters: ["图片文件 (*.png *.jpg *.jpeg)", "文本文件 (*.txt)", "所有文件 (*)"]
                        onAccepted: {
                            console.log("选择的文件数量:", multiFileDialog.selectedFiles, multiFileDialog.selectedFiles.length);
                            for (var i = 0; i < multiFileDialog.selectedFiles.length; i++) {
                                console.log("文件" + (i + 1) + ":", multiFileDialog.selectedFiles[i]);
                            }
                        }
                        onRejected: {
                            console.log("取消选择文件");
                        }
                    }

                    // 文件夹选择对话框
                    FolderDialog {
                        id: folderDialog
                        title: "请选择文件夹"
                        onAccepted: {
                            console.log("选择的文件夹:", folderDialog.selectedFolder);
                        }
                        onRejected: {
                            console.log("取消选择文件夹");
                        }
                    }

                    // 颜色选择对话框
                    ColorDialog {
                        id: colorDialog
                        title: "请选择颜色"
                        onAccepted: {
                            console.log("选择的颜色:", colorDialog.selectedColor);
                        }
                        onRejected: {
                            console.log("取消选择颜色");
                        }
                    }

                    // 字体选择对话框
                    FontDialog {
                        id: fontDialog
                        title: "请选择字体"
                        onAccepted: {
                            console.log("选择的字体:", fontDialog.selectedFont.family, "大小:", fontDialog.selectedFont.pointSize);
                        }
                        onRejected: {
                            console.log("取消选择字体");
                        }
                    }

                    // 消息对话框
                    MessageDialog {
                        id: messageDialog
                        title: "系统提示"
                        text: "这是一个消息对话框"
                        informativeText: "MessageDialog 用于显示简单的提示信息，支持多种按钮组合。"
                        buttons: MessageDialog.Ok | MessageDialog.Cancel
                        onAccepted: console.log("MessageDialog: 点击了确定")
                        onRejected: console.log("MessageDialog: 点击了取消")
                    }
                }

                // 示例11: Menu 弹出菜单
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
                            text: "示例11: Menu 弹出菜单"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 15

                            Button {
                                text: "右键菜单"
                                onClicked: contextMenu.popup()
                            }

                            Button {
                                text: "文件菜单"
                                onClicked: fileMenu.popup()
                            }

                            Button {
                                id: menuButton
                                text: "编辑菜单"
                                onClicked: editMenu.open()
                            }
                        }
                    }

                    Menu {
                        id: contextMenu

                        MenuItem {
                            text: "复制"
                            onTriggered: console.log("复制")
                        }
                        MenuItem {
                            text: "粘贴"
                            onTriggered: console.log("粘贴")
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "删除"
                            onTriggered: console.log("删除")
                        }
                    }

                    Menu {
                        id: fileMenu

                        MenuItem {
                            text: "新建"
                            onTriggered: console.log("新建文件")
                        }
                        MenuItem {
                            text: "打开"
                            onTriggered: console.log("打开文件")
                        }
                        MenuItem {
                            text: "保存"
                            onTriggered: console.log("保存文件")
                        }
                        MenuSeparator {}
                        MenuItem {
                            text: "退出"
                            onTriggered: console.log("退出应用")
                        }
                    }

                    Menu {
                        id: editMenu
                        x: menuButton.x
                        y: menuButton.y + menuButton.height

                        MenuItem {
                            text: "撤销"
                            enabled: false
                        }
                        MenuItem {
                            text: "重做"
                            enabled: false
                        }
                        MenuSeparator {}
                        Menu {
                            title: "更多选项"
                            MenuItem {
                                text: "选项 1"
                                onTriggered: console.log("选项 1")
                            }
                            MenuItem {
                                text: "选项 2"
                                onTriggered: console.log("选项 2")
                            }
                        }
                    }
                }

                // 示例12: Card 卡片（自定义组件）
                Rectangle {
                    width: parent.width
                    height: 400
                    color: '#ffffff'
                    radius: 10
                    border.color: '#e0e0e0'
                    border.width: 1

                    Column {
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 20

                        Text {
                            text: "示例12: Card 卡片布局"
                            font.pixelSize: 18
                            font.bold: true
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 20

                            // Card 1
                            Rectangle {
                                width: 180
                                height: 250
                                color: '#ffffff'
                                radius: 8
                                border.color: '#e0e0e0'
                                border.width: 1

                                Column {
                                    anchors.fill: parent
                                    anchors.margins: 15
                                    spacing: 10

                                    Rectangle {
                                        width: parent.width
                                        height: 100
                                        color: '#3498db'
                                        radius: 5

                                        Text {
                                            anchors.centerIn: parent
                                            text: "图片区域"
                                            color: "white"
                                            font.pixelSize: 14
                                        }
                                    }

                                    Text {
                                        text: "卡片标题"
                                        font.pixelSize: 16
                                        font.bold: true
                                    }

                                    Text {
                                        text: "这是卡片的描述内容，可以显示更多信息。"
                                        font.pixelSize: 12
                                        color: "#666666"
                                        wrapMode: Text.WordWrap
                                        width: parent.width
                                    }

                                    Button {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        text: "查看详情"
                                        flat: true
                                        onClicked: console.log("卡片1点击")
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.border.color = '#3498db'
                                    onExited: parent.border.color = '#e0e0e0'
                                    onClicked: {} // 防止穿透
                                }
                            }

                            // Card 2
                            Rectangle {
                                width: 180
                                height: 250
                                color: '#ffffff'
                                radius: 8
                                border.color: '#e0e0e0'
                                border.width: 1

                                Column {
                                    anchors.fill: parent
                                    anchors.margins: 15
                                    spacing: 10

                                    Rectangle {
                                        width: parent.width
                                        height: 100
                                        color: '#e74c3c'
                                        radius: 5

                                        Text {
                                            anchors.centerIn: parent
                                            text: "封面"
                                            color: "white"
                                            font.pixelSize: 14
                                        }
                                    }

                                    Text {
                                        text: "产品卡片"
                                        font.pixelSize: 16
                                        font.bold: true
                                    }

                                    Text {
                                        text: "价格: ¥99.00"
                                        font.pixelSize: 14
                                        color: "#e74c3c"
                                        font.bold: true
                                    }

                                    Button {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        text: "立即购买"
                                        highlighted: true
                                        onClicked: console.log("卡片2点击")
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.border.color = '#e74c3c'
                                    onExited: parent.border.color = '#e0e0e0'
                                    onClicked: {}
                                }
                            }

                            // Card 3
                            Rectangle {
                                width: 180
                                height: 250
                                color: '#ffffff'
                                radius: 8
                                border.color: '#e0e0e0'
                                border.width: 1

                                Column {
                                    anchors.fill: parent
                                    anchors.margins: 15
                                    spacing: 10

                                    Rectangle {
                                        width: parent.width
                                        height: 100
                                        color: '#2ecc71'
                                        radius: 5

                                        Text {
                                            anchors.centerIn: parent
                                            text: "缩略图"
                                            color: "white"
                                            font.pixelSize: 14
                                        }
                                    }

                                    Text {
                                        text: "用户卡片"
                                        font.pixelSize: 16
                                        font.bold: true
                                    }

                                    Text {
                                        text: "在线状态: 活跃"
                                        font.pixelSize: 12
                                        color: "#2ecc71"
                                    }

                                    Button {
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        text: "关注"
                                        onClicked: console.log("卡片3点击")
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.border.color = '#2ecc71'
                                    onExited: parent.border.color = '#e0e0e0'
                                    onClicked: {}
                                }
                            }
                        }
                    }
                }

                // 底部间距
                Item {
                    height: 20
                }
            }
        }
    }
}
