@echo off
setlocal

echo Installing popular development tools...

REM Check internet connection
echo Checking internet connection...
ping -n 1 google.com > nul
if errorlevel 1 (
  echo Error: No internet connection detected. Exiting...
  exit /b 1
)

echo Downloading and installing Git for Windows...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/latest/download/Git-2.43.0-64-bit.exe' -OutFile 'C:\Users\WDAGUtilityAccount\Desktop\git-installer.exe'"

if exist "C:\Users\WDAGUtilityAccount\Desktop\git-installer.exe" (
  echo Installing Git...
  start /wait "" "C:\Users\WDAGUtilityAccount\Desktop\git-installer.exe" /VERYSILENT /NORESTART
  del "C:\Users\WDAGUtilityAccount\Desktop\git-installer.exe"
  echo Git installation completed.
) else (
  echo Failed to download Git installer.
)

echo Downloading and installing Node.js LTS...
powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v20.10.0/node-v20.10.0-x64.msi' -OutFile 'C:\Users\WDAGUtilityAccount\Desktop\nodejs-installer.msi'"

if exist "C:\Users\WDAGUtilityAccount\Desktop\nodejs-installer.msi" (
  echo Installing Node.js...
  start /wait msiexec /i "C:\Users\WDAGUtilityAccount\Desktop\nodejs-installer.msi" /quiet /norestart
  del "C:\Users\WDAGUtilityAccount\Desktop\nodejs-installer.msi"
  echo Node.js installation completed.
) else (
  echo Failed to download Node.js installer.
)

echo Installing Python via Microsoft Store (if available)...
winget install -e --id Python.Python.3.11

echo Setting up development environment complete.
pause