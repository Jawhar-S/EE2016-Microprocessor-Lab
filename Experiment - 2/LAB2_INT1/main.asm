;
; LAB2_INT1.asm
;
; Created: 20-09-2021 16:58:35
; Author : Jawhar
;


; Replace with your application code
.org 0x0000
rjmp reset

.org 0x0004
rjmp int1_ISR

.org 0x0100

reset:
	  
      LDI R16,0x70
	  OUT SPL,R16
	  LDI R16,0x00
	  OUT SPH,R16

	  LDI R16,0x01
	  OUT DDRB,R16
	 
	  LDI R16,0x00
	  OUT DDRD,R16

	  LDI R16,0x00
	  OUT MCUCR,R16

	  LDI R16,0x80
	  OUT GICR,R16

	  SEI
ind_loop:rjmp ind_loop

int1_ISR:IN R16,SREG
		 PUSH R16			 
		
		 LDI R16,0x0A
		 MOV R0,R16
		 
	c1:	 LDI R16,0x01
		 OUT PORTB,R16
		 ; 0x45 = 69 in decimal
		 LDI R16,0x45
	a1:	 LDI R17,0x45
	a2:  LDI R18,0x45
	a3:	 DEC R18		
		 BRNE a3		
		 DEC R17		
		 BRNE a2		
		 DEC R16		
		 BRNE a1		
		 LDI R16,0x00
		 OUT PORTB,R16

		 LDI R16,0x45
	b1:	 LDI R17,0x45
	b2:  LDI R18,0x45
	b3:	 DEC R18
		 BRNE b3
		 DEC R17
		 BRNE b2
		 DEC R16
		 BRNE b1

		 DEC R0
		 BRNE c1
		 POP R16				 
		 OUT SREG, R16
		 RETI

; Delay caused while looping this instruction = 1*69*69*69
; Delay caused while looping this instruction = 2*69*69*69
; Delay caused while looping this instruction = 1*69*69
; Delay caused while looping this instruction = 2*69*69
; Delay caused while looping this instruction = 1*69
; Delay caused while looping this instruction = 2*69
; Total Delay = 1000017 micro seconds = approximately 1 second