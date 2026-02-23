@echo off
setlocal

cd /d "%~dp0"

set "PORT=8080"
set "URL=http://localhost:%PORT%/"

where py >nul 2>nul
if %errorlevel%==0 (
    start "" "%URL%"
    py -m http.server %PORT%
    goto :eof
)

where python >nul 2>nul
if %errorlevel%==0 (
    start "" "%URL%"
    python -m http.server %PORT%
    goto :eof
)

echo Python not found. Opening index.html directly...
start "" "%~dp0index.html"
pause
