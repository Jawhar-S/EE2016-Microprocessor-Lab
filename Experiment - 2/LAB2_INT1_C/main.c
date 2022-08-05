/*
 * LAB2_INT1_C.c
 *
 * Created: 21-09-2021 11:39:36
 * Author : Jawhar
 */ 


#define F_CPU 1000000  // clock frequency

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR (INT1_vect)
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
	GICR=0x80;   
	PORTB=0x00;
	sei();       

	while (1) //wait
	{

	}
}
