import QtQuick
import QtQuick.Controls
import QtMultimedia

Rectangle {
    id: root
    color: "#1a1a1f"
    
    // 音频设备管理
    MediaDevices {
        id: mediaDevices
    }
    
    // 音频播放器
    MediaPlayer {
        id: player
        
        audioOutput: AudioOutput {
            id: audioOutput
            device: mediaDevices.defaultAudioOutput
            volume: 1.0
            muted: audioPlayer.isMuted
        }
        
        source: "qrc:/qt/qml/demo/audio/sample1.mp3"
        
        onPlaybackStateChanged: {
            console.log("播放状态变化:", playbackState)
            if (playbackState === MediaPlayer.PlayingState) {
                audioPlayer.isPlaying = true
            } else if (playbackState === MediaPlayer.PausedState) {
                audioPlayer.isPlaying = false
            } else if (playbackState === MediaPlayer.StoppedState) {
                if (audioPlayer.isPlaying) {
                    retryTimer.start()
                } else {
                    audioPlayer.isPlaying = false
                }
            }
        }
        
        onPositionChanged: {
            if (duration > 0) {
                audioPlayer.progress = position / duration
                audioPlayer.currentPosition = Math.floor(position / 1000)
            }
        }
        
        onDurationChanged: {
            if (duration > 0) {
                audioPlayer.duration = Math.floor(duration / 1000)
                console.log("音频时长:", audioPlayer.duration, "秒")
            }
        }
        
        onMediaStatusChanged: {
            console.log("媒体状态:", mediaStatus)
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                audioPlayer.nextSong()
            } else if (mediaStatus === MediaPlayer.InvalidMedia) {
                console.error("❌ 无效的媒体文件")
                statusText.text = "错误：无效的媒体文件"
            } else if (mediaStatus === MediaPlayer.LoadedMedia) {
                console.log("✅ 媒体加载成功")
                statusText.text = "就绪"
            } else if (mediaStatus === MediaPlayer.LoadingMedia) {
                statusText.text = "加载中..."
            } else if (mediaStatus === MediaPlayer.StalledMedia) {
                if (audioPlayer.isPlaying || player.playbackState === MediaPlayer.PlayingState) {
                    Qt.callLater(function() {
                        if (player.mediaStatus === MediaPlayer.StalledMedia) {
                            player.play()
                        }
                    })
                }
            }
        }
        
        onErrorOccurred: function(error, errorString) {
            console.error("❌ 播放器错误:", error, "-", errorString)
            statusText.text = "错误: " + errorString
        }
        
        Component.onCompleted: {
            console.log("播放器初始化完成")
            console.log("音频源:", source)
            console.log("默认音频输出设备:", mediaDevices.defaultAudioOutput)
        }
    }
    
    // 重试定时器
    Timer {
        id: retryTimer
        interval: 100
        repeat: false
        onTriggered: {
            if (player.playbackState === MediaPlayer.StoppedState) {
                console.log("重试播放...")
                player.play()
            }
        }
    }
    
    // 背景渐变效果
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1a1a1f" }
            GradientStop { position: 0.5; color: "#252530" }
            GradientStop { position: 1.0; color: "#1a1a1f" }
        }
    }
    
    // 主内容区域 - 使用 ScrollView 支持小屏幕
    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        clip: true
        
        Column {
            width: Math.min(parent.width, 900)
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 0
            topPadding: 40
            bottomPadding: 40
            
            // 标题区域
            Item {
                width: parent.width
                height: 80
                
                Column {
                    anchors.centerIn: parent
                    spacing: 8
                    
                    Text {
                        text: "🎵 音频播放器"
                        font.pixelSize: 32
                        font.bold: true
                        color: "#ffffff"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    
                    Text {
                        id: statusText
                        text: "就绪"
                        font.pixelSize: 14
                        color: "#888888"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
            
            // 主播放器卡片
            Rectangle {
                width: parent.width - 40
                anchors.horizontalCenter: parent.horizontalCenter
                height: Math.max(500, playerContent.implicitHeight + 60)
                color: "#2a2a35"
                radius: 20
                
                // 卡片阴影效果
                layer.enabled: true
                layer.effect: ShaderEffect {
                    property color shadowColor: "#000000"
                }
                
                Column {
                    id: playerContent
                    anchors.centerIn: parent
                    spacing: 30
                    width: parent.width - 60
                    
                    // 专辑封面区域
                    Item {
                        width: parent.width
                        height: 240
                        
                        Rectangle {
                            id: albumCover
                            width: 220
                            height: 220
                            radius: 110
                            anchors.centerIn: parent
                            color: "#3d3d4a"
                            
                            // 旋转动画
                            rotation: audioPlayer.isPlaying ? rotationAnimation.currentRotation : 0
                            
                            Behavior on rotation {
                                enabled: !audioPlayer.isPlaying
                                RotationAnimation {
                                    duration: 500
                                    direction: RotationAnimation.Shortest
                                }
                            }
                            
                            NumberAnimation {
                                id: rotationAnimation
                                target: rotationAnimation
                                property: "currentRotation"
                                from: 0
                                to: 360
                                duration: 10000
                                loops: Animation.Infinite
                                running: audioPlayer.isPlaying
                                property real currentRotation: 0
                            }
                            
                            // 渐变背景
                            Rectangle {
                                anchors.fill: parent
                                radius: parent.radius
                                gradient: Gradient {
                                    GradientStop { position: 0.0; color: "#ec4141" }
                                    GradientStop { position: 1.0; color: "#8b2a2a" }
                                }
                                opacity: 0.3
                            }
                            
                            Text {
                                text: "🎵"
                                font.pixelSize: 90
                                anchors.centerIn: parent
                            }
                            
                            // 外圈装饰
                            Rectangle {
                                anchors.fill: parent
                                radius: parent.radius
                                color: "transparent"
                                border.color: "#ec4141"
                                border.width: 3
                                opacity: audioPlayer.isPlaying ? 0.6 : 0.3
                                
                                Behavior on opacity {
                                    NumberAnimation { duration: 300 }
                                }
                            }
                        }
                        
                        // 播放状态指示器
                        Rectangle {
                            width: 50
                            height: 50
                            radius: 25
                            color: "#ec4141"
                            anchors.right: albumCover.right
                            anchors.bottom: albumCover.bottom
                            anchors.rightMargin: 10
                            anchors.bottomMargin: 10
                            
                            Text {
                                text: audioPlayer.isPlaying ? "⏸" : "▶"
                                font.pixelSize: 24
                                color: "#ffffff"
                                anchors.centerIn: parent
                            }
                        }
                    }
                    
                    // 歌曲信息
                    Column {
                        width: parent.width
                        spacing: 10
                        
                        Text {
                            text: audioPlayer.songName
                            font.pixelSize: 26
                            font.bold: true
                            color: "#ffffff"
                            anchors.horizontalCenter: parent.horizontalCenter
                            elide: Text.ElideRight
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                        }
                        
                        Text {
                            text: audioPlayer.artistName
                            font.pixelSize: 16
                            color: "#aaaaaa"
                            anchors.horizontalCenter: parent.horizontalCenter
                            elide: Text.ElideRight
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                        }
                        
                        // 当前播放速度显示
                        Rectangle {
                            width: speedText.width + 20
                            height: 28
                            radius: 14
                            color: "#3d3d4a"
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: audioPlayer.currentPlaybackRate !== 1.0
                            
                            Text {
                                id: speedText
                                text: "⚡ " + audioPlayer.currentPlaybackRate + "x"
                                font.pixelSize: 13
                                font.bold: true
                                color: "#ec4141"
                                anchors.centerIn: parent
                            }
                        }
                    }
                    
                    // 进度条区域
                    Column {
                        width: parent.width
                        spacing: 12
                        
                        Slider {
                            id: progressSlider
                            width: parent.width
                            from: 0
                            to: 1
                            value: audioPlayer.progress
                            
                            onMoved: {
                                audioPlayer.seek(value)
                            }
                            
                            background: Rectangle {
                                x: progressSlider.leftPadding
                                y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2
                                width: progressSlider.availableWidth
                                height: 6
                                radius: 3
                                color: "#3d3d4a"
                                
                                Rectangle {
                                    width: progressSlider.visualPosition * parent.width
                                    height: parent.height
                                    radius: 3
                                    gradient: Gradient {
                                        orientation: Gradient.Horizontal
                                        GradientStop { position: 0.0; color: "#ec4141" }
                                        GradientStop { position: 1.0; color: "#ff6b6b" }
                                    }
                                }
                            }
                            
                            handle: Rectangle {
                                x: progressSlider.leftPadding + progressSlider.visualPosition * (progressSlider.availableWidth - width)
                                y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2
                                width: 18
                                height: 18
                                radius: 9
                                color: "#ffffff"
                                border.color: "#ec4141"
                                border.width: 3
                                
                                scale: progressSlider.pressed ? 1.2 : 1.0
                                
                                Behavior on scale {
                                    NumberAnimation { duration: 150 }
                                }
                            }
                        }
                        
                        // 时间显示
                        Row {
                            width: parent.width
                            
                            Text {
                                text: audioPlayer.formatTime(audioPlayer.currentPosition)
                                font.pixelSize: 13
                                color: "#aaaaaa"
                                font.family: "Menlo, Monaco, monospace"
                            }
                            
                            Item {
                                width: parent.width - 100
                                height: 1
                            }
                            
                            Text {
                                text: audioPlayer.formatTime(audioPlayer.duration)
                                font.pixelSize: 13
                                color: "#aaaaaa"
                                font.family: "Menlo, Monaco, monospace"
                            }
                        }
                    }
                    
                    // 播放速度控制面板
                    Column {
                        width: parent.width
                        spacing: 12
                        
                        // 标题和当前速度
                        Row {
                            width: parent.width
                            
                            Text {
                                text: "⚡ 播放速度"
                                font.pixelSize: 14
                                color: "#aaaaaa"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            
                            Item {
                                width: parent.width - 200
                                height: 1
                            }
                            
                            Text {
                                text: audioPlayer.currentPlaybackRate.toFixed(2) + "x"
                                font.pixelSize: 16
                                font.bold: true
                                color: "#ec4141"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        
                        // 速度滑块
                        Slider {
                            id: speedSlider
                            width: parent.width
                            from: 0
                            to: audioPlayer.playbackRates.length - 1
                            stepSize: 1
                            value: audioPlayer.currentRateIndex
                            snapMode: Slider.SnapAlways
                            
                            onMoved: {
                                audioPlayer.setPlaybackRate(Math.round(value))
                            }
                            
                            background: Rectangle {
                                x: speedSlider.leftPadding
                                y: speedSlider.topPadding + speedSlider.availableHeight / 2 - height / 2
                                width: speedSlider.availableWidth
                                height: 4
                                radius: 2
                                color: "#3d3d4a"
                                
                                // 刻度标记
                                Repeater {
                                    model: audioPlayer.playbackRates.length
                                    
                                    Rectangle {
                                        required property int index
                                        x: (speedSlider.availableWidth / (audioPlayer.playbackRates.length - 1)) * index - 2
                                        y: -2
                                        width: 4
                                        height: 8
                                        radius: 2
                                        color: index === audioPlayer.currentRateIndex ? "#ec4141" : "#4d4d5a"
                                        
                                        Behavior on color {
                                            ColorAnimation { duration: 200 }
                                        }
                                    }
                                }
                                
                                Rectangle {
                                    width: speedSlider.visualPosition * parent.width
                                    height: parent.height
                                    radius: 2
                                    color: "#ec4141"
                                }
                            }
                            
                            handle: Rectangle {
                                x: speedSlider.leftPadding + speedSlider.visualPosition * (speedSlider.availableWidth - width)
                                y: speedSlider.topPadding + speedSlider.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: "#ffffff"
                                border.color: "#ec4141"
                                border.width: 3
                                
                                scale: speedSlider.pressed ? 1.3 : 1.0
                                
                                Behavior on scale {
                                    NumberAnimation { duration: 150 }
                                }
                                
                                Text {
                                    text: "⚡"
                                    font.pixelSize: 10
                                    anchors.centerIn: parent
                                }
                            }
                        }
                        
                        // 速度预设按钮
                        Row {
                            spacing: 8
                            anchors.horizontalCenter: parent.horizontalCenter
                            
                            Repeater {
                                model: audioPlayer.playbackRates
                                
                                Button {
                                    required property real modelData
                                    required property int index
                                    
                                    width: 50
                                    height: 30
                                    text: modelData + "x"
                                    
                                    background: Rectangle {
                                        color: audioPlayer.currentRateIndex === index ? "#ec4141" : (parent.pressed ? "#3d3d4a" : "transparent")
                                        radius: 15
                                        border.color: audioPlayer.currentRateIndex === index ? "#ec4141" : "#4d4d5a"
                                        border.width: 1.5
                                        
                                        Behavior on color {
                                            ColorAnimation { duration: 200 }
                                        }
                                        
                                        Behavior on border.color {
                                            ColorAnimation { duration: 200 }
                                        }
                                    }
                                    
                                    contentItem: Text {
                                        text: parent.text
                                        font.pixelSize: 11
                                        font.bold: audioPlayer.currentRateIndex === index
                                        color: audioPlayer.currentRateIndex === index ? "#ffffff" : "#aaaaaa"
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        
                                        Behavior on color {
                                            ColorAnimation { duration: 200 }
                                        }
                                    }
                                    
                                    onClicked: audioPlayer.setPlaybackRate(index)
                                    
                                    scale: pressed ? 0.9 : 1.0
                                    Behavior on scale {
                                        NumberAnimation { duration: 100 }
                                    }
                                }
                            }
                        }
                    }
                    
                    // 控制按钮
                    Row {
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        // 上一首
                        Button {
                            width: 55
                            height: 55
                            text: "⏮"
                            font.pixelSize: 22
                            
                            background: Rectangle {
                                color: parent.pressed ? "#3d3d4a" : "#2a2a35"
                                radius: 27.5
                                border.color: "#4d4d5a"
                                border.width: 2
                                
                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }
                            }
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            onClicked: audioPlayer.previousSong()
                            
                            scale: pressed ? 0.95 : 1.0
                            Behavior on scale {
                                NumberAnimation { duration: 100 }
                            }
                        }
                        
                        // 播放/暂停
                        Button {
                            width: 70
                            height: 70
                            text: audioPlayer.isPlaying ? "⏸" : "▶"
                            font.pixelSize: 32
                            
                            background: Rectangle {
                                radius: 35
                                gradient: Gradient {
                                    GradientStop { position: 0.0; color: parent.pressed ? "#d63838" : "#ec4141" }
                                    GradientStop { position: 1.0; color: parent.pressed ? "#b82e2e" : "#d63838" }
                                }
                                
                                Behavior on gradient {
                                    PropertyAnimation { duration: 150 }
                                }
                                
                                // 发光效果
                                Rectangle {
                                    anchors.fill: parent
                                    radius: parent.radius
                                    color: "#ec4141"
                                    opacity: 0.3
                                    scale: 1.1
                                    z: -1
                                }
                            }
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            onClicked: audioPlayer.togglePlayPause()
                            
                            scale: pressed ? 0.95 : 1.0
                            Behavior on scale {
                                NumberAnimation { duration: 100 }
                            }
                        }
                        
                        // 下一首
                        Button {
                            width: 55
                            height: 55
                            text: "⏭"
                            font.pixelSize: 22
                            
                            background: Rectangle {
                                color: parent.pressed ? "#3d3d4a" : "#2a2a35"
                                radius: 27.5
                                border.color: "#4d4d5a"
                                border.width: 2
                                
                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }
                            }
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            onClicked: audioPlayer.nextSong()
                            
                            scale: pressed ? 0.95 : 1.0
                            Behavior on scale {
                                NumberAnimation { duration: 100 }
                            }
                        }
                        
                        // 静音
                        Button {
                            width: 55
                            height: 55
                            text: audioPlayer.isMuted ? "🔇" : "🔊"
                            font.pixelSize: 20
                            
                            background: Rectangle {
                                color: parent.pressed ? "#3d3d4a" : "#2a2a35"
                                radius: 27.5
                                border.color: audioPlayer.isMuted ? "#ec4141" : "#4d4d5a"
                                border.width: 2
                                
                                Behavior on color {
                                    ColorAnimation { duration: 150 }
                                }
                                
                                Behavior on border.color {
                                    ColorAnimation { duration: 150 }
                                }
                            }
                            
                            contentItem: Text {
                                text: parent.text
                                font: parent.font
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            
                            onClicked: audioPlayer.toggleMute()
                            
                            scale: pressed ? 0.95 : 1.0
                            Behavior on scale {
                                NumberAnimation { duration: 100 }
                            }
                        }
                    }
                }
            }
            
            // 间距
            Item {
                width: parent.width
                height: 30
            }
            
            // 播放列表卡片
            Rectangle {
                width: parent.width - 40
                anchors.horizontalCenter: parent.horizontalCenter
                height: 280
                color: "#2a2a35"
                radius: 20
                
                Column {
                    anchors.fill: parent
                    anchors.margins: 25
                    spacing: 15
                    
                    Row {
                        width: parent.width
                        spacing: 10
                        
                        Text {
                            text: "📋"
                            font.pixelSize: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        Text {
                            text: "播放列表"
                            font.pixelSize: 20
                            font.bold: true
                            color: "#ffffff"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        
                        Item {
                            width: parent.width - 150
                            height: 1
                        }
                        
                        Text {
                            text: audioPlayer.playlist.count + " 首歌曲"
                            font.pixelSize: 14
                            color: "#888888"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                    
                    ListView {
                        width: parent.width
                        height: parent.height - 40
                        clip: true
                        spacing: 5
                        
                        model: audioPlayer.playlist
                        
                        delegate: Rectangle {
                            width: ListView.view.width
                            height: 60
                            color: index === audioPlayer.currentIndex ? "#3d3d4a" : "transparent"
                            radius: 10
                            
                            Behavior on color {
                                ColorAnimation { duration: 200 }
                            }
                            
                            // 悬停效果
                            Rectangle {
                                anchors.fill: parent
                                radius: parent.radius
                                color: "#3d3d4a"
                                opacity: mouseArea.containsMouse && index !== audioPlayer.currentIndex ? 0.5 : 0
                                
                                Behavior on opacity {
                                    NumberAnimation { duration: 150 }
                                }
                            }
                            
                            Row {
                                anchors.fill: parent
                                anchors.leftMargin: 15
                                anchors.rightMargin: 15
                                spacing: 15
                                
                                // 序号或播放图标
                                Rectangle {
                                    width: 35
                                    height: 35
                                    radius: 17.5
                                    color: index === audioPlayer.currentIndex ? "#ec4141" : "#3d3d4a"
                                    anchors.verticalCenter: parent.verticalCenter
                                    
                                    Behavior on color {
                                        ColorAnimation { duration: 200 }
                                    }
                                    
                                    Text {
                                        text: index === audioPlayer.currentIndex && audioPlayer.isPlaying ? "▶" : (index + 1)
                                        font.pixelSize: index === audioPlayer.currentIndex && audioPlayer.isPlaying ? 14 : 16
                                        font.bold: true
                                        color: "#ffffff"
                                        anchors.centerIn: parent
                                    }
                                }
                                
                                Column {
                                    anchors.verticalCenter: parent.verticalCenter
                                    spacing: 4
                                    width: parent.width - 60
                                    
                                    Text {
                                        text: model.songName
                                        font.pixelSize: 16
                                        color: index === audioPlayer.currentIndex ? "#ec4141" : "#ffffff"
                                        font.bold: index === audioPlayer.currentIndex
                                        elide: Text.ElideRight
                                        width: parent.width
                                        
                                        Behavior on color {
                                            ColorAnimation { duration: 200 }
                                        }
                                    }
                                    
                                    Text {
                                        text: model.artistName
                                        font.pixelSize: 13
                                        color: "#888888"
                                        elide: Text.ElideRight
                                        width: parent.width
                                    }
                                }
                            }
                            
                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true
                                onClicked: audioPlayer.loadSong(index)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 音频播放器逻辑
    QtObject {
        id: audioPlayer
        
        property bool isPlaying: false
        property real progress: 0.0
        property bool isMuted: false
        property int currentIndex: 0
        property int currentPosition: 0
        property int duration: 0
        
        property string songName: "栖息地"
        property string artistName: "Mikey-18 / 暴躁的兔子"
        
        // 播放速度相关
        property var playbackRates: [0.5, 0.75, 1.0, 1.25, 1.5, 2.0]
        property int currentRateIndex: 2  // 默认 1.0x
        property real currentPlaybackRate: 1.0
        
        property ListModel playlist: ListModel {
            ListElement {
                songName: "栖息地"
                artistName: "Mikey-18 / 暴躁的兔子"
                source: "qrc:/qt/qml/demo/audio/sample1.mp3"
            }
            ListElement {
                songName: "示例歌曲 2"
                artistName: "示例艺术家"
                source: "qrc:/qt/qml/demo/audio/sample1.mp3"
            }
            ListElement {
                songName: "示例歌曲 3"
                artistName: "示例艺术家"
                source: "qrc:/qt/qml/demo/audio/sample1.mp3"
            }
        }
        
        function togglePlayPause() {
            console.log("切换播放/暂停，当前状态:", isPlaying)
            if (isPlaying) {
                player.pause()
            } else {
                audioOutput.device = mediaDevices.defaultAudioOutput
                audioOutput.volume = 1.0
                player.play()
            }
        }
        
        function nextSong() {
            currentIndex = (currentIndex + 1) % playlist.count
            loadSong(currentIndex)
        }
        
        function previousSong() {
            currentIndex = (currentIndex - 1 + playlist.count) % playlist.count
            loadSong(currentIndex)
        }
        
        function loadSong(index) {
            if (index >= 0 && index < playlist.count) {
                console.log("加载歌曲:", index)
                currentIndex = index
                var song = playlist.get(index)
                songName = song.songName
                artistName = song.artistName
                
                player.stop()
                player.source = song.source
                console.log("新音频源:", player.source)
                
                progress = 0
                currentPosition = 0
                
                Qt.callLater(function() {
                    player.play()
                })
            }
        }
        
        function seek(position) {
            if (player.duration > 0) {
                player.position = position * player.duration
            }
        }
        
        function toggleMute() {
            isMuted = !isMuted
        }
        
        function setPlaybackRate(index) {
            if (index >= 0 && index < playbackRates.length) {
                currentRateIndex = index
                currentPlaybackRate = playbackRates[index]
                player.playbackRate = currentPlaybackRate
                console.log("播放速度设置为:", currentPlaybackRate + "x")
            }
        }
        
        function formatTime(seconds) {
            var mins = Math.floor(seconds / 60)
            var secs = seconds % 60
            return mins + ":" + (secs < 10 ? "0" : "") + secs
        }
    }
}
