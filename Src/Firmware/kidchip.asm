
_USB_Init_Desc:

;usbdsc.c,151 :: 		void USB_Init_Desc(){
;usbdsc.c,152 :: 		USB_config_dsc_ptr[0] = &configDescriptor1;
	MOVLW       _configDescriptor1+0
	MOVWF       _USB_config_dsc_ptr+0 
	MOVLW       hi_addr(_configDescriptor1+0)
	MOVWF       _USB_config_dsc_ptr+1 
	MOVLW       higher_addr(_configDescriptor1+0)
	MOVWF       _USB_config_dsc_ptr+2 
;usbdsc.c,153 :: 		USB_string_dsc_ptr[0] = (const char*)&strd1;
	MOVLW       _strd1+0
	MOVWF       _USB_string_dsc_ptr+0 
	MOVLW       hi_addr(_strd1+0)
	MOVWF       _USB_string_dsc_ptr+1 
	MOVLW       higher_addr(_strd1+0)
	MOVWF       _USB_string_dsc_ptr+2 
;usbdsc.c,154 :: 		USB_string_dsc_ptr[1] = (const char*)&strd2;
	MOVLW       _strd2+0
	MOVWF       _USB_string_dsc_ptr+3 
	MOVLW       hi_addr(_strd2+0)
	MOVWF       _USB_string_dsc_ptr+4 
	MOVLW       higher_addr(_strd2+0)
	MOVWF       _USB_string_dsc_ptr+5 
;usbdsc.c,155 :: 		USB_string_dsc_ptr[2] = (const char*)&strd3;
	MOVLW       _strd3+0
	MOVWF       _USB_string_dsc_ptr+6 
	MOVLW       hi_addr(_strd3+0)
	MOVWF       _USB_string_dsc_ptr+7 
	MOVLW       higher_addr(_strd3+0)
	MOVWF       _USB_string_dsc_ptr+8 
;usbdsc.c,156 :: 		}
L_end_USB_Init_Desc:
	RETURN      0
; end of _USB_Init_Desc

_interrupt:

;kidchip.c,16 :: 		void interrupt(){
;kidchip.c,17 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;kidchip.c,18 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;kidchip.c,20 :: 		void main() {
;kidchip.c,21 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;kidchip.c,22 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;kidchip.c,23 :: 		TRISB = 0;
	CLRF        TRISB+0 
;kidchip.c,24 :: 		PORTB = 0;
	CLRF        PORTB+0 
;kidchip.c,25 :: 		TRISC = 0;
	CLRF        TRISC+0 
;kidchip.c,26 :: 		HID_Enable(&readbuff,&writebuff);
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;kidchip.c,27 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;kidchip.c,28 :: 		while(1) {
L_main0:
;kidchip.c,29 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;kidchip.c,30 :: 		PORTB = readbuff[1];
	MOVF        1281, 0 
	MOVWF       PORTB+0 
;kidchip.c,31 :: 		}
	GOTO        L_main0
;kidchip.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
