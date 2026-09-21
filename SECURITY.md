# Public release security

`model-work-release` is public. Every tracked file, release note, manifest, and
asset must be safe for anonymous access.

## Never publish

- Private source code or source archives
- Private wheels, containers, packages, or source maps
- Private keys, tokens, passwords, credentials, or private certificates
- Customer configuration, internal addresses, topology, or sensitive logs
- Restricted model weights or dependencies without redistribution permission
- Private artifact URLs, storage paths, or access instructions

## Allowed after review

- Component names and approved version identifiers
- Public commit identifiers needed for traceability
- Public changelog summaries and compatibility statements
- Checksums and signatures for approved public artifacts
- Publisher public keys

## Release gate

Before upload, inspect the unpacked artifact, scan for secrets and configuration,
review dependency licenses, and verify the final file list. If any item cannot
be confirmed safe for public distribution, keep it in the private delivery
channel.

Signing keys remain outside this repository. Only signatures and public keys
may be committed or attached to a release.
