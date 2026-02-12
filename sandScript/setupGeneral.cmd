@echo off
setlocal

echo Setting up general development utilities...

REM Check internet connection
echo Checking internet connection...
ping -n 1 google.com > nul
if errorlevel 1 (
  echo Warning: No internet connection detected.
) else (
  echo Internet connection verified.
)

REM Create necessary directories
if not exist "C:\Tools" mkdir "C:\Tools"
if not exist "C:\Temp" mkdir "C:\Temp"

REM Display system information
echo.
echo System Information:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.

echo General setup completed successfully.
pause