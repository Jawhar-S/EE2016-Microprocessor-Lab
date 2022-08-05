	AREA Factorial,CODE,READONLY
ENTRY
Main

	LDR R0, Number1
	LDR R1, Number2
	MOV R3, #0

Loop
	CMP R1, #0
	BEQ Err
	CMP R0, R1
	BLT Done
	ADD R3, R3, #1
	SUB R0, R0, R1
	B Loop

Err
	MOV R3, #0xFFFFFFFF

Done
	STR R0, Remain
	STR R3, Quotient
	SWI &11

	AREA Data1, DATA

Number1 DCD &0276CBC1
Number2 DCD &0286
	ALIGN

	AREA Data2, DATA

Quotient DCD 0
Remain DCD 0
	ALIGN
	END

