@echo off

:Start
set Input=""
echo Type the FX graphic name to merge (without "_lo" or "_hi") then press enter.
set /p Input=""

set PATH="../../../Global"

setlocal EnableDelayedExpansion
IF %Input% equ "" (
	echo No file was given.
	echo.
	goto :Start
)

:: Fool-proof check
IF %Input:~-4% equ .bin SET Input=%Input:~0,-4%
IF %Input:~-3% equ _lo SET Input=%Input:~0,-3%
IF %Input:~-3% equ _hi SET Input=%Input:~0,-3%

echo.
echo Merging %Input%...
asar --fix-checksum=off --no-title-check --define HiBitmap="%Input%_hi" --define LoBitmap="%Input%_lo" MergeGFX.asm "%Input%.bin"
echo.
IF NOT EXIST "../../Graphics/Custom/SuperFX" md "../../Graphics/Custom/SuperFX"
move "%Input%.bin" "../../Graphics/Custom/SuperFX"

echo Finished.
goto :Start
exit
