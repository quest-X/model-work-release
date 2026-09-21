[CmdletBinding()]
param(
    [ValidateSet("frontend", "backend", "node", "extension", "monitor")]
    [string[]]$Components,

    [ValidateSet("main", "commercial")]
    [string]$FrontendChannel,

    [switch]$Yes
)

$ErrorActionPreference = "Stop"
$Version = "0.0.1"

function Read-MultiSelect {
    Write-Host "选择组件（可多选，用逗号分隔）/ Select components:"
    Write-Host "  1. Frontend"
    Write-Host "  2. Backend"
    Write-Host "  3. Node"
    Write-Host "  4. Extension"
    Write-Host "  5. Monitor"

    $map = @{
        "1" = "frontend"
        "2" = "backend"
        "3" = "node"
        "4" = "extension"
        "5" = "monitor"
    }

    $result = foreach ($item in ((Read-Host ">") -split ",")) {
        $value = $item.Trim().ToLowerInvariant()
        if ($map.ContainsKey($value)) {
            $map[$value]
        } elseif ($value -in $map.Values) {
            $value
        } else {
            throw "Unknown component: $item"
        }
    }
    @($result | Select-Object -Unique)
}

$architecture = switch ([System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture) {
    "X64" { "x64" }
    "Arm64" { "ARM64" }
    default { throw "Unsupported architecture: $_" }
}

Write-Host "OpenSight 一键安装器 v$Version"
Write-Host "OpenSight Installer v$Version"
Write-Host ""
Write-Host "平台 / Platform: Windows"
Write-Host "架构 / Architecture: $architecture"
Write-Host ""

if (-not $Components -or $Components.Count -eq 0) {
    $Components = Read-MultiSelect
}

if ($Components -contains "frontend" -and -not $FrontendChannel) {
    Write-Host ""
    Write-Host "选择 Frontend 通道 / Select Frontend channel:"
    Write-Host "  1. main       通用主线版 / General edition"
    Write-Host "  2. commercial 现场商业部署版 / Commercial field edition"
    $FrontendChannel = switch (Read-Host ">") {
        "1" { "main" }
        "main" { "main" }
        "2" { "commercial" }
        "commercial" { "commercial" }
        default { throw "Unknown Frontend channel: $_" }
    }
}

Write-Host ""
Write-Host "安装计划 / Installation plan"
Write-Host "  Components: $($Components -join ',')"
if ($Components -contains "frontend") {
    Write-Host "  Frontend channel: $FrontendChannel"
}
Write-Host "  Platform: Windows ($architecture)"
Write-Host ""

if (-not $Yes) {
    $answer = Read-Host "确认此计划？/ Confirm this plan? [y/N]"
    if ($answer -notin @("y", "Y", "yes", "YES")) {
        Write-Host "已取消 / Cancelled"
        exit 1
    }
}

Write-Host ""
Write-Host "预览完成：组件选择和安装计划已确认。"
Write-Host "Preview complete: component selection and installation plan confirmed."
Write-Host "私有制品下载将在后续版本接入授权目录。"
Write-Host "Private artifact delivery will be connected to the authorized catalog in a later release."

