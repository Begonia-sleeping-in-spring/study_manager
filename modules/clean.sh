#!/bin/bash

SHARE_DIR="./share"
BACKUP_DIR="./backup"

echo "========== 开始清理 =========="

find "$SHARE_DIR" -type f -mtime +30 | while read file
do

    filename=$(basename "$file")

    cp "$file" "$BACKUP_DIR/"

    rm "$file"

    echo "已清理：$filename"

done

echo "========== 清理完成 =========="
