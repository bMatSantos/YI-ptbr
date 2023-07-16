@ECHO OFF

SET PATH="../../Global"
setlocal EnableDelayedExpansion

echo Decompressing tilemaps...
IF NOT EXIST "../Tilemaps/Decompressed" md "../Tilemaps/Decompressed"
FOR %%I IN (*.lz1) DO (decomp "%%I" "Decompressed/%%I.bin" 0 1 0)

echo.
echo Finished.
pause
