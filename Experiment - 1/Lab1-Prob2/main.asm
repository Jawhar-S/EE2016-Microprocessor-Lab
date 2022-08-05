;
; Lab1-Prob2.asm
;
; Created: 01-09-2021 15:19:19
; Author : Jawhar
;


; Replace with your application code
.CSEG
	LDI	R16,$34	; lower byte of num1
	LDI	R17,$12	; lower byte of num2
	LDI	R18,$CD	; higher byte of num1
	LDI	R19,$AB	; higher byte of num2
	LDI R20,$01 ; carry for lower byte addition
	LDI R21,$00	; carry for higher byte addition
	ADD R16,R17
	BRCC nc
	ADD R18,R20
nc: ADD R18,R19
	BRCC nc2
	LDI R21,$01
nc2:NOP
	
