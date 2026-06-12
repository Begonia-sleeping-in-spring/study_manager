#!/bin/bash

# ===================================
# Linux 学习资源共享管理工具
# 模块：关键字搜索
# Version: v0.6
# ===================================

SHARE_DIR="./share"

echo "========================================"
echo "      学习资源关键字搜索模块"
echo "========================================"
echo

# 输入关键字
echo -n "请输入关键字："
read keyword

# 判断是否为空
if [ -z "$keyword" ]; then
    echo
    echo "错误：关键字不能为空！"
    exit 1
fi

echo
echo "正在搜索，请稍候……"
echo

count=0

while read -r file
do
    filename=$(basename "$file")

    # 跳过隐藏文件
    [[ "$filename" == .* ]] && continue

    # 文件名包含关键字（忽略大小写）
    if echo "$filename" | grep -iq "$keyword"; then

        count=$((count + 1))

        echo "[$count]"
        echo "$file"
        echo

    fi

done < <(find "$SHARE_DIR" -type f)

echo "----------------------------------------"

if [ "$count" -eq 0 ]; then
    echo "未找到包含关键字 \"$keyword\" 的学习资源。"
else
    echo "共找到 $count 个匹配文件。"
fi

echo "========================================"
