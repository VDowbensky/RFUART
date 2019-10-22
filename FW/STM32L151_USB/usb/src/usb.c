#include "usb.h"

USB_EP_DATA EP0Data;
USB_SETUP_PACKET SetupPacket;
BYTE  USB_DeviceAddress;
LineCoding com_port_option = { 115200 /*baudrate*/, 0 /*1 Stop Bit*/, 0 /*None Parity*/, 8 /*8 Data bits*/};
uint32_t FreeBufAddr;
EP_BUF_DSCR *pBUF_DSCR = (EP_BUF_DSCR *)USB_PMA_ADDR;

