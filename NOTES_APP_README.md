# SQLite 笔记应用说明

## 📝 功能概述

这是一个完整的 QML + SQLite 笔记应用示例，展示了如何在 Qt Quick 应用中集成数据库功能。

## ✨ 主要功能

### 1. 笔记管理
- ✅ **创建笔记**：点击左上角 "+" 按钮创建新笔记
- ✅ **编辑笔记**：点击列表中的笔记进行编辑
- ✅ **保存笔记**：编辑完成后点击"保存"按钮
- ✅ **删除笔记**：编辑时点击"删除"按钮（带确认对话框）

### 2. 搜索功能
- ✅ **实时搜索**：在搜索框输入关键词，实时过滤笔记
- ✅ **全文搜索**：搜索标题和内容

### 3. 界面特性
- ✅ **双栏布局**：左侧笔记列表，右侧编辑区
- ✅ **实时预览**：列表显示笔记标题、内容预览和更新时间
- ✅ **字数统计**：底部显示当前笔记字数
- ✅ **空状态提示**：无笔记时显示友好提示

## 🏗️ 技术架构

### C++ 层（NoteDatabase）

**文件：** `NoteDatabase.h` / `NoteDatabase.cpp`

**核心方法：**
```cpp
// 初始化数据库
Q_INVOKABLE bool initDatabase();

// 创建笔记
Q_INVOKABLE bool createNote(const QString &title, const QString &content);

// 获取所有笔记
Q_INVOKABLE QVariantList getAllNotes();

// 根据 ID 获取笔记
Q_INVOKABLE QVariantMap getNoteById(int id);

// 更新笔记
Q_INVOKABLE bool updateNote(int id, const QString &title, const QString &content);

// 删除笔记
Q_INVOKABLE bool deleteNote(int id);

// 搜索笔记
Q_INVOKABLE QVariantList searchNotes(const QString &keyword);
```

### 数据库结构

**表名：** `notes`

| 字段 | 类型 | 说明 |
|------|------|------|
| id | INTEGER | 主键，自增 |
| title | TEXT | 笔记标题 |
| content | TEXT | 笔记内容 |
| created_at | DATETIME | 创建时间 |
| updated_at | DATETIME | 更新时间 |

### QML 层（NotesApp.qml）

**文件：** `src/qml/NotesApp.qml`

**主要组件：**
- `NoteDatabase`：数据库实例
- `ListModel`：笔记列表数据模型
- `ListView`：笔记列表视图
- `TextField`：标题输入框
- `TextArea`：内容编辑区

## 📂 数据存储位置

数据库文件自动保存在系统应用数据目录：

- **macOS**: `~/Library/Application Support/demo/notes.db`
- **Windows**: `C:\Users\<用户名>\AppData\Local\demo\notes.db`
- **Linux**: `~/.local/share/demo/notes.db`

## 🚀 使用方法

1. **编译项目**
   ```bash
   mkdir build && cd build
   cmake ..
   make
   ```

2. **运行应用**
   - 在主菜单中选择 "SQLite 笔记应用"

3. **创建第一条笔记**
   - 点击左上角 "+" 按钮
   - 输入标题和内容
   - 点击"保存"

4. **编辑笔记**
   - 点击列表中的笔记
   - 修改内容后点击"保存"

5. **搜索笔记**
   - 在搜索框输入关键词
   - 列表自动过滤匹配的笔记

6. **删除笔记**
   - 打开要删除的笔记
   - 点击"删除"按钮
   - 确认删除

## 🔧 扩展建议

### 1. 添加 Markdown 支持
将 MarkdownConverter 集成到笔记应用中，支持 Markdown 格式：

```qml
// 在 NotesApp.qml 中添加
MarkdownConverter {
    id: markdownConverter
}

// 预览区显示渲染后的 HTML
TextArea {
    textFormat: TextEdit.RichText
    text: markdownConverter.toHtml(contentArea.text)
}
```

### 2. 添加标签功能
扩展数据库表结构，支持笔记标签：

```sql
CREATE TABLE tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE note_tags (
    note_id INTEGER,
    tag_id INTEGER,
    FOREIGN KEY (note_id) REFERENCES notes(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);
```

### 3. 添加分类功能
添加笔记本/文件夹概念：

```sql
CREATE TABLE notebooks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE notes ADD COLUMN notebook_id INTEGER;
```

### 4. 添加导出功能
支持导出为 Markdown、HTML、PDF 等格式。

### 5. 添加同步功能
实现云端同步，支持多设备访问。

## 📚 相关文档

- [Qt SQL 模块文档](https://doc.qt.io/qt-6/qtsql-index.html)
- [QSqlDatabase 文档](https://doc.qt.io/qt-6/qsqldatabase.html)
- [SQLite 官方文档](https://www.sqlite.org/docs.html)

## 💡 注意事项

1. **数据库初始化**：应用启动时自动初始化数据库
2. **错误处理**：所有数据库操作都有错误处理和提示
3. **数据持久化**：所有数据自动保存到本地数据库
4. **性能优化**：使用预编译语句（prepared statements）提高性能
5. **SQL 注入防护**：使用参数绑定防止 SQL 注入攻击

## 🐛 常见问题

**Q: 数据库文件在哪里？**
A: 查看控制台输出的 "数据库路径" 信息。

**Q: 如何重置数据库？**
A: 删除数据库文件，应用会自动重新创建。

**Q: 支持哪些 SQL 功能？**
A: 支持 SQLite 的所有标准 SQL 功能。

**Q: 如何备份数据？**
A: 直接复制数据库文件即可。
