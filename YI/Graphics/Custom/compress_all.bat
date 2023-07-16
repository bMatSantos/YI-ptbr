@ECHO OFF

SET PATH="../../../Global"
setlocal EnableDelayedExpansion

echo Compressing LC_LZ1 files...
echo.
FOR %%I IN (*.lz1.bin) DO (
	recomp %%I "%%~nI.cbn" 0 1 0
)

echo.
echo Compressing LC_LZ16 files...
echo.
FOR %%I IN (*.lz16.bin) DO (
:: Tiles row check
	SET rows=2
	:: Default value (2 rows/kb)
	IF %%~nI==GFX_589AE6.lz16 SET rows=8
	IF %%~nI==GFX_589D4F.lz16 SET rows=8
	IF %%~nI==GFX_589FC4.lz16 SET rows=8
	IF %%~nI==GFX_58A2CD.lz16 SET rows=8
	IF %%~nI==GFX_5CBA89.lz16 SET rows=8
	IF %%~nI==GFX_5CC342.lz16 SET rows=8
	IF %%~nI==GFX_5CCB44.lz16 SET rows=8
	IF %%~nI==GFX_5CD671.lz16 SET rows=8
	IF %%~nI==GFX_5CDFC6.lz16 SET rows=8
	IF %%~nI==GFX_5CE630.lz16 SET rows=8
	IF %%~nI==GFX_5CEEE1.lz16 SET rows=8
	IF %%~nI==GFX_5CF376.lz16 SET rows=8
	IF %%~nI==GFX_5CF91E.lz16 SET rows=8
	IF %%~nI==GFX_5CFF0B.lz16 SET rows=8
	IF %%~nI==GFX_5D04ED.lz16 SET rows=8
	IF %%~nI==GFX_5D0FEB.lz16 SET rows=8
	IF %%~nI==GFX_5D180F.lz16 SET rows=8
	IF %%~nI==GFX_5D1FFF.lz16 SET rows=8
	IF %%~nI==GFX_5D26DE.lz16 SET rows=8
	IF %%~nI==GFX_5D2F69.lz16 SET rows=8
	IF %%~nI==GFX_5D351B.lz16 SET rows=8
	IF %%~nI==GFX_5D3A65.lz16 SET rows=8
	IF %%~nI==GFX_5D4050.lz16 SET rows=8
	IF %%~nI==GFX_5D46D0.lz16 SET rows=8
	IF %%~nI==GFX_5D4B93.lz16 SET rows=8
	IF %%~nI==GFX_5D511D.lz16 SET rows=8
	IF %%~nI==GFX_5D57EE.lz16 SET rows=8
	IF %%~nI==GFX_5D5D3A.lz16 SET rows=8
	IF %%~nI==GFX_5D6469.lz16 SET rows=8
	IF %%~nI==GFX_5DF804.lz16 SET rows=16
	IF %%~nI==GFX_5E03D3.lz16 SET rows=4
	IF %%~nI==GFX_5E0596.lz16 SET rows=4
	IF %%~nI==GFX_5E0750.lz16 SET rows=4
	IF %%~nI==GFX_5E0956.lz16 SET rows=4
	IF %%~nI==GFX_5E0AB6.lz16 SET rows=8
	IF %%~nI==GFX_5E0F30.lz16 SET rows=8
	IF %%~nI==GFX_5E16FA.lz16 SET rows=8
	IF %%~nI==GFX_5E1DD1.lz16 SET rows=8
	IF %%~nI==GFX_5E2450.lz16 SET rows=8
	IF %%~nI==GFX_5E2E3F.lz16 SET rows=8
	IF %%~nI==GFX_5E3939.lz16 SET rows=8
	IF %%~nI==GFX_5E3E16.lz16 SET rows=8
	IF %%~nI==GFX_5E42AC.lz16 SET rows=8
	IF %%~nI==GFX_5E4D55.lz16 SET rows=8
	IF %%~nI==GFX_5E57A7.lz16 SET rows=8
	IF %%~nI==GFX_5E5E4B.lz16 SET rows=8
	IF %%~nI==GFX_5E6583.lz16 SET rows=8
	IF %%~nI==GFX_5E6AAE.lz16 SET rows=8
	IF %%~nI==GFX_5E70E0.lz16 SET rows=8
	IF %%~nI==GFX_5E77FD.lz16 SET rows=8
	IF %%~nI==GFX_5E829F.lz16 SET rows=16
	IF %%~nI==GFX_5E9360.lz16 SET rows=16
	IF %%~nI==GFX_5EA7C0.lz16 SET rows=16
	IF %%~nI==GFX_5EBA21.lz16 SET rows=16
	IF %%~nI==GFX_5EC639.lz16 SET rows=16
	IF %%~nI==GFX_5ED157.lz16 SET rows=8
	IF %%~nI==GFX_5ED7BE.lz16 SET rows=8
	IF %%~nI==GFX_5EE3D2.lz16 SET rows=8
	IF %%~nI==GFX_5EE999.lz16 SET rows=8
	IF %%~nI==GFX_5EEC88.lz16 SET rows=8
	IF %%~nI==GFX_5EF3B1.lz16 SET rows=4
	IF %%~nI==GFX_5EF5DC.lz16 SET rows=4
	IF %%~nI==GFX_5EF845.lz16 SET rows=4
	IF %%~nI==GFX_5EFA6E.lz16 SET rows=4
	IF %%~nI==GFX_5EFCD6.lz16 SET rows=4
	IF %%~nI==GFX_5EFEFF.lz16 SET rows=4
	IF %%~nI==GFX_5F01FE.lz16 SET rows=4
	IF %%~nI==GFX_5F0576.lz16 SET rows=4
	IF %%~nI==GFX_5F0922.lz16 SET rows=4
	IF %%~nI==GFX_5F0BBB.lz16 SET rows=4
	IF %%~nI==GFX_5F10E1.lz16 SET rows=4
	IF %%~nI==GFX_5F15BA.lz16 SET rows=4
	IF %%~nI==GFX_5F1960.lz16 SET rows=4
	IF %%~nI==GFX_5F1D97.lz16 SET rows=4
	IF %%~nI==GFX_5F21AB.lz16 SET rows=4
	IF %%~nI==GFX_5F25FB.lz16 SET rows=4
	IF %%~nI==GFX_5F2948.lz16 SET rows=8
	IF %%~nI==GFX_5F2CAC.lz16 SET rows=8
	IF %%~nI==GFX_5F2EB0.lz16 SET rows=8
	IF %%~nI==GFX_5F3352.lz16 SET rows=8
	IF %%~nI==GFX_5F3A70.lz16 SET rows=8
	IF %%~nI==GFX_5F4013.lz16 SET rows=8
	IF %%~nI==GFX_5F45B7.lz16 SET rows=8
	IF %%~nI==GFX_5F4D68.lz16 SET rows=8
	IF %%~nI==GFX_5F62D2.lz16 SET rows=8
	IF %%~nI==GFX_5F6925.lz16 SET rows=8
	IF %%~nI==GFX_5F6E88.lz16 SET rows=8
	IF %%~nI==GFX_5F725C.lz16 SET rows=8
	IF %%~nI==GFX_5F7906.lz16 SET rows=4
	IF %%~nI==GFX_5F7AC9.lz16 SET rows=4
	IF %%~nI==GFX_5F7CE1.lz16 SET rows=4
	IF %%~nI==GFX_5F7EA6.lz16 SET rows=4
	IF %%~nI==GFX_5F80B8.lz16 SET rows=8
	IF %%~nI==GFX_5F8589.lz16 SET rows=8
:: Compress
	recomp %%I "%%~nI.cbn" 0 15 !rows!
)
IF NOT EXIST "../../Graphics/Custom/CompressedGFX" md "../../Graphics/Custom/CompressedGFX"
move *.cbn "../../Graphics/Custom/CompressedGFX"
echo.
echo.
echo Compression finished.
pause
