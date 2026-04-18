import QtQuick

QtObject {
    // Demo 配置列表
    property var demos: [
        {
            "id": "demo1",
            "title": "Demo 1 - 基础交互",
            "component": "Demo1"
        },
        {
            "id": "demo2",
            "title": "Demo 2 - Qt 全局对象",
            "component": "Demo2"
        },
        {
            "id": "demo3",
            "title": "Demo 3 - Connections 信号劫持",
            "component": "Demo3"
        },
        {
            "id": "demo4",
            "title": "Demo 4 - Backend & DataModel",
            "component": "Demo4"
        },
        {
            "id": "demo5",
            "title": "Demo 5 - 锚点布局示例",
            "component": "Demo5"
        },
        {
            "id": "demo6",
            "title": "Demo 6 - 输入框示例",
            "component": "Demo6"
        }
    ]
}
