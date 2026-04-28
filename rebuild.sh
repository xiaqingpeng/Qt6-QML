#!/bin/bash

echo "🧹 清理旧的构建文件..."
rm -rf build build-debug

echo "📦 创建构建目录..."
mkdir build
cd build

echo "⚙️  配置 CMake..."
cmake ..

echo "🔨 开始构建..."
cmake --build .

echo "✅ 构建完成！"
echo ""
echo "运行应用:"
echo "  ./appdemo.app/Contents/MacOS/appdemo"
