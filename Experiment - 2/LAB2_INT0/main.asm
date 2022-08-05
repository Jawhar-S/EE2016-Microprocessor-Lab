;
; LAB2_INT0.asm
;
; Created: 21-09-2021 11:20:18
; Author : Jawhar
;


; Replace with your application code
.org 0x0000
rjmp reset

.org 0x0002
rjmp int0_ISR

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

	  LDI R16,0x40
	  OUT GICR,R16

	  SEI
ind_loop:rjmp ind_loop

int0_ISR:IN R16,SREG
		 PUSH R16
		
		 LDI R16,0x0A
		 MOV R0,R16
		 
	c1:	 LDI R16,0x01
		 OUT PORTB,R16

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