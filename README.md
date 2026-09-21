# model-work-release

OpenSight public release artifacts for trusted OTA distribution.

OpenSight 可信 OTA 更新公开制品仓库。

## Scope

This repository publishes signed, immutable release artifacts built from
private OpenSight source repositories. It is a distribution endpoint, not a
source mirror.

当前仅发布 `model-work-node` 的正式 OTA 制品。这里是公开下载入口，不是私有源码镜像。

## Trust

- Release manifests are signed with the Ed25519 publisher in
  [`publisher.public.json`](publisher.public.json).
- Clients must pin the publisher key and approved HTTPS origins locally.
- Every artifact is bound to an exact source revision, size, and SHA-256 digest.
- GitHub transport does not replace manifest signature verification.

## License

Release artifacts remain proprietary unless an individual release explicitly
states otherwise. Public download availability does not grant source or
redistribution rights.
