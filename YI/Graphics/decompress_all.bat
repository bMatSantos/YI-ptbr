@ECHO OFF

SET PATH="../../Global"
setlocal EnableDelayedExpansion

echo Decompressing LC_LZ1 files...
FOR %%I IN (*.lz1) DO (
	IF %%~xI==.lz1 decomp "%%I" "%%I.bin" 0 1 0
)

echo Decompressing LC_LZ16 files...
FOR %%I IN (*.lz16) DO (
:: Tiles row check
	SET rows=2
	:: Default value (2 rows/kb)
	IF %%~nI==GFX_589AE6 SET rows=8
	IF %%~nI==GFX_589D4F SET rows=8
	IF %%~nI==GFX_589FC4 SET rows=8
	IF %%~nI==GFX_58A2CD SET rows=8
	IF %%~nI==GFX_5CBA89 SET rows=8
	IF %%~nI==GFX_5CC342 SET rows=8
	IF %%~nI==GFX_5CCB44 SET rows=8
	IF %%~nI==GFX_5CD671 SET rows=8
	IF %%~nI==GFX_5CDFC6 SET rows=8
	IF %%~nI==GFX_5CE630 SET rows=8
	IF %%~nI==GFX_5CEEE1 SET rows=8
	IF %%~nI==GFX_5CF376 SET rows=8
	IF %%~nI==GFX_5CF91E SET rows=8
	IF %%~nI==GFX_5CFF0B SET rows=8
	IF %%~nI==GFX_5D04ED SET rows=8
	IF %%~nI==GFX_5D0FEB SET rows=8
	IF %%~nI==GFX_5D180F SET rows=8
	IF %%~nI==GFX_5D1FFF SET rows=8
	IF %%~nI==GFX_5D26DE SET rows=8
	IF %%~nI==GFX_5D2F69 SET rows=8
	IF %%~nI==GFX_5D351B SET rows=8
	IF %%~nI==GFX_5D3A65 SET rows=8
	IF %%~nI==GFX_5D4050 SET rows=8
	IF %%~nI==GFX_5D46D0 SET rows=8
	IF %%~nI==GFX_5D4B93 SET rows=8
	IF %%~nI==GFX_5D511D SET rows=8
	IF %%~nI==GFX_5D57EE SET rows=8
	IF %%~nI==GFX_5D5D3A SET rows=8
	IF %%~nI==GFX_5D6469 SET rows=8
	IF %%~nI==GFX_5DF804 SET rows=16
	IF %%~nI==GFX_5E03D3 SET rows=4
	IF %%~nI==GFX_5E0596 SET rows=4
	IF %%~nI==GFX_5E0750 SET rows=4
	IF %%~nI==GFX_5E0956 SET rows=4
	IF %%~nI==GFX_5E0AB6 SET rows=8
	IF %%~nI==GFX_5E0F30 SET rows=8
	IF %%~nI==GFX_5E16FA SET rows=8
	IF %%~nI==GFX_5E1DD1 SET rows=8
	IF %%~nI==GFX_5E2450 SET rows=8
	IF %%~nI==GFX_5E2E3F SET rows=8
	IF %%~nI==GFX_5E3939 SET rows=8
	IF %%~nI==GFX_5E3E16 SET rows=8
	IF %%~nI==GFX_5E42AC SET rows=8
	IF %%~nI==GFX_5E4D55 SET rows=8
	IF %%~nI==GFX_5E57A7 SET rows=8
	IF %%~nI==GFX_5E5E4B SET rows=8
	IF %%~nI==GFX_5E6583 SET rows=8
	IF %%~nI==GFX_5E6AAE SET rows=8
	IF %%~nI==GFX_5E70E0 SET rows=8
	IF %%~nI==GFX_5E77FD SET rows=8
	IF %%~nI==GFX_5E829F SET rows=16
	IF %%~nI==GFX_5E9360 SET rows=16
	IF %%~nI==GFX_5EA7C0 SET rows=16
	IF %%~nI==GFX_5EBA21 SET rows=16
	IF %%~nI==GFX_5EC639 SET rows=16
	IF %%~nI==GFX_5ED157 SET rows=8
	IF %%~nI==GFX_5ED7BE SET rows=8
	IF %%~nI==GFX_5EE3D2 SET rows=8
	IF %%~nI==GFX_5EE999 SET rows=8
	IF %%~nI==GFX_5EEC88 SET rows=8
	IF %%~nI==GFX_5EF3B1 SET rows=4
	IF %%~nI==GFX_5EF5DC SET rows=4
	IF %%~nI==GFX_5EF845 SET rows=4
	IF %%~nI==GFX_5EFA6E SET rows=4
	IF %%~nI==GFX_5EFCD6 SET rows=4
	IF %%~nI==GFX_5EFEFF SET rows=4
	IF %%~nI==GFX_5F01FE SET rows=4
	IF %%~nI==GFX_5F0576 SET rows=4
	IF %%~nI==GFX_5F0922 SET rows=4
	IF %%~nI==GFX_5F0BBB SET rows=4
	IF %%~nI==GFX_5F10E1 SET rows=4
	IF %%~nI==GFX_5F15BA SET rows=4
	IF %%~nI==GFX_5F1960 SET rows=4
	IF %%~nI==GFX_5F1D97 SET rows=4
	IF %%~nI==GFX_5F21AB SET rows=4
	IF %%~nI==GFX_5F25FB SET rows=4
	IF %%~nI==GFX_5F2948 SET rows=8
	IF %%~nI==GFX_5F2CAC SET rows=8
	IF %%~nI==GFX_5F2EB0 SET rows=8
	IF %%~nI==GFX_5F3352 SET rows=8
	IF %%~nI==GFX_5F3A70 SET rows=8
	IF %%~nI==GFX_5F4013 SET rows=8
	IF %%~nI==GFX_5F45B7 SET rows=8
	IF %%~nI==GFX_5F4D68 SET rows=8
	IF %%~nI==GFX_5F62D2 SET rows=8
	IF %%~nI==GFX_5F6925 SET rows=8
	IF %%~nI==GFX_5F6E88 SET rows=8
	IF %%~nI==GFX_5F725C SET rows=8
	IF %%~nI==GFX_5F7906 SET rows=4
	IF %%~nI==GFX_5F7AC9 SET rows=4
	IF %%~nI==GFX_5F7CE1 SET rows=4
	IF %%~nI==GFX_5F7EA6 SET rows=4
	IF %%~nI==GFX_5F80B8 SET rows=8
	IF %%~nI==GFX_5F8589 SET rows=8
:: Decompress
	decomp "%%I" "%%I.bin" 0 15 !rows!
)
IF NOT EXIST "../Graphics/DecompressedLZ1" md "../Graphics/DecompressedLZ1"
IF NOT EXIST "../Graphics/DecompressedLZ16" md "../Graphics/DecompressedLZ16"
move GFX_*.lz1.bin "../Graphics/DecompressedLZ1"
move GFX_*.lz16.bin "../Graphics/DecompressedLZ16"

pause
