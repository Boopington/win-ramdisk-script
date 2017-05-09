@echo off
set dir=Paks
set game="C:\Program Files (x86)\Steam\steamapps\common\PUBG\TslGame\Content"
set size=7800M
set ramdisk_drive=X

title Ramdisk for %dir%
imdisk -a -o awe -s %size% -m %ramdisk_drive%: -p "/fs:ntfs /q /y"
cd %game%
xcopy %dir% %ramdisk_drive%:\%dir% /O /X /E /H /K /I
ren %dir% %dir%_orig
mklink /D %dir% %ramdisk_drive%:\%dir%
cls
echo Unpause when done playing
pause

rmdir %dir%
ren %dir%_orig %dir%
imdisk -D -m %ramdisk_drive%:
exit

rem xcopy %dir% %ramdisk_drive%:\%dir% /O /X /E /H /K /I
rem ROBOCOPY %dir% %ramdisk_drive%:\%dir% /E /njh /njs /nc /COPYALL /DCOPY:DAT