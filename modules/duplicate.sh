#!/bin/bash

# ===================================
# Linux 学习资源共享管理工具
# 模块：重复文件检测（MD5）
# Version: v0.5.1
# ===================================

SHARE_DIR="./share"

echo "========== 开始检测重复文件 =========="

declare -A md5_map

while read -r file
do
    filename=$(basename "$file")

    # 跳过隐藏文件（如 .gitkeep）
    [[ "$filename" == .* ]] && continue

    # 跳过空文件
    [ ! -s "$file" ] && continue

    # 计算 MD5
    md5=$(md5sum "$file" | awk '{print $1}')

    # 如果已经存在相同 MD5，则认为是重复文件
    if [[ -n "${md5_map[$md5]}" ]]; then

        echo
        echo "========================================"
        echo "发现重复文件："
        echo
        echo "① 保留文件："
        echo "   ${md5_map[$md5]}"
        echo
        echo "② 待删除文件："
        echo "   $file"
        echo

        echo -n "是否删除②（y/n）: "
        read answer </dev/tty

        if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
            rm -f "$file"
            echo
            echo "✓ 已删除：$file"
        else
            echo
            echo "✓ 已保留：$file"
        fi

        echo "========================================"

    else

        # 首次出现该 MD5，记录下来
        md5_map["$md5"]="$file"

    fi

done < <(find "$SHARE_DIR" -type f)

echo
echo "========== 检测完成 =========="
