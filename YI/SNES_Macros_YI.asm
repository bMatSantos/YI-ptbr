macro CUSTOM_YI_AddSInPair(Address)
%InsertMacroAtXPosition(<Address>)
MatchCards_AddSInPair:
	LDA.l !RAM_YI_Global_TilemapUploadIndexLo
	TAX
	LDA.w #$6A12		;\ VRAM adress
	STA.l $7E4002,x		;/
	LDA.w #$8003		;\ Write vertically; Size = 4 bytes
	STA.l $7E4004,x		;|
	STA.l $7E400C,x		;/
	LDA.w #$0EC7		;\ Data
	STA.l $7E4006,x		;|
	LDA.w #$0EC9		;| 
	STA.l $7E4008,x		;/

	LDA.w #$6A13		;\ VRAM adress
	STA.l $7E400A,x		;/
	LDA.w #$0EC8		;\ Data
	STA.l $7E400E,x		;|
	LDA.w #$0ECA		;| 
	STA.l $7E4010,x		;/
	
	LDA.w #$FFFF
	STA.l $7E4012,x

	TXA
	CLC
	ADC.w #$0010									;\ Data length + 4
	STA.l !RAM_YI_Global_TilemapUploadIndexLo		;/
endmacro

;----------------------------------------------------------
macro CUSTOM_YI_LogoExpansion(Address)
namespace YI_LogoExpansion
%InsertMacroAtXPosition(<Address>)
StoreExpandedTiles:
	LDY.b #!VRAMAddressIncrementValue_IncrementOnLoByte
	STY.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$2800
	STA.w !REGISTER_VRAMAddressLo
	LDY.b #!REGISTER_ReadFromVRAMPortLo
	STY.w DMA[$00].Destination
	LDY.b #$7E
	STY.w DMA[$00].SourceBank
	LDA.w #$9CBE
	STA.w DMA[$00].SourceLo
	LDA.w #$0800
	STA.w DMA[$00].SizeLo
	LDY.w !REGISTER_ReadFromVRAMPortLo
	STX.w !REGISTER_DMAEnable

	LDY.b #!VRAMAddressIncrementValue_IncrementOnHiByte
	STY.w !REGISTER_VRAMAddressIncrementValue
	LDA.w #$2800
	STA.w !REGISTER_VRAMAddressLo
	LDY.b #!REGISTER_ReadFromVRAMPortHi
	STY.w DMA[$00].Destination
	LDA.w #$0800
	STA.w DMA[$00].SizeLo
	LDY.w !REGISTER_ReadFromVRAMPortHi
	STX.w !REGISTER_DMAEnable
	RTS

FadeOutExpandedTiles:
	LDX.b $00
	LDY.w #$0400		; Bitplane's size / 2
-:
	STZ.w $2100,x
	INX
	INX
	DEY
	BNE.b -
	RTS

DMAExpandedTiles:
	STA.w !RAM_YI_Global_DMAQueueIndexLo
	TAX
	LDA.w #$2800			;\ VRAM address
	STA.w $0000,x			;/
	LDA.b $00					;\ Source
	CLC							;|
	ADC.w #$2100				;|
	STA.w $0005,x				;/ 
	LSR						;\ Increment VRAM address if it's a high byte
	BCC.b +					;|
	INC.w $0000,x			;/
+:
	LDY.w #$1800		;\ Parameters (low bytes)
	AND.w #$0400		;|\ Increment value (low bytes)
	BNE.b ++			;.|
	LDA.w #$0080		;.\ Increment value (high bytes)
	LDY.w #$1900		;\ Parameters (high bytes)
++:
	STA.w $0002,x		;|/
	TYA					;|
	STA.w $0003,x		;/

	LDA.w #$007E				;\ Source bank
	STA.w $0007,x				;/
	LDA.w #$07FF		;\ Size
	STA.w $0008,x		;/
	LDA.w !RAM_YI_Global_DMAQueueIndexLo	;\ Next entry
	CLC											;|
	ADC.w #$000C								;|
	STA.w $000A,x								;|
	STA.w !RAM_YI_Global_DMAQueueIndexLo	;/
	RTS

namespace off
endmacro
