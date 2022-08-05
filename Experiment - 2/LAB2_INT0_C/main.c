/*
 * LAB2_INT0_C.c
 *
 * Created: 21-09-2021 12:05:18
 * Author : Jawhar
 */ 

#define F_CPU 1000000  

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR (INT0_vect)
{
	int i;
	for (i=1;i<=10;i++) 

	{
		PORTB=0x01;
		_delay_ms(1000);   
		PORTB=0x00;
		_delay_ms(1000);
		
	}
	
	
}
int main(void)
{
	DDRD=0x00;   
	DDRB=0x01;   
	MCUCR=0x00;  
	GICR=0x40;   
	PORTB=0x00;
	sei();       

	while (1)
	{

	}
}
