:start
@echo off 
:: comment the line above to see the mess it would cause without echo off
echo -create (Enter "create" ^for creating the pasword.)
:: Notice the carrot symbol ^ for escaping the character.
echo -check (Enter "check" ^for creating the pasword.)
echo What do you want to do^?
set /p PROGRAM=
goto %PROGRAM%

:create
cls
echo Enter new PASSWORD.
set /p PASSWORD=
attrib -h secret.txt
echo %PASSWORD% > secret.txt
attrib +h secret.txt
pause
goto start

:check
cls
set /p PASSWORD=Enter your PASSWORD.
attrib -h secret.txt
:: Try %character% instead of %%c
for /f "Delims=" %%c in (secret.txt) do (
:: uncomment this for debugging
:: echo %%c
:: comment this for debugging
set TEXT=%%c
)
attrib +h secret.txt
if %PASSWORD%==%TEXT% goto correct
echo Password do not match.
pause
goto start

:correct
echo Password match.
echo Opening the (^not so) secret file.
attrib -h secret_2.txt
start secret_2.txt
attrib +h secret_2.txt
pause
goto start
