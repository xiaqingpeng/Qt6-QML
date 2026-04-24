# QML Examples 示例集合

这是一个 Qt6 QML 项目，包含多个实用的 QML 示例，展示了 QML 的各种特性和最佳实践。

## ✨ 最新更新 v2.1.0

🎵 **全新音频播放器示例！**
- 完整的音频播放功能（播放/暂停/切换/进度控制）
- ⚡ **播放速度控制**（0.5x - 2.0x 倍速播放）
- 现代化深色主题 UI 设计
- 平滑的动画效果和交互体验
- 完善的播放列表管理

## 项目特点

- 🎯 **动态路由系统** - 类似前端 Umi 框架的约定式路由，自动生成导航菜单
- 📱 **响应式布局** - 所有示例都支持自适应布局
- 🎨 **现代化 UI** - 使用 Qt Quick Controls 2 构建美观的界面
- 📚 **丰富示例** - 涵盖基础交互、布局、输入控件、状态转换、多媒体等常用场景
- 🔧 **组件化设计** - 每个示例都拆分为独立的可复用组件
- 🎵 **多媒体支持** - 集成 Qt Multimedia，支持音频播放和速度控制 🆕

## 项目结构

```
.
├── Main.qml                          # 主入口，动态路由系统
├── src/qml/
│   ├── ExamplesConfig.qml           # 示例配置文件（路由配置）
│   ├── InteractionBasics.qml        # 基础交互 & Qt 对象 & Connections
│   ├── BackendIntegration.qml       # Backend & DataModel 示例
│   ├── AnchorLayouts.qml            # 锚点布局示例
│   ├── InputFields.qml              # 输入框示例
│   ├── MouseKeyboardEvents.qml      # 鼠标键盘事件示例
│   ├── BasicControls.qml            # QML 常用基础控件
│   ├── StateTransitions.qml         # State 和 Transition 示例
│   ├── AudioPlayer.qml              # 音频播放器示例 🆕
│   └── component/                   # 组件文件夹（40+ 可复用组件）
│       ├── AnchorLayouts/           # 锚点布局组件（8个）
│       ├── InputFields/             # 输入框组件（8个）
│       ├── MouseKeyboardEvents/     # 事件处理组件（6个）
│       ├── BasicControls/           # 基础控件组件（12个）
│       └── StateTransitions/        # 状态转换组件（6个）
├── audio/                           # 音频资源文件夹 🆕
│   ├── sample1.mp3                  # 示例音频文件（2.1MB）
│   └── README.md                    # 音频文件说明
├── Backend.h/cpp                    # C++ 后端类
├── DataModel.h/cpp                  # 数据模型类
├── main.cpp                         # 应用程序入口
├── report.png                       # 示例图片
├── audio.qrc                        # 音频资源配置 🆕
└── CMakeLists.txt                   # CMake 构建配置
```

## 示例列表

### InteractionBasics - 基础交互 & Qt 对象 & Connections
使用 TabBar 组织的三合一示例：

**Tab 1: 基础交互**
- 按钮点击计数器
- 文本显示与更新
- 图片加载与状态监听
- 基础属性绑定

**Tab 2: Qt 全局对象**
- Qt.quit() 退出应用
- Qt.platform 平台信息
- Qt.formatDateTime() 日期格式化
- 其他 Qt 全局 API

**Tab 3: Connections 信号劫持**
- Connections 组件使用
- 信号槽机制
- 动态信号连接

### BackendIntegration - Backend & DataModel
- QML 与 C++ 交互
- 自定义 C++ 类暴露给 QML
- 数据模型绑定
- 调用 C++ 方法并获取返回值

### AnchorLayouts - 锚点布局示例
包含 8 个实用布局模式：

**示例 1: 三栏布局（顶部+左侧+中间）**
- 顶部导航栏（固定高度 60px）
- 左侧菜单（固定宽度 180px）
- 中间内容区（自适应）

**示例 2: 居中布局**
- centerIn - 完全居中
- horizontalCenter - 水平居中
- verticalCenter - 垂直居中

**示例 3: 填充布局**
- anchors.fill 填充父元素
- anchors.margins 设置边距

**示例 4: 相对定位**
- 元素之间相互定位
- 参考元素 + 左右上下相对布局

**示例 5: 顶部工具栏 + 内容区**
- 固定高度顶部工具栏
- 自适应内容区域

**示例 6: 侧边栏布局**
- 固定宽度左侧边栏（120px）
- 自适应主内容区

**示例 7: 底部固定按钮**
- 自适应滚动内容区
- 底部固定操作按钮

**示例 8: 网易云音乐三栏布局**
- 左侧导航栏（180px）
- 中间内容区（自适应）
- 底部播放器（70px）

### InputFields - 输入框示例
包含 8 种常用输入控件：
1. 基础搜索框 - 带焦点高亮
2. 密码输入框 - echoMode 隐藏输入
3. 数字输入框 - validator 验证
4. 邮箱输入框 - 输入提示
5. 只读输入框 - readOnly
6. 字符长度限制 - maximumLength
7. 多行文本框 - TextArea
8. 带清除按钮的输入框

### MouseKeyboardEvents - 鼠标键盘事件
包含 6 个交互示例：

**示例 1: 点击事件**
- 单击计数器
- 双击计数器

**示例 2: 悬停和按压**
- containsMouse 悬停状态
- pressed 按压状态
- 带动画效果

**示例 3: 拖拽**
- 可拖动的矩形
- 实时显示位置坐标

**示例 4: 键盘事件**
- 方向键控制移动
- Enter 键确认
- ESC 键重置

**示例 5: 鼠标滚轮**
- 滚轮缩放效果
- 实时显示缩放比例

**示例 6: 组合事件**
- 点击 + 拖拽 + 悬停
- 综合交互演示

### BasicControls - QML 常用基础控件
包含 12 个控件示例：

**示例 1: Button 按钮**
- 普通按钮、禁用按钮
- 高亮按钮、扁平按钮

**示例 2: CheckBox 和 RadioButton**
- CheckBox 多选框
- RadioButton 单选按钮组
- ButtonGroup 分组管理

**示例 3: Slider 和 ProgressBar**
- 连续滑块
- 步进滑块（snapMode）
- 进度条绑定

**示例 4: Switch 和 SpinBox**
- Switch 开关控件
- SpinBox 数字输入框
- 步进值设置

**示例 5: ComboBox 下拉框**
- 基础下拉框
- 可编辑下拉框
- 当前选择显示

**示例 6: TextField 和 TextArea**
- 普通文本输入
- 密码输入框
- 只读输入框
- 多行文本区域

**示例 7: Label 和 ToolTip**
- 不同样式的 Label
- 悬停提示（ToolTip）
- 延迟显示设置

**示例 8: BusyIndicator 和 Dial**
- 加载指示器
- 旋钮控件

**示例 9: Popup 弹出层**
- 普通 Popup
- 底部 Popup
- 模态 Popup（背景变暗）

**示例 10: Dialog 对话框**
- 确认对话框（Ok/Cancel）
- 信息对话框（Close）
- 自定义对话框（登录表单）

**示例 11: Menu 弹出菜单**
- 右键菜单
- 文件菜单
- 编辑菜单（带子菜单）
- MenuSeparator 分隔线

**示例 12: Card 卡片布局**
- 信息卡片
- 产品卡片
- 用户卡片
- 悬停边框高亮效果

### StateTransitions - State 和 Transition
包含 6 个状态转换示例：

**示例 1: 基础状态切换**
- 简单的状态切换
- 宽度、高度、颜色的过渡动画

**示例 2: 颜色和位置过渡**
- 位置移动和颜色变化
- NumberAnimation 和 ColorAnimation

**示例 3: 旋转和缩放动画**
- 旋转、缩放和颜色同时变化
- RotationAnimation 和弹性缓动效果

**示例 4: 多状态切换**
- 5 个不同状态之间的切换
- 方块在不同位置和颜色之间平滑过渡

**示例 5: 交通信号灯**
- 红黄绿三色信号灯
- 支持手动切换和自动循环模式

**示例 6: 卡片翻转效果**
- 3D 翻转效果
- Rotation transform 实现翻转动画

### AudioPlayer - 音频播放器 🆕
一个功能完整的现代化音频播放器，展示 Qt Multimedia 的强大功能。

**核心功能**
- 🎵 **播放控制** - 播放/暂停、上一首/下一首
- 📊 **进度控制** - 可拖动进度条、实时时间显示（mm:ss 格式）
- 🔊 **音量控制** - 静音/取消静音切换
- 📋 **播放列表** - 显示所有歌曲、点击切换、高亮当前播放
- ⚡ **播放速度** - 支持 0.5x - 2.0x 倍速播放（重点功能）

**播放速度控制**（亮点功能）
- **6 种预设速度**: 0.5x, 0.75x, 1.0x, 1.25x, 1.5x, 2.0x
- **滑块控制**: 拖动滑块平滑切换速度，带刻度标记
- **按钮快选**: 点击预设按钮快速切换
- **实时反馈**: 显示当前播放速度标识（⚡ 1.5x）
- **应用场景**:
  - 0.5x/0.75x - 学习外语、听清歌词、音乐练习
  - 1.0x - 正常播放（默认）
  - 1.25x/1.5x - 提高效率、快速浏览
  - 2.0x - 倍速播放、快速预览

**视觉效果**
- 🎨 **现代化深色主题** - 渐变背景、卡片设计
- 🔄 **旋转动画** - 播放时专辑封面平滑旋转
- 💫 **平滑过渡** - 所有交互都有动画效果
- 🎯 **响应式设计** - 支持不同屏幕尺寸，使用 ScrollView

**技术实现**
- 使用 `MediaPlayer` 和 `AudioOutput` 组件
- `MediaDevices` 管理音频设备
- `playbackRate` 属性控制播放速度
- 完善的错误处理和状态管理
- 资源文件（qrc）加载音频：`qrc:/qt/qml/demo/audio/sample1.mp3`
- 实时进度更新和时间格式化

**代码统计**
- 主文件：~650 行 QML 代码
- 集成 Qt Multimedia 模块
- 完整的播放器逻辑和 UI

## 技术栈

- **Qt 6.8+** - Qt 框架
- **QML** - 声明式 UI 语言
- **Qt Quick Controls 2** - UI 控件库
- **Qt Multimedia** - 音频/视频播放 🆕
- **C++17** - 后端逻辑
- **CMake** - 构建系统

## 项目统计 📊

- **示例数量**: 8 个完整示例
- **组件数量**: 40+ 可复用组件
- **代码行数**: ~1,700+ 行 QML 代码
- **音频资源**: 1 个示例音频文件（2.1MB）
- **C++ 类**: 2 个（Backend, DataModel）

## 构建与运行

### 环境要求

- Qt 6.8 或更高版本
- Qt Multimedia 模块（音频播放必需）🆕
- CMake 3.16+
- C++17 编译器
- macOS / Linux / Windows

### 构建步骤

1. 克隆项目
```bash
git clone <repository-url>
cd demo
```

2. 使用 Qt Creator 打开
- 打开 Qt Creator
- File -> Open File or Project
- 选择 `CMakeLists.txt`
- 配置构建套件
- 点击运行

3. 或使用命令行构建
```bash
mkdir build
cd build
cmake ..
cmake --build .
./appdemo
```

### 音频播放器快速测试 🆕

```bash
# 直接运行应用
./build/appdemo.app/Contents/MacOS/appdemo

# 或使用 open 命令（macOS）
open build/appdemo.app
```

**测试步骤**:
1. 启动应用
2. 点击主菜单中的 **"音频播放器"**
3. 点击红色播放按钮 ▶️
4. 尝试调整播放速度（拖动滑块或点击速度按钮）
5. 测试其他功能（进度条、静音、切换歌曲）

## 核心特性详解

### 动态路由系统

项目采用类似前端 Umi 框架的约定式路由，通过配置文件自动生成导航：

**ExamplesConfig.qml** - 路由配置中心
```qml
QtObject {
    // 示例配置列表
    property var demos: [
        {
            "id": "interactionBasics",
            "title": "基础交互 & Qt 对象 & Connections",
            "component": "InteractionBasics"
        },
        {
            "id": "stateTransitions",
            "title": "State 和 Transition",
            "component": "StateTransitions"
        },
        {
            "id": "audioPlayer",
            "title": "音频播放器",
            "component": "AudioPlayer"
        }
        // ... 共 8 个示例
    ]
}
```

**Main.qml** - 动态加载实现
```qml
ExamplesConfig {
    id: examplesConfig
}

Repeater {
    model: examplesConfig.demos
    delegate: Button {
        required property var modelData
        text: modelData.title
        onClicked: {
            stackView.push(examplePageComponent, {
                "exampleTitle": modelData.title,
                "exampleComponent": modelData.component
            })
        }
    }
}
```

### 组件化设计

每个示例都采用组件化设计，将复杂的示例拆分为独立的可复用组件：

**示例结构**
```
AnchorLayouts.qml                    # 主示例文件
└── component/AnchorLayouts/         # 组件文件夹
    ├── MyThreeColumnLayout.qml      # 三栏布局组件
    ├── MyCenterLayout.qml           # 居中布局组件
    ├── MyFillLayout.qml             # 填充布局组件
    └── ...                          # 更多组件
```

**主文件示例** - `AnchorLayouts.qml`
```qml
Item {
    ScrollView {
        Column {
            // 引用组件
            MyThreeColumnLayout { id: threeColumnLayout }
            MyCenterLayout { id: centerLayout }
            MyFillLayout { id: fillLayout }
        }
    }
}
```

### 添加新示例

只需三步：

**1. 创建示例文件** - `src/qml/CustomExample.qml`
```qml
import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string name: "自定义示例"

    Rectangle {
        anchors.fill: parent
        color: '#f5f5f5'
        
        Text {
            anchors.centerIn: parent
            text: "这是自定义示例"
            font.pixelSize: 24
        }
    }
}
```

**2. 注册到 ExamplesConfig.qml**
```qml
{
    "id": "customExample",
    "title": "自定义示例",
    "component": "CustomExample"
}
```

**3. 添加到 CMakeLists.txt**
```cmake
QML_FILES
    src/qml/CustomExample.qml
```

重新构建，新示例自动出现在菜单中！

## 代码规范与最佳实践

### QML 编码规范

**类型安全**
```qml
pragma ComponentBehavior: Bound  // 启用严格类型检查

Repeater {
    model: items
    delegate: Item {
        required property var modelData  // 明确声明属性
    }
}
```

**布局规范**
```qml
// ✅ 正确：Layout 中使用 Layout.preferredHeight
ColumnLayout {
    Rectangle {
        Layout.preferredHeight: 100
    }
}

// ❌ 错误：Layout 中直接使用 height
ColumnLayout {
    Rectangle {
        height: 100  // 会被忽略
    }
}
```

**ScrollView 使用**
```qml
ScrollView {
    id: scrollView  // 必须添加 id
    
    Column {
        width: scrollView.width - 20  // 引用父元素宽度
    }
}
```

### 架构最佳实践

1. **组件化设计**
   - 每个 Demo 独立文件
   - 可复用组件抽取为单独文件
   - 保持组件职责单一

2. **配置驱动**
   - 使用 ExamplesConfig.qml 集中管理路由
   - 避免硬编码，提高可维护性

3. **动态加载**
   - 使用 Loader 按需加载组件
   - 减少初始加载时间
   - 降低内存占用

4. **响应式设计**
   - 优先使用锚点布局
   - 使用 Layout 系列组件
   - 避免固定尺寸

5. **性能优化**
   - 使用 `clip: true` 裁剪溢出内容
   - 合理使用 `visible` 和 `opacity`
   - 避免深层嵌套

### C++ 与 QML 交互

**注册 C++ 类型**
```cpp
// main.cpp
qmlRegisterType<Backend>("com.example", 1, 0, "Backend");
qmlRegisterType<DataModel>("com.example", 1, 0, "DataModel");
```

**QML 中使用**
```qml
import com.example 1.0

Backend {
    id: backend
    onDataChanged: console.log("数据更新")
}
```

## 常见问题

### Q: 如何修改应用样式？
A: 在 `main.cpp` 中修改样式：
```cpp
QQuickStyle::setStyle("Basic");  // 可选：Basic, Fusion, Material, Universal
```

### Q: 如何添加 C++ 后端？
A: 三步走：
1. 创建 C++ 类（继承 QObject）
2. 在 `main.cpp` 中注册：`qmlRegisterType<YourClass>("com.example", 1, 0, "YourClass")`
3. 在 QML 中导入使用：`import com.example 1.0`

参考 `Backend.h/cpp` 和 `DataModel.h/cpp` 示例。

### Q: 图片资源如何加载？
A: 两种方式：
1. 添加到 `CMakeLists.txt` 的 `RESOURCES`
2. 在 QML 中使用相对路径：`source: "image.png"`

### Q: 为什么有些 QML 警告？
A: 常见警告及解决方案：
- `unqualified access` - 使用 `pragma ComponentBehavior: Bound`
- `StackLayout is not a type` - 添加 `import QtQuick.Layouts`
- `Cannot specify anchors for items inside Row` - 移除 Row 子元素的锚点

### Q: 如何调试 QML？
A: 使用 `console.log()` 输出调试信息：
```qml
onClicked: console.log("按钮被点击", value)
```

### Q: Popup/Dialog 不显示？
A: 检查：
1. 是否调用了 `.open()` 或 `.popup()`
2. 父元素是否可见
3. 是否设置了正确的位置（x, y 或 anchors）

### Q: 如何实现页面切换动画？
A: 使用 StackView 或在 Loader 中添加 Transition：
```qml
Loader {
    id: loader
    Behavior on opacity {
        NumberAnimation { duration: 300 }
    }
}
```

### Q: 音频播放器无法播放？🆕
A: 按以下步骤排查：

1. **检查 Qt Multimedia 模块**:
   ```bash
   # macOS
   brew install qt6
   
   # 确保包含 Multimedia 模块
   ls $(qmake -query QT_INSTALL_LIBS) | grep Multimedia
   ```

2. **检查音频文件**:
   ```bash
   # 确认音频文件存在
   ls -lh audio/sample1.mp3
   
   # 测试系统播放器
   open audio/sample1.mp3  # macOS
   ```

3. **查看控制台日志**:
   - 启动应用后查看控制台输出
   - 应该看到 "播放器初始化完成" 和 "媒体加载成功"

4. **重新构建项目**:
   ```bash
   rm -rf build
   cmake -B build -S .
   cmake --build build
   ```

### Q: 如何添加更多音频文件？🆕
A: 三步走：

1. **复制音频文件到 audio 目录**:
   ```bash
   cp /path/to/your/music.mp3 audio/sample2.mp3
   ```

2. **更新 CMakeLists.txt**:
   ```cmake
   RESOURCES
       report.png
       audio/sample1.mp3
       audio/sample2.mp3  # 新增
   ```

3. **更新 AudioPlayer.qml 播放列表**:
   ```qml
   ListElement {
       songName: "新歌曲"
       artistName: "艺术家"
       source: "qrc:/qt/qml/demo/audio/sample2.mp3"
   }
   ```

4. **重新构建**:
   ```bash
   cmake --build build
   ```

### Q: 播放速度如何工作？🆕
A: 使用 MediaPlayer 的 `playbackRate` 属性：
```qml
MediaPlayer {
    id: player
    playbackRate: 1.5  // 1.5 倍速播放
}
```

支持的速度范围：0.5x - 2.0x（建议范围，超出可能影响音质）

## 学习路径建议

### 基础入门
1. **InteractionBasics** - 了解基础交互和 Qt 对象
2. **AnchorLayouts** - 掌握锚点布局
3. **BasicControls** - 熟悉常用控件

### 进阶学习
4. **BackendIntegration** - C++ 与 QML 交互
5. **MouseKeyboardEvents** - 掌握事件处理
6. **InputFields** - 深入输入控件
7. **StateTransitions** - 掌握状态和动画

### 实战项目
8. **AudioPlayer** - Qt Multimedia 音频播放器 🆕
   - 完整的多媒体应用
   - 播放速度控制实现
   - 现代化 UI 设计
   - 状态管理和错误处理

### 实战技巧
- 查看 `Main.qml` 了解动态路由实现
- 研究 `ExamplesConfig.qml` 配置驱动
- 阅读组件文件夹了解组件化设计
- 阅读 `Backend.cpp` 理解 C++ 集成
- 查看 `AudioPlayer.qml` 学习多媒体应用 🆕
- 研究播放速度控制的实现细节 🆕

## 扩展资源

### 官方文档
- [Qt 6 Documentation](https://doc.qt.io/qt-6/)
- [QML Reference](https://doc.qt.io/qt-6/qmlreference.html)
- [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [Qt Multimedia](https://doc.qt.io/qt-6/qtmultimedia-index.html) 🆕
- [MediaPlayer QML Type](https://doc.qt.io/qt-6/qml-qtmultimedia-mediaplayer.html) 🆕

### 推荐阅读
- Qt Quick 最佳实践
- QML 性能优化指南
- Qt 信号槽机制详解
- Qt Multimedia 音频播放指南 🆕

## 版本历史

### v2.1.0 (当前版本) 🆕
**发布日期**: 2024-04-24

**新增功能**:
- ✅ 新增音频播放器示例（AudioPlayer.qml）
- ✅ 集成 Qt Multimedia 模块
- ✅ 播放速度控制（0.5x - 2.0x）
  - 滑块控制 + 预设按钮
  - 实时速度显示
  - 平滑动画过渡
- ✅ 现代化深色主题 UI
- ✅ 完整的播放控制和进度管理
- ✅ 播放列表支持（点击切换、高亮显示）
- ✅ 音频资源管理（audio/ 目录）
- ✅ 专辑封面旋转动画

**技术改进**:
- 添加 QtMultimedia 依赖到 CMakeLists.txt
- 使用 MediaPlayer 和 AudioOutput 组件
- MediaDevices 音频设备管理
- 完善的错误处理和重试机制
- 资源文件（qrc）配置

**代码统计**:
- 新增 ~650 行 QML 代码
- 总计 8 个示例
- 40+ 可复用组件
- ~1,700+ 行 QML 代码

### v2.0.0
**发布日期**: 2024-04-XX

- ✅ 7 个完整示例（新增 StateTransitions）
- ✅ 组件化设计，40+ 可复用组件
- ✅ 动态路由系统
- ✅ 语义化命名，提高代码可读性
- ✅ C++ 与 QML 交互
- ✅ 60+ 控件和动画示例
- ✅ 完整的布局演示

### v1.0.0
**发布日期**: 2024-03-XX

- ✅ 6 个基础示例
- ✅ 动态路由系统
- ✅ C++ 与 QML 交互

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

贡献指南：
1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

