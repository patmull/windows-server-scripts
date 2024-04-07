@echo off

:start

set /p MATH=Input equation:
set /a RESULT=%MATH%

:: what happens now? just prints "RESULT"!
echo RESULT
:: prints the actual values
echo %RESULT%

pause
cls :: after click, it gets erased
goto start