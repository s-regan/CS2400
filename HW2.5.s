@Sarah Regan, 2017

@count number of 't's in string

string: .asciz "this is my string" 	@count should be 17
char:	.ascii "t"			@count should be 2

	.equ nul,0			@let nul equal 0
	.align				@align data
	
	LDR R0,=string			@load whatever string is into R0
	LDR R1,=char			@load character to check for into R1
	MOV R2,#0			@zero out R2(counter)
	LDRB R4,[R1],#1			@load 1 byte from R1(char) into R4
	
loop:	LDRB R3,[R0],#1			@load 1 byte from R0(string) into R3
	CMP R3,#nul			@compare R3 to nul
	BEQ stop			@if nul(empty/0) branch to stop	
	CMP R4,R3			@otherwise cont, compare char in R4 to R3
	BNE loop			@if not equal, branch to loop
	
	ADD R2,R2,#1			@if equal, increase counter by 1
	CMP R3,#nul				@compare R3 to nul
	BNE loop			@if not nul(empty) branch to loop
	
stop: SWI 0x11				@stop program