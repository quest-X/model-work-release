# OpenSight 安装包矩阵
**OpenSight installer matrix**

以下安装包均为规划目标。只有在对应操作系统完成构建、测试并通过公开分发审查后，
才会作为可下载附件发布。

All installer targets below are planned. No installer binary is attached until
it has been built, tested on the matching operating system, and approved for
public distribution.

| 平台<br>Platform | 页面显示<br>Display | 内部架构<br>Internal architecture | 规划文件名<br>Planned filename | 状态<br>Status |
| --- | --- | --- | --- | --- |
| Linux | Linux x64 | `x86_64` / `amd64` | `OpenSight-1.1.5-linux-x64.run` | 规划中<br>Planned |
| Linux | Linux ARM64 | `aarch64` / `arm64` | `OpenSight-1.1.5-linux-arm64.run` | 规划中<br>Planned |
| macOS Intel | macOS x64 | `x86_64` | `OpenSight-1.1.5-macos-x64.pkg` | 规划中<br>Planned |
| macOS Apple 芯片<br>macOS Apple silicon | macOS ARM64 | `arm64` | `OpenSight-1.1.5-macos-arm64.pkg` | 规划中<br>Planned |
| macOS 通用包<br>macOS universal | macOS Universal | `universal2` | `OpenSight-1.1.5-macos-universal.pkg` | 规划中<br>Planned |
| Windows 10/11 | Windows x64 | `x86_64` / `amd64` | `OpenSight-1.1.5-windows-x64.exe` | 规划中<br>Planned |
| Windows 11 ARM | Windows ARM64 | `aarch64` / `arm64` | `OpenSight-1.1.5-windows-arm64.exe` | 规划中<br>Planned |
| NVIDIA Jetson Linux | Linux ARM64 Jetson | `aarch64` / `arm64` | `OpenSight-1.1.5-linux-arm64-jetson.run` | 规划中<br>Planned |

## 公开包边界
**Public package boundary**

公开安装器只能包含引导、环境检测、签名验证、安装和回滚逻辑。私有源码、程序载荷、
凭证、私有下载地址和客户配置继续通过鉴权后的私有通道交付。

Public installers may contain only bootstrap, environment detection, signature
verification, installation, and rollback logic. Private source, payloads,
credentials, private download locations, and customer configuration remain in
the authenticated private delivery channel.
