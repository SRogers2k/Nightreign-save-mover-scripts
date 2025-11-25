@echo off
REM Set below variable to your steam id folder
set "SAVEDIR=STEAMIDHERE"
goto options

:options
echo Select an option:
echo 1. Move Seamless save to Vanilla
echo 2. Move Vanilla save to Seamless
echo Ctrl+C to exit.
set /p option=Enter 1 or 2: 
if "%option%"=="1" goto co2_to_sl2
if "%option%"=="2" goto sl2_to_co2

:co2_to_sl2
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
goto end


:sl2_to_co2
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

REM Delete the target .co2 and .co2.bak files if they exist
del /q "NR0000.co2"
del /q "NR0000.co2.bak"

REM Rename .co2 and .co2.bak to .sl2 and .sl2.bak
copy "NR0000.sl2" "NR0000.co2"
copy "NR0000.sl2.bak" "NR0000.co2.bak"

echo Done.
goto end

:end
exit