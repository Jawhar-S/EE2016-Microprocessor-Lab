;
; LAB1_Prob4.asm
;
; Created: 01-09-2021 17:29:35
; Author : Jawhar
;


; R0 will contain the final largest hexadecimal number
		.CSEG
		LDI ZL,LOW(NUM<<1)
		LDI ZH,HIGH(NUM<<1)
		LDI XL,$60	; SRAM address
		LDI XH,$00
		LPM R20,Z+
		LPM R0,Z+
loop:	DEC R20
		CPI R20,$0
		BREQ last	; if R20 = 0 then 'last' branch will get executed
		LPM R16,Z+
		CP R16,R0
		BRSH change ; if the number in R16 is greater than or equal to R0 then 'change' branch will get executed
		RJMP loop
change: MOV R0,R16
		RJMP loop
last:	ST X,R0
		NOP
NUM:.db 4, $96,$1A,$F4,$B5  ; 4 is the no. of 8 bit unsigned binary numbers to be compared(used for looping)
