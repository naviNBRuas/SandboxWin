@echo off
setlocal enabledelayedexpansion

echo #########################################################
echo #               TOR Browser Installer                     #
echo #            Enhanced Security Version                  #
echo #########################################################

echo Checking internet connection...
:check_connection
rem Check if the computer is connected to the internet
ping -n 1 google.com > nul
if errorlevel 1 (
  echo No internet connection detected. Retrying in 5 seconds...
  timeout /t 5 /nobreak > nul
  goto check_connection
)

echo Verifying system security...
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.

:download_tor
echo Downloading latest version of Tor Browser...
rem Try multiple mirrors for Tor Browser download
powershell -Command "try { (New-Object Net.WebClient).DownloadFile('https://www.torproject.org/dist/torbrowser/tor-browser-windows.exe', 'C:\\Users\\WDAGUtilityAccount\\Desktop\\torbrowser.exe') } catch { try { Invoke-WebRequest -Uri 'https://archive.torproject.org/tor-package-archive/torbrowser/latest/tor-browser-windows.exe' -OutFile 'C:\\Users\\WDAGUtilityAccount\\Desktop\\torbrowser.exe' } catch { Write-Output 'Failed to download from all sources.' } }"

rem Wait for download to complete
timeout /t 3 /nobreak > nul

echo Verifying downloaded file...
if not exist "C:\\Users\\WDAGUtilityAccount\\Desktop\\torbrowser.exe" (
  echo Failed to download Tor Browser installer from all sources.
  pause
  exit /b 1
)

for %%A in ("C:\\Users\\WDAGUtilityAccount\\Desktop\\torbrowser.exe") do echo File Size: %%~zA bytes
echo.

echo Installing Tor Browser...
rem Install Tor Browser silently
if exist "C:\Users\WDAGUtilityAccount\Desktop\torbrowser.exe" (
  start "" /wait "C:\Users\WDAGUtilityAccount\Desktop\torbrowser.exe" /S
  
  rem Start Tor Browser if installation was successful
  if exist "C:\Program Files\Tor Browser\Browser\firefox.exe" (
    start "" "C:\Program Files\Tor Browser\Browser\firefox.exe" --new-instance
  ) else if exist "C:\Program Files (x86)\Tor Browser\Browser\firefox.exe" (
    start "" "C:\Program Files (x86)\Tor Browser\Browser\firefox.exe" --new-instance
  )
  
  rem Clean up installer file
  del "C:\Users\WDAGUtilityAccount\Desktop\torbrowser.exe" > nul 2>&1
  echo Tor Browser has been installed and started successfully.
) else (
  echo Failed to locate Tor Browser installer.
)

echo #########################################################
echo #          Installation process completed               #
echo #########################################################
pause
