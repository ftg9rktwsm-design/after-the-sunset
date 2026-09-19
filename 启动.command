#!/bin/bash
# 日落之后 · 第一幕 —— 双击即玩（会打开一个终端窗口作为本地服务）
cd "$(dirname "$0")" || exit 1
PORT=8787

# 如果端口上已有服务在跑，就直接打开页面
if ! curl -s -o /dev/null "http://localhost:$PORT/"; then
  python3 -m http.server "$PORT" >/dev/null 2>&1 &
fi

sleep 0.6
open "http://localhost:$PORT/"
echo ""
echo "  日落之后 · 第一幕 已在浏览器打开: http://localhost:$PORT/"
echo "  关闭此终端窗口即停止服务"
echo ""
wait
