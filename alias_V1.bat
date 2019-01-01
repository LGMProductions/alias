@echo off

rem (C) Luca Franziskowski 2019. All rights reserved!
rem Download the .exe File from batchsoftware.de for free.
rem Thank you :)
rem Version: Version_0.3_Github_Edition

set version=0.3 
set var=%cd%\\

if "%1"=="" goto erklaerung
if "%1"=="-a" goto all
if "%1"=="-n" goto new
if "%1"=="-x" goto delete
if "%1"=="-e" goto edit
if "%1"=="-t" goto over

if "%1"=="-h" goto erklearung
if "%1"=="-help" goto erklearung
echo.
echo Command not found.
echo.
goto ende

:all
if exist %appdata%\alias.txt type %appdata%\alias.txt
if not exist %appdata%\alias.txt echo No alias avainable.
goto ende

:new
cd/d C:\Windows\System32
echo @echo off >%2.bat
echo %3 %4 %5 %6 %7 %8 %9 >>%2.bat
if exist %2.bat echo Alias "%2" created successfully !
if exist %2.bat echo %2 now active. >>%appdata%\alias.txt
if not exist %2.bat echo ! Error: You must run alias as administrator !
goto ende

:over
cd/d C:\Windows\System32
echo %3 %4 %5 %6 %7 %8 %9 >>%2.bat
if exist %2.bat echo Alias "%2" extended successfully !
if not exist %2.bat echo ! Error: You must run alias as administrator !
goto ende

:edit
notepad C:\Windows\System32\%2.bat
goto ende


:delete
cd/d C:\Windows\System32
if not exist %2.bat echo ! Error: Could not found alias "%2" !
set x=0
if exist %2.bat set x=1
if exist %2.bat del %2.bat /s /q >nul
if %x%==0 if not exist %2.bat echo Alias "%2" deleted.
if %x%==0 if not exist %2.bat echo %2 Deleted! >>%appdata%\alias.txt
goto ende


:erklaerung
echo.
echo alias DOS_X Edition V%version%
echo by (c) Luca Franziskowski. 2019
echo.
echo ! To run, you must be root/administrator !
echo.
echo alias [Parameter] [alias] [command to execute]
echo.
echo alias -n test echo test : Type "test" in cmd, the
echo                           command "echo test" will
echo                           be executed. (up to 7 words)
echo alias -t test echo yes  : Extend alias "test" with
echo                           "echo yes".
echo alias -a                : Displays history of all alias
echo                           and all active alias.
echo alias -x test           : Delete alias "test".
echo alias -e test           : Edit alias "test".
echo.
echo alias -help             : Shows this help.
echo.
goto ende

:ende
cd/d %var%
