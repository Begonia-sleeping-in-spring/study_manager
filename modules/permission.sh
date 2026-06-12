#!/bin/bash

SHARE_DIR="./share"

echo "========== 设置权限 =========="

find "$SHARE_DIR" -type d -exec chmod 755 {} \;

find "$SHARE_DIR" -type f -exec chmod 644 {} \;

echo "权限设置完成"
