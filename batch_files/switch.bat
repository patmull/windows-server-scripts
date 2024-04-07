@echo off

:start

set /p BUTTON_PRESSED=Press button...

if %BUTTON_PRESSED%==5 start notepad.exe
cls
goto start