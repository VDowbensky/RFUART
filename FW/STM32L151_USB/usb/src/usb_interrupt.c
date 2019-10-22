#include "usb_interrupt.h"

void USB_LP_IRQHandler(void)
{
	uint32_t istr, val, num;
	
	istr = ISTR;
	
	if(istr & USB_ISTR_RESET)
	{
		ISTR = 0; // ����� �������� ������� ����������
		// �������� ���������� �� ���������� �������� (USB_CNTR_CTRM)
		// reset ������������������(USB_CNTR_RESETM)
		/*� ��������� ��� ����������� ���������� �� SOF*/
		CNTR = USB_CNTR_CTRM | USB_CNTR_RESETM;
		
		/* ������� �������� ����� ����������� �����
		   �������� ����� ����������� ��� ������������ COM ����� */
		
		FreeBufAddr = EP_BUF_ADDR; // ������ 3 �������� �����
		// ������� btable = 0 - ����� ��� ������������ endpoint � packet memory
		// ������ packet memory (USB_PMA_ADDR) 0x40006000
		BTABLE = 0x00;
		// pBUF_DSCR - ��������� �������� ����� (ADDR_TX; COUNT_TX; ADDR_RX; COUNT_RX;)		
		pBUF_DSCR->ADDR_TX = FreeBufAddr;
		FreeBufAddr = FreeBufAddr + USB_MAX_PACKET0;
		pBUF_DSCR->ADDR_RX = FreeBufAddr;
		FreeBufAddr = FreeBufAddr + USB_MAX_PACKET0;		
		// ��������� ������ ������ ��� ������ - ��. REFERENCE MANUAL
		// size>62 -> BL_SIZE = 1, NUM_BLOCK 1=32�., COUNT_RX - ��������������� ��������� ��� ������ 
		// size<62 -> BL_SIZE = 0, NUM_BLOCK 1=2�.,  COUNT_RX - ��������������� ��������� ��� ������  
		/* ������ ������ ��� �������� ��������� ��� ��������������� */
		if(USB_MAX_PACKET0 > 62) 
		{			
			pBUF_DSCR->COUNT_RX = 0;
			// ���������� ������ ������ ������
			pBUF_DSCR->COUNT_RX |= BLSIZE; 						
			pBUF_DSCR->COUNT_RX |= NUM_BLOCK_1_BYTE; // ������ ������ 64 ����� (2*32�.)
		} 
		else 
		{
			pBUF_DSCR->COUNT_RX = 0;
			// ���������� ������ ������ ������
			pBUF_DSCR->COUNT_RX |= NUM_BLOCK_3_BYTE; // ������ ������ 8 ����� (4*2�.)
		}
				
		// ��� �������� ����� control
		//  ������ ����� ���������� (�����)
		EPxREG(0) = EP_CONTROL | EP_RX_VALID;
		
		// �������� ������� �������� ����� - ��������� usb
		DADDR = USB_DADDR_EF | 0;
		// ����� ���� daddr �������� ���������� ����� ����������
	}
	
	
	// �������� ���������� � �������� ���������
  while ((istr = ISTR) & USB_ISTR_CTR) 
	{
		// ����� ����� � ���������� �� �������� ���������
    ISTR = ~USB_ISTR_CTR;
		
		// ���������� �������� ����� �� ������� ��������� ����������
		// � ����� ������-���������� �����/��������
		num = istr & USB_ISTR_EP_ID;
		val = EPxREG(num);
		
		if(val & USB_EP0R_CTR_RX)
		{
			EPxREG(num) = val & ~USB_EP0R_CTR_RX & EP_MASK;			
			if(val & EP_SETUP) 
			{
				if(num == 0) USB_EndPoint0(USB_EVT_SETUP); 					
				if(num == 1)
				{
					USB_EndPoint1(USB_EVT_SETUP);
				}					
				if(num == 2) USB_EndPoint2(USB_EVT_SETUP);
				if(num == 3) USB_EndPoint3(USB_EVT_SETUP);					
			}

			else
			{
				if(num == 0) USB_EndPoint0(USB_EVT_OUT); 					
				if(num == 1)
				{
					USB_EndPoint1(USB_EVT_OUT);
				}					
				if(num == 2) USB_EndPoint2(USB_EVT_OUT);
				if(num == 3) USB_EndPoint3(USB_EVT_OUT);					
			}		
		}
		
		if(val & USB_EP0R_CTR_TX)
		{
			EPxREG(num) = val & ~USB_EP0R_CTR_TX & EP_MASK;
			if(num == 0) USB_EndPoint0(USB_EVT_IN); 					
			if(num == 1) USB_EndPoint1(USB_EVT_IN);
			if(num == 2) USB_EndPoint2(USB_EVT_IN);
			if(num == 3) USB_EndPoint3(USB_EVT_IN);							
		}
	}
}


