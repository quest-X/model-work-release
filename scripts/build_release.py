#!/usr/bin/env python3
import argparse
import base64
import hashlib
import json
import shutil
from pathlib import Path

from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey

VERSION = "0.0.1"
PURPOSE = "opensight.installer-manifest.v1"

SHELL_ASSETS = (
    ("Linux", "x64 / ARM64", f"OpenSight-Installer-v{VERSION}-linux.sh"),
    ("macOS Intel", "x64", f"OpenSight-Installer-v{VERSION}-macos-x64.command"),
    ("macOS Apple silicon", "ARM64", f"OpenSight-Installer-v{VERSION}-macos-arm64.command"),
    ("NVIDIA Jetson Linux", "ARM64", f"OpenSight-Installer-v{VERSION}-jetson.sh"),
)
WINDOWS_ASSET = ("Windows 10/11", "x64 / ARM64", f"OpenSight-Installer-v{VERSION}-windows.ps1")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--private-key", type=Path, required=True)
    args = parser.parse_args()

    root = Path(__file__).resolve().parent.parent
    dist = root / "dist" / f"v{VERSION}"
    shutil.rmtree(dist, ignore_errors=True)
    dist.mkdir(parents=True)

    shell_source = root / "installer" / "opensight-installer.sh"
    windows_source = root / "installer" / WINDOWS_ASSET[2]

    entries = []
    for platform, architecture, filename in SHELL_ASSETS:
        target = dist / filename
        shutil.copy2(shell_source, target)
        target.chmod(0o755)
        entries.append((platform, architecture, target))

    windows_target = dist / WINDOWS_ASSET[2]
    shutil.copy2(windows_source, windows_target)
    entries.insert(3, (WINDOWS_ASSET[0], WINDOWS_ASSET[1], windows_target))

    artifacts = [
        {
            "platform": platform,
            "architecture": architecture,
            "filename": path.name,
            "sha256": sha256(path),
            "size": path.stat().st_size,
            "status": "preview",
        }
        for platform, architecture, path in entries
    ]
    manifest = {
        "schema": 1,
        "purpose": PURPOSE,
        "installer_version": VERSION,
        "release_channel": "preview",
        "features": [
            "component multi-select",
            "frontend main/commercial channel selection",
            "installation plan confirmation",
        ],
        "artifacts": artifacts,
    }
    manifest_path = dist / "installer.json"
    manifest_bytes = (json.dumps(manifest, ensure_ascii=False, indent=2) + "\n").encode()
    manifest_path.write_bytes(manifest_bytes)

    private_key = serialization.load_pem_private_key(args.private_key.read_bytes(), password=None)
    signature = private_key.sign(manifest_bytes)
    signature_record = {
        "algorithm": "Ed25519",
        "purpose": PURPOSE,
        "signature": base64.urlsafe_b64encode(signature).decode(),
    }
    (dist / "installer.json.sig").write_text(
        json.dumps(signature_record, indent=2) + "\n", encoding="utf-8"
    )

    public_record = json.loads((root / "installer.publisher.public.json").read_text())
    public_key = Ed25519PublicKey.from_public_bytes(
        base64.urlsafe_b64decode(public_record["public_key"])
    )
    public_key.verify(signature, manifest_bytes)
    shutil.copy2(root / "installer.publisher.public.json", dist)

    checksum_files = sorted(path for path in dist.iterdir() if path.name != "SHA256SUMS")
    checksum_text = "".join(f"{sha256(path)}  {path.name}\n" for path in checksum_files)
    (dist / "SHA256SUMS").write_text(checksum_text, encoding="utf-8")

    print(dist)


if __name__ == "__main__":
    main()

