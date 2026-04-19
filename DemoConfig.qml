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
        }
    ]
}
