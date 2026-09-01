$ErrorActionPreference = 'Stop'
$port = 8000

$listeners = @(Get-NetTCPConnection -LocalPort $port -State Listen -ErrorAction SilentlyContinue)

if ($listeners.Count -eq 0) {
    Add-Type -AssemblyName PresentationFramework
    [System.Windows.MessageBox]::Show('体育档案服务器当前没有运行。', '体育档案') | Out-Null
    exit 0
}

$stopped = 0
foreach ($listener in $listeners) {
    $processId = $listener.OwningProcess
    $process = Get-CimInstance Win32_Process -Filter "ProcessId = $processId" -ErrorAction SilentlyContinue
    if ($null -eq $process) { continue }

    $isPython = $process.Name -match '^python(w)?\.exe$|^py\.exe$'
    $isHttpServer = $process.CommandLine -match 'http\.server\s+8000'
    if ($isPython -and $isHttpServer) {
        Stop-Process -Id $processId -Force -ErrorAction Stop
        $stopped++
    }
}

Add-Type -AssemblyName PresentationFramework
if ($stopped -gt 0) {
    [System.Windows.MessageBox]::Show('体育档案服务器已关闭。网页数据不会被删除。', '体育档案') | Out-Null
} else {
    [System.Windows.MessageBox]::Show('端口 8000 被其他程序使用，未执行关闭操作。', '体育档案') | Out-Null
}
