%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a
rem 这个只是最简单的加密只是用系统自带的记事本打开不了
rem !使用脚本造成的问题均由使用者承担!
rem !使用脚本造成的问题均由使用者承担!
rem !使用脚本造成的问题均由使用者承担!
@echo off
mode con cols=50 lines=25
TITLE smsboom 辅助脚本
color 02
rem 环境变量
set file_config=%cd%\config.ini
set file_smsboom=%cd%\smsboom.exe
set file_API=%cd%\api.json
set file_GET_API=%cd%\GETAPI.json
set http_proxy=%cd%\http_proxy.txt
set socks4_proxy=%cd%\socks4_proxy.txt
set socks5_proxy=%cd%\socks5_proxy.txt

rem 检查重要文件
if not exist %file_smsboom% echo 重要程序不存在 & pause & exit /b

rem 读取配置文件

rem 设置变量
set jb-time=2024/2/1/12:00
set api-time=2023-11-23
set get_api-time=2023-11-23
set version=0.0.8
set GUI-3=作者
set multithreaded=10
set frequency=1
set Interval=0
set proxy=
set GUI-proxy=关闭
set update=国外
:START
set quantity=1
set phone=
cls
echo.
ECHO.==================================================
echo.
echo.                smsboom 辅助脚本
echo.
echo.        1.启动轰炸         2.多个轰炸
echo.
echo.        3.短信接口[%GUI-3%]   4.更新接口
echo.
echo.        5.免责声明         6.更新镜像[%update%]
echo.
echo.        7.关于脚本         8.更新脚本
echo.
echo.                   0.Exit
echo.
ECHO.==================================================
choice /c:012345678 /m:"请选择你要的模式"
if %errorlevel%==1 exit
if %errorlevel%==2 goto SINGLE
if %errorlevel%==3 goto multiple
if %errorlevel%==4 (
    if %GUI-3%==官方 set GUI-3=作者
    if %GUI-3%==作者 set GUI-3=官方

    goto START
)
if %errorlevel%==5 (
    cls
    if %GUI-3%==官方 (
        echo 时间%jb-time%，官方网址仍有问题，可能会导致无法使用!是否继续更新
        choice
        if errorlevel 1 %file_smsboom% update
        if errorlevel 2 goto StART
        pause

    )
    if %GUI-3%==作者 (
        if %update%==国内 (
            echo.正在从Gitee上下载API.json
            curl -L -O https://gitee.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/api.json
            pause
            cls
            echo.正在从Gitee上下载GETAPI.json
            curl -L -O https://gitee.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/GETAPI.json
        )
        if %update%==国外 (
            cls
            echo.正在从GitHub上下载API.json
            curl -L -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/api.json
            pause
            cls
            echo.正在从GitHub上下载GETAPI.json
            curl -L -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/GETAPI.json
        )
        pause
        goto START
    )
    goto START  
)
if %errorlevel%==6 goto DISCLAIMER
if %errorlevel%==7 (
    if %update%==国外 set update=国内
    if %update%==国内 set update=国外

    goto START
)
if %errorlevel%==8 goto ABOUT
if %errorlevel%==9 (
    cls
    if %update%==国内 (
        echo.正在从Gitee上下载最新脚本
        curl -L -O https://gitee.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/go.bat
    )
    if %update%==国外 (
        echo.正在从GitHub上下载最新脚本
        curl -L -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/go.bat
    )
    
    pause
    goto START
)

:SINGLE
cls
echo.
ECHO.==================================================
echo.
echo.                    单人轰炸               
echo.
echo.     1.线程数[%multithreaded%]         2.轮番次数[%frequency%]
echo.                  5.开始
echo.     3.间隔时间[%Interval%]        4.代理列表[%GUI-proxy%]
echo.
echo.                     0.back
echo.
ECHO.==================================================
if not defined phone (
    set /p phone=请输入手机号:
)

choice /c:012345 /m:"你要干啥"
if %errorlevel%==1 goto START
if %errorlevel%==2 (
    set /p multithreaded=请输入线程数:
    goto SINGLE
)
if %errorlevel%==3 (
    set /p frequency=请输入轰炸次数:
    goto SINGLE
)
if %errorlevel%==4 (
    set /p Interval=请输入间隔时间-秒:
    goto SINGLE
)
if %errorlevel%==5 (
    if %GUI-proxy%==关闭 set GUI-proxy=开启
    if %GUI-proxy%==开启 set GUI-proxy=关闭

    if %GUI-proxy%==关闭 set proxy=
    if %GUI-proxy%==开启 set proxy=-e
    goto SINGLE
)
if %errorlevel%==6 (
    cls
    echo. %file_smsboom% run -t %multithreaded% -p %phone% -f %frequency% -i %Interval% %proxy%
    pause
    %file_smsboom% run -t %multithreaded% -p %phone% -f %frequency% -i %Interval% %proxy%
    pause
    goto START
)
:multiple
cls
echo.
ECHO.==================================================
echo.
echo.                    多人轰炸               
echo.
echo.          1.线程数[%multithreaded%]       2.轮番次数[%frequency%]
echo.                      5.开始
echo.          3.间隔时间[%Interval%]        4.代理列表[%GUI-proxy%]
echo.                      6.受害者[%quantity%]
echo.
echo.                     0.back
echo.
ECHO.==================================================
choice /c:0123456 /m:"你要干啥"
if %errorlevel%==1 goto START
if %errorlevel%==2 (
    set /p multithreaded=请输入线程数:
    goto SINGLE
)
if %errorlevel%==3 (
    set /p frequency=请输入轰炸次数:
    goto SINGLE
)
if %errorlevel%==4 (
    set /p Interval=请输入间隔时间-秒:
    goto SINGLE
)
if %errorlevel%==5 (
    if %GUI-proxy%==关闭 set GUI-proxy=开启
    if %GUI-proxy%==开启 set GUI-proxy=关闭

    if %GUI-proxy%==关闭 set proxy=
    if %GUI-proxy%==开启 set proxy=-e
    goto SINGLE
)
if %errorlevel%==6 goto START
if %errorlevel%==7 (
    set /a quantity=%quantity%+1
    goto multiple
)
:DISCLAIMER
cls
echo.
ECHO.==================================================
echo.
echo.                   !免责声明!            
echo.         使用此程序请遵守当地的法律法规
echo.       触犯法律所造成的问题均由使用者承担。
echo.                   禁止恶意使用
echo.              禁止滥用与用于商业用途
echo.                   禁止二改
echo.               未经作者同意禁止搬运
echo.
echo.
echo.
echo.       !使用脚本造成的问题均由使用者承担!
echo.
echo.       !使用脚本造成的问题均由使用者承担!
echo.
echo.       !使用脚本造成的问题均由使用者承担!
echo.
echo.         !使用本辅助脚本则代表同意!
ECHO.==================================================
echo.
pause
goto START

:ABOUT
cls
echo.
ECHO.==================================================
echo.
echo.                   关于脚本               
echo.
echo.                   ↓作者↓
echo.
echo.                    东经雨
echo.
echo.                  ↓E-mail↓
echo.
echo.               10554117737@qq.com
echo.                    
echo.            ↓最后一次更新接口时间↓
echo.
echo.         api:%api-time%    get:%get_api-time%
echo.
echo.                   版本:%version%
echo.                 %jb-time%
echo.         https://dong8jing8yu.github.io/
ECHO.==================================================
echo.
pause
goto START