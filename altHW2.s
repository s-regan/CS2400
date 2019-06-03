@Sarah Regan, 2017

@another assignment called HW2

	.equ SWI_exit, 0x11

start: LDR R0,=a
	LDR R1,[R0]
	LDR R0,=b
	LDR R2,[R0]
	MOV R3,R1
	
loop: CMP R3,R2
	BGT end
	
	ADD R3,R3,#1
	B loop
	
end: LDR R0,=c
	STR R3,[R0]
	
	SWI SWI_exit
	
.data
a: .word 0
b: .word 5
c: .word 10