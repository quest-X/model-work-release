# model-work-release

**中文** | [English](README_EN.md)

OpenSight 可信 OTA 更新公开制品仓库。

## 范围

本仓库发布由 OpenSight 私有源码仓库构建、经过签名且不可变的发行制品。这里是分发端点，不是源码镜像。

当前仅发布 `model-work-node` 的正式 OTA 制品。这里是公开下载入口，不是私有源码镜像。

## 信任

- 发行清单使用 [`publisher.public.json`](publisher.public.json)
  中的 Ed25519 发布者密钥签名。
- 客户端必须在本地固定发布者密钥和获准的 HTTPS 来源。
- 每个制品均绑定到准确的源码修订、文件大小和 SHA-256 摘要。
- GitHub 传输不能替代对清单签名的验证。

## 许可

除非具体发行版本另有明确说明，发行制品仍为专有内容。公开下载不授予源码访问或再分发权利。
