@echo off

set PATH="../../../Global"

setlocal EnableDelayedExpansion

IF NOT EXIST "Split" md "Split"
FOR %%I IN (DATA_*.bin) DO (
	echo Splitting %%~I...
	echo.
	asar --fix-checksum=off --no-title-check --define Bitmap="%%~nI" --define HighNibble=1 SplitGFX.asm "Split/%%~nI_hi.bin"
	asar --fix-checksum=off --no-title-check --define Bitmap="%%~nI" --define HighNibble=0 SplitGFX.asm "Split/%%~nI_lo.bin"
)
echo Finished.
pause
