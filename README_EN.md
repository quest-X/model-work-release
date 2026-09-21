# model-work-release

[中文](README.md) | **English**

OpenSight public release artifacts for trusted OTA distribution.

## Scope

This repository publishes signed, immutable release artifacts built from
private OpenSight source repositories. It is a distribution endpoint, not a
source mirror.

Only official `model-work-node` OTA artifacts are currently published. This is
a public download endpoint, not a private source mirror.

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
