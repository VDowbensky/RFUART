#include "myusb.h"
void USB_SendBlock (uint8_t l);
void USB_sendstr(const char *Addr);
void USB_checkRX(void);



void USB_SendBlock (uint8_t l)
{
	uint8_t i;
	
	for(i = 0; i < l; i++) w_buf[i] = TXbuffer[i]; //copy TX buffer
	cnt_send_byte = i;
}

void USB_sendstr(const char *Addr)
{
	uint8_t i=0;
	while (*Addr !=0)
		{
		TXbuffer[i]=*Addr;
		i++;
		Addr++;
		}
					
	//i++;
	TXbuffer[i]=0x0D;
	i++;
	TXbuffer[i]=0x0A;
	USB_SendBlock(i);
}


void USB_checkRX(void)
{
	if(!TestMode) //flush buffer
	{
		if(cnt_rec_byte != 0) cnt_rec_byte = 0; //dummy read
	}
	
	else //check incoming command
	{
		check_incoming_command();
	}
}

/*
	// эхо на виртуально com порту
	while(1)
	{
		if(cnt_rec_byte != 0)
		{
			while(cnt_rec_byte != 0)
			{
				w_buf[i] = r_buf[i];
				i++;
				cnt_rec_byte--;
			}
			cnt_send_byte = i;
			i = 0;
		}
	}
*/

