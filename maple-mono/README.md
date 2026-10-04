# Maple Mono（NF · CN · unhinted patch）

个人定制的 [Maple Mono](https://github.com/subframe7536/maple-font) 构建。

## 这版是什么

- **版本**：v7.9
- **NF**：Nerd Font 版，内置 Nerd Fonts 图标（lsd / starship / tmux 等终端图标靠它）
- **CN**：带中文字符，每个 ttf 约 20MB
- **unhinted**：不含 hinting，适合 Linux 上的 FreeType / 高分屏渲染
- **字体名**：`MapleMono NF CN`
- 成品：`MapleMono-NF-CN-unhinted-patch.zip`，16 个静态 ttf

| 字重 | 正体 | 斜体 |
|------|------|------|
| Thin (100) | `MapleMono-NF-CN-Thin.ttf` | `MapleMono-NF-CN-ThinItalic.ttf` |
| ExtraLight (200) | `ExtraLight` | `ExtraLightItalic` |
| Light (300) | `Light` | `LightItalic` |
| Regular (400) | `Regular` | `Italic` |
| Medium (500) | `Medium` | `MediumItalic` |
| SemiBold (600) | `SemiBold` | `SemiBoldItalic` |
| Bold (700) | `Bold` | `BoldItalic` |
| ExtraBold (800) | `ExtraBold` | `ExtraBoldItalic` |

## 安装

从本仓库的 `maple-mono-v7.9` tag 下载 zip，然后：

```bash
# 全部 16 个（解压后约 330MB）
mkdir -p ~/.local/share/fonts/MapleMono
unzip -j MapleMono-NF-CN-unhinted-patch.zip '*.ttf' -d ~/.local/share/fonts/MapleMono
fc-cache -f

# 只要 4 个常用字重：把上面的 '*.ttf' 换成
#   'MapleMono-NF-CN-Regular.ttf' 'MapleMono-NF-CN-Italic.ttf'
#   'MapleMono-NF-CN-Bold.ttf' 'MapleMono-NF-CN-BoldItalic.ttf'

fc-list | grep -i maple   # 验证
```

除此之外 zip 里还带 `LICENSE.txt`（OFL 1.1）。安装后在终端 / 编辑器里把字体设为 `MapleMono NF CN`，字重和斜体自动映射到这些文件。

## 配置文件的用途

- **`config.json`** — 构建配置：`family_name`、字重映射、`line_height`、`use_hinted`、`ligature` 开关，以及所有 OpenType 特性（cvXX / ssXX）的默认状态。
- **`patch-in-browser.json`** — 网页版 patcher 用的特性配置：这里把 `cv01`、`cv61`、`ss03` 以及连字 `calt` 保留为 `freeze`，其余为 `ignore`。

## 重建方式

用的是 **Maple Mono 网页版 patcher**（在浏览器里上传字体、套用配置生成），不依赖上游仓库的构建脚本。步骤：

1. 到上游 `v7.9` release 取 `MapleMono-NF-CN-unhinted.zip`（本次成品即基于它）。
2. 打开上游的网页 patcher，把打法配置设为 `patch-in-browser.json` 中的取值（cv01 / cv61 / ss03 / calt = `freeze`，其余 `ignore`）。
3. 导出后按原 zip 的文件命名保持 `MapleMono-NF-CN-<字重>[Italic].ttf`，压缩为 `MapleMono-NF-CN-unhinted-patch.zip`。

> 待补充：patcher 的具体页面 URL 记在这儿，方便下次直接打开。

## Release

Tag：`maple-mono-v7.9`
