;!HiBitmap
;!LoBitmap
!ByteOffset = $00
!GFXSizeHi #= filesize("!HiBitmap.bin")
!GFXSizeLo #= filesize("!LoBitmap.bin")

assert !GFXSizeHi == !GFXSizeLo, "The bitmaps have different sizes! Make sure they have the same size so that they can be properly interleaved."
warnings disable W1008

while !ByteOffset < !GFXSizeLo
	!HiBMPByte #= readfile1("!HiBitmap.bin", !ByteOffset)
	!LoBMPByte #= readfile1("!LoBitmap.bin", !ByteOffset)

	; Split high bitmap's data
	!HiNibble1 #= !HiBMPByte&$F0
	!HiNibble2 #= !HiBMPByte<<4
	; Split low bitmap's data
	!LoNibble1 #= !LoBMPByte>>4
	!LoNibble2 #= !LoBMPByte&$0F

	; Interleave bytes
	db !HiNibble1|!LoNibble1,!HiNibble2|!LoNibble2
	!ByteOffset #= !ByteOffset+1
endif
