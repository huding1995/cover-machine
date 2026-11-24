#!/usr/bin/env bash
# 封面机 · 做封面 —— 一键安装到本机 WorkBuddy 技能目录
# 用法：bash install.sh        （Windows 用 Git Bash；macOS / Linux 直接跑）
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${HOME}/.workbuddy/skills"

echo "源目录：$HERE"
echo "安装到：$DEST"
mkdir -p "$DEST"

for s in "$HERE"/skills/*/; do
  name="$(basename "$s")"
  echo "  → 安装技能：$name"
  rm -rf "$DEST/$name"
  cp -r "$s" "$DEST/$name"
done

echo
echo "✅ 安装完成。"
echo "下一步："
echo "  1) 重启 WorkBuddy（技能在启动时加载）"
echo "  2) 对话里说「封面机」或「做封面」即可"
echo
echo "提示：presets.json 是各本书的预设文案和轮换指针，不要删；"
echo "      换电脑后它会把之前的预设一起带过来，接着上次的进度继续。"
