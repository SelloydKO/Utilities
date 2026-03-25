@echo off
title Asset Remover
echo ==========================================================
echo Universal DEll / Lenovo Asset Tag & Ownership tag removal
echo ==========================================================
echo.
echo Select an Option
echo 1. Dell
echo 2. Lenovo
echo 3. Exit
echo.
set /p choice=Enter choice (1-3): 

if /i "%choice%"=="1" goto dell
if /i "%choice%"=="2" goto lenovo
if /i "%choice%"=="3" goto end

echo.
echo Invalid choice. Please enter 1, 2, or 3.
pause
goto menu

:dell
cls
echo.
echo ================== DELL ASSET REMOVER ==================
echo Clearing Asset Tag and Ownership/Property Tag...
echo.
cctk.exe --asset=
cctk.exe --propowntag=
echo.
echo Tags cleared (or set to blank). Reboot and check BIOS (F2) to verify.
echo.
pause
goto menu

:lenovo
cls
echo.
echo ================= LENOVO ASSET REMOVER =================
echo Clearing primary asset tag (ASSET_NUMBER)...
WinAIA64.exe -set "USERASSETDATA.ASSET_NUMBER=NO ASSET TAG"
echo.
echo Primary asset tag cleared. Reboot and check BIOS (F1) to verify.
echo.
pause
goto menu

:end
cls
echo.
echo Goodbye! Reboot the machine to apply changes.
echo.
pause
exit
