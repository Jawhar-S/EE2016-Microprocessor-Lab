#include "LPC23xx.h"

int main()
{
    int Byte;
    int highNibble;
    int lowNibble;
    FIO3DIR = 0xFF;
    FIO4DIR = 0x00;

    while(1)
    {
        Byte = FIO4PIN;
        highNibble = Byte & 0xF0;
        highNibble = highNibble >> 4;
        lowNibble = Byte & 0x0F;
        FIO3PIN = highNibble * lowNibble;
    }
    return 0;
}