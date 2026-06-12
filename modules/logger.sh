#!/bin/bash

LOG_FILE="./logs/run.log"

echo "==================================" >> "$LOG_FILE"
echo "运行时间：$(date)" >> "$LOG_FILE"
echo "执行用户：$(whoami)" >> "$LOG_FILE"
echo "==================================" >> "$LOG_FILE"
