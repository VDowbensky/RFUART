#include "usb_interrupt.h"

void USB_LP_IRQHandler(void)
{
	uint32_t istr, val, num;
	
	istr = ISTR;
	
	if(istr & USB_ISTR_RESET)
	{
		ISTR = 0; // сброс регистра статуса прерывани€
		// включаем прерывани€ по правильной передаче (USB_CNTR_CTRM)
		// reset последовательности(USB_CNTR_RESETM)
		/*в прнимерах еще установлено прерывани€ по SOF*/
		CNTR = USB_CNTR_CTRM | USB_CNTR_RESETM;
		
		/* нулева€ конечна€ точка расположена после
		   конечных точек необходимых дл€ виртуального COM порта */
		
		FreeBufAddr = EP_BUF_ADDR; // размер 3 конечные точки
		// регистр btable = 0 - адрес где располрожены endpoint в packet memory
		// начало packet memory (USB_PMA_ADDR) 0x40006000
		BTABLE = 0x00;
		// pBUF_DSCR - структура конечной точки (ADDR_TX; COUNT_TX; ADDR_RX; COUNT_RX;)		
		pBUF_DSCR->ADDR_TX = FreeBufAddr;
		FreeBufAddr = FreeBufAddr + USB_MAX_PACKET0;
		pBUF_DSCR->ADDR_RX = FreeBufAddr;
		FreeBufAddr = FreeBufAddr + USB_MAX_PACKET0;		
		// установка размер буфера дл€ приема - см. REFERENCE MANUAL
		// size>62 -> BL_SIZE = 1, NUM_BLOCK 1=32б., COUNT_RX - устанавливаетс€ аппаратно при приеме 
		// size<62 -> BL_SIZE = 0, NUM_BLOCK 1=2б.,  COUNT_RX - устанавливаетс€ аппаратно при приеме  
		/* размер буфера дл€ отправки Ќ≈ѕќЌя“Ќќ где устанавливаетс€ */
		if(USB_MAX_PACKET0 > 62) 
		{			
			pBUF_DSCR->COUNT_RX = 0;
			// установить нужный размер буфера
			pBUF_DSCR->COUNT_RX |= BLSIZE; 						
			pBUF_DSCR->COUNT_RX |= NUM_BLOCK_1_BYTE; // размер буфера 64 байта (2*32б.)
		} 
		else 
		{
			pBUF_DSCR->COUNT_RX = 0;
			// установить нужный размер буфера
			pBUF_DSCR->COUNT_RX |= NUM_BLOCK_3_BYTE; // размер буфера 8 байта (4*2б.)
		}
				
		// тип конечной точки control
		//  статус према правильный (прием)
		EPxREG(0) = EP_CONTROL | EP_RX_VALID;
		
		// включаем нулевую конечную точку - настройка usb
		DADDR = USB_DADDR_EF | 0;
		// кроме того daddr содержит уникальный адрес устройства
	}
	
	
	// возникло прерывание и передача завершена
  while ((istr = ISTR) & USB_ISTR_CTR) 
	{
		// сброс флага о прерывание по передаче завершена
    ISTR = ~USB_ISTR_CTR;
		
		// определ€ем конечную точку по которой произошло прерывание
		// и какой запрос-прерывание прием/передача
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


