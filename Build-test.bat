@echo off
title Subfinder Auto Builder (BETA)
cls 
echo BETA!
color f1
mode con cols=50 lines=20
echo -------------------------
echo    Installing Golang
echo -------------------------
pause

bash -c "wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz" || goto :errordownloading
cls 

bash -c "sudo tar -xvf go1.11.linux-amd64.tar.gz"
cls


echo --------------------------
echo Removing old installations
echo --------------------------
bash -c "sudo rm -rf /usr/local/go/"
cls


echo --------------------------
echo Installing New files...
echo --------------------------
bash -c "sudo mv go /usr/local"
cls


bash -c "echo export GOROOT=/usr/local/go > ~/.bashrc"
bash -c "echo export GOPATH=$HOME/go > ~/.bashrc"
bash -c "echo export PATH=$GOPATH/bin:$GOROOT/bin:$PATH > ~/.bashrc"



cls

echo -------------------------
echo  Building Subfinder...
echo -------------------------

bash -c "go get github.com/subfinder/subfinder"
bash -c "sudo cp ~/work/bin/subfinder /usr/bin"
bash -c "sudo chmod +x /usr/bin/subfinder"


echo -------------------------
echo  DONE!. Cleaning up...
echo -------------------------

bash -c "sudo rm -rf /go go1.11.linux-amd64.tar.gz"





bash -c "/usr/local/go/bin/go get github.com/subfinder/subfinder && cd subfinder"
bash -c "/usr/local/go/bin/go build"



call [WIN]subfinder-installer.exe
exit

:errordownloading
cls
echo --------------------------------------
echo Cannot get go1.11.linux-amd64.tar.gz
echo Pls Report BUG 
echo --------------------------------------
goto :main

pause

