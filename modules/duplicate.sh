#!/bin/bash

# ===================================
# Linux 学习资源共享管理工具
# 模块：重复文件检测（MD5）
# Version: v0.4
# ===================================

SHARE_DIR="./share"

echo "========== 开始检测重复文件 =========="

declare -A md5_map

while read -r file
do
    filename=$(basename "$file")

    # 跳过隐藏文件
    [[ "$filename" == .* ]] && continue

    # 跳过空文件
    [ ! -s "$file" ] && continue

    md5=$(md5sum "$file" | awk '{print $1}')

    if [[ -n "${md5_map[$md5]}" ]]; then
        echo "发现重复文件："
        echo "  原文件：${md5_map[$md5]}"
        echo "  重复文件：$file"
        echo
    else
        md5_map["$md5"]="$file"
    fi

done < <(find "$SHARE_DIR" -type f)

echo "========== 检测完成 =========="
