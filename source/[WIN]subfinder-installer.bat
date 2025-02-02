@shift /0
@echo off

:start
cls
@shift /0
@echo off
cls


title Subfinder Auto Installer
mode con cols=50 lines=20


color f1
echo ----------------------------------------
echo 1- Enable Subsystem (restart required)
echo 2- Install distribution
echo 3- Install subfinder 
echo 4- Information/Support
echo ----------------------------------------
                      

set /p option=choose: || set option="0"

if /I %option%==1 goto 1

if /I %option%==2 goto 2

if /I %option%==3 goto menu2

if /I %option%==4 goto 4


:1

cls
color 7
echo -----------------------------------------
echo               Enabling...
echo -----------------------------------------

TIMEOUT /T 5 /NOBREAK

powershell Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
pause

:2
cls
echo -----------------------------------------
echo         "Choose to Download"
echo -----------------------------------------
echo U - Ubuntu (recommended)
echo D - Debian
echo O - opensuse (not complatible yet)

set /p option=choose: || set option="0"

if /I %option%==u goto u

if /I %option%==d goto d

if /I %option%==o goto o

:menu2
cls
echo -----------------------------------------
echo         "Choose option"
echo -----------------------------------------
echo A - Install
echo U - Update
echo B - Build From Source
echo R - Remove

set /p option=choose: || set option="0"

if /I %option%==a goto 3

if /I %option%==b goto build

if /I %option%==r goto remove

if /I %option%==u goto update



:3

cls
@echo off
echo Write your windows username and press ENTER
set /p winuser=

cls

echo Write your subsystem username and press ENTER
set /p subuser=

cls

TIMEOUT /T 5 /NOBREAK

powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/TheDoop/subfinder-installer/master/subfinder -OutFile subfinder" || cls && @echo "Download Error" && TIMEOUT /T 5 /NOBREAK && goto 3

Echo n|COPY /-y subfinder C:\users\%winuser%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\usr\bin\subfinder || cls && @echo "Copy Error - Enter correct username" &&  TIMEOUT /T 5 /NOBREAK && goto 3

bash -c "sudo chmod +x C:\users\%winuser%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\usr\bin\subfinder" || cls && @echo "Permision Error (Set manual)" && TIMEOUT /T 5 /NOBREAK && cls

bash -c "sudo chmod +x ~\usr\bin\subfinder" || cls && @echo "Permision Error (Set manual)" && TIMEOUT /T 5 /NOBREAK && cls


cd C:\users\%winuser%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\%subuser%\

pause

goto start

:4
cls
start https://t.me/F_Katyusha
goto start

exit 


:u
cls
start www.microsoft.com/tr-tr/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab
goto :start

:d
cls
start www.microsoft.com/store/apps/9MSVKQC78PK6
goto :start

:o
cls
start www.microsoft.com/store/apps/9njvjts82tjx
goto :start

:remove
cls

bash -c "sudo rm -rf C:\users\%winuser%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\usr\bin\subfinder" || @echo "Error" && exit /B 1
goto start


:build
call (Alpha)-build.exe
exit









