 ; [BR]
macro YI_InsertMsgBoxText(File)
	!TxtOffset = $00
	!TxtNext = $01
	!Txt3rd = $02
	!Txt5th = $04
	!ThisByte = readfile1("<File>", !TxtOffset)
	!ThisWord = readfile2("<File>", !TxtOffset)
	!ThisDWord = readfile4("<File>", !TxtOffset)
	!NextByte = readfile1("<File>", !TxtNext)
	!NextWord = readfile2("<File>", !TxtNext)
	!NextLong = readfile3("<File>", !TxtNext)
	!NextDWord = readfile4("<File>", !TxtNext)

	!ThirdByte = readfile1("<File>", !Txt3rd)
	!FifthByte = readfile1("<File>", !Txt5th)
	!FifthWord = readfile2("<File>", !Txt5th)

while !TxtOffset < filesize("<File>")
	if !ThisWord == $0A0D	; Ignores line breaks on txt
		!Increment = 2
	elseif !ThisByte == $7B		; {
	;	Commands
		if !NextByte == $6E					; {n_}, new lines
			db $FF,!ThirdByte-$2C
			!Increment = 4
		
		elseif !NextByte == $50				; {P}, indicates 1st line of the next page
			dw $0AFF
			!Increment = 3

		elseif !NextDWord == $32726353		; {Scr2}, scroll 2 pixels/frame
			rep 8 : dw $12FF
			!Increment = 6
		
		elseif !NextByte == $44				; {D_n_} Yoshi drawings
			!Increment = 6
			if !ThirdByte == $31				; D1 = Making an egg
				!Drawing = $0000 : !Pg = $30
			elseif !ThirdByte == $32			; D2 = Ground pound
				!Drawing = $0030 : !Pg = $30
			elseif !ThirdByte == $33			; D3 = Throwing eggs
				!Drawing = $0080 : !Pg = $30
			endif
			; n_ = Line number
			dw $60FF
			db $00 : dw !Drawing : db $80,!Pg,$00,(!FifthByte-$31)<<4
		
		elseif !NextDWord == $6566694C		; {Life}, life number
			dw $3DFF,$3EFF,$3FFF
			!Increment = 6
		
		; Size commands. The default value is {S1}.
		elseif !NextByte == $53				; {S_} proportional scale
			!Increment = 4
			db $FF,!ThirdByte-1
		elseif !NextByte == $48				; {H_} scale height
			!Increment = 4
			db $FF,!ThirdByte+3
		elseif !NextByte == $57				; {W_} scale width
			!Increment = 4
			db $FF,!ThirdByte+7
		
		elseif !NextLong == $646E45			; {End__}, endstring
			!Increment = 7
			if !FifthWord == $4630				; 0F = Default
				dw $0FFF
			elseif !FifthWord == $3035			; 50 = Retry prompt
				dw $50FF
			elseif !FifthWord == $3135			; 51 = Unknown prompt
				dw $51FF
			elseif !FifthWord == $3235			; 52 = Message box prompt
				dw $52FF
			endif
		endif
	elseif !ThisByte == $C3
	;	Accents (Latin Supplement)
		!Increment = 2 
		if !NextByte == $80			; À
			db $40
		elseif !NextByte == $81		; Á
			db $4E
		elseif !NextByte == $82		; Â
			db $41
		elseif !NextByte == $83		; Ã
			db $0E
		elseif !NextByte == $87		; Ç
			db $42
		elseif !NextByte == $89		; É
			db $44
		elseif !NextByte == $8A		; Ê
			db $45
		elseif !NextByte == $8D		; Í
			db $4F
		elseif !NextByte == $93		; Ó
			db $51
		elseif !NextByte == $94		; Ô
			db $47
		elseif !NextByte == $95		; Õ
			db $0F
		elseif !NextByte == $9A		; Ú
			db $48
		elseif !NextByte == $A0		; à
			db $00
		elseif !NextByte == $A1		; á
			db $56
		elseif !NextByte == $A2		; â
			db $01
		elseif !NextByte == $A3		; ã
			db $0C
		elseif !NextByte == $A7		; ç
			db $02
		elseif !NextByte == $A9		; é
			db $04
		elseif !NextByte == $AA		; ê
			db $05
		elseif !NextByte == $AD		; í
			db $57
		elseif !NextByte == $B3		; ó
			db $59
		elseif !NextByte == $B4		; ô
			db $07
		elseif !NextByte == $B5		; õ
			db $0D
		elseif !NextByte == $BA		; ú
			db $5F
		endif
	elseif !ThisByte == $5B		; [
	; 	Icons
		!Increment = 3
		if !NextWord == $7859			; [Yx] Yoshi + multiplier
			!Increment = 4
			db $D5,$D6,$D7
		elseif !NextWord == $5055		; [UP] arrow
			!Increment = 4
			db $2F
		elseif !NextDWord == $5446454C	; [LEFT] arrow 
			!Increment = 6
			db $2D
		elseif !NextDWord == $54484752	; [RGHT] arrow
			!Increment = 6
			db $2E
		elseif !NextDWord == $4E574F44	; [DOWN] arrow
			!Increment = 6
			db $30
		elseif !NextByte == $41			; [A] button
			db $18,$19
		elseif !NextByte == $42			; [B] button
			db $1A,$1B
		elseif !NextByte == $58			; [X] button
			db $1E,$1F
		elseif !NextByte == $59			; [Y] button
			db $1C,$1D
		elseif !NextLong == $4C4553		; [SEL] Select
			!Increment = 5
			db $20,$21,$22
		elseif !NextDWord == $54525453	; [STRT] Start
			!Increment = 6
			db $31,$32,$33
		elseif !NextByte == $4C			; [L] trigger
			db $23,$24,$25
		elseif !NextByte == $52			; [R] trigger
			db $28,$29,$2A
		elseif !NextDWord == $52444C43	; [CLDR] Cloud arrow
			!Increment = 6
			db $34,$35
		elseif !NextByte == $2C			; [,] Different comma
			db $37
		elseif !NextByte == $2E			; [.] Different period
			db $3F
		elseif !NextDWord == $44415044	; [DPAD] D-pad
			!Increment = 6
			db $CA,$CB
		elseif !NextByte == $3E			; [>] right cursor
			db $D4
		elseif !NextByte == $3F			; [?] winged cloud
			db $F4,$F5
		elseif !NextByte == $2A			; [*] star
			db $F6,$F7
		elseif !NextByte == $21			; [!] switch
			db $F8,$F9
		endif
	elseif !ThisByte >= $30 && !ThisByte <= $39
	; 	0-9 Range
		db !ThisByte+$70
		!Increment = 1
	elseif !ThisByte >= $61 && !ThisByte <= $7A
	; 	a-z Range
		db !ThisByte+$77
		!Increment = 1
	elseif !ThisByte >= $41 && !ThisByte <= $5A
	; 	A-Z Range
		db !ThisByte+$69
		!Increment = 1
	elseif !ThisByte == $C2
	; Extended symbols
		!Increment = 2
		if !NextByte == $AA			; ª
			db $5C
		elseif !NextByte == $BA		; º
			db $5B
		endif
	; Misc.
	elseif !ThisByte == $20
		db " "
		!Increment = 1
	elseif !ThisByte == $21
		db "!"
		!Increment = 1
	elseif !ThisByte == $22
		db $D2	; "
		!Increment = 1
	elseif !ThisByte == $27
		db "'"
		!Increment = 1
	elseif !ThisByte == $2C
		db ","
		!Increment = 1
	elseif !ThisByte == $2D
		db "-"
		!Increment = 1
	elseif !ThisByte == $2E
		db "."
		!Increment = 1
	elseif !ThisByte == $2F
		db $0A	; /
		!Increment = 1
	elseif !ThisByte == $3A
		db ":"
		!Increment = 1
	elseif !ThisByte == $3B
		db ";"
		!Increment = 1
	elseif !ThisByte == $3D
		db "="
		!Increment = 1
	elseif !ThisByte == $3F
		db "?"
		!Increment = 1
	elseif !ThisByte == $7E
		db "~"
		!Increment = 1
	else
		print "<File>"
		print "Byte $",hex(!ThisByte, 2)," at offset $",hex(!TxtOffset, 3)
		!Increment = 1
	endif

	!TxtOffset #= !TxtOffset+!Increment
	!TxtNext #= !TxtNext+!Increment
	!Txt3rd #= !Txt3rd+!Increment
	!Txt5th #= !Txt5th+!Increment
endif
	dw $FFFF
endmacro
