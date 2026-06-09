#!/bin/bash

echo "正在创建项目目录结构..."

# 创建目录
mkdir -p modules
mkdir -p logs
mkdir -p backup

mkdir -p share/课件资料
mkdir -p share/实验代码
mkdir -p share/作业文件
mkdir -p share/复习资料
mkdir -p share/未知文件

# 创建日志文件
touch logs/run.log

# 创建主脚本
touch auto_run.sh
touch config.sh

# 创建模块脚本
touch modules/classify.sh
touch modules/rename.sh
touch modules/permission.sh
touch modules/logger.sh
touch modules/clean.sh

# 给脚本添加执行权限
chmod +x auto_run.sh
chmod +x modules/*.sh

echo "项目初始化完成！"
