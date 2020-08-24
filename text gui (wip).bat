@echo off
:menu
echo What do you want to do?
echo 1) Start program
echo 2) Exit
echo.
choice /C:12 /M Choice?

if ERRORLEVEL 2 (
goto :exit
)

: : why is it errorlevel? why can it not just be "choice" or "option" why??????????????????/

if ERRORLEVEL 1 (
echo Press any key to start the program
pause >nul
cls
call resources\start.bat
)


:eob
echo would you like to Exit or Go back to the beginning?
echo.
choice /C:EG

if ERRORLEVEL 2 (
cls
goto :menu
)

if ERRORLEVEL 1 (
goto :exit
)

:exit
echo.
echo thx
pause
cmd /k