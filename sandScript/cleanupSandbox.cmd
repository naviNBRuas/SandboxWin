@echo off
setlocal

echo Performing system cleanup...

REM Clear temporary files
echo Cleaning temporary files...
del /q /f /s "%TEMP%\*.*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

REM Clear Windows temp
echo Cleaning Windows temporary files...
del /q /f /s "C:\Windows\Temp\*.*" >nul 2>&1

REM Clear recent documents
echo Clearing recent documents...
del /q /f /s "%APPDATA%\Microsoft\Windows\Recent\*.*" >nul 2>&1

REM Clear recycle bin
echo Emptying recycle bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1

REM Clear browser cache (if browsers exist)
echo Clearing browser caches...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data" (
  rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
  rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Media Cache" >nul 2>&1
)

REM Clear DNS cache
echo Flushing DNS cache...
ipconfig /flushdns >nul

REM Clear ARP cache
echo Clearing ARP cache...
arp -d * >nul

REM Defragment drives (not typically needed in sandbox but for completeness)
echo Cleanup completed successfully.
echo.
echo Current disk usage:
wmic logicaldisk get size,freespace,caption
echo.
pause