import QtQuick

QtObject {
    // 示例配置列表
    property var demos: [
        {
            "id": "interactionBasics",
            "title": "基础交互 & Qt 对象 & Connections",
            "component": "InteractionBasics"
        },
        {
            "id": "backendIntegration",
            "title": "Backend & DataModel",
            "component": "BackendIntegration"
        },
        {
            "id": "anchorLayouts",
            "title": "锚点布局示例",
            "component": "AnchorLayouts"
        },
        {
            "id": "inputFields",
            "title": "输入框示例",
            "component": "InputFields"
        },
        {
            "id": "mouseKeyboardEvents",
            "title": "鼠标键盘事件",
            "component": "MouseKeyboardEvents"
        },
        {
            "id": "basicControls",
            "title": "QML 常用基础控件",
            "component": "BasicControls"
        },
        {
            "id": "stateTransitions",
            "title": "State 和 Transition",
            "component": "StateTransitions"
        }
    ]
}
