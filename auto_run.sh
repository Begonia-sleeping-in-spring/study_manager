#!/bin/bash

while true
do
    clear

    echo "========================================="
    echo " Linux 学习资源共享管理工具 v1.0"
    echo "========================================="
    echo
    echo "1. 学习资源自动分类"
    echo "2. 批量重命名文件"
    echo "3. 配置共享目录权限"
    echo "4. 检测并删除重复文件"
    echo "5. 关键字搜索资源"
    echo "6. 清理30天以上过期文件"
    echo "0. 退出"
    echo

    read -p "请选择：" choice

    case $choice in

    1)
        ./modules/classify.sh
        ;;

    2)
        ./modules/rename.sh
        ;;

    3)
        ./modules/permission.sh
        ;;

    4)
        ./modules/duplicate.sh
        ;;

    5)
        ./modules/search.sh
        ;;
    6)
        ./modules/clean.sh
        ;;

    0)
        echo
        echo "程序退出。"
        exit 0
        ;;

    *)
        echo
        echo "输入错误，请重新选择。"
        ;;
    esac

    echo
    read -p "按回车键返回主菜单..."
done
