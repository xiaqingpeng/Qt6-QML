# 构建说明

## 新增功能模块

本次更新新增了 3 个重要功能模块：

### 1. 网络请求示例 (NetworkRequests.qml)
- ✅ HTTP GET/POST 请求
- ✅ JSON 数据解析
- ✅ 异步请求和回调
- ✅ 错误处理和重试
- ✅ 下载进度显示

**C++ 类**: NetworkManager.h/cpp

### 2. ListView 高级用法 (ListViewAdvanced.qml)
- ✅ 分组列表 (Section)
- ✅ 搜索和筛选
- ✅ 滑动删除 (SwipeDelegate)
- ✅ 收藏功能
- ✅ 动态添加/删除

### 3. 文件操作示例 (FileOperations.qml)
- ✅ 文件选择对话框
- ✅ 读取/写入文本文件
- ✅ 文件信息显示
- ✅ 文件删除和复制
- ✅ 文本编辑器

**C++ 类**: FileManager.h/cpp

## 构建步骤

### 1. 清理旧的构建文件
```bash
rm -rf build build-debug
```

### 2. 重新构建
```bash
mkdir build
cd build
cmake ..
cmake --build .
```

### 3. 运行应用
```bash
# macOS
./appdemo.app/Contents/MacOS/appdemo

# Linux
./appdemo

# Windows
.\Release\appdemo.exe
```

## 依赖项

确保已安装以下 Qt 模块：
- Qt6::Quick
- Qt6::QuickControls2
- Qt6::Multimedia
- Qt6::Sql
- Qt6::Network ⭐ 新增

## 测试新功能

### 测试网络请求
1. 启动应用
2. 点击 "网络请求示例"
3. 点击 "获取用户列表" 按钮
4. 查看返回的 JSON 数据

### 测试 ListView
1. 点击 "ListView 高级用法"
2. 尝试搜索联系人
3. 左滑列表项查看删除/收藏操作
4. 点击 "添加联系人" 按钮

### 测试文件操作
1. 点击 "文件操作示例"
2. 点击 "打开文件" 选择一个文本文件
3. 编辑内容后点击 "保存文件"
4. 尝试 "另存为" 和 "删除文件"

## 常见问题

### Q: 编译错误 "NetworkManager not found"
A: 确保 CMakeLists.txt 中已添加：
```cmake
find_package(Qt6 REQUIRED COMPONENTS Network)
target_link_libraries(appdemo PRIVATE Qt6::Network)
```

### Q: 网络请求失败
A: 检查网络连接，确保可以访问 https://jsonplaceholder.typicode.com

### Q: 文件对话框不显示
A: 确保已导入 QtQuick.Dialogs 模块

## 项目统计

更新后的项目规模：
- **功能模块**: 14 个 (新增 3 个)
- **C++ 类**: 6 个 (新增 2 个)
- **QML 文件**: 50+ 个
- **代码行数**: 2500+ 行

## 下一步计划

可以继续添加：
- [ ] 图表和数据可视化
- [ ] 多线程示例
- [ ] 表格控件
- [ ] 设置页面
- [ ] 通知和提示

## 求职建议

这 3 个新模块是面试高频考点：
1. **网络请求** - 展示异步编程和 API 调用能力
2. **ListView** - 展示列表优化和用户体验设计
3. **文件操作** - 展示系统 API 调用和文件处理

在简历中可以这样描述：
- "实现了完整的网络请求模块，支持 HTTP GET/POST、JSON 解析和错误处理"
- "开发了高级列表组件，支持分组、搜索、滑动删除等交互"
- "实现了文件管理功能，包括文件读写、信息查询和文本编辑"
