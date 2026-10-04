# fonts

我自己的字体构建配置。字体文件不放进仓库，只保留**构建配置**，成品 zip 传到 **GitHub Releases**。

## 已收录

| 字体 | 版本 | Release tag |
|------|------|--------------|
| [maple-mono](./maple-mono/) | v7.9 · NF · CN · unhinted | `maple-mono-v7.9` |

## 目录约定

以后新增字体，照这个结构建独立子目录：

```
fonts/
├── README.md
└── <字体名>/
    ├── README.md    # 该字体的说明：怎么构建、字体名怎么选、装在哪
    └── config.json  # 构建配置 + 该字体专有的配置文件
```

每个字体一个独立 tag，约定 tag 名 = `<字体目录名>-<版本>`，例如 `maple-mono-v7.9`。

## 发布

```bash
cd ~/code/fonts
git add -A && git commit -m "..."

git tag maple-mono-v7.9
git push origin main --tags
gh release create maple-mono-v7.9 MapleMono-NF-CN-unhinted-patch.zip \
  --title "Maple Mono NF CN unhinted (v7.9)"
```

不要用 `releases/latest/download` 下载——多个字体共存时 `latest` 只会指向最后一个发布的 release，要按 tag 取。
