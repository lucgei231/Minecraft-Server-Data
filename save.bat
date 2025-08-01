@echo off
for /f "tokens=2 delims==." %%I in ('"wmic os get localdatetime /value"') do set dt=%%I

REM Adjust UTC to your local timezone (e.g., UTC-6 for CDT)
set /a hour=1%dt:~8,2% - 6
if %hour% lss 0 set /a hour=24+%hour%
if %hour% lss 10 set hour=0%hour%

set datetime=%dt:~6,2%-%dt:~4,2%_%dt:~0,4%_%hour%-%dt:~10,2%
REM Now %datetime% contains (d)-(m)_(y)_(hour)-(minute) in your timezone

REM Create a temporary exclude file for xcopy
echo session.lock > exclude.txt

REM Copy folder ./realms5b to ./backups\%datetime% excluding session.lock
xcopy /E /I /Y /EXCLUDE:exclude.txt "D:\Desktop\MCJE Server\realms5b" "D:\Desktop\MCJE Server\backups\%datetime%"

REM Delete the temporary exclude file
del exclude.txt