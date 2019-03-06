@shift /0
@echo off

:start
cls
@shift /0
@echo off
cls

title Setting permisions
mode con cols=50 lines=20

bash -c "sudo chmod +x C:\users\%winuser%\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\usr\bin\subfinder"

call [WIN]subfinder-installer.bat

pause 

exit 

