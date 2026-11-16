@echo off
cd /d "%~dp0"
title Update Gallery Index
echo ============================================
echo   Updating Thumbdrive Photo and Video Index
echo ============================================
if exist "build_gallery.exe" (
    build_gallery.exe
) else (
    python build_gallery.py
)
echo.
echo Press any key to close this window...
pause >nul
