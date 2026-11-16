@echo off
setlocal
cd /d "%~dp0"
title Build Standalone Gallery Executables

echo ==============================================================
echo   Drive Photo and Video Gallery - Standalone EXE Builder
echo ==============================================================
echo.

where python >nul 2>&1
if errorlevel 1 (
    echo [!] Error: Python was not found in your PATH.
    echo     Please install Python 3.8+ and try again.
    pause
    exit /b 1
)

python -m PyInstaller --version >nul 2>&1
if errorlevel 1 (
    echo [!] Error: PyInstaller is not installed.
    echo     Install it by running: pip install pyinstaller
    pause
    exit /b 1
)

for %%I in ("%~dp0..\DRIVE_ROOT\.gallery-app") do set "APP_DIR=%%~fI"

if not exist "%APP_DIR%\build_gallery.py" (
    echo [!] Error: Could not find "%APP_DIR%\build_gallery.py"
    pause
    exit /b 1
)

echo [*] Syncing Open Gallery.html and assets\icon.png into build_gallery.py...
python -c "import base64, zlib, pathlib; app=pathlib.Path(r'%APP_DIR%'); html_b64=base64.b64encode(zlib.compress((app/'Open Gallery.html').read_bytes(),9)).decode('ascii'); fav_b64=base64.b64encode((app/'assets'/'icon.png').read_bytes()).decode('ascii'); py=app/'build_gallery.py'; lines=py.read_text(encoding='utf-8').splitlines(keepends=True); q=chr(34); out=[(f'EMBEDDED_HTML_B64 = {q}{html_b64}{q}\n' if l.startswith('EMBEDDED_HTML_B64 = ') else (f'EMBEDDED_FAVICON_B64 = {q}{fav_b64}{q}\n' if l.startswith('EMBEDDED_FAVICON_B64 = ') else l)) for l in lines]; py.write_text(''.join(out), encoding='utf-8')"
if errorlevel 1 (
    echo [!] Error: Failed to sync embedded assets into build_gallery.py.
    pause
    exit /b 1
)

set "BUILD_TMP=%TEMP%\drive_gallery_exe_build"
if exist "%BUILD_TMP%" rmdir /s /q "%BUILD_TMP%"
mkdir "%BUILD_TMP%"

echo [*] Compiling build_gallery.py into standalone Windows executable...
echo     Source: %APP_DIR%\build_gallery.py
echo     Temp build directory: %BUILD_TMP%
echo.

python -m PyInstaller ^
    --onefile ^
    --clean ^
    --name "Create Gallery" ^
    --icon "%APP_DIR%\assets\drive_icon.ico" ^
    --add-data "%APP_DIR%\build_gallery.py;." ^
    --distpath "%BUILD_TMP%\dist" ^
    --workpath "%BUILD_TMP%\work" ^
    --specpath "%BUILD_TMP%" ^
    "%APP_DIR%\build_gallery.py"

if errorlevel 1 (
    echo.
    echo [!] Build failed! See errors above.
    if exist "%BUILD_TMP%" rmdir /s /q "%BUILD_TMP%"
    pause
    exit /b 1
)

echo.
echo [*] Updating release and .gallery-app executables...
copy /y "%BUILD_TMP%\dist\Create Gallery.exe" "%~dp0Create Gallery.exe" >nul
copy /y "%BUILD_TMP%\dist\Create Gallery.exe" "%APP_DIR%\build_gallery.exe" >nul

if exist "%BUILD_TMP%" rmdir /s /q "%BUILD_TMP%"

echo.
echo ==============================================================
echo   [OK] Build Complete!
echo   Updated:
echo     - Releases\Create Gallery.exe
echo     - DRIVE_ROOT\.gallery-app\build_gallery.exe
echo ==============================================================
echo.
pause
