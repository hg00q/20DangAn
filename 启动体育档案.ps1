$ErrorActionPreference = 'Stop'
$port = 8000
Set-Location -LiteralPath $PSScriptRoot

Write-Host ''
Write-Host '体育档案本地服务器已启动。' -ForegroundColor Green
Write-Host "请在浏览器打开：http://localhost:$port/manage.html"
Write-Host '使用期间请保持此窗口开启；关闭窗口即停止服务。' -ForegroundColor Yellow
Write-Host ''

Start-Process "http://localhost:$port/manage.html"

if (Get-Command py -ErrorAction SilentlyContinue) {
  & py -m http.server $port
} else {
  & 'C:\Users\User\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' -m http.server $port
}
