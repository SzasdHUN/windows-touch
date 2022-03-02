@echo off
setlocal EnableDelayedExpansion
set fileName=%1
set path=%2

if /i "%fileName%"=="/?" goto help else goto pathCheck

:pathCheck
if "%path%"=="" (set path=%cd%) else (set path=%path%)
if not x%path:.=%==x%path% (set do=true && goto do) else (goto apend)

:apend
set file=%path%\%fileName%
set do=true
goto do

:help
echo (c)2022 Szasd Version 1.2
echo TOUCH [filename][drive:path]
echo.
echo   help		/?
echo.

:do
if %do%==false (echo FAIL Something went wrong) else (type nul > %file% && echo SUCSESS %fileName% has been created)

set file=
set path=
set fileName=
set inPath=
set do=