# model-work-release

[中文](README.md) | **English**

Public releases for the OpenSight one-click installer.

## Scope

Each `model-work-*` repository continues to publish its own releases. This
repository publishes the public installer, signed manifest, and checksums. The
installer selects components and obtains private artifacts only after
authorization. Private source, packages, download locations, credentials, and
internal configuration are not published here.

## Versioning

- OpenSight installer versions start at `v0.0.1` and advance independently.
- Component repository versions remain independent.
- Normal component releases do not automatically create installer versions.
- A new installer is released only when installation flow, compatibility, or
  OTA behavior changes.

## Installers

Releases provide entry points for Linux, macOS, Windows, and NVIDIA Jetson
Linux. The installer supports component multi-select and Frontend `main` /
`commercial` channel selection.

## Trust

- Installer manifests are signed with the Ed25519 publisher in
  [`installer.publisher.public.json`](installer.publisher.public.json).
- Clients must pin the publisher key and approved HTTPS origins locally.
- Public artifacts must have an exact size and SHA-256 digest.
- GitHub transport does not replace manifest signature verification.

## Security

See [`SECURITY.md`](SECURITY.md). When public safety is uncertain, the artifact
is not published.

## License

Metadata in this repository does not grant access to private components.
Individual public artifacts state their own distribution terms.
