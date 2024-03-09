@echo off
mode con cols=50 lines=20

color 09

rem 设置变量
set script-time=2024/2/1
set version=0.0.2
TITLE Minecraft-辅助命令脚本-%version%
rem 设置命令变量
set command_Pages=1
set command=
set Subcommands_1=
set Subcommands_2=
set Subcommands_3=
rem 设置命令的内容
set CP_G_1=        1.help                  2.ability
set CP_G_2=        3.                      4.
set CP_G_3=        5.                      6.
set CP_G_4=        7.                      8.

ren Minecraft-辅助命令脚本_Download.bat 命令助手-%version%.bat
:START
cls
echo.
ECHO.==================================================
echo.
echo.              Minecraft-辅助命令脚本
echo.
echo.         1.选择命令         2.更新脚本
echo.
echo.         3.免责声明         4.关于脚本
echo.
echo.                   0.Exit
echo.
ECHO.==================================================
choice /c:01234 /m:"请选择你想要的操作"
if %errorlevel%==1 命令助手.bat
if %errorlevel%==2 goto COMMAND_choose
if %errorlevel%==3 goto Script_updates
if %errorlevel%==4 goto DISCLAIMER
if %errorlevel%==5 goto ABOUT

:COMMAND_choose
cls
echo.
ECHO.==================================================
echo.
echo.                 [%command_Pages%]-命令选择-[%command_Pages%]
echo.
echo.%CP_G_1%
echo.
echo.%CP_G_2%
echo.
echo.%CP_G_3%
echo.
echo.%CP_G_4%
echo.
echo.        [A]上一页                下一页[D]
echo.                       0.back
ECHO.==================================================
choice /c:ad012345678 /m:"请选择你想要的操作"
if %errorlevel%==1 (
    if %command_Pages%==10 set command_Pages=9
    if %command_Pages%==9 set command_Pages=8
    if %command_Pages%==8 set command_Pages=7
    if %command_Pages%==7 set command_Pages=6
    if %command_Pages%==6 set command_Pages=5
    if %command_Pages%==5 set command_Pages=4
    if %command_Pages%==4 set command_Pages=3
    if %command_Pages%==3 set command_Pages=2
    if %command_Pages%==2 set command_Pages=1
    if %command_Pages%==1 echo.没有了,退出按请0 && pause
    goto handoff_GUI
)
if %errorlevel%==2 (
    if %command_Pages%==1 set command_Pages=2
    if %command_Pages%==2 set command_Pages=3
    if %command_Pages%==3 set command_Pages=4
    if %command_Pages%==4 set command_Pages=5
    if %command_Pages%==5 set command_Pages=6
    if %command_Pages%==6 set command_Pages=7
    if %command_Pages%==7 set command_Pages=8
    if %command_Pages%==8 set command_Pages=9
    if %command_Pages%==9 set command_Pages=10
    if %command_Pages%==10 echo.没有了[80个],指令少了?→1055411737@qq.com && pause
    goto handoff_GUI
)
if %errorlevel%==3 goto START
if %errorlevel%==4 set command_choose=1 && goto Subcommands
if %errorlevel%==5 set command_choose=2 && goto Subcommands
if %errorlevel%==6 set command_choose=3 && goto Subcommands
if %errorlevel%==7 set command_choose=4 && goto Subcommands
if %errorlevel%==8 set command_choose=5 && goto Subcommands
if %errorlevel%==9 set command_choose=6 && goto Subcommands
if %errorlevel%==10 set command_choose=7 && goto Subcommands
if %errorlevel%==11 set command_choose=8 && goto Subcommands
:handoff_GUI
if %command_Pages%==1 (
    set CP_G_1=        1.help                   2.ability
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==2 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==3 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==4 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==5 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==6 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==7 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==8 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==9 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
if %command_Pages%==10 (
    set CP_G_1=        1.                       2.
    set CP_G_2=        3.
    set CP_G_3=        5.
    set CP_G_4=        7.
)
goto COMMAND_choose


:Subcommands
cls
echo.%command_Pages% %command_choose%
pause
goto COMMAND_choose

:NO
echo.还没想好呢
pause
goto START

:Script_updates
cls
echo.
ECHO.==================================================
echo.
echo.                      更新提醒
echo.
echo.         是否使用国外镜像源下载最新脚本？
echo.
echo.         国外镜像源[Y]   国内镜像源[N]
echo.
ECHO.==================================================
choice /c:0yn /m:"请选择你想要的操作"
if %errorlevel%==1 goto START
if %errorlevel%==2 (
    echo.正在准备从GitHub上下载最新脚本，请检查你是否有加速GitHub
    pause
    curl -L -o Minecraft-辅助命令脚本_Download.bat --ssl-no-revoke --connect-timeout 60 --retry 5 https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/Minecraft/命令助手.bat
    Minecraft-辅助命令脚本_Download.bat
)
if %errorlevel%==3 (
        echo.还没有找到好的网站呢
        pause
        goto Script_updates
)
goto START

:DISCLAIMER
cls
echo.
ECHO.==================================================
echo.
echo.                   !免责声明!            
echo.                
echo.
echo.              !禁止滥用与商业用途!
echo.
echo.                   !禁止二改!
echo.
echo.             !未经作者同意禁止搬运!
echo.
echo.            !使用本辅助脚本则代表同意!
ECHO.==================================================
echo.
pause
goto START

:ABOUT
cls
echo.
ECHO.==================================================
echo.
echo.                     关于脚本               
echo.
echo.                     ↓作者↓
echo.
echo.                      东经雨
echo.
echo.                    ↓E-mail↓
echo.
echo.                 10554117737@qq.com
echo.
echo.                   版本:%version%
echo.                    %script-time%
echo.           https://dong8jing8yu.github.io/
ECHO.==================================================
pause
goto START