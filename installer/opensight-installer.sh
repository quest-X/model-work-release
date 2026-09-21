#!/usr/bin/env bash
set -euo pipefail

VERSION="0.0.1"
COMPONENTS=""
FRONTEND_CHANNEL=""
ASSUME_YES=0

usage() {
  cat <<'EOF'
OpenSight Installer v0.0.1

Usage:
  ./opensight-installer.sh [options]

Options:
  --components LIST          Comma-separated: frontend,backend,node,extension,monitor
  --frontend-channel VALUE  main or commercial
  --yes                      Skip the final confirmation
  --help                     Show this help
EOF
}

detect_platform() {
  local os arch
  os="$(uname -s)"
  arch="$(uname -m)"

  case "$os" in
    Linux)
      if [[ -f /etc/nv_tegra_release ]]; then
        PLATFORM="NVIDIA Jetson Linux"
      else
        PLATFORM="Linux"
      fi
      ;;
    Darwin) PLATFORM="macOS" ;;
    *) echo "Unsupported operating system: $os" >&2; exit 2 ;;
  esac

  case "$arch" in
    x86_64|amd64) ARCHITECTURE="x64" ;;
    arm64|aarch64) ARCHITECTURE="ARM64" ;;
    *) echo "Unsupported architecture: $arch" >&2; exit 2 ;;
  esac
}

validate_asset_target() {
  case "$(basename "$0")" in
    *-linux.sh)
      [[ "$PLATFORM" == "Linux" ]] || {
        echo "This installer is for standard Linux. Detected: $PLATFORM" >&2
        exit 2
      }
      ;;
    *-macos-x64.command)
      [[ "$PLATFORM" == "macOS" && "$ARCHITECTURE" == "x64" ]] || {
        echo "This installer is for macOS Intel (x64). Detected: $PLATFORM $ARCHITECTURE" >&2
        exit 2
      }
      ;;
    *-macos-arm64.command)
      [[ "$PLATFORM" == "macOS" && "$ARCHITECTURE" == "ARM64" ]] || {
        echo "This installer is for macOS Apple silicon (ARM64). Detected: $PLATFORM $ARCHITECTURE" >&2
        exit 2
      }
      ;;
    *-jetson.sh)
      [[ "$PLATFORM" == "NVIDIA Jetson Linux" ]] || {
        echo "This installer is for NVIDIA Jetson Linux. Detected: $PLATFORM" >&2
        exit 2
      }
      ;;
  esac
}

normalize_components() {
  local raw item normalized=""
  raw="${1// /}"
  IFS=',' read -r -a selected <<< "$raw"
  for item in "${selected[@]}"; do
    case "$item" in
      1|frontend) item="frontend" ;;
      2|backend) item="backend" ;;
      3|node) item="node" ;;
      4|extension) item="extension" ;;
      5|monitor) item="monitor" ;;
      *) echo "Unknown component: $item" >&2; exit 2 ;;
    esac
    if [[ ",$normalized," != *",$item,"* ]]; then
      normalized="${normalized:+$normalized,}$item"
    fi
  done
  [[ -n "$normalized" ]] || { echo "Select at least one component." >&2; exit 2; }
  COMPONENTS="$normalized"
}

has_component() {
  [[ ",$COMPONENTS," == *",$1,"* ]]
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --components)
      [[ $# -ge 2 ]] || { echo "--components requires a value" >&2; exit 2; }
      COMPONENTS="$2"
      shift 2
      ;;
    --frontend-channel)
      [[ $# -ge 2 ]] || { echo "--frontend-channel requires a value" >&2; exit 2; }
      FRONTEND_CHANNEL="$2"
      shift 2
      ;;
    --yes) ASSUME_YES=1; shift ;;
    --help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

detect_platform
validate_asset_target

echo "OpenSight 一键安装器 v$VERSION"
echo "OpenSight Installer v$VERSION"
echo
echo "平台 / Platform: $PLATFORM"
echo "架构 / Architecture: $ARCHITECTURE"
echo

if [[ -z "$COMPONENTS" ]]; then
  echo "选择组件（可多选，用逗号分隔）/ Select components:"
  echo "  1. Frontend"
  echo "  2. Backend"
  echo "  3. Node"
  echo "  4. Extension"
  echo "  5. Monitor"
  read -r -p "> " COMPONENTS
fi
normalize_components "$COMPONENTS"

if has_component frontend; then
  if [[ -z "$FRONTEND_CHANNEL" ]]; then
    echo
    echo "选择 Frontend 通道 / Select Frontend channel:"
    echo "  1. main       通用主线版 / General edition"
    echo "  2. commercial 现场商业部署版 / Commercial field edition"
    read -r -p "> " FRONTEND_CHANNEL
  fi
  case "$FRONTEND_CHANNEL" in
    1|main) FRONTEND_CHANNEL="main" ;;
    2|commercial) FRONTEND_CHANNEL="commercial" ;;
    *) echo "Unknown Frontend channel: $FRONTEND_CHANNEL" >&2; exit 2 ;;
  esac
fi

echo
echo "安装计划 / Installation plan"
echo "  Components: $COMPONENTS"
if has_component frontend; then
  echo "  Frontend channel: $FRONTEND_CHANNEL"
fi
echo "  Platform: $PLATFORM ($ARCHITECTURE)"
echo

if [[ "$ASSUME_YES" -ne 1 ]]; then
  read -r -p "确认此计划？/ Confirm this plan? [y/N] " answer
  case "$answer" in
    y|Y|yes|YES) ;;
    *) echo "已取消 / Cancelled"; exit 1 ;;
  esac
fi

echo
echo "预览完成：组件选择和安装计划已确认。"
echo "Preview complete: component selection and installation plan confirmed."
echo "私有制品下载将在后续版本接入授权目录。"
echo "Private artifact delivery will be connected to the authorized catalog in a later release."
