@Sarah Regan, 2017

@count number of 't's in string

string: .asciz "this is my string" 	@count should be 17
char:	.ascii "t"	@count should be 2

	.equ nul,0
	.align
	
	LDR R0,=string
	LDR R1,=char
	MOV R2,#0
	LDRB R4,[R1],#1
	
loop: LDRB R3,[R0],#1
	CMP R3,#nul
	BEQ stop
	CMP R4,R3
	BNE loop
	
	ADD R2,R2,#1
	CMP R3,#nul
	BNE loop
	
stop: SWI 0x11