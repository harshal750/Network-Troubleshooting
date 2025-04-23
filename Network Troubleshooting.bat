@echo off
title Network Troubleshooter - Basic to Advanced
color 0B

:menu
cls
echo ================================
echo     NETWORK TROUBLESHOOTER
echo ================================
echo 1. Check IP Configuration
echo 2. Release IP Address
echo 3. Flush DNS Cache
echo 4. Reset Winsock
echo 5. Test Internet Connectivity
echo 6. Traceroute to Google
echo 7. Display Routing Table
echo 8. Show ARP Table
echo 9. Run All Steps
echo 0. Exit
echo ================================
set /p choice=Enter your choice: 

if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto release
if "%choice%"=="3" goto flushdns
if "%choice%"=="4" goto winsock
if "%choice%"=="5" goto pingtest
if "%choice%"=="6" goto traceroute
if "%choice%"=="7" goto routetable
if "%choice%"=="8" goto arptable
if "%choice%"=="9" goto runall
if "%choice%"=="0" exit
goto menu

:ipconfig
echo.
echo ---- IP Configuration ----
ipconfig /all
pause
goto menu

:release
echo.
echo ---- Releasing IP Address ----
ipconfig /release
echo.
echo ---- Renewing IP Address ----
ipconfig /renewip
echo.
echo IP Configuration has been refreshed.
pause
goto menu

:flushdns
echo.
echo ---- Flushing DNS Cache ----
ipconfig /flushdns
pause
goto menu

:winsock
echo.
echo ---- Resetting Winsock ----
netsh winsock reset
netsh int ip reset
pause
goto menu

:pingtest
echo.
echo ---- Testing Internet Connection ----
ping www.google.com
pause
goto menu

:traceroute
echo.
echo ---- Traceroute to Google ----
tracert www.google.com
pause
goto menu

:routetable
echo.
echo ---- Routing Table ----
route print
pause
goto menu

:arptable
echo.
echo ---- ARP Table ----
arp -a
pause
goto menu

:runall
call :ipconfig
call :renewip
call :flushdns
call :winsock
call :pingtest
call :traceroute
call :routetable
call :arptable
pause
goto menu
