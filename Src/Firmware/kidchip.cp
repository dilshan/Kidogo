#line 1 "D:/Kidogo/Src/Firmware/kidchip.c"
#line 1 "d:/kidogo/src/firmware/usbdsc.c"










const unsigned int USB_VENDOR_ID = 0x1984;
const unsigned int USB_PRODUCT_ID = 0x620;
const char USB_SELF_POWER = 0x80;
const char USB_MAX_POWER = 100;
const char HID_INPUT_REPORT_BYTES = 2;
const char HID_OUTPUT_REPORT_BYTES = 2;
const char USB_TRANSFER_TYPE = 0x03;
const char EP_IN_INTERVAL = 1;
const char EP_OUT_INTERVAL = 1;

const char USB_INTERRUPT = 1;
const char USB_HID_EP = 1;
const char USB_HID_RPT_SIZE = 33;

const struct {
 char bLength;
 char bDescriptorType;
 unsigned int bcdUSB;
 char bDeviceClass;
 char bDeviceSubClass;
 char bDeviceProtocol;
 char bMaxPacketSize0;
 unsigned int idVendor;
 unsigned int idProduct;
 unsigned int bcdDevice;
 char iManufacturer;
 char iProduct;
 char iSerialNumber;
 char bNumConfigurations;
} device_dsc = {
 0x12,
 0x01,
 0x0200,
 0x00,
 0x00,
 0x00,
 8,
 USB_VENDOR_ID,
 USB_PRODUCT_ID,
 0x0001,
 0x01,
 0x02,
 0x00,
 0x01
 };

const char configDescriptor1[]= {
 0x09,
 0x02,
 0x29,0x00,
 1,
 1,
 0,
 USB_SELF_POWER,
 USB_MAX_POWER,
 0x09,
 0x04,
 0,
 0,
 2,
 0x03,
 0,
 0,
 0,
 0x09,
 0x21,
 0x01,0x01,
 0x00,
 1,
 0x22,
 USB_HID_RPT_SIZE,0x00,
 0x07,
 0x05,
 USB_HID_EP | 0x80,
 USB_TRANSFER_TYPE,
 0x40,0x00,
 EP_IN_INTERVAL,
 0x07,
 0x05,
 USB_HID_EP,
 USB_TRANSFER_TYPE,
 0x40,0x00,
 EP_OUT_INTERVAL
};

const struct {
 char report[USB_HID_RPT_SIZE];
}hid_rpt_desc =
 {
 {0x06, 0x00, 0xFF,
 0x09, 0x01,
 0xA1, 0x01,
 0x19, 0x01,
 0x29, 0x40,
 0x15, 0x00,
 0x26, 0xFF, 0x00,
 0x75, 0x08,
 0x95, HID_INPUT_REPORT_BYTES,
 0x81, 0x02,
 0x19, 0x01,
 0x29, 0x40,
 0x75, 0x08,
 0x95, HID_OUTPUT_REPORT_BYTES,
 0x91, 0x02,
 0xC0}
 };

const struct {
 char bLength;
 char bDscType;
 unsigned int string[1];
 } strd1 = {
 4,
 0x03,
 {0x0409}
 };

const struct{
 char bLength;
 char bDscType;
 unsigned int string[18];
 }strd2={
 38,
 0x03,
 {'D','i','l','s','h','a','n',' ','R',' ','J','a','y','a','k','o','d','y'}
 };

const struct{
 char bLength;
 char bDscType;
 unsigned int string[34];
}strd3={
 70,
 0x03,
 {'K','i','d','o','g','o',' ','U','S','B',' ','D','i','g','i','t','a','l',' ','S','i','g','n','a','l',' ','I','n','j','e','c','t','o','r'}
 };

const char* USB_config_dsc_ptr[1];
const char* USB_string_dsc_ptr[3];

void USB_Init_Desc(){
 USB_config_dsc_ptr[0] = &configDescriptor1;
 USB_string_dsc_ptr[0] = (const char*)&strd1;
 USB_string_dsc_ptr[1] = (const char*)&strd2;
 USB_string_dsc_ptr[2] = (const char*)&strd3;
}
#line 13 "D:/Kidogo/Src/Firmware/kidchip.c"
unsigned char readbuff[2] absolute 0x500;
unsigned char writebuff[2] absolute 0x540;

void interrupt(){
 USB_Interrupt_Proc();
}

void main() {
 ADCON1 |= 0x0F;
 CMCON |= 7;
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
