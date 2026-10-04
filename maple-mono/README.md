# Maple Mono Cherr（NF · CN · unhinted）

基于 [Maple Mono](https://github.com/subframe7536/maple-font) v7.9 的个人定制版，字体名改成 `Cherr` 后缀以避免和上游原版混淆。

## 这版是什么

- **家族名**：`Maple Mono Cherr`（在 `config.json` 的 `family_name` 里设置，上游默认是 `Maple Mono`）
- **版本**：v7.9
- **NF**：Nerd Font 版，内置 Nerd Fonts 图标（lsd / starship / tmux 等终端图标靠它）
- **CN**：带中文字符，每个 ttf 约 20MB
- **unhinted**：不含 hinting，适合 Linux 上的 FreeType / 高分屏渲染
- 完整字体名（安装时选这个）：`Maple Mono Cherr NF CN`
- 成品 zip：`MapleMonoCherr-NF-CN-unhinted.zip`，16 个静态 ttf

> 注：OFL 未声明 Reserved Font Name，所以改名前也不违协议；改名纯粹是为了让字体列表里一眼看出这是自制版，而不是上游原版。

| 字重 | 正体 | 斜体 |
|------|------|------|
| Thin (100) | `MapleMonoCherr-NF-CN-Thin.ttf` | `MapleMonoCherr-NF-CN-ThinItalic.ttf` |
| ExtraLight (200) | `ExtraLight` | `ExtraLightItalic` |
| Light (300) | `Light` | `LightItalic` |
| Regular (400) | `Regular` | `Italic` |
| Medium (500) | `Medium` | `MediumItalic` |
| SemiBold (600) | `SemiBold` | `SemiBoldItalic` |
| Bold (700) | `Bold` | `BoldItalic` |
| ExtraBold (800) | `ExtraBold` | `ExtraBoldItalic` |

文件前缀由 patcher 按 `family_name` 生成，实际输出以重建结果为准。

## 安装

从本仓库的 `maple-mono-cherr-v7.9` tag 下载 zip，然后：

```bash
# 全部 16 个（解压后约 330MB）
mkdir -p ~/.local/share/fonts/MapleMonoCherr
unzip -j MapleMonoCherr-NF-CN-unhinted.zip '*.ttf' -d ~/.local/share/fonts/MapleMonoCherr
fc-cache -f

# 只要 4 个常用字重：把上面的 '*.ttf' 换成
#   'MapleMonoCherr-NF-CN-Regular.ttf' 'MapleMonoCherr-NF-CN-Italic.ttf'
#   'MapleMonoCherr-NF-CN-Bold.ttf' 'MapleMonoCherr-NF-CN-BoldItalic.ttf'

fc-list | grep -i cherr   # 验证
```

除此之外 zip 里还带 `LICENSE.txt`（OFL 1.1，版权归上游 Maple Mono）。安装后在终端 / 编辑器里把字体设为 `Maple Mono Cherr NF CN`（配置里也能写作 `MapleMonoCherr NF CN`），字重和斜体自动映射到这些文件。

## 配置文件的用途

- **`config.json`** — 构建配置：`family_name`（`Maple Mono Cherr`）、字重映射、`line_height`、`use_hinted`、`ligature` 开关，以及所有 OpenType 特性（cvXX / ssXX）的默认状态。
- **`patch-in-browser.json`** — 网页版 patcher 用的特性配置：这里把 `cv01`、`cv61`、`ss03` 以及连字 `calt` 保留为 `freeze`，其余为 `ignore`。

## 重建方式

用的是 **Maple Mono 网页版 patcher**（在浏览器里上传字体、套用配置生成），不依赖上游仓库的构建脚本。

> ⚠️ `~/Downloads/MapleMono-NF-CN-unhinted-patch.zip` 是改造前那一版，里面的 ttf 字体名仍是上游的 `Maple Mono NF CN`。要发布带自定义名的成品，得按下面重跑一次。

1. 到上游 `v7.9` release 取 `MapleMono-NF-CN-unhinted.zip`，套用 `config.json`。字体名改成 `Maple Mono Cherr`（即 `config.json` 现在里的 `family_name`）。
2. 特性按 `patch-in-browser.json` 取值：`cv01` / `cv61` / `ss03` / `calt` = `freeze`，其余 `ignore`。
3. 导出后压缩为 `MapleMonoCherr-NF-CN-unhinted.zip`。文件前缀会随 `family_name` 变成 `MapleMonoCherr-`，以 patcher 实际输出为准。

> 待补充：patcher 的具体页面 URL 记在这儿，方便下次直接打开。

## Release

Tag：`maple-mono-cherr-v7.9`，资产名 `MapleMonoCherr-NF-CN-unhinted.zip`。
