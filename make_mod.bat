@echo off
if not exist mod_root (
    echo Error: 'mod_root' directory not found.
    exit /b 1
)

if exist "Miyamai Moca Navigation Voice.scs" (
    del /f /q "Miyamai Moca Navigation Voice.scs"
)
if exist "Miyamai Moca Navigation Voice.zip" (
    del /f /q "Miyamai Moca Navigation Voice.zip"
)

echo Packaging 'mod_root' into 'Miyamai Moca Navigation Voice.scs' (Uncompressed)...
cd mod_root
tar -a -cf "..\Miyamai Moca Navigation Voice.zip" --options zip:compression-level=0 *
cd ..

if exist "Miyamai Moca Navigation Voice.zip" (
    move /y "Miyamai Moca Navigation Voice.zip" "Miyamai Moca Navigation Voice.scs" >nul
    echo MOD created successfully: Miyamai Moca Navigation Voice.scs
) else (
    echo Error: Failed to create MOD package.
    exit /b 1
)
