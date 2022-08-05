/*
 * LAB2_Timer1_Delay.c
 *
 * Created: 22-09-2021 15:06:19
 * Author : Jawhar
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

ISR (TIMER1_OVF_vect)    // Timer1 ISR
{
	PORTB ^= (1 << PB0);
	TCNT1 = 49911;   // for 1 sec at 1 MHz with 64 pre scaler
}

int main()
{
	DDRB = (1 << PB0);     //Configure the PORTB1 as output
	
	TCNT1 = 49911;   // for 1 sec at 1 MHz with 64 pre scaler

	TCCR1A = 0x00;
	TCCR1B = (1<<CS10) | (1<<CS11); // Timer mode with 64 pre scaler
	TIMSK = (1 << TOIE1) ;   // Enable timer1 overflow interrupt(TOIE1)
	sei();        // Enable global interrupts by setting global interrupt enable bit in SREG
	
	while(1)
	{
		
	}
}