@Sarah Regan, 2017
@Collaboration with Joey Brennan for declaring sizes

@to change test values, change a and b values below main code
@edit: I realize that something is going wrong when you step through 
@I will try to address it in the future  

	LDR r0,=a 		@load label a into R0
	LDR R1,[R0]		@load contents (label a) into R1(R1 is now called a)
	LDR R0,=b 		@load label b into R0
	LDR R2,[R0]		@load contents (label b) into R2(R2 is now called b)
	LDR R0,=value1		@load label value1 into R0
	LDR R3,[R0]		@load contents (label value1) into R3(R3 is now called value1)
	LDR R0,=value2		@load label value2 into R0
	LDR R4,[R0]		@load contents (label value2) into R4(R4 is now called value2)
	LDR R0,=value3		@load label value3 into R0
	LDR R5,[R0]		@load contents (label value3) into R5(R5 is now called value3)
	LDR R0,=value4		@load label value4 into R0
	LDR R6,[R0]		@load contents (label value4) into R6(R6 is now called value4)
	
	ADD R3,R1,R2	@add R1 to R2, put in R3
	SUB R4,R1,R2	@sub R1 from R2, put in R4
	MUL R5,R1,R2	@multiply R1 to R2, put in R5
	
	ADD R6,R3,R4	@add R3 to R4, put in R6
	ADD R7,R5,R6	@add R5 to R6, put in R7
	
	SWI 0X11

	@by default, the first value(s) are read first
	@size is declared as a word
	
	a: .word 0x1 ,0x45,0x1111,0x2222,0x2,0xFFFF,0x0,0x1234,C,0xABCD,0xFFFF		@possible values for a
	b: .word 0x1 ,0x2,0x2222,0x1111,0x45,0x25,0x65,0x4321,0x1234,0xFF,0xFFFF 	@possible values for b
	
	value1: .word 0x0 @size of memory for values and default values
	value2: .word 0x0
	value3: .word 0x0
	value4: .word 0x0
	
	.align @align data
	
	@notes:
	@value1 = a + b
	@value2 = a - b 
	@value3 = a x b 
	@value4 = val1 + val2 + val3
	