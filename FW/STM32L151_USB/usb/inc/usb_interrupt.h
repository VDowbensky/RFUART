#include "stm32l1xx.h"
#include "type.h"
#include "usb.h"
#include "usb_endp.h"

DWORD USB_WriteEP(DWORD EPNum, BYTE *pData, DWORD cnt); 
DWORD USB_ReadEP (DWORD EPNum, BYTE *pData);
void USB_DisableEP (DWORD EPNum);
void USB_DataInStage(void);

