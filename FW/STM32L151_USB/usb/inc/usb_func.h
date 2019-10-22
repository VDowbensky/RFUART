#include "type.h"

void EP_Status(DWORD EPNum, DWORD stat);
DWORD USB_ReadEP (DWORD EPNum, BYTE *pData);
DWORD USB_ReadEP2 (DWORD EPNum, BYTE *pData);
DWORD USB_WriteEP(DWORD EPNum, BYTE *pData, DWORD cnt);
void USB_SetAddress(DWORD adr);
void USB_DataInStage(void);
void USB_DataOutStage(void);
void USB_DisableEP (DWORD EPNum);
void USB_EnableEP (DWORD EPNum);
void USB_ResetEP (DWORD EPNum);
void EP_Reset (DWORD EPNum);

BOOL USB_GetDescriptor (void);
BOOL USB_SetConfiguration(void);

