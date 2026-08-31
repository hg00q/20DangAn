@echo off
cd /d "%~dp0"
start "体育档案网页" http://localhost:8000/manage.html
if exist "C:\Users\User\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" (
  "C:\Users\User\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" -m http.server 8000
) else (
  py -m http.server 8000
)
