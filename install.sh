#!/usr/bin/env bash
# 分发安装：./install.sh <字体目录> [--uninstall]
# 不带参数会列出全部可安装字体。
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT="${1:-}"

list_fonts() {
  echo "可安装字体："
  for d in "$ROOT"/*/; do
    [[ -f "${d}install.sh" ]] || continue
    printf '  - %s\n' "$(basename "$d")"
  done
  echo
  echo "用法: ./install.sh <字体目录> [--uninstall]"
}

if [[ -z "$FONT" || "$FONT" == "-h" || "$FONT" == "--help" ]]; then
  list_fonts
  exit 0
fi

if [[ ! -f "$ROOT/$FONT/install.sh" ]]; then
  echo "❌ 找不到字体: $FONT" >&2
  list_fonts >&2
  exit 1
fi

exec bash "$ROOT/$FONT/install.sh" "${2:-}"
