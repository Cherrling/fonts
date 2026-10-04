# fonts

我自己的字体构建配置与一键安装脚本。字体文件不放在仓库里，只把**构建配置**入库，成品 zip 传到 **GitHub Releases**。

## 已收录

| 字体 | 版本 | 安装 |
|------|------|------|
| [maple-mono](./maple-mono/) | v7.9 · NF · CN · unhinted | `./install.sh maple-mono` |

## 一键安装

```bash
# 只安装某个字体（默认装全部字重，共 16 个 ttf）
./install.sh maple-mono

# 只要 4 个常用字重：Regular / Italic / Bold / BoldItalic
MINIMAL=1 ./install.sh maple-mono

# 卸载（只是删掉复制进字体目录的文件）
./install.sh maple-mono --uninstall
```

不带参数运行 `./install.sh` 会列出所有可安装的字体。

远程直接用（不克隆仓库）：

```bash
curl -fsSL https://raw.githubusercontent.com/Cherrling/fonts/main/maple-mono/install.sh | bash
```

## 目录约定

以后新增字体时照这个结构建子目录：

```
fonts/
├── install.sh              # 分发脚本：./install.sh <字体目录> [--uninstall]
├── README.md               # 本文件：字体清单
└── <字体名>/
    ├── README.md           # 该字体用到的配置、构建方式、字体名怎么选
    ├── config.json         # 构建配置
    ├── install.sh          # 从本仓库对应 release tag 下载并安装
    └── (其他该字体专有的配置文件)
```

**每个字体一个独立 tag**，约定 tag 名 = `<字体目录名>-<版本>`，例如 `maple-mono-v7.9`。
不要用 `releases/latest/download`——多个字体共存时 `latest` 只会指向最后一个发布的 release。

## 发布流程

```bash
cd ~/code/fonts
git add -A && git commit -m "..."

# 打 tag 并上传成品 zip
git tag maple-mono-v7.9
git push origin main --tags
gh release create maple-mono-v7.9 MapleMono-NF-CN-unhinted-patch.zip \
  --title "Maple Mono v7.9 (NF · CN · unhinted · patched)" \
  --notes "Maple Mono v7.9 patched 配置构建，含 Nerd Font 图标 + 中文 + 无 hinting。"
```

## 协议

每个字体遵循各自上游协议（Maple Mono 为 SIL OFL 1.1），仓库内仅保存构建配置与下载脚本；重分发的字体 zip 保持上游 LICENSE 原样。
