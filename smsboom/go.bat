@echo off
mode con cols=50 lines=25
TITLE 一键轰炸
color 02
rem 环境变量
set file_config=%cd%\config.ini
set file_smsboom=%cd%\smsboom.exe
set file_API=%cd%\api.json
set file_GET_API=%cd%\GETAPI.json
set http_proxy=%cd%\http_proxy.txt
set socks4_proxy=%cd%\socks4_proxy.txt
set socks5_proxy=%cd%\socks5_proxy.txt

rem 设置变量
rem 官方接口已经无啦
set jb-time=2024/2/1/12:00
set version=0.0.1
set GUI-3=其他
set GUI-5_6=添加
set multithreaded=1
:START
cls
echo.
ECHO.==================================================
echo.
echo.                 东经雨编写
echo.                   %version%
echo.
echo.        1.启动轰炸         2.多个轰炸
echo.
echo.        3.接口[%GUI-3%]       4.更新接口
echo.
echo.        5.%GUI-5_6%API          6.%GUI-5_6%GET-API
echo.
echo.        7.关于脚本         8.更新脚本
echo.
echo.                   0.Exit
echo.
ECHO.==================================================
choice /c:012345678 /m:"请选择你要的模式"
if %errorlevel%==1 exit
if %errorlevel%==2 goto SINGLE
if %errorlevel%==3 goto MULTIPLE
if %errorlevel%==4 (
    if %GUI-3%==官方 set GUI-3=其他
    if %GUI-3%==其他 set GUI-3=自定
    if %GUI-3%==自定 set GUI-3=官方

    if %GUI-3%==自定 set GUI-5_6=查看
    if %GUI-3%==官方 set GUI-5_6=查看
    if %GUI-3%==其他 set GUI-5_6=添加

    goto START
)
if %errorlevel%==5 (
    if %GUI-3%==官方 (
        cls
        echo 时间%jb-time%，官方网址仍有问题，可能会导致无法使用!是否继续更新
        choice
        if errorlevel 1 %file_smsboom% update
        if errorlevel 2 goto StART
        pause

    )
    if %GUI-3%==其他 (
        cls
        echo.正在从GitHub上下载api.json
        curl -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/api.json
        pause
        cls
        echo.正在从GitHub上下载GETAPI.json
        curl -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/GETAPI.json
        pause
        goto START
    )
    goto START  
)
if %errorlevel%==6 goto START
if %errorlevel%==7 goto START
if %errorlevel%==8 pause
if %errorlevel%==9 (
    cls
    echo.正在从GitHub上下载最新脚本
    curl -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/go.bat
    pause
    goto START
)



:SINGLE
cls
echo.
echo.==================================================
echo.
echo.                    单人轰炸               
echo.
echo.       1.修改线程数[1]      2.轮番轰炸次数[0]
echo.
echo.       3.间隔时间[0]        4.代理列表[关闭]
echo.
echo.                   0.back
echo.
ECHO.==================================================
choice /c:01234 /m:"你要干啥"
if %errorlevel%==1 goto START
if %errorlevel%==2 goto SINGLE
if %errorlevel%==3 goto SINGLE
if %errorlevel%==4 goto SINGLE
if %errorlevel%==5 goto SINGLE

:MULTIPLE
cls
echo.
echo.==================================================
echo.
echo.                    多人轰炸               
echo.
echo.       1.修改线程数[1]      2.轮番轰炸次数[0]
echo.
echo.       3.间隔时间[0]        4.代理列表[关闭]
echo.
echo.                   0.back
echo.
ECHO.==================================================
choice /c:01234 /m:"你要干啥"
if %errorlevel%==1 goto START
if %errorlevel%==2 goto MULTIPLE
if %errorlevel%==3 goto MULTIPLE
if %errorlevel%==4 goto MULTIPLE
if %errorlevel%==5 goto MULTIPLE