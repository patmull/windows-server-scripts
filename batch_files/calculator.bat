@echo off

:start

set /p EQUATION=Input equation:
set /a RESULT=%EQUATION%

echo %EQUATION%

pause
cls :: after click, it gets erased
goto start