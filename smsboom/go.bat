@echo off
mode con cols=50 lines=25
TITLE smsboom �����ű�
color 02
rem ��������
set file_config=%cd%\config.ini
set file_smsboom=%cd%\smsboom.exe
set file_API=%cd%\api.json
set file_GET_API=%cd%\GETAPI.json
set http_proxy=%cd%\http_proxy.txt
set socks4_proxy=%cd%\socks4_proxy.txt
set socks5_proxy=%cd%\socks5_proxy.txt

rem �����Ҫ�ļ�
if not exist %file_smsboom% echo ��Ҫ���򲻴��� & pause & exit /b

rem ��ȡ�����ļ�

rem ���ñ���
set jb-time=2024/2/1/12:00
set api-time=2023-11-23
set get_api-time=2023-11-23
set version=0.0.1
set GUI-3=����
set GUI-5_6=���
set multithreaded=1
set frequency=1
set Interval=0
set proxy=�ر�
:START
cls
echo.
ECHO.==================================================
echo.
echo.                smsboom �����ű�
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
if %errorlevel%==3 goto START
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
        curl -L -O --ssl-no-revoke https://github.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/api.json
        pause
        cls
        echo.���ڴ�GitHub������GETAPI.json
        curl -L -O --ssl-no-revoke https://github.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/GETAPI.json
        pause
        goto START
    )
    goto START  
)
if %errorlevel%==6 goto START
if %errorlevel%==7 goto START
if %errorlevel%==8 goto ABOUT
if %errorlevel%==9 (
    cls
    echo.���ڴ�GitHub���������½ű�
    curl -L -O --ssl-no-revoke https://github.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/go.bat
    pause
    goto START
)

:SINGLE
cls
echo.
ECHO.==================================================
echo.
echo.                    ���˺�ը               
echo.
echo.       1.�޸��߳���[%multithreaded%]      2.�ַ���ը����[%frequency%]
echo.
echo.       3.���ʱ��[%Interval%]        4.�����б�[%proxy%]
echo.
echo.                   0.back
echo.
ECHO.==================================================
choice /c:01234 /m:"��Ҫ��ɶ"
if %errorlevel%==1 goto START
if %errorlevel%==2 goto SINGLE
if %errorlevel%==3 goto SINGLE
if %errorlevel%==4 goto SINGLE
if %errorlevel%==5 (
    if %proxy%==�ر� set proxy=����
    if %proxy%==���� set proxy=�ر�
    goto SINGLE
)

:ABOUT
cls
echo.
ECHO.==================================================
echo.
echo.                    ���ڽű�               
echo.
echo.
echo.
echo.
echo.                   �����ߡ�
echo.
echo.                    ������
echo.
echo.                  ��E-mail��
echo.
echo.               10554117737@qq.com
echo.                    
echo.            �����һ�θ��½ӿ�ʱ���
echo.
echo.         api:%api-time%    get:%get_api-time%
echo.
echo.                   �汾:%version%
echo.                 %jb-time%
echo.         https://dong8jing8yu.github.io/
ECHO.==================================================
pause
goto START