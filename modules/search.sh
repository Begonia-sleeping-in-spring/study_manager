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

echo -n "请输入关键字："
read keyword

if [ -z "$keyword" ]; then
    echo
    echo "错误：关键字不能为空！"
    exit 1
fi

echo
echo "搜索中，请稍候……"
echo

count=0

# 用于避免重复输出
declare -A result_map

while read -r file
do

    filename=$(basename "$file")

    # 跳过隐藏文件
    [[ "$filename" == .* ]] && continue

    matched=0

    # ---------- 文件名搜索 ----------
    if echo "$filename" | grep -iq "$keyword"; then
        matched=1
    fi

    # ---------- 文本文件内容搜索 ----------
    case "$filename" in
        *.txt|*.c|*.cpp|*.java|*.py|*.sh|*.md)

            if grep -qi "$keyword" "$file" 2>/dev/null; then
                matched=1
            fi

            ;;
    esac

    # ---------- 输出 ----------
    if [ "$matched" -eq 1 ]; then

        if [ -z "${result_map[$file]}" ]; then

            count=$((count + 1))

            result_map["$file"]=1

            echo "[$count]"
            echo "$file"
            echo

        fi

    fi

done < <(find "$SHARE_DIR" -type f)

echo "----------------------------------------"

if [ "$count" -eq 0 ]; then

    echo "未找到关键字 \"$keyword\" 相关资源。"

else

    echo "共找到 $count 个匹配文件。"

fi

echo "========================================"
