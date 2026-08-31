# 体育课程档案网页雏形

请使用 `启动体育档案.ps1`：右键该文件，选择“使用 PowerShell 运行”。它会自动打开电脑端 `manage.html` 管理页面。关闭 PowerShell 窗口即停止本地网站。

旧的 `启动本地服务器.bat` 因 Windows 对中文路径的兼容问题，暂不建议使用。

数据只保存在当前浏览器。请使用页面右上角“导出备份”定期保存备份文件。

GitHub Pages 首页 `index.html` 已是手机只读查看页。每次电脑端更新后，在“手机查看发布”页生成 `viewer-data.enc`，再上传覆盖仓库同名文件。手机打开 GitHub Pages 地址，输入查看密码即可只读查看。`viewer.html` 是同一查看页的备用入口。

请勿将本机备份 JSON、明文成绩表或查看密码上传到 GitHub。
