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

start:	MOV R1,#0 		@r1 is count, save into count location  after loop
	MOV R2,#0		@r2 is j- loop control variable
	LDR R0,=size		@load address of size
	LDR R3,[R0]		@load size(number of words in tableIn) into r3
	LDR R0,=target		@load address of target
	LDR R4,[R0]		@load target word into r4
	LDR R5,=tableIn		@r5 to point to first word in tableIn
	LDR R6,=tableOut	@r6 to point to first available word in tableOut
	
loop:	CMP R2,R3		@compare j and size
	BGE end			@exit loop is j>=r3
	
	LDR R7,[R5]		@load current word from tableIn
	CMP R7,R4		@compare word from table to target
	BNE endif		@branch if word from table and target are not equal
	STR R7,[R6]		@store word from table into tableOut
	ADD R6,R6,#4		@add 4 to r6 so it points to next available location in tableOut
	ADD R1,R1,#1		@count++

endif: ADD R5,R5,#4		@add 4 to pointer to tableIn so it points to next word in table
	ADD R2,R2,#1		@j++
	B loop

end:	LDR R0,=count		@load address of count
	STR R1,[R0]		@store count
	
	SWI SWI_exit
	
.data
count: .word 0
tableIn: .word 12,13,9,12,13,9,8,9,9,8
size: .word 10			@number of words in tableIn
target: .word 9
tableOut: .word 0		@no need to specify exact number of words in tableOut