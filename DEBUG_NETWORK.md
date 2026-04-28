# 网络请求崩溃问题调试指南

## 可能的原因

### 1. Qt Network 模块未正确链接
检查 CMakeLists.txt 是否包含：
```cmake
find_package(Qt6 REQUIRED COMPONENTS Network)
target_link_libraries(appdemo PRIVATE Qt6::Network)
```

### 2. NetworkManager 未正确注册
检查 main.cpp 是否包含：
```cpp
#include "NetworkManager.h"
qmlRegisterType<NetworkManager>("com.example", 1, 0, "NetworkManager");
```

### 3. 网络权限问题（macOS）
macOS 可能需要网络权限。检查控制台是否有权限相关错误。

## 调试步骤

### 步骤 1: 清理并重新构建
```bash
# 完全清理
rm -rf build build-debug

# 重新构建
mkdir build && cd build
cmake ..
cmake --build .
```

### 步骤 2: 运行并查看日志
```bash
# macOS
./appdemo.app/Contents/MacOS/appdemo 2>&1 | tee debug.log

# Linux
./appdemo 2>&1 | tee debug.log
```

### 步骤 3: 检查崩溃信息
查看控制台输出，寻找：
- Segmentation fault
- QNetworkAccessManager 相关错误
- SSL 相关错误
- 权限相关错误

## 常见错误和解决方案

### 错误 1: "QSslSocket: cannot resolve SSL functions"
**原因**: 缺少 OpenSSL 库

**解决方案 (macOS)**:
```bash
brew install openssl@3
```

**解决方案 (Linux)**:
```bash
sudo apt-get install libssl-dev
```

### 错误 2: "QNetworkAccessManager: Operation not permitted"
**原因**: 网络权限问题

**解决方案**: 在 Info.plist 中添加网络权限（macOS）

### 错误 3: Segmentation fault
**原因**: 内存管理问题

**解决方案**: 已在代码中修复，确保使用最新版本

## 简化测试版本

如果问题持续，使用这个简化版本测试：

```qml
// TestNetwork.qml
import QtQuick
import QtQuick.Controls
import com.example 1.0

Item {
    NetworkManager {
        id: networkManager
        
        onRequestFinished: function(response) {
            console.log("成功:", response.substring(0, 100))
            resultText.text = "成功: " + response.substring(0, 200)
        }
        
        onRequestError: function(error) {
            console.log("错误:", error)
            resultText.text = "错误: " + error
        }
    }
    
    Column {
        anchors.centerIn: parent
        spacing: 20
        
        Button {
            text: "测试 GET 请求"
            onClicked: {
                console.log("开始请求...")
                networkManager.get("https://jsonplaceholder.typicode.com/users/1")
            }
        }
        
        Text {
            id: resultText
            text: "等待请求..."
            width: 400
            wrapMode: Text.WordWrap
        }
    }
}
```

## 替代方案：使用 XMLHttpRequest

如果 NetworkManager 持续崩溃，可以使用 QML 内置的 XMLHttpRequest：

```qml
import QtQuick
import QtQuick.Controls

Item {
    function testRequest() {
        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log("成功:", xhr.responseText)
                    var data = JSON.parse(xhr.responseText)
                    // 处理数据
                } else {
                    console.log("错误:", xhr.status)
                }
            }
        }
        xhr.open("GET", "https://jsonplaceholder.typicode.com/users")
        xhr.send()
    }
    
    Button {
        text: "测试请求"
        onClicked: testRequest()
    }
}
```

## 检查清单

- [ ] CMakeLists.txt 包含 Qt6::Network
- [ ] main.cpp 注册了 NetworkManager
- [ ] 已完全清理并重新构建
- [ ] 检查了控制台日志
- [ ] 测试了简化版本
- [ ] 检查了网络连接
- [ ] 检查了 SSL 库

## 获取更多帮助

如果问题仍然存在，请提供：
1. 完整的崩溃日志
2. 操作系统版本
3. Qt 版本 (`qmake --version`)
4. 崩溃时的具体操作步骤

## 临时解决方案

在问题解决之前，可以使用 XMLHttpRequest 替代：

```qml
// 替换 NetworkManager 为 XMLHttpRequest
function makeRequest(url) {
    var xhr = new XMLHttpRequest()
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            busyIndicator.running = false
            if (xhr.status === 200) {
                try {
                    var data = JSON.parse(xhr.responseText)
                    handleResponse(data)
                    statusText.text = "✅ 请求成功"
                    statusText.color = "#4CAF50"
                } catch (e) {
                    statusText.text = "❌ 解析失败: " + e.message
                    statusText.color = "#f44336"
                }
            } else {
                statusText.text = "❌ 请求失败: " + xhr.status
                statusText.color = "#f44336"
            }
        }
    }
    xhr.open("GET", url)
    xhr.send()
}

// 在按钮点击时调用
Button {
    text: "📥 获取用户列表"
    onClicked: {
        busyIndicator.running = true
        makeRequest("https://jsonplaceholder.typicode.com/users")
    }
}
```
