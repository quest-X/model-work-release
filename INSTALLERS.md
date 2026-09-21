# OpenSight installer matrix / OpenSight 安装包矩阵

All installer targets below are planned. No installer binary is attached until
it has been built, tested on the matching operating system, and approved for
public distribution.

以下安装包均为规划目标。只有在对应操作系统完成构建、测试并通过公开分发审查后，
才会作为可下载附件发布。

| Platform / 平台 | Display / 页面显示 | Internal architecture / 内部架构 | Planned filename / 规划文件名 | Status / 状态 |
| --- | --- | --- | --- | --- |
| Windows 10/11 | Windows x64 | `x86_64` / `amd64` | `OpenSight-1.1.4-windows-x64.exe` | Planned / 规划中 |
| Windows 11 ARM | Windows ARM64 | `aarch64` / `arm64` | `OpenSight-1.1.4-windows-arm64.exe` | Planned / 规划中 |
| Linux | Linux x64 | `x86_64` / `amd64` | `OpenSight-1.1.4-linux-x64.run` | Planned / 规划中 |
| Linux | Linux ARM64 | `aarch64` / `arm64` | `OpenSight-1.1.4-linux-arm64.run` | Planned / 规划中 |
| NVIDIA Jetson Linux | Linux ARM64 Jetson | `aarch64` / `arm64` | `OpenSight-1.1.4-linux-arm64-jetson.run` | Planned / 规划中 |
| macOS Intel | macOS x64 | `x86_64` | `OpenSight-1.1.4-macos-x64.pkg` | Planned / 规划中 |
| macOS Apple silicon | macOS ARM64 | `arm64` | `OpenSight-1.1.4-macos-arm64.pkg` | Planned / 规划中 |
| macOS universal | macOS Universal | `universal2` | `OpenSight-1.1.4-macos-universal.pkg` | Planned / 规划中 |

## Public package boundary / 公开包边界

Public installers may contain only bootstrap, environment detection, signature
verification, installation, and rollback logic. Private source, payloads,
credentials, private download locations, and customer configuration remain in
the authenticated private delivery channel.

公开安装器只能包含引导、环境检测、签名验证、安装和回滚逻辑。私有源码、程序载荷、
凭证、私有下载地址和客户配置继续通过鉴权后的私有通道交付。
