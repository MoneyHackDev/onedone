@echo off
setlocal

rem Set variables for Python and Chrome URLs
set PYTHON_URL=https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe
set CHROME_URL=http://dl.google.com/chrome/install/375.126/chrome_installer.exe

rem Set temporary directory
set TEMP_DIR=%TEMP%

rem Download Python installer using PowerShell
echo Downloading Python installer...
powershell.exe -Command "Invoke-WebRequest '%PYTHON_URL%' -OutFile '$TEMP_DIR\python_installer.exe'"

rem Install Python silently
echo Installing Python...
"%TEMP_DIR%\python_installer.exe" /quiet InstallAllUsers=1 PrependPath=1

rem Remove Python installer
del "%TEMP_DIR%\python_installer.exe"

rem Download Chrome installer using PowerShell
echo Downloading Google Chrome installer...
powershell.exe -Command "Invoke-WebRequest '%CHROME_URL%' -OutFile '$TEMP_DIR\chrome_installer.exe'"

rem Install Chrome silently
echo Installing Google Chrome...
"%TEMP_DIR%\chrome_installer.exe" /silent /install

rem Remove Chrome installer
del "%TEMP_DIR%\chrome_installer.exe"

echo Installation complete.

endlocal
