@echo off
REM Set below variable to your steam id folder
set "SAVEDIR=STEAMIDHERE"

set "rawdate=%date%"
set "hyphendate=%rawdate:/=-%"
set "rawtime=%time%"
set "hyphentime=%rawtime::=-%"
set "hyphentime=%hyphentime:~0,8%"
if "%hyphentime:~0,1%"==" " set "hyphentime=0%hyphentime:~1%"

set "BACKUPFOLDER=%BASEDIR%%hyphendate%-%hyphentime%"

REM Copy the saves directory to the backup folder
xcopy "%SAVEDIR%" "%BACKUPFOLDER%\" /E /I /Y

cd /d "%SAVEDIR%"

REM Delete the target .sl2 and .sl2.bak files if they exist
del /q "NR0000.sl2"
del /q "NR0000.sl2.bak"

REM Rename .co2 and .co2.bak to .sl2 and .sl2.bak
copy "NR0000.co2" "NR0000.sl2"
copy "NR0000.co2.bak" "NR0000.sl2.bak"

echo Done.
pause