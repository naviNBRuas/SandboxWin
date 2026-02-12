@echo off
setlocal

echo #########################################################
echo #            Visual Studio Code Installer                 #
echo #              Enhanced Version                         #
echo #########################################################

echo Checking system requirements...
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
echo.

echo Downloading Visual Studio Code...

REM Download Visual Studio Code Stable release
powershell -Command "try { Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile 'C:\\users\\WDAGUtilityAccount\\Desktop\\vscode.exe' } catch { Invoke-WebRequest -Uri 'https://update.code.visualstudio.com/latest/win32-x64-user/stable' -OutFile 'C:\\users\\WDAGUtilityAccount\\Desktop\\vscode.exe' }"

echo Installing Visual Studio Code...

REM Install Visual Studio Code silently
if exist "C:\users\WDAGUtilityAccount\Desktop\vscode.exe" (
  C:\users\WDAGUtilityAccount\Desktop\vscode.exe /VERYSILENT /NORESTART /MERGETASKS=!runcode
  
  REM Clean up installer file
  del "C:\users\WDAGUtilityAccount\Desktop\vscode.exe" > nul 2>&1
  
  echo Visual Studio Code has been installed successfully.
  
  REM Optionally start VS Code
  if exist "C:\Users\%USERNAME%\AppData\Local\Programs\Microsoft VS Code\Code.exe" (
    start "" "C:\Users\%USERNAME%\AppData\Local\Programs\Microsoft VS Code\Code.exe"
  ) else (
    echo Please start VS Code manually from the Start menu.
  )
) else (
  echo Failed to locate VS Code installer.
)

echo #########################################################
echo #         VS Code installation completed                #
echo #########################################################
pause
