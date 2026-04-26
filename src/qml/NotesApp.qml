import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import demo

// SQLite 笔记应用 - 美化版
Page {
    id: root
    title: "SQLite 笔记应用"

    // 主题色
    readonly property color primaryColor: "#6366f1"      // 靛蓝色
    readonly property color primaryLight: "#818cf8"
    readonly property color primaryDark: "#4f46e5"
    readonly property color accentColor: "#f59e0b"       // 琥珀色
    readonly property color backgroundColor: "#f8fafc"   // 浅灰背景
    readonly property color cardColor: "#ffffff"
    readonly property color textPrimary: "#1e293b"
    readonly property color textSecondary: "#64748b"
    readonly property color borderColor: "#e2e8f0"
    readonly property color hoverColor: "#f1f5f9"
    readonly property color selectedColor: "#eef2ff"

    background: Rectangle {
        color: backgroundColor
    }

    // 数据库实例
    NoteDatabase {
        id: noteDB
        Component.onCompleted: {
            if (noteDB.initDatabase()) {
                loadNotes()
            }
        }
        onDatabaseError: function(error) {
            errorDialog.text = error
            errorDialog.open()
        }
    }

    // 当前选中的笔记
    property int currentNoteId: -1
    property bool isEditing: false

    // 加载所有笔记
    function loadNotes() {
        var notes = noteDB.getAllNotes()
        notesModel.clear()
        for (var i = 0; i < notes.length; i++) {
            notesModel.append(notes[i])
        }
    }

    // 创建新笔记
    function createNewNote() {
        titleField.text = "新笔记"
        contentArea.text = ""
        currentNoteId = -1
        isEditing = true
        titleField.focus = true
    }

    // 保存笔记
    function saveNote() {
        if (titleField.text.trim() === "") {
            errorDialog.text = "标题不能为空"
            errorDialog.open()
            return
        }

        // 检查标题是否重复（创建新笔记时检查，更新时排除当前笔记）
        if (noteDB.isDuplicateNote(titleField.text, contentArea.text, currentNoteId)) {
            errorDialog.text = "已存在相同标题的笔记，请使用不同的标题"
            errorDialog.open()
            return
        }

        var success = false
        if (currentNoteId === -1) {
            // 创建新笔记
            success = noteDB.createNote(titleField.text, contentArea.text)
        } else {
            // 更新现有笔记
            success = noteDB.updateNote(currentNoteId, titleField.text, contentArea.text)
        }

        if (success) {
            loadNotes()
            isEditing = false
        }
    }

    // 编辑笔记
    function editNote(id) {
        var note = noteDB.getNoteById(id)
        if (note.id !== undefined) {
            currentNoteId = note.id
            titleField.text = note.title
            contentArea.text = note.content
            isEditing = true
        }
    }

    // 删除笔记
    function deleteCurrentNote() {
        if (currentNoteId !== -1) {
            if (noteDB.deleteNote(currentNoteId)) {
                loadNotes()
                createNewNote()
            }
        }
    }

    // 笔记数据模型
    ListModel {
        id: notesModel
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // 左侧：笔记列表
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 320
            color: cardColor
            
            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: "#10000000"
                shadowHorizontalOffset: 2
                shadowVerticalOffset: 0
                shadowBlur: 0.4
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                // 顶部工具栏
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 70
                    color: primaryColor
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        // 图标
                        Rectangle {
                            width: 40
                            height: 40
                            radius: 8
                            color: "white"
                            opacity: 0.2

                            Text {
                                anchors.centerIn: parent
                                text: "📝"
                                font.pixelSize: 24
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Label {
                                text: "我的笔记"
                                font.bold: true
                                font.pixelSize: 18
                                color: "white"
                            }

                            Label {
                                text: notesModel.count + " 条笔记"
                                font.pixelSize: 12
                                color: "white"
                                opacity: 0.8
                            }
                        }

                        // 新建按钮
                        Button {
                            Layout.preferredWidth: 44
                            Layout.preferredHeight: 44
                            
                            background: Rectangle {
                                radius: 8
                                color: parent.hovered ? "white" : "transparent"
                                opacity: parent.hovered ? 0.2 : 0.1
                                border.color: "white"
                                border.width: parent.hovered ? 2 : 1
                            }

                            contentItem: Text {
                                text: "+"
                                font.pixelSize: 28
                                font.bold: true
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: createNewNote()
                        }
                    }
                }

                // 搜索框
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    color: cardColor

                    TextField {
                        id: searchField
                        anchors.fill: parent
                        anchors.margins: 12
                        placeholderText: "🔍 搜索笔记..."
                        font.pixelSize: 14
                        
                        background: Rectangle {
                            radius: 8
                            color: backgroundColor
                            border.color: searchField.activeFocus ? primaryColor : borderColor
                            border.width: searchField.activeFocus ? 2 : 1
                        }

                        onTextChanged: {
                            if (text.trim() === "") {
                                loadNotes()
                            } else {
                                var notes = noteDB.searchNotes(text)
                                notesModel.clear()
                                for (var i = 0; i < notes.length; i++) {
                                    notesModel.append(notes[i])
                                }
                            }
                        }
                    }
                }

                // 笔记列表
                ListView {
                    id: notesListView
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    model: notesModel
                    spacing: 4

                    delegate: ItemDelegate {
                        width: notesListView.width
                        height: 100

                        background: Rectangle {
                            color: {
                                if (currentNoteId === model.id) return selectedColor
                                if (parent.hovered) return hoverColor
                                return "transparent"
                            }
                            
                            Rectangle {
                                anchors.left: parent.left
                                width: 4
                                height: parent.height
                                color: primaryColor
                                visible: currentNoteId === model.id
                            }

                            Behavior on color {
                                ColorAnimation { duration: 150 }
                            }
                        }

                        contentItem: ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 6

                            RowLayout {
                                Layout.fillWidth: true
                                spacing: 8

                                Label {
                                    Layout.fillWidth: true
                                    text: model.title
                                    font.bold: true
                                    font.pixelSize: 15
                                    elide: Text.ElideRight
                                    color: textPrimary
                                }

                                // 选中标记
                                Rectangle {
                                    width: 8
                                    height: 8
                                    radius: 4
                                    color: primaryColor
                                    visible: currentNoteId === model.id
                                }
                            }

                            Label {
                                Layout.fillWidth: true
                                text: model.content || "无内容"
                                font.pixelSize: 13
                                color: textSecondary
                                elide: Text.ElideRight
                                maximumLineCount: 2
                                wrapMode: Text.WordWrap
                            }

                            Label {
                                text: "📅 " + Qt.formatDateTime(new Date(model.updated_at), "MM-dd hh:mm")
                                font.pixelSize: 11
                                color: textSecondary
                                opacity: 0.7
                            }
                        }

                        onClicked: {
                            editNote(model.id)
                        }
                    }

                    ScrollBar.vertical: ScrollBar {
                        policy: ScrollBar.AsNeeded
                    }
                }
            }
        }

        // 右侧：笔记编辑区
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: backgroundColor

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                // 编辑工具栏
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 70
                    color: cardColor
                    visible: isEditing
                    
                    layer.enabled: true
                    layer.effect: MultiEffect {
                        shadowEnabled: true
                        shadowColor: "#08000000"
                        shadowVerticalOffset: 2
                        shadowBlur: 0.3
                    }

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        // 保存按钮
                        Button {
                            Layout.preferredHeight: 40
                            text: "💾 保存"
                            font.pixelSize: 14
                            font.bold: true

                            background: Rectangle {
                                radius: 8
                                color: parent.down ? primaryDark : (parent.hovered ? primaryLight : primaryColor)
                                
                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }
                            }

                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: saveNote()
                        }

                        // 取消按钮
                        Button {
                            Layout.preferredHeight: 40
                            text: "✖ 取消"
                            font.pixelSize: 14

                            background: Rectangle {
                                radius: 8
                                color: parent.down ? borderColor : (parent.hovered ? hoverColor : "transparent")
                                border.color: borderColor
                                border.width: 1
                                
                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }
                            }

                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: textSecondary
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: {
                                isEditing = false
                                if (currentNoteId !== -1) {
                                    editNote(currentNoteId)
                                } else {
                                    titleField.text = ""
                                    contentArea.text = ""
                                }
                            }
                        }

                        Item { Layout.fillWidth: true }

                        // 删除按钮
                        Button {
                            Layout.preferredHeight: 40
                            text: "🗑 删除"
                            font.pixelSize: 14
                            visible: currentNoteId !== -1

                            background: Rectangle {
                                radius: 8
                                color: parent.down ? "#dc2626" : (parent.hovered ? "#ef4444" : "transparent")
                                border.color: "#ef4444"
                                border.width: 1
                                
                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }
                            }

                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: parent.parent.hovered || parent.parent.down ? "white" : "#ef4444"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: deleteConfirmDialog.open()
                        }
                    }
                }

                // 编辑区容器
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 24
                        spacing: 16

                        // 标题输入
                        TextField {
                            id: titleField
                            Layout.fillWidth: true
                            placeholderText: "笔记标题"
                            font.pixelSize: 24
                            font.bold: true
                            readOnly: !isEditing
                            color: textPrimary
                            
                            background: Rectangle {
                                color: "transparent"
                                Rectangle {
                                    anchors.bottom: parent.bottom
                                    width: parent.width
                                    height: 2
                                    color: titleField.activeFocus ? primaryColor : borderColor
                                    
                                    Behavior on color {
                                        ColorAnimation { duration: 200 }
                                    }
                                }
                            }
                        }

                        // 内容编辑区
                        ScrollView {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            clip: true

                            TextArea {
                                id: contentArea
                                placeholderText: isEditing ? "✍️ 开始写笔记..." : "选择一个笔记或创建新笔记"
                                wrapMode: TextEdit.Wrap
                                selectByMouse: true
                                font.pixelSize: 15
                                font.family: "SF Pro Text, Segoe UI, sans-serif"
                                readOnly: !isEditing
                                color: textPrimary
                                
                                background: Rectangle {
                                    color: isEditing ? cardColor : "transparent"
                                    radius: 8
                                    border.color: contentArea.activeFocus ? primaryColor : (isEditing ? borderColor : "transparent")
                                    border.width: 1
                                    
                                    Behavior on border.color {
                                        ColorAnimation { duration: 200 }
                                    }
                                }
                            }
                        }

                        // 底部信息栏
                        Rectangle {
                            Layout.fillWidth: true
                            height: 40
                            color: hoverColor
                            radius: 8
                            visible: isEditing

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 16

                                Label {
                                    text: "📊 字数: " + contentArea.text.length
                                    font.pixelSize: 13
                                    color: textSecondary
                                }

                                Rectangle {
                                    width: 1
                                    height: 16
                                    color: borderColor
                                }

                                Label {
                                    text: "⏱ 行数: " + contentArea.lineCount
                                    font.pixelSize: 13
                                    color: textSecondary
                                }

                                Item { Layout.fillWidth: true }

                                Label {
                                    text: isEditing ? "✏️ 编辑中" : "👁 查看"
                                    font.pixelSize: 13
                                    color: primaryColor
                                    font.bold: true
                                }
                            }
                        }
                    }

                    // 空状态提示
                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 16
                        visible: !isEditing && currentNoteId === -1

                        Text {
                            text: "📝"
                            font.pixelSize: 64
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Label {
                            text: "还没有笔记"
                            font.pixelSize: 20
                            font.bold: true
                            color: textPrimary
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Label {
                            text: "点击左上角 + 按钮创建第一条笔记"
                            font.pixelSize: 14
                            color: textSecondary
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
            }
        }
    }

    // 错误对话框
    Dialog {
        id: errorDialog
        title: "⚠️ 提示"
        property alias text: errorLabel.text
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 400
        height: contentItem.implicitHeight + header.height + footer.height + 40
        modal: true
        closePolicy: Popup.CloseOnEscape

        background: Rectangle {
            color: cardColor
            radius: 16
            border.color: borderColor
            border.width: 1
            
            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: "#30000000"
                shadowBlur: 1.0
                shadowVerticalOffset: 4
            }
        }

        header: Rectangle {
            id: errorHeader
            width: parent.width
            height: 60
            color: "#fef3c7"
            radius: 16
            
            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 16
                color: parent.color
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 12

                Text {
                    text: "⚠️"
                    font.pixelSize: 28
                }

                Label {
                    text: "提示"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#92400e"
                    Layout.fillWidth: true
                }
            }
        }

        contentItem: Item {
            implicitHeight: errorLabel.implicitHeight + 40

            Label {
                id: errorLabel
                anchors.fill: parent
                anchors.margins: 20
                wrapMode: Text.WordWrap
                font.pixelSize: 15
                color: textPrimary
                verticalAlignment: Text.AlignVCenter
            }
        }

        footer: Rectangle {
            id: errorFooter
            width: parent.width
            height: 70
            color: "transparent"

            Button {
                anchors.centerIn: parent
                width: 120
                height: 44
                text: "确定"
                font.pixelSize: 15
                font.bold: true

                background: Rectangle {
                    radius: 10
                    color: parent.down ? primaryDark : (parent.hovered ? primaryLight : primaryColor)
                    
                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }

                contentItem: Text {
                    text: parent.text
                    font: parent.font
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: errorDialog.close()
            }
        }
    }

    // 删除确认对话框
    Dialog {
        id: deleteConfirmDialog
        title: "🗑 确认删除"
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 420
        height: contentItem.implicitHeight + header.height + footer.height + 40
        modal: true
        closePolicy: Popup.CloseOnEscape

        background: Rectangle {
            color: cardColor
            radius: 16
            border.color: borderColor
            border.width: 1
            
            layer.enabled: true
            layer.effect: MultiEffect {
                shadowEnabled: true
                shadowColor: "#30000000"
                shadowBlur: 1.0
                shadowVerticalOffset: 4
            }
        }

        header: Rectangle {
            id: deleteHeader
            width: parent.width
            height: 60
            color: "#fee2e2"
            radius: 16
            
            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 16
                color: parent.color
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 12

                Text {
                    text: "🗑"
                    font.pixelSize: 28
                }

                Label {
                    text: "确认删除"
                    font.pixelSize: 18
                    font.bold: true
                    color: "#991b1b"
                    Layout.fillWidth: true
                }
            }
        }

        contentItem: Item {
            implicitHeight: deleteContent.implicitHeight + 40

            ColumnLayout {
                id: deleteContent
                anchors.fill: parent
                anchors.margins: 20
                spacing: 12

                Label {
                    Layout.fillWidth: true
                    text: "确定要删除这条笔记吗？"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 15
                    font.bold: true
                    color: textPrimary
                }

                Label {
                    Layout.fillWidth: true
                    text: "⚠️ 此操作无法撤销，笔记将永久删除。"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 13
                    color: textSecondary
                }
            }
        }

        footer: Rectangle {
            id: deleteFooter
            width: parent.width
            height: 80
            color: "transparent"

            RowLayout {
                anchors.centerIn: parent
                spacing: 12

                // 取消按钮
                Button {
                    width: 120
                    height: 44
                    text: "取消"
                    font.pixelSize: 15

                    background: Rectangle {
                        radius: 10
                        color: parent.down ? hoverColor : (parent.hovered ? hoverColor : backgroundColor)
                        border.color: borderColor
                        border.width: 1
                        
                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }

                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        color: textSecondary
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: deleteConfirmDialog.close()
                }

                // 删除按钮
                Button {
                    width: 120
                    height: 44
                    text: "删除"
                    font.pixelSize: 15
                    font.bold: true

                    background: Rectangle {
                        radius: 10
                        color: parent.down ? "#b91c1c" : (parent.hovered ? "#dc2626" : "#ef4444")
                        
                        Behavior on color {
                            ColorAnimation { duration: 150 }
                        }
                    }

                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: {
                        deleteConfirmDialog.close()
                        deleteCurrentNote()
                    }
                }
            }
        }
    }
}
