@Sarah Regan,2017

@count # of characters in a string

string: .asciz "This is my string"	@count should be 17 

	equ nul,0		@let nul be 0
	
	.align			@align data
	
	LDR R0,=string		@load whatever sting is into R0
	MOV R1,#0		@move 0 into R1
	
loop: 		LDRB R2,[R0],#1			@load 1 byte from R0(char) into R2
	ADD R1,R1,#1		@increment counter by 1
	CMP R2,#nul		@compare R2 to nothing 
	BNE loop		@if false goto loop
		
	SUB R1,R1,#1		@if true, subtract 1 from counter

stop:	SWI 0x11			@stop program

@if using ARMSim, R1 should be equal to 11 (hex for 17)