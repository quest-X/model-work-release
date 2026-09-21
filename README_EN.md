# model-work-release

[中文](README.md) | **English**

OpenSight unified-suite release index and approved public artifacts.

## Scope

Each `model-work-*` repository publishes normal releases under its own version.
This repository is used only for an explicitly requested unified release, such
as a major OpenSight or OTA suite. Private components are recorded as necessary
version metadata only; their source, private packages, download locations,
credentials, and internal configuration are not published here.

## Versioning

- OpenSight suite versions start at `v0.0.1` and advance independently.
- Component repository versions remain independent.
- Normal component releases do not automatically create suite versions.
- A suite tag and Release are created only after explicit authorization.
- No unified suite version is currently published.

## Installers

Each unified suite release lists only installers that have been built, tested,
and approved for public distribution. Only files actually attached to a Release
are downloadable artifacts.

## Trust

- Suite manifests are signed with the Ed25519 publisher in
  [`suite.publisher.public.json`](suite.publisher.public.json).
- Clients must pin the publisher key and approved HTTPS origins locally.
- Public artifacts must have an exact size and SHA-256 digest.
- GitHub transport does not replace manifest signature verification.

## Security

See [`SECURITY.md`](SECURITY.md). When public safety is uncertain, the artifact
is not published.

## License

Metadata in this repository does not grant access to private components.
Individual public artifacts state their own distribution terms.
