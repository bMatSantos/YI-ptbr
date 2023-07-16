; Info: $FE,(Ypos/8),$FD,(Ypos),$FC,(Xpos)
; $FB = 2x scale
; To centralize a line: Xpos = ($100-Total Width)/2

YI_Story_IntroA:
	db $FE,$00,$FD,$00,$FC,$2A
	db "Esta ",$04," uma hist",$59,"ria sobre"
	db $FE,$01,$FD,$08,$FC,$2D
	db "o beb",$05," Mario e o Yoshi..."
	db $FF
YI_Story_IntroB:
	db $FE,$02,$FD,$10,$FC,$24
	db "Uma hist",$59,"ria que aconteceu"
	db $FE,$03,$FD,$18,$FC,$35
	db "h",$56," muito, muito tempo."
	db $FF

YI_Story_StorkA:
	db $FE,$00,$FD,$00,$FC,$14
	db "Antes do dia raiar, uma cegonha"
	db $FE,$01,$FD,$08,$FC,$31
	db "voa com muita urg",$05,"ncia,"
	db $FF
YI_Story_StorkB:
	db $FE,$02,$FD,$10,$FC,$33
	db "carregando em seu bico"
	db $FE,$03,$FD,$18,$FC,$36
	db "um par de irm",$0C,"ozinhos."
	db $FF
YI_Story_StorkC:
	db $FE,$00,$FD,$00,$FC,$25
	db "De repente, surge um vulto"
	db $FE,$01,$FD,$08,$FC,$3A
	db "por entre as nuvens,"
	db $FF
YI_Story_StorkD:
	db $FE,$02,$FD,$10,$FC,$2A
	db "voando a toda velocidade"
	db $FE,$03,$FD,$18,$FC,$38
	db "em dire",$02,$0C,"o ",$00," cegonha."
	db $FF

YI_Story_KamekA:
	db $FE,$00,$FE,$01,$FD,$00,$FC,$1A,$FB
	db "CRR",$4E,$4E,$4E,$4E,$4E,$4E,$4E,"!!!"
	db $FF
YI_Story_KamekB:
	db $FE,$02,$FD,$10,$FC,$40
	db "OS BEB",$45,"S S",$0E,"O MEUS!"
	db $FE,$03,$FF

YI_Story_KidnapA:
	db $FE,$00,$FE,$01,$FD,$00,$FC,$52,$FB
	db "UAH!!!"
	db $FF
YI_Story_KidnapB:
	db $FE,$02,$FD,$10,$FC,$27
	db "Ao trombar com a cegonha,"
	db $FE,$03,$FD,$18,$FC,$27
	db "a criatura apanha um beb",$05
	db $FF
YI_Story_KidnapC:
	db $FE,$00,$FD,$00,$FC,$28
	db "e some na mesma escurid",$0C,"o"
	db $FE,$01,$FD,$08,$FC,$2E
	db "de onde havia aparecido."
	db $FF

YI_Story_OpenSeaA:
	db $FE,$00,$FE,$01,$FD,$00,$FC,$40,$FB
	db "AH N",$0E,"O..."
	db $FF
YI_Story_OpenSeaB:
	db $FE,$02,$FD,$10,$FC,$25
	db "O outro beb",$05," foi derrubado"
	db $FE,$03,$FD,$18,$FC,$2A
	db "no oceano sem querer...!"
	db $FF
YI_Story_OpenSeaC:

YI_Story_YoshiWalkA:
	db $FE,$00,$FD,$00,$FC,$1D
	db "Enquanto isso, na Ilha Yoshi,"
	db $FE,$01,$FD,$08,$FC,$24
	db "o lar de todos os Yoshis..."
	db $FF
YI_Story_YoshiWalkB:
	db $FE,$02,$FD,$10,$FC,$1F
	db $44," uma linda manh",$0C,", e por isso"
	db $FE,$03,$FD,$18,$FC,$25
	db "um Yoshi sai para caminhar."
	db $FF
YI_Story_YoshiWalkC:
	db $FE,$00,$FE,$01,$FD,$00,$FC,$4C,$FB
	db "OXE?!?"
	db $FF
YI_Story_YoshiWalkD:
	db $FE,$02,$FD,$10,$FC,$22
	db "Sem mais nem menos, o mesmo"
	db $FE,$03,$FD,$18,$FC,$2E
	db "beb",$05," cai em suas costas."
	db $FF
YI_Story_YoshiWalkE:
	db $FE,$00,$FD,$00,$FC,$23
	db "Pelo visto, o beb",$05," est",$56," bem."
	db $FE,$01,$FD,$08,$FC,$5D
	db "Que al",$57,"vio!"
	db $FF
YI_Story_YoshiWalkF:
	db $FE,$02,$FD,$10,$FC,$3A
	db "H",$0C,"? Outra coisa caiu"
	db $FE,$03,$FD,$18,$FC,$49
	db "junto com ele..."
	db $FF
YI_Story_YoshiWalkG:

YI_Story_MapA:
	db $FE,$00,$FD,$00,$FC,$25
	db "Parece ser um mapa. Talvez"
	db $FE,$01,$FD,$08,$FC,$21
	db "a cegonha o estava usando?"
	db $FF
YI_Story_MapB:
	db $FE,$02,$FD,$10,$FC,$3C
	db "Ainda assim, o Yoshi"
	db $FE,$03,$FD,$18,$FC,$35
	db "n",$0C,"o consegue ler nada."
	db $FF
YI_Story_MapC:
	db $FE,$00,$FD,$00,$FC,$30
	db "Ele resolve discutir com"
	db $FE,$01,$FD,$08,$FC,$29
	db "seus amigos sobre isso..."
	db $FF

YI_Story_ToadiesA:
	db $FE,$00,$FE,$01,$FD,$00,$FC,$10,$FB
	db "GAAAAAAAAAH!!!"
	db $FF
YI_Story_ToadiesB:
	db $FE,$02,$FD,$10,$FC,$1F
	db "Quem raptou o outro beb",$05," foi"
	db $FE,$03,$FD,$18,$FC,$25
	db "Kamek, o malvado Magikupa."
	db $FF
YI_Story_ToadiesC:
	db $FE,$00,$FD,$00,$FC,$1F
	db "No castelo de Bauser, ao ver"
	db $FE,$01,$FD,$08,$FC,$2D
	db "que perdeu um dos beb",$05,"s,"
	db $FF
YI_Story_ToadiesD:
	db $FE,$02,$FD,$10,$FC,$25
	db "ele rapidamente manda seus"
	db $FE,$03,$FD,$18,$FC,$22
	db "subalternos o encontrarem!"
	db $FF

YI_Story_PlainsA:
	db $FE,$00,$FD,$00,$FC,$2D
	db "Yoshi vai despreocupado"
	db $FE,$01,$FD,$08,$FC,$1E
	db "a caminho dos outros Yoshis,"
	db $FF
YI_Story_PlainsB:
	db $FE,$02,$FD,$10,$FC,$1A
	db "sem saber do perigo por perto."
	db $FE,$03,$FF
YI_Story_PlainsC:
	db $FE,$00,$FD,$00,$FC,$20
	db "As tropas de Kamek j",$56," est",$0C,"o"
	db $FE,$01,$FD,$08,$FC,$22
	db "procurando o beb",$05," pela ilha."
	db $FF

YI_Story_Outro:
	db $FE,$00,$FD,$00,$FC,$0D
	db "Ser",$56," que essas crian",$02,"as chegar",$0C,"o"
	db $FE,$01,$FD,$08,$FC,$1B
	db "com seguran",$02,"a aos seus pais?"
	db $FF