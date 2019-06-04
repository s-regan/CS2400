@Sarah Regan, 2017

@another assignment called HW1

	.equ SWI_exit, 0x11

start:	LDR R0,=a
	LDR R1,[R0]
	LDR R2,=b
	LDR R2,[R0]
	CMP R1,R2
	BNE else
	
	LDR R0,=d
	LDR R1,[R0]
	LDR R0,=f 
	LDR R2,[R0]
	ADD R3,R1,R2
	LDR R0,=c
	STR R3,[R0]
	B end
	
else:	LDR R0,=d
	LDR R1,[R0]
	LDR R0,=f
	LDR R2,[R0]
	MUL R3,R1,R2
	LDR R0,=e
	STR R3,[R0]

end: SWI SWI_exit

a: .word 10
b: .word 45
c: .word 0
d: .word 2
e: .word 0
f: .word 5
	
	
	
	