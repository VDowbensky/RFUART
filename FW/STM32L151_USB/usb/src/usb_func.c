#include "usb_func.h"
#include "usb.h"

/*
 *  Read USB Endpoint Data
 *    Parameters:      EPNum: Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *                     pData: Pointer to Data Buffer
 *    Return Value:    Number of bytes read
 */
DWORD USB_ReadEP (DWORD EPNum, BYTE *pData) 
{
/* Double Buffering is not yet supported*/
  DWORD num, cnt, *pv, n;

  num = EPNum & 0x0F;

  pv  = (DWORD *)(USB_PMA_ADDR + 2*((pBUF_DSCR + num)->ADDR_RX));
  cnt = (pBUF_DSCR + num)->COUNT_RX & EP_COUNT_MASK;
  for (n = 0; n < (cnt + 1) / 2; n++) 
	{
    *((__packed WORD *)pData) = *pv++;
    pData += 2;
  }
  EP_Status(EPNum, EP_RX_VALID);

  return (cnt);
}

/*
 *  Write USB Endpoint Data
 *    Parameters:      EPNum: Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *                     pData: Pointer to Data Buffer
 *                     cnt:   Number of bytes to write
 *    Return Value:    Number of bytes written
 */
DWORD USB_WriteEP(DWORD EPNum, BYTE *pData, DWORD cnt) 
{
/*Double Buffering is not yet supported*/
  DWORD num, *pv, n;

  num = EPNum & 0x0F;

  pv = (DWORD *)(USB_PMA_ADDR + 2*((pBUF_DSCR + num)->ADDR_TX));
  for(n = 0; n < (cnt + 1) / 2; n++) 
	{
    *pv++ = *((__packed WORD *)pData);
    pData += 2;
  }
  (pBUF_DSCR + num)->COUNT_TX = cnt;
  EP_Status(EPNum, EP_TX_VALID);

  return (cnt);
}

/*
 *  Set Endpoint Status
 *    Parameters:      EPNum: Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *                     stat: New Status
 *    Return Value:    None
 */
void EP_Status(DWORD EPNum, DWORD stat) 
{
  DWORD num, val;

  num = EPNum & 0x0F;
  val = EPxREG(num);
  if (EPNum & 0x80) 
	{ 
		/* IN Endpoint */
    EPxREG(num) = (val ^ (stat & EP_STAT_TX)) & (EP_MASK | EP_STAT_TX);
  } 
	else 
	{                                  
		/* OUT Endpoint */
    EPxREG(num) = (val ^ (stat & EP_STAT_RX)) & (EP_MASK | EP_STAT_RX);
  }
}

/*
 *  USB Request - Data In Stage
 *    Parameters:      None (global EP0Data)
 *    Return Value:    None
 */
void USB_DataInStage(void) 
{
  DWORD cnt;

  if (EP0Data.Count > USB_MAX_PACKET0) {
    cnt = USB_MAX_PACKET0;
  } else {
    cnt = EP0Data.Count;
  }
  cnt = USB_WriteEP(0x80, EP0Data.pData, cnt);
  EP0Data.pData += cnt;
  EP0Data.Count -= cnt;
}

/*
 *  Get Descriptor USB Request
 *    Parameters:      None (global SetupPacket)
 *    Return Value:    TRUE - Success, FALSE - Error
 */
BOOL USB_GetDescriptor(void) 
{
  BYTE  *pD;
  DWORD len;

  switch(SetupPacket.bmRequestType.BM.Recipient) 
	{
    case REQUEST_TO_DEVICE:
      switch(SetupPacket.wValue.WB.H) 
			{
        case USB_DEVICE_DESCRIPTOR_TYPE:
          EP0Data.pData = (BYTE *)Virtual_Com_Port_DeviceDescriptor;
          len = 0x12;
          break;
        case USB_CONFIGURATION_DESCRIPTOR_TYPE:
          pD = (BYTE *)Virtual_Com_Port_ConfigDescriptor;					
          EP0Data.pData = pD;
          len = ((USB_CONFIGURATION_DESCRIPTOR *)pD)->wTotalLength;
          break;
        case USB_STRING_DESCRIPTOR_TYPE:
          EP0Data.pData = (BYTE *)Virtual_Com_Port_StringLangID + SetupPacket.wValue.WB.L;
          len = ((USB_STRING_DESCRIPTOR *)EP0Data.pData)->bLength;
          break;
        default:
          return (FALSE);
      }
      break;
			
    default:
      return (FALSE);
  }

  if(EP0Data.Count > len) 
	{
    EP0Data.Count = len;
  }
  USB_DataInStage();
  return(TRUE);
}

/*
 *  USB Set Address Function
 *    Parameters:      adr:   USB Address
 *    Return Value:    None
 */
void USB_SetAddress(DWORD adr) 
{
  DADDR = DADDR_EF | adr;
}

/*
 *  USB Request - Data Out Stage
 *    Parameters:      None (global EP0Data)
 *    Return Value:    None
 */
void USB_DataOutStage(void) 
{
  DWORD cnt;

  cnt = USB_ReadEP(0x00, EP0Data.pData);
  EP0Data.pData += cnt;
  EP0Data.Count -= cnt;
}


/*
 *  Set Configuration USB Request
 *    Parameters:      None (global SetupPacket)
 *    Return Value:    TRUE - Success, FALSE - Error
 */
BOOL USB_SetConfiguration(void) 
{
	// 1 конечная точка (0x81 - IN), (0x03 - interrupt), размер 64 байта (> 62)
	(pBUF_DSCR + 1)->ADDR_TX = FreeBufAddr;
	FreeBufAddr = FreeBufAddr + 64;
	EPxREG(1) |= EP_INTERRUPT;
	EPxREG(1) |= 1; // номер конечной точки в EA
	
	// 2 конечная точка (0x02 - OUT), (0x02 - bulk), размер 64 байта (> 62)
	(pBUF_DSCR + 2)->ADDR_RX = FreeBufAddr;
	FreeBufAddr = FreeBufAddr + 64;
	(pBUF_DSCR + 2)->COUNT_RX = 0;
	(pBUF_DSCR + 2)->COUNT_RX |= BLSIZE; 						
	(pBUF_DSCR + 2)->COUNT_RX |= NUM_BLOCK_1_BYTE; // размер буфера 64 байта (2*32б.)
	EPxREG(2) |= EP_BULK;
  EPxREG(2) |= 2; // номер конечной точки в EA
	
	// 3 конечная точка (0x83 - IN), (0x02 - bulk), размер 64 байта (> 62)
	(pBUF_DSCR + 3)->ADDR_TX = FreeBufAddr;
	FreeBufAddr = FreeBufAddr + 64;
	EPxREG(3) |= EP_BULK;
	EPxREG(3) |= 3; // номер конечной точки в EA
	
	USB_EnableEP(0x81);
	USB_EnableEP(0x02);
	USB_EnableEP(0x83);
	
	USB_ResetEP(0x81);
	USB_ResetEP(0x02);
	USB_ResetEP(0x83);
	
	return(TRUE);
}


void USB_DisableEP (DWORD EPNum) {
  EP_Status(EPNum, EP_TX_DIS | EP_RX_DIS);
}


void USB_EnableEP(DWORD EPNum) {
  EP_Status(EPNum, EP_TX_VALID | EP_RX_VALID);
}


/*
 *  Reset USB Endpoint
 *    Parameters:      EPNum: Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void USB_ResetEP(DWORD EPNum) {
  EP_Reset(EPNum);
}

/*
 *  Reset Endpoint
 *    Parameters:      EPNum: Endpoint Number
 *                       EPNum.0..3: Address
 *                       EPNum.7:    Dir
 *    Return Value:    None
 */

void EP_Reset(DWORD EPNum) {
  DWORD num, val;

  num = EPNum & 0x0F;
  val = EPxREG(num);
  if (EPNum & 0x80) {                       /* IN Endpoint */
    EPxREG(num) = val & (EP_MASK | EP_DTOG_TX);
  } else {                                  /* OUT Endpoint */
    EPxREG(num) = val & (EP_MASK | EP_DTOG_RX);
  }
}


