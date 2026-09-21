# model-work-release

**中文** | [English](README_EN.md)

OpenSight 一键安装器的公开发布仓库。

## 范围

各 `model-work-*` 子仓库继续按自身版本正常发布 Release。本仓库发布公开
安装器、签名清单和校验文件；安装器可选择需要的组件，并在授权后获取私有制品。
这里不会发布私有源码、私有安装包、下载地址、凭证或内部配置。

## 版本

- OpenSight 安装器版本从 `v0.0.1` 开始，并独立连续递增。
- 子仓库版本保持独立，普通子仓库发版不会自动生成安装器版本。
- 只有安装流程、兼容范围或 OTA 能力需要更新时才发布新安装器。

## 安装包

Release 中提供 Linux、macOS、Windows 和 NVIDIA Jetson Linux 安装入口。
安装器支持组件多选，以及 Frontend `main` / `commercial` 通道选择。

## 信任

- 安装器清单使用 [`installer.publisher.public.json`](installer.publisher.public.json)
  中的 Ed25519 发布者公钥验证。
- 客户端必须在本地固定发布者公钥和获准的 HTTPS 来源。
- 公开制品必须绑定准确的文件大小和 SHA-256 摘要。
- GitHub 传输不能替代清单签名验证。

## 安全

完整规则见 [`SECURITY.md`](SECURITY.md)。无法确认适合公开分发时，默认不上传。

## 许可

本仓库中的版本元数据不授予私有组件的访问权。公开制品的分发条件以对应版本说明为准。
