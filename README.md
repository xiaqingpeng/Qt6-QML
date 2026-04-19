# QML Demo 示例集合

这是一个 Qt6 QML 学习项目，包含多个实用的 QML 示例，展示了 QML 的各种特性和最佳实践。

## 项目特点

- 🎯 **动态路由系统** - 类似前端 Umi 框架的约定式路由，自动生成导航菜单
- 📱 **响应式布局** - 所有示例都支持自适应布局
- 🎨 **现代化 UI** - 使用 Qt Quick Controls 2 构建美观的界面
- 📚 **丰富示例** - 涵盖基础交互、布局、输入控件等常用场景

## 项目结构

```
.
├── Main.qml              # 主入口，动态路由系统
├── DemoConfig.qml        # Demo 配置文件（路由配置）
├── Demo1.qml             # 基础交互 & Qt 对象 & Connections
├── Demo2.qml             # Backend & DataModel 示例
├── Demo3.qml             # 锚点布局示例
├── Demo4.qml             # 输入框示例
├── Demo5.qml             # 鼠标键盘事件示例
├── Demo6.qml             # QML 常用基础控件
├── Backend.h/cpp         # C++ 后端类
├── DataModel.h/cpp       # 数据模型类
├── main.cpp              # 应用程序入口
├── img.qrc               # 资源文件配置
├── report.png            # 示例图片
└── CMakeLists.txt        # CMake 构建配置
```

## Demo 列表

### Demo 1 - 基础交互 & Qt 对象 & Connections
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

### Demo 2 - Backend & DataModel
- QML 与 C++ 交互
- 自定义 C++ 类暴露给 QML
- 数据模型绑定
- 调用 C++ 方法并获取返回值

### Demo 3 - 锚点布局示例
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

### Demo 4 - 输入框示例
包含 8 种常用输入控件：
1. 基础搜索框 - 带焦点高亮
2. 密码输入框 - echoMode 隐藏输入
3. 数字输入框 - validator 验证
4. 邮箱输入框 - 输入提示
5. 只读输入框 - readOnly
6. 字符长度限制 - maximumLength
7. 多行文本框 - TextArea
8. 带清除按钮的输入框

### Demo 5 - 鼠标键盘事件
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

### Demo 6 - QML 常用基础控件
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

## 技术栈

- **Qt 6.8+** - Qt 框架
- **QML** - 声明式 UI 语言
- **Qt Quick Controls 2** - UI 控件库
- **C++17** - 后端逻辑
- **CMake** - 构建系统

## 构建与运行

### 环境要求

- Qt 6.8 或更高版本
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

## 核心特性详解

### 动态路由系统

项目采用类似前端 Umi 框架的约定式路由，通过配置文件自动生成导航：

**DemoConfig.qml** - 路由配置中心
```qml
QtObject {
    property var demos: [
        {
            "id": "demo1",
            "title": "Demo 1 - 基础交互",
            "component": "Demo1"
        }
        // ... 更多配置
    ]
}
```

**Main.qml** - 动态加载实现
```qml
Repeater {
    model: demoConfig.demos
    delegate: Button {
        required property var modelData
        text: modelData.title
        onClicked: {
            loader.source = modelData.component + ".qml"
        }
    }
}

Loader {
    id: loader
    source: "Demo1.qml"
}
```

### 添加新 Demo

只需三步：

**1. 创建 Demo 文件** - `Demo7.qml`
```qml
import QtQuick
import QtQuick.Controls

Item {
    id: root
    property string name: "Demo 7 示例"

    Rectangle {
        anchors.fill: parent
        color: '#f5f5f5'
        
        Text {
            anchors.centerIn: parent
            text: "这是 Demo 7"
            font.pixelSize: 24
        }
    }
}
```

**2. 注册到 DemoConfig.qml**
```qml
{
    "id": "demo7",
    "title": "Demo 7 - 新功能示例",
    "component": "Demo7"
}
```

**3. 添加到 CMakeLists.txt**
```cmake
QML_FILES
    Demo7.qml
```

重新构建，新 Demo 自动出现在菜单中！

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
   - 使用 DemoConfig.qml 集中管理路由
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

## 学习路径建议

### 初学者
1. **Demo 1** - 了解基础交互和 Qt 对象
2. **Demo 3** - 掌握锚点布局
3. **Demo 6** - 熟悉常用控件

### 进阶
4. **Demo 2** - 学习 C++ 与 QML 交互
5. **Demo 5** - 掌握事件处理
6. **Demo 4** - 深入输入控件

### 实战技巧
- 查看 `Main.qml` 了解动态路由实现
- 研究 `DemoConfig.qml` 学习配置驱动
- 阅读 `Backend.cpp` 理解 C++ 集成

## 扩展资源

### 官方文档
- [Qt 6 Documentation](https://doc.qt.io/qt-6/)
- [QML Reference](https://doc.qt.io/qt-6/qmlreference.html)
- [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html)

### 推荐阅读
- Qt Quick 最佳实践
- QML 性能优化指南
- Qt 信号槽机制详解

## 版本历史

### v1.0.0 (当前版本)
- ✅ 6 个完整 Demo 示例
- ✅ 动态路由系统
- ✅ C++ 与 QML 交互
- ✅ 50+ 控件示例
- ✅ 完整的布局演示

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

## 致谢

感谢 Qt 社区的支持和贡献。

## 联系方式

如有问题或建议，请提交 Issue。
