@echo off
set dir=EFT
set game="C:\Battlestate Games"
set size=13000M
set ramdisk_drive=X

title Ramdisk for %dir%

net session >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo Hurray, running as admin
) else (
    echo Run as admin please
    pause
    exit
)

imdisk -a -o awe -s %size% -m %ramdisk_drive%: -p "/fs:ntfs /q /y"
cd %game%
xcopy %dir% %ramdisk_drive%:\%dir% /O /X /E /H /K /I
ren %dir% %dir%_orig
mklink /D %dir% %ramdisk_drive%:\%dir%
cls
set /p DUMMY=Hit ENTER when done playing...

rmdir %dir%
ren %dir%_orig %dir%
imdisk -D -m %ramdisk_drive%:
exit