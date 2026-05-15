@echo off
cd /d C:\WorkSpace\news-monitor

REM 변경사항이 있는지 확인
git status --porcelain > %TEMP%\gitstatus.tmp
for /f %%i in ("%TEMP%\gitstatus.tmp") do set size=%%~zi
del %TEMP%\gitstatus.tmp

if %size% EQU 0 (
    echo [%date% %time%] No changes to commit. Skipping push.
    exit /b 0
)

REM 오늘 날짜 가져오기
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set datetime=%%a
set today=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%

REM Git push
git add -A
git commit -m "Daily report %today%"
git push

echo [%date% %time%] Push completed.