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
set multithreaded=1
set frequency=1
set Interval=0
set proxy=�ر�
set update=����
:START
cls
echo.
ECHO.==================================================
echo.
echo.                smsboom �����ű�
echo.
echo.        1.������ը         2.�����ը
echo.
echo.        3.���Žӿ�[%GUI-3%]   4.���½ӿ�
echo.
echo.        5.��������         6.���¾���[%update%]
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

    goto START
)
if %errorlevel%==5 (
    cls
    if %GUI-3%==�ٷ� (
        echo ʱ��%jb-time%���ٷ���ַ�������⣬���ܻᵼ���޷�ʹ��!�Ƿ��������
        choice
        if errorlevel 1 %file_smsboom% update
        if errorlevel 2 goto StART
        pause

    )
    if %GUI-3%==���� (
        if %update%==���� (
            echo.���ڴ�Gitee������API.json
            curl -L -O --ssl-no-revoke https://gitee.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/api.json
            pause
            cls
            echo.���ڴ�Gitee������GETAPI.json
            curl -L -O --ssl-no-revoke https://gitee.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/GETAPI.json
        )
        if %update%==���� (
            cls
            echo.���ڴ�GitHub������API.json
            curl -L -O --ssl-no-revoke https://github.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/api.json
            pause
            cls
            echo.���ڴ�GitHub������GETAPI.json
            curl -L -O --ssl-no-revoke https://github.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/GETAPI.json
        )
        pause
        goto START
    )
    goto START  
)
if %errorlevel%==6 goto DISCLAIMER
if %errorlevel%==7 (
    if %update%==���� set update=����
    if %update%==���� set update=����

    goto START
)
if %errorlevel%==8 goto ABOUT
if %errorlevel%==9 (
    cls
    if %update%==���� (
        echo.���ڴ�Gitee���������½ű�
        curl -L -O --ssl-no-revoke https://gitee.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/go.bat
    )
    if %update%==���� (
        echo.���ڴ�GitHub���������½ű�
        curl -L -O --ssl-no-revoke https://github.com/Dong8jing8yu/Dong8jing8yu.github.io/raw/main/smsboom/go.bat
    )
    
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

:DISCLAIMER
cls
echo.
ECHO.==================================================
echo.
echo.                   !��������!            
echo.         ʹ�ô˳��������ص��صķ��ɷ���
echo.       ������������ɵ��������ʹ���߳е���
echo.                   ��ֹ����ʹ��
echo.              ��ֹ������������ҵ��;
echo.                   ��ֹ����
echo.               δ������ͬ���ֹ����
echo.
echo.
echo.
echo.       !ʹ�ýű���ɵ��������ʹ���߳е�!
echo.
echo.       !ʹ�ýű���ɵ��������ʹ���߳е�!
echo.
echo.       !ʹ�ýű���ɵ��������ʹ���߳е�!
echo.
echo.         !ʹ�ñ������ű������ͬ��!
ECHO.==================================================
echo.
pause
goto START

:ABOUT
cls
echo.
ECHO.==================================================
echo.
echo.                   ���ڽű�               
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
echo.
pause
goto START