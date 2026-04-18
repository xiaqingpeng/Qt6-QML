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
├── Demo1.qml             # 基础交互示例
├── Demo2.qml             # Qt 全局对象示例
├── Demo3.qml             # Connections 信号劫持
├── Demo4.qml             # Backend & DataModel 示例
├── demo5.qml             # 锚点布局示例
├── Demo6.qml             # 输入框示例
├── Backend.h/cpp         # C++ 后端类
├── DataModel.h/cpp       # 数据模型类
├── main.cpp              # 应用程序入口
└── CMakeLists.txt        # CMake 构建配置
```

## Demo 列表

### Demo 1 - 基础交互
- 按钮点击事件
- 文本显示与更新
- 基础属性绑定

### Demo 2 - Qt 全局对象
- Qt.quit() 退出应用
- Qt.platform 平台信息
- Qt.formatDateTime() 日期格式化
- 其他 Qt 全局 API

### Demo 3 - Connections 信号劫持
- Connections 组件使用
- 信号槽机制
- 动态信号连接

### Demo 4 - Backend & DataModel
- QML 与 C++ 交互
- 自定义 C++ 类暴露给 QML
- 数据模型绑定

### Demo 5 - 锚点布局示例
包含 7 个常用布局模式：
1. 四角布局 - left/right/top/bottom
2. 居中布局 - centerIn, horizontalCenter, verticalCenter
3. 填充布局 - anchors.fill
4. 相对定位 - 元素之间相互定位
5. 顶部工具栏 + 内容区
6. 侧边栏布局
7. 底部固定按钮

### Demo 6 - 输入框示例
包含 8 种常用输入控件：
1. 基础搜索框 - 带焦点高亮
2. 密码输入框 - echoMode 隐藏输入
3. 数字输入框 - validator 验证
4. 邮箱输入框 - 输入提示
5. 只读输入框 - readOnly
6. 字符长度限制 - maximumLength
7. 多行文本框 - TextArea
8. 带清除按钮的输入框

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

## 添加新 Demo

项目采用动态路由系统，添加新 Demo 非常简单：

### 1. 创建 Demo 文件

创建 `Demo7.qml`：
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

### 2. 在 DemoConfig.qml 中注册

```qml
property var demos: [
    // ... 其他 demos
    {
        "id": "demo7",
        "title": "Demo 7 - 新功能示例",
        "component": "Demo7"
    }
]
```

### 3. 在 CMakeLists.txt 中添加

```cmake
qt_add_qml_module(appdemo
    URI demo
    QML_FILES
        # ... 其他文件
        Demo7.qml
    # ...
)
```

### 4. 重新构建运行

新的 Demo 会自动出现在主菜单中！

## 代码规范

- 使用 `pragma ComponentBehavior: Bound` 确保类型安全
- 使用 `required property` 明确声明必需属性
- 使用 `Repeater` 的 `delegate` 属性而不是直接子元素
- 在 Layout 中使用 `Layout.preferredHeight` 而不是 `height`
- 给 ScrollView 添加 `id` 以便子元素正确引用宽度

## 最佳实践

1. **组件化** - 每个 Demo 独立成文件
2. **配置驱动** - 使用 DemoConfig.qml 集中管理路由
3. **动态加载** - 使用 Loader 按需加载组件
4. **类型安全** - 使用 required property 和 pragma
5. **响应式设计** - 使用锚点和 Layout 实现自适应

## 常见问题

### Q: 如何修改应用样式？
A: 在 `main.cpp` 中修改 `QQuickStyle::setStyle("Basic")`，可选值：Basic, Fusion, Material, Universal

### Q: 如何添加 C++ 后端？
A: 参考 `Backend.h/cpp` 和 `DataModel.h/cpp`，在 `main.cpp` 中注册类型

### Q: 为什么有些警告？
A: IDE 的静态分析警告，不影响运行。确保使用 `pragma ComponentBehavior: Bound` 可以减少警告

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

## 联系方式

如有问题，请提交 Issue。
