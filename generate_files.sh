#!/bin/bash

# 设置目标目录和文件
TARGET_DIR="Sources"
PACKAGE_FILE="Package.swift"
BACKUP_FILE="Package.swift.bak"
TEMP_FILE="Package.swift.tmp"

# 创建备份
cp "$PACKAGE_FILE" "$BACKUP_FILE"

# 生成可运行文件列表
FILES_LIST=$(find "$TARGET_DIR" -name "*.swift" | sort | while read -r file; do
    # 检查文件是否包含 main() 或 solve() 函数
    if grep -q "func main()" "$file" || grep -q "func solve(" "$file"; then
        echo "    \"./${file}\","
    fi
done)

# 检查文件列表是否为空
if [ -z "$FILES_LIST" ]; then
    echo "Error: No executable Swift files found in $TARGET_DIR"
    exit 1
fi

# 处理文件
{
    # 读取到 myfiles 数组定义之前的内容
    sed -n '1,/^let myfiles: \[String\] = \[/p' "$PACKAGE_FILE"
    
    # 插入新的文件列表
    echo "$FILES_LIST"
    
    # 读取从第一个 ] 之后到文件末尾的内容
    sed -n '/^]/,$p' "$PACKAGE_FILE" | sed '1q;d'
    sed -n '/^]/,$p' "$PACKAGE_FILE" | sed '1d'
    
} > "$TEMP_FILE"

# 验证新文件
if [ ! -s "$TEMP_FILE" ]; then
    echo "Error: Generated file is empty. Restoring from backup..."
    cp "$BACKUP_FILE" "$PACKAGE_FILE"
    rm -f "$TEMP_FILE"
    exit 1
fi

# 检查文件完整性
if ! grep -q "let package = Package(" "$TEMP_FILE"; then
    echo "Error: Generated file is invalid. Restoring from backup..."
    cp "$BACKUP_FILE" "$PACKAGE_FILE"
    rm -f "$TEMP_FILE"
    exit 1
fi

# 更新文件
mv "$TEMP_FILE" "$PACKAGE_FILE"

echo "Successfully updated $PACKAGE_FILE"
echo "Backup saved as $BACKUP_FILE" 