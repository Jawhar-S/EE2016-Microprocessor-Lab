;
; Lab1-Prob1.asm
;
; Created: 01-09-2021 14:54:37
; Author : Jawhar
;


; Replace with your application code
.CSEG
		LDI R17,$7A
		LDI R18,$8B
		LDI R16,$00 ; carry bit
		ADD R17,R18
		BRCC nc
		LDI R16,$01
nc:		NOP
	
