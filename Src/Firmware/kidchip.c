//******************************************************************************
// Kidogo Firmware - Version 1.0.0
// Copyright © 2012 Dilshan R Jayakody. (jayakody2000lk at gmail.com)
//
// The contents of this file are subject to the terms of Common Development
// and Distribution License("CDDL"). You may not use this file except in
// compliance with the License. You can obtain a copy of the License from
// "http://www.opensource.org/licenses/CDDL-1.0".
//******************************************************************************

#include "USBdsc.c"

unsigned char readbuff[2] absolute 0x500;
unsigned char writebuff[2] absolute 0x540;

void interrupt(){
  USB_Interrupt_Proc();
}

void main() {
  ADCON1 |= 0x0F;
  CMCON  |= 7;
  TRISB = 0;
  PORTB = 0;
  TRISC = 0;
  HID_Enable(&readbuff,&writebuff);
  PORTC.B7 = 1;
  while(1) {
    while(!HID_Read());
    PORTB = readbuff[1];
  }
}