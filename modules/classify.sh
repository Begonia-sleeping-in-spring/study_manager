#!/bin/bash

# 学习资源自动分类模块

SHARE_DIR="./share"

echo "========== 开始分类 =========="

# 遍历 share 根目录下所有普通文件
for file in "$SHARE_DIR"/*
do
    # 如果不是普通文件，则跳过
    [ -f "$file" ] || continue

    filename=$(basename "$file")

    case "$filename" in

        *.pdf|*.ppt|*.pptx)
            mv "$file" "$SHARE_DIR/课件资料/"
            echo "$filename -> 课件资料"
            ;;

        *.c|*.cpp|*.java|*.py|*.sh)
            mv "$file" "$SHARE_DIR/实验代码/"
            echo "$filename -> 实验代码"
            ;;

        *.doc|*.docx|*.txt)
            mv "$file" "$SHARE_DIR/作业文件/"
            echo "$filename -> 作业文件"
            ;;

        *)
            mv "$file" "$SHARE_DIR/未知文件/"
            echo "$filename -> 未知文件"
            ;;

    esac

done

echo "========== 分类完成 =========="
