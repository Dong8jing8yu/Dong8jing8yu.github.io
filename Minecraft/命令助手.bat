@echo off
mode con cols=50 lines=20

color 09

rem ���ñ���
set script-time=2024/2/1
set version=0.0.2
TITLE Minecraft-��������ű�-%version%
rem �����������
set command_Pages=1
set command=
set Subcommands_1=
set Subcommands_2=
set Subcommands_3=
rem �������������
set CP_G_1=        1.help                  2.ability
set CP_G_2=        3.                      4.
set CP_G_3=        5.                      6.
set CP_G_4=        7.                      8.

ren Minecraft-��������ű�_Download.bat ��������-%version%.bat
:START
cls
echo.
ECHO.==================================================
echo.
echo.              Minecraft-��������ű�
echo.
echo.         1.ѡ������         2.���½ű�
echo.
echo.         3.��������         4.���ڽű�
echo.
echo.                   0.Exit
echo.
ECHO.==================================================
choice /c:01234 /m:"��ѡ������Ҫ�Ĳ���"
if %errorlevel%==1 ��������.bat
if %errorlevel%==2 goto COMMAND_choose
if %errorlevel%==3 goto Script_updates
if %errorlevel%==4 goto DISCLAIMER
if %errorlevel%==5 goto ABOUT

:COMMAND_choose
cls
echo.
ECHO.==================================================
echo.
echo.                 [%command_Pages%]-����ѡ��-[%command_Pages%]
echo.
echo.%CP_G_1%
echo.
echo.%CP_G_2%
echo.
echo.%CP_G_3%
echo.
echo.%CP_G_4%
echo.
echo.        [A]��һҳ                ��һҳ[D]
echo.                       0.back
ECHO.==================================================
choice /c:ad012345678 /m:"��ѡ������Ҫ�Ĳ���"
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
    if %command_Pages%==1 echo.û����,�˳�����0 && pause
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
    if %command_Pages%==10 echo.û����[80��],ָ������?��1055411737@qq.com && pause
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
echo.��û�����
pause
goto START

:Script_updates
cls
echo.
ECHO.==================================================
echo.
echo.                      ��������
echo.
echo.         �Ƿ�ʹ�ù��⾵��Դ�������½ű���
echo.
echo.         ���⾵��Դ[Y]   ���ھ���Դ[N]
echo.
ECHO.==================================================
choice /c:0yn /m:"��ѡ������Ҫ�Ĳ���"
if %errorlevel%==1 goto START
if %errorlevel%==2 (
    echo.����׼����GitHub���������½ű����������Ƿ��м���GitHub
    pause
    curl -L -o Minecraft-��������ű�_Download.bat --ssl-no-revoke --connect-timeout 60 --retry 5 https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/Minecraft/��������.bat
    Minecraft-��������ű�_Download.bat
)
if %errorlevel%==3 (
        echo.��û���ҵ��õ���վ��
        pause
        goto Script_updates
)
goto START

:DISCLAIMER
cls
echo.
ECHO.==================================================
echo.
echo.                   !��������!            
echo.                
echo.
echo.              !��ֹ��������ҵ��;!
echo.
echo.                   !��ֹ����!
echo.
echo.             !δ������ͬ���ֹ����!
echo.
echo.            !ʹ�ñ������ű������ͬ��!
ECHO.==================================================
echo.
pause
goto START

:ABOUT
cls
echo.
ECHO.==================================================
echo.
echo.                     ���ڽű�               
echo.
echo.                     �����ߡ�
echo.
echo.                      ������
echo.
echo.                    ��E-mail��
echo.
echo.                 10554117737@qq.com
echo.
echo.                   �汾:%version%
echo.                    %script-time%
echo.           https://dong8jing8yu.github.io/
ECHO.==================================================
pause
goto START