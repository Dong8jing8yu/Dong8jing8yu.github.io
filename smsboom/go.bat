@echo off
mode con cols=50 lines=25
TITLE һ����ը
color 02
rem ��������
set file_config=%cd%\config.ini
set file_smsboom=%cd%\smsboom.exe
set file_API=%cd%\api.json
set file_GET_API=%cd%\GETAPI.json
set http_proxy=%cd%\http_proxy.txt
set socks4_proxy=%cd%\socks4_proxy.txt
set socks5_proxy=%cd%\socks5_proxy.txt

rem ���ñ���
rem �ٷ��ӿ��Ѿ�����
set jb-time=2024/2/1/12:00
set version=0.0.1
set GUI-3=����
set GUI-5_6=���
set multithreaded=1
:START
cls
echo.
ECHO.==================================================
echo.
echo.                 �������д
echo.                   %version%
echo.
echo.        1.������ը         2.�����ը
echo.
echo.        3.�ӿ�[%GUI-3%]       4.���½ӿ�
echo.
echo.        5.%GUI-5_6%API          6.%GUI-5_6%GET-API
echo.
echo.        7.���ڽű�         8.���½ű�
echo.
echo.                   0.Exit
echo.
ECHO.==================================================
choice /c:012345678 /m:"��ѡ����Ҫ��ģʽ"
if %errorlevel%==1 exit
if %errorlevel%==2 goto SINGLE
if %errorlevel%==3 goto MULTIPLE
if %errorlevel%==4 (
    if %GUI-3%==�ٷ� set GUI-3=����
    if %GUI-3%==���� set GUI-3=�Զ�
    if %GUI-3%==�Զ� set GUI-3=�ٷ�

    if %GUI-3%==�Զ� set GUI-5_6=�鿴
    if %GUI-3%==�ٷ� set GUI-5_6=�鿴
    if %GUI-3%==���� set GUI-5_6=���

    goto START
)
if %errorlevel%==5 (
    if %GUI-3%==�ٷ� (
        cls
        echo ʱ��%jb-time%���ٷ���ַ�������⣬���ܻᵼ���޷�ʹ��!�Ƿ��������
        choice
        if errorlevel 1 %file_smsboom% update
        if errorlevel 2 goto StART
        pause

    )
    if %GUI-3%==���� (
        cls
        echo.���ڴ�GitHub������api.json
        curl -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/api.json
        pause
        cls
        echo.���ڴ�GitHub������GETAPI.json
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
    echo.���ڴ�GitHub���������½ű�
    curl -O --ssl-no-revoke https://raw.githubusercontent.com/Dong8jing8yu/Dong8jing8yu.github.io/main/smsboom/go.bat
    pause
    goto START
)



:SINGLE
cls
echo.
echo.==================================================
echo.
echo.                    ���˺�ը               
echo.
echo.       1.�޸��߳���[1]      2.�ַ���ը����[0]
echo.
echo.       3.���ʱ��[0]        4.�����б�[�ر�]
echo.
echo.                   0.back
echo.
ECHO.==================================================
choice /c:01234 /m:"��Ҫ��ɶ"
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
echo.                    ���˺�ը               
echo.
echo.       1.�޸��߳���[1]      2.�ַ���ը����[0]
echo.
echo.       3.���ʱ��[0]        4.�����б�[�ر�]
echo.
echo.                   0.back
echo.
ECHO.==================================================
choice /c:01234 /m:"��Ҫ��ɶ"
if %errorlevel%==1 goto START
if %errorlevel%==2 goto MULTIPLE
if %errorlevel%==3 goto MULTIPLE
if %errorlevel%==4 goto MULTIPLE
if %errorlevel%==5 goto MULTIPLE