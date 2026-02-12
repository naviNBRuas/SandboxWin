@echo off
setlocal

echo Installing productivity tools...

REM Check internet connection
echo Checking internet connection...
ping -n 1 google.com > nul
if errorlevel 1 (
  echo Error: No internet connection detected. Exiting...
  exit /b 1
)

echo Creating downloads directory...
if not exist "C:\Downloads" mkdir "C:\Downloads"
pushd "C:\Downloads"

echo Downloading and installing 7-Zip...
powershell -Command "Invoke-WebRequest -Uri 'https://www.7-zip.org/a/7z2301-x64.exe' -OutFile '7zip-installer.exe'"

if exist "7zip-installer.exe" (
  echo Installing 7-Zip...
  start /wait "" "7zip-installer.exe" /S
  del "7zip-installer.exe"
  echo 7-Zip installation completed.
) else (
  echo Failed to download 7-Zip installer.
)

echo Downloading and installing Notepad++...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/latest/download/npp.8.6.Installer.x64.exe' -OutFile 'notepadplusplus-installer.exe'"

if exist "notepadplusplus-installer.exe" (
  echo Installing Notepad++...
  start /wait "" "notepadplusplus-installer.exe" /S
  del "notepadplusplus-installer.exe"
  echo Notepad++ installation completed.
) else (
  echo Failed to download Notepad++ installer.
)

echo Downloading and installing Firefox...
powershell -Command "Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US' -OutFile 'Firefox Installer.exe'"

if exist "Firefox Installer.exe" (
  echo Installing Firefox...
  start /wait "" "Firefox Installer.exe" /S
  del "Firefox Installer.exe"
  echo Firefox installation completed.
) else (
  echo Failed to download Firefox installer.
)

popd
echo Productivity tools installation completed.
pause