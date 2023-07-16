@echo off

echo Merging data...
set PATH="../../../Global"

setlocal EnableDelayedExpansion
IF NOT EXIST "../../Graphics/Custom/SuperFX" md "../../Graphics/Custom/SuperFX"

IF EXIST "../../Graphics/Custom/DATA_530000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_530000_hi" --define LoBitmap="DATA_530000_lo" MergeGFX.asm "SuperFX/DATA_530000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_538000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_538000_hi" --define LoBitmap="DATA_538000_lo" MergeGFX.asm "SuperFX/DATA_538000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_540000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_540000_hi" --define LoBitmap="DATA_540000_lo" MergeGFX.asm "SuperFX/DATA_540000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_548000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_548000_hi" --define LoBitmap="DATA_548000_lo" MergeGFX.asm "SuperFX/DATA_548000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_550000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_550000_hi" --define LoBitmap="DATA_550000_lo" MergeGFX.asm "SuperFX/DATA_550000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_558000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_558000_hi" --define LoBitmap="DATA_558000_lo" MergeGFX.asm "SuperFX/DATA_558000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_560000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_560000_hi" --define LoBitmap="DATA_560000_lo" MergeGFX.asm "SuperFX/DATA_560000.bin"
)
IF EXIST "../../Graphics/Custom/DATA_570000_lo.bin" (
	asar --fix-checksum=off --no-title-check --define HiBitmap="DATA_570000_hi" --define LoBitmap="DATA_570000_lo" MergeGFX.asm "SuperFX/DATA_570000.bin"
)
echo Finished.
pause
