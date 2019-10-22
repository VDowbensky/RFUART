#include "usb_endp.h"

DWORD cnt_r;
DWORD cnt_m;

extern uint8_t cnt_rec_byte;
extern uint8_t r_buf[]; 

extern uint8_t cnt_send_byte;
extern uint8_t w_buf[];


void USB_EndPoint0(uint32_t event) 
{
	switch(event)
	{
		case USB_EVT_SETUP:			
			USB_ReadEP(0x00, (BYTE *)&SetupPacket); // читаем данные из EP			
			EP0Data.Count = SetupPacket.wLength; // количество байт для чтения
			// определяем тип запроса
			switch(SetupPacket.bmRequestType.BM.Type)
			{
				case REQUEST_STANDARD:
					switch(SetupPacket.bRequest)
					{
						case USB_REQUEST_GET_DESCRIPTOR:
							//add_deb_buf(1);  //debug используется
							if(!USB_GetDescriptor()) 
							{
                goto stall_i;
              }
              break;
							
						case USB_REQUEST_SET_ADDRESS:
							//add_deb_buf(2); //debug используется
							switch (SetupPacket.bmRequestType.BM.Recipient) 
							{
								case REQUEST_TO_DEVICE:
									//add_deb_buf(3); //debug используется
									USB_DeviceAddress = 0x80 | SetupPacket.wValue.WB.L;
									USB_WriteEP(0x80, NULL, 0);
									break;
									
								default:
									//add_deb_buf(4);
									goto stall_i;
							}							
							break;																
							
						case USB_REQUEST_SET_DESCRIPTOR:
							//add_deb_buf(8);
							break;
							
						case USB_REQUEST_GET_CONFIGURATION:
							//add_deb_buf(9);
							break;
							
						case USB_REQUEST_SET_CONFIGURATION:
							//add_deb_buf(10); //debug используется
							switch(SetupPacket.bmRequestType.BM.Recipient)
							{
								case REQUEST_TO_DEVICE:
									//add_deb_buf(11); //debug используется
									if(!USB_SetConfiguration()) 
									{
                    goto stall_i;
                  }
									USB_WriteEP(0x80, NULL, 0);
									break;
									
								default:
									//add_deb_buf(12);
									goto stall_i;
							}
							break;													
							
						default:
							//add_deb_buf(15);
							goto stall_i;																										
					}
					break;
					
				case REQUEST_CLASS:
					//add_deb_buf(16); //debug используется
					if(SetupPacket.wLength > 0)
					{
						switch(SetupPacket.bRequest)
						{
							case SET_LINE_CODING:
								//add_deb_buf(17); 
								cnt_m = USB_ReadEP(0x00, (BYTE*)&com_port_option);
								EP0Data.Count = 0;
								EP0Data.pData += 7; 
								//!!! внести изменения в отдельный проект с драйвером USB
								//EP0Data.pData += cnt_m; //!!! ИЗМЕНИЛ(закоментировал) - заработало, но все равно пишет в память
								//EP0Data.Count -= cnt_m;
								USB_WriteEP(0x80, NULL, 0);
								break;
								
							case GET_LINE_CODING:
								//add_deb_buf(18); //debug используется
								EP0Data.pData = (BYTE*)&com_port_option; 
								EP0Data.Count = 7;
								USB_DataInStage();											
								break;
								
							case SET_CONTROL_LINE_STATE:
								/*if(SetupPacket.wValue != 2)
								{
								}
								else
								{
								}
								if(SetupPacket.wValue & CDC_DTR_MASK)
								{
								}
								else
								{
								}	*/								
								//add_deb_buf(19); //debug используется
								//USB_WriteEP(0x80, NULL, 0);
								break;
								
							case CDC_SEND_BREAK:
								
								USB_WriteEP(0x80, NULL, 0);							
								break;
								
							default:
								//add_deb_buf(20);
								goto stall_i;
								//break;							
						}
						break;
					}
					else
					{
						USB_WriteEP(0x80, (BYTE*)&SetupPacket, 0);
					}
					
					
				case REQUEST_VENDOR:
					//add_deb_buf(21);
					goto stall_i;
					//break;		
					
				default:					
stall_i:  //add_deb_buf(22);
					EP_Status(0x80, EP_TX_STALL | EP_RX_STALL);
					EP0Data.Count = 0;
					break;
			}
			break;
		
		case USB_EVT_IN:
			//add_deb_buf(23); //debug используется
			if(SetupPacket.bmRequestType.BM.Dir == 1) 
			{
				//add_deb_buf(32); //debug используется
				USB_DataInStage();
			}
			else
			{
				//add_deb_buf(33); //debug используется
				if (USB_DeviceAddress & 0x80) 
				{
          USB_DeviceAddress &= 0x7F;
          USB_SetAddress(USB_DeviceAddress);
        }
			}
			break;
		
		case USB_EVT_OUT:
			//add_deb_buf(24); //debug используется
			if(SetupPacket.bmRequestType.BM.Dir == 0) 
			{
				if(EP0Data.Count)
				{
					USB_DataOutStage();
					if (EP0Data.Count == 0) // передали полностью
					{
						switch (SetupPacket.bmRequestType.BM.Type)
						{
							case REQUEST_STANDARD:
								//add_deb_buf(25);
								goto stall_i;
								
							case REQUEST_CLASS:
								//add_deb_buf(26);
								switch(SetupPacket.bmRequestType.BM.Recipient) 
								{
									case REQUEST_TO_INTERFACE:
										//add_deb_buf(27);
										if((SetupPacket.wIndex.WB.L == 0) || (SetupPacket.wIndex.WB.L == 1))
										{
											break;
										}
										goto stall_i;
										
									default:
										//add_deb_buf(28);
										goto stall_i;
								}
								break;															
						}						
					}
				}
			}
			else
			{
				//add_deb_buf(29); //debug используется
				USB_DataOutStage();
			}
			break;
	}
}

void USB_EndPoint1(uint32_t event) 
{
	uint8_t buf[10];
	
	buf[0] = 0xA1;
	buf[1] = 0x20;
	buf[2] = 0x00;
	buf[3] = 0x00;
	buf[4] = 0x00;
	buf[5] = 0x00;
	buf[6] = 0x02;
	buf[7] = 0x00;
	buf[8] = 0;
	buf[9] = 0;//(0 >> 8);							

  USB_WriteEP(0x81, (BYTE*)&buf[0], 10);
}
	
void USB_EndPoint2(uint32_t event) 
{
	switch(event) 
	{
    case USB_EVT_OUT:			      
			cnt_r = USB_ReadEP(0x02, r_buf);
			cnt_rec_byte += cnt_r;
			break;
  }
}
	
void USB_EndPoint3(uint32_t event) 
{
	switch(event) 
	{
    case USB_EVT_IN:	
			USB_WriteEP(0x83, w_buf, cnt_send_byte);
			cnt_send_byte = 0;
			break;
  }
}
