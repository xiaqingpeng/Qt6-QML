import QtQuick

QtObject {
    // Demo 配置列表
    property var demos: [
        {
            "id": "demo1",
            "title": "Demo 1 - 基础交互 & Qt 对象 & Connections",
            "component": "Demo1"
        },
        {
            "id": "demo2",
            "title": "Demo 2 - Backend & DataModel",
            "component": "Demo2"
        },
        {
            "id": "demo3",
            "title": "Demo 3 - 锚点布局示例",
            "component": "Demo3"
        },
        {
            "id": "demo4",
            "title": "Demo 4 - 输入框示例",
            "component": "Demo4"
        },
        {
            "id": "demo5",
            "title": "Demo 5 - 鼠标键盘事件",
            "component": "Demo5"
        },
        {
            "id": "demo6",
            "title": "Demo 6 - qml常用基础控件",
            "component": "Demo6"
        },
        {
            "id": "demo7",
            "title": "Demo 7 - State 和 Transition",
            "component": "Demo7"
        }
    ]
}
