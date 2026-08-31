@echo off
echo Sports archive server is running.
echo Open this address in your browser:
echo http://localhost:8000/manage.html
echo Keep this window open while using the archive.
"C:\Users\User\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" -m http.server 8000
