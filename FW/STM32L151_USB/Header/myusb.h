#ifndef _MYUSB_H_
#define _MYUSB_H_
#include "main.h"


extern void USB_SendBlock (uint8_t l);
extern void USB_checkRX(void);
extern void USB_sendstr(const char *Addr);

#endif


