;!Bitmap
;!HighNibble
!ByteOffset = $00
!GFXSize #= filesize("!Bitmap.bin")

warnings disable W1008

while !ByteOffset < !GFXSize
	!FileByte1 = readfile1("!Bitmap.bin", !ByteOffset)
	!FileByte2 = readfile1("!Bitmap.bin", !ByteOffset+1)

	if !HighNibble == 1
		; Extract high nibbles
		!Nibble1 #= !FileByte1&$F0
		!Nibble2 #= !FileByte2>>4
	else
		; Extract low nibbles
		!Nibble1 #= !FileByte1<<4
		!Nibble2 #= !FileByte2&$0F
	endif

	db !Nibble1|!Nibble2
	!ByteOffset #= !ByteOffset+2
endif
