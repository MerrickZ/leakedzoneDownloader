# leakedzone Downloader
leakedzone.com 视频下载器，download video/photos from leakedzone.com

>Powershell script downloaded from various Reddit posts, see below

>Powershell 脚本为从Reddit上的多个讨论帖整理而来，见文末

## How to use

1. Install Python ```winget install python```
2. Install [yt-dlp](https://github.com/yt-dlp/yt-dlp) to download m3u8 files ```pip install yt-dlp```
3. Enable Powershell script execution policy in windows 10/11 ```Set-ExecutionPolicy unrestricted```
4. make sure ffmpeg.exe is in your PATH
5. Execute the script ```lz.ps1```

## 如何使用

1. 安装 Python ```winget install python```
2. 安装 [yt-dlp](https://github.com/yt-dlp/yt-dlp) （在线视频下载工具） ```pip install yt-dlp```
3. 启用本地powershell脚本执行 ```Set-ExecutionPolicy unrestricted```
4. 确保 ffmpeg.exe 在 PATH 变量的路径内
5. 运行脚本 ```lz.ps1```

## 代码说明

因为客观原因，代码中默认设置了 http://127.0.0.1:1081 的HTTP代理，如果不需要使用代理的话可以把相应行的参数删除 （从-proxy或者--proxy开始删到行尾），或者使用 ```lz-noproxy.ps1```

ffmpeg可以在[官方网站](https://ffmpeg.org/download.html)上找到 windows 编译版，放进一个文件夹内，然后在系统/高级/环境变量里面把 PATH 变量双击，加入有ffmpeg.exe的路径即可。不加的话 yt-dlp 会没有办法自动修复视频文件问题，导致下载的视频没有缩略图。

PythonPip 安装慢的话可以设置镜像，如腾讯/阿里/163等。

## 引用

[1 bulk_downloading_from_leakedzone](https://www.reddit.com/r/DataHoarder/comments/z08vti/bulk_downloading_from_leakedzone/)

[2 leakedzone_download_method](https://www.reddit.com/r/DataHoarder/comments/znj0eg/leakedzone_download_method/)
