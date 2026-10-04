# Maple Mono（NF · CN · unhinted patch）

个人定制的 [Maple Mono](https://github.com/MapleMono/MapleMono) 构建。

## 这版是什么

- **版本**：v7.9
- **NF**：Nerd Font 版，内置 Nerd Fonts 图标（适配 lsd / starship / tmux / 各类终端图标）
- **CN**：带中文字符版本，每个 ttf 约 20MB
- **unhinted**：不含 hinting，适合 Linux 上的 FreeType/高分屏渲染
- **字体名**：`MapleMono NF CN`

包含 8 个字重 × 正/斜体共 16 个 ttf：

| 字重 | 正体 | 斜体 |
|------|------|------|
| Thin (100) | `Thin.ttf` | `ThinItalic.ttf` |
| ExtraLight (200) | `ExtraLight.ttf` | `ExtraLightItalic.ttf` |
| Light (300) | `Light.ttf` | `LightItalic.ttf` |
| Regular (400) | `MapleMono-NF-CN-Regular.ttf` | `MapleMono-NF-CN-Italic.ttf` |
| Medium (500) | `Medium.ttf` | `MediumItalic.ttf` |
| SemiBold (600) | `SemiBold.ttf` | `SemiBoldItalic.ttf` |
| Bold (700) | `Bold.ttf` | `BoldItalic.ttf` |
| ExtraBold (800) | `ExtraBold.ttf` | `ExtraBoldItalic.ttf` |

## 安装

```bash
./install.sh            # 全装 16 个（约 330MB）
MINIMAL=1 ./install.sh  # 只装 Regular / Italic / Bold / BoldItalic
./install.sh --uninstall
```

安装位置 `~/.local/share/fonts/MapleMono`。在终端 / 编辑器里把字体设为 `MapleMono NF CN` 即可，字重和斜体会自动映射。

## 构建配置

- **`config.json`** — 构建配置：family_name、字重映射、line_height、是否 hinted、连字开关，以及所有 OpenType 特性（cvXX / ssXX）的默认状态。
- **`patch-in-browser.json`** — 同一套特性的另一种取值形式（`freeze` 代替 `ignore`，并补上 `calt`），用于 Maple Mono 的网页 patcher。

两份配置都已入库，重新构建时按实际用的构建方式取对应文件即可（`config.json` 对 CLI 构建，`patch-in-browser.json` 对浏览器 patcher）。产物命名保持一致：
`MapleMono-NF-CN-unhinted-patch.zip`。

## Release

Tag：`maple-mono-v7.9`

```bash
gh release create maple-mono-v7.9 MapleMono-NF-CN-unhinted-patch.zip \
  --title "Maple Mono NF CN unhinted (v7.9)"
```
