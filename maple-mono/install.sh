#!/usr/bin/env bash
# 安装 Maple Mono（NF · CN · unhinted patch）到用户字体目录
# 用法: ./install.sh          安装全部 16 个字重
#       MINIMAL=1 ./install.sh 只装 Regular / Italic / Bold / BoldItalic
#       ./install.sh --uninstall
set -euo pipefail

REPO="Cherrling/fonts"
TAG="maple-mono-v7.9"
ASSET="MapleMono-NF-CN-unhinted-patch.zip"
DEST="${HOME}/.local/share/fonts/MapleMono"

if [[ "${1:-}" == "--uninstall" ]]; then
  rm -rf "$DEST"
  fc-cache -f >/dev/null 2>&1 || true
  echo "🗑  已移除 $DEST"
  exit 0
fi

# ---------- 下载 ----------
URL="https://github.com/${REPO}/releases/download/${TAG}/${ASSET}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "⬇  $URL"
curl -fL# "$URL" -o "$TMP/maple.zip"

# ---------- 解压 ----------
mkdir -p "$DEST"
if [[ "${MINIMAL:-0}" == "1" ]]; then
  unzip -jo "$TMP/maple.zip" \
    "MapleMono-NF-CN-Regular.ttf" \
    "MapleMono-NF-CN-Italic.ttf" \
    "MapleMono-NF-CN-Bold.ttf" \
    "MapleMono-NF-CN-BoldItalic.ttf" \
    -d "$DEST" >/dev/null
else
  unzip -jo "$TMP/maple.zip" '*.ttf' -d "$DEST" >/dev/null
fi

# ---------- 注册字体 ----------
command -v fc-cache >/dev/null && fc-cache -f "$DEST" >/dev/null

echo "✅ 已安装 $(find "$DEST" -name '*.ttf' | wc -l) 个字体文件 -> $DEST"
echo "   字体名: MapleMono NF CN  (Bash 也可写 'Maple Mono NF CN')"
