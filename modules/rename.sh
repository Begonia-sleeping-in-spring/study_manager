#!/bin/bash

# ===================================
# Linux 学习资源共享管理工具
# 模块：批量重命名
# Version: v0.3
# ===================================

SHARE_DIR="./share"
PREFIX="Linux课程_"

echo "========== 开始批量重命名 =========="

# 遍历 share 下所有普通文件
find "$SHARE_DIR" -type f | while read -r file
do
    filename=$(basename "$file")
    dirname=$(dirname "$file")

    # 如果已经有前缀，则跳过
    if [[ "$filename" == ${PREFIX}* ]]; then
        echo "跳过：$filename"
        continue
    fi

    new_name="${PREFIX}${filename}"

    mv "$file" "$dirname/$new_name"

    echo "$filename -> $new_name"
done

echo "========== 重命名完成 =========="
