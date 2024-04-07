@echo off

:start

set /p BUTTON_PRESSED=Press hotkey button... Press 0 for end.

if %BUTTON_PRESSED%==5 start notepad.exe
if %BUTTON_PRESSED%==0 goto end

cls
goto start

:end
echo Ending the program... Press key to end it right away.
:: > nul allows for custom message for ending, 
:: otherwise default timeout appears
timeout 3 > nul
