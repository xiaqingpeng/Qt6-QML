# 网络请求示例实现计划

## 功能设计

### 示例 1: HTTP GET 请求
- 调用 JSONPlaceholder API 获取用户列表
- 显示加载状态（BusyIndicator）
- 解析 JSON 数据
- 显示在 ListView 中

### 示例 2: HTTP POST 请求
- 创建新用户
- 发送 JSON 数据
- 处理响应

### 示例 3: 错误处理
- 网络错误提示
- 超时处理
- 重试机制

### 示例 4: 图片加载
- 异步加载网络图片
- 显示加载进度
- 缓存机制

## 技术实现

### C++ 后端（NetworkManager.h/cpp）
```cpp
class NetworkManager : public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE void get(const QString &url);
    Q_INVOKABLE void post(const QString &url, const QString &data);
    
signals:
    void requestFinished(const QString &response);
    void requestError(const QString &error);
    
private:
    QNetworkAccessManager *manager;
};
```

### QML 前端（NetworkRequests.qml）
```qml
import QtQuick
import QtQuick.Controls
import com.example 1.0

Item {
    NetworkManager {
        id: networkManager
        onRequestFinished: {
            // 处理响应
            var data = JSON.parse(response)
            listModel.clear()
            for (var i = 0; i < data.length; i++) {
                listModel.append(data[i])
            }
            busyIndicator.running = false
        }
        onRequestError: {
            // 显示错误
            errorDialog.text = error
            errorDialog.open()
        }
    }
    
    Column {
        Button {
            text: "获取用户列表"
            onClicked: {
                busyIndicator.running = true
                networkManager.get("https://jsonplaceholder.typicode.com/users")
            }
        }
        
        BusyIndicator {
            id: busyIndicator
            running: false
        }
        
        ListView {
            model: ListModel { id: listModel }
            delegate: ItemDelegate {
                text: model.name + " - " + model.email
            }
        }
    }
}
```

## 开发步骤

### Day 1: C++ 后端
1. 创建 NetworkManager.h/cpp
2. 实现 GET/POST 方法
3. 添加信号槽
4. 注册到 QML

### Day 2: QML 前端
1. 创建 NetworkRequests.qml
2. 实现 4 个示例
3. 添加加载状态
4. 添加错误处理

### Day 3: 完善和测试
1. 添加更多 API 示例
2. 优化 UI
3. 添加注释
4. 测试各种场景

## 测试 API 推荐

1. **JSONPlaceholder** (免费)
   - https://jsonplaceholder.typicode.com/
   - 用户、文章、评论等数据

2. **OpenWeatherMap** (免费)
   - https://openweathermap.org/api
   - 天气数据

3. **GitHub API** (免费)
   - https://api.github.com/
   - 用户、仓库信息

## 面试话术

"我在项目中实现了完整的网络请求模块，包括：
1. 使用 QNetworkAccessManager 进行 HTTP 请求
2. 异步处理和回调机制
3. JSON 数据解析和绑定
4. 完善的错误处理和重试机制
5. 加载状态的用户体验优化

这个模块展示了我对网络编程、异步编程和用户体验的理解。"
