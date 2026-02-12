@echo off
setlocal

echo Installing security analysis tools...

REM Check internet connection
echo Checking internet connection...
ping -n 1 google.com > nul
if errorlevel 1 (
  echo Error: No internet connection detected. Exiting...
  exit /b 1
)

echo Creating tools directory...
if not exist "C:\Tools" mkdir "C:\Tools"

echo Downloading Sysinternals Suite...
powershell -Command "Invoke-WebRequest -Uri 'https://download.sysinternals.com/files/SysinternalsSuite.zip' -OutFile 'C:\Users\WDAGUtilityAccount\Desktop\SysinternalsSuite.zip'"

if exist "C:\Users\WDAGUtilityAccount\Desktop\SysinternalsSuite.zip" (
  echo Extracting Sysinternals Suite...
  powershell -Command "Expand-Archive -Path 'C:\Users\WDAGUtilityAccount\Desktop\SysinternalsSuite.zip' -DestinationPath 'C:\Tools\Sysinternals' -Force"
  del "C:\Users\WDAGUtilityAccount\Desktop\SysinternalsSuite.zip"
  echo Sysinternals Suite installation completed.
) else (
  echo Failed to download Sysinternals Suite.
)

echo Downloading Process Monitor (ProcMon)...
REM Already included in Sysinternals Suite, but we'll add it as reference

echo Downloading Autoruns...
powershell -Command "Invoke-WebRequest -Uri 'https://download.sysinternals.com/files/Autoruns.zip' -OutFile 'C:\Users\WDAGUtilityAccount\Desktop\Autoruns.zip'"

if exist "C:\Users\WDAGUtilityAccount\Desktop\Autoruns.zip" (
  echo Extracting Autoruns...
  powershell -Command "Expand-Archive -Path 'C:\Users\WDAGUtilityAccount\Desktop\Autoruns.zip' -DestinationPath 'C:\Tools\Autoruns' -Force"
  del "C:\Users\WDAGUtilityAccount\Desktop\Autoruns.zip"
  echo Autoruns installation completed.
) else (
  echo Failed to download Autoruns.
)

echo Security tools installation completed.
echo Tools installed to C:\Tools\
dir "C:\Tools" /AD /B
pause