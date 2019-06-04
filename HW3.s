@Sarah Regan, 2017

@ R0-addressing
@ R1-count
@ R2-j
@ R3-size
@ R4-target
@ R5-pointer to tableIn
@ R6-pointer to tableOut
@ R7-data from tableIn

.equ SWI_exit, 0x11

start: MOV R1,#0
	MOV R2,#0
	LDR R0,=size
	LDR R3,[R0]
	LDR R0,=target
	LDR R4,[R0]
	LDR R5,=tableIn
	LDR R6,=tableOut
	
loop:	CMP R2,R3
	BGE end
	
	LDR R7,[R5]
	CMP R7,R4
	BNE endif
	STR R7,[R6]
	ADD R6,R6,#4
	ADD R1,R1,#1

endif: ADD R5,R5,#4
	ADD R2,R2,#1
	B loop

end: LDR R0,=count
	STR R1,[R0]
	
	SWI SWI_exit
	
.data
count: .word 0
tableIn: .word 12,13,9,12,13,9,8,9,9,8
size: .word 10
target: .word 9
tableOut: .word 0