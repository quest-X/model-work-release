# model-work-release

**中文** | [English](README_EN.md)

OpenSight 系列公开版本索引与经审查的公开制品仓库。

## 范围

每次 Release 都列出完整的 `model-work-*` 组件版本。各组件保留独立版本号。
私有组件只公开必要的版本元数据，不会在这里发布源码、安装包、下载地址、凭证或内部配置。

## 版本

- 仓库标签是连续的 OpenSight 套件版本。
- 组件版本保持独立。
- 未变化的组件仍列入清单并标记为 `unchanged`。
- 已发布清单如需修改，必须使用新的套件版本。

## 信任

- 套件清单使用 [`suite.publisher.public.json`](suite.publisher.public.json)
  中的 Ed25519 发布者公钥验证。
- 客户端必须在本地固定发布者公钥和获准的 HTTPS 来源。
- 公开制品必须绑定准确的文件大小和 SHA-256 摘要。
- GitHub 传输不能替代清单签名验证。

## 安全

完整规则见 [`SECURITY.md`](SECURITY.md)。无法确认适合公开分发时，默认不上传。

## 许可

本仓库中的版本元数据不授予私有组件的访问权。公开制品的分发条件以对应版本说明为准。
