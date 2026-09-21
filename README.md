# model-work-release

OpenSight public suite release index and approved public artifacts.

OpenSight 系列公开版本索引与经审查的公开制品仓库。

## Scope

Each release describes the complete `model-work-*` suite while every component
keeps its own version. Private components are recorded as version metadata only;
their source, packages, download locations, credentials, and internal
configuration are not published here.

每次 Release 都列出完整的 `model-work-*` 组件版本。私有组件只公开必要的版本元数据，
不会在这里发布源码、安装包、下载地址、凭证或内部配置。

## Versioning

- Repository tags are consecutive OpenSight suite versions.
- Component versions remain independent.
- Unchanged components remain listed and are marked `unchanged`.
- A new suite tag is required for any published manifest change.

## Trust

- Suite manifests are signed with the Ed25519 publisher in
  [`publisher.public.json`](publisher.public.json).
- Clients must pin the publisher key and approved HTTPS origins locally.
- Public artifacts must have an exact size and SHA-256 digest.
- GitHub transport does not replace manifest signature verification.

## Security

See [`SECURITY.md`](SECURITY.md). When public safety is uncertain, the artifact
is not published.

## License

Metadata in this repository does not grant access to private components.
Individual public artifacts state their own distribution terms.
