#include "usb_init.h"

// инициализаци€ usb периферии
void usb_init(void)
{
	// включение тактировани€ модул€ SYSCFG, который необходим 
	// дл€ включени€ подт€гивающего 1.5 кќм резистора к DP
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
	// APB1 - тактирование USB модул€
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USB, ENABLE);
	// настройка прерывани€ от usb
	USB_Interrupts_Config();
}



// настройка пренрывани€ от USB
void USB_Interrupts_Config(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);

  NVIC_InitStructure.NVIC_IRQChannel = USB_LP_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);  
}

// включение USB
void usb_on(void)
{
	uint16_t wInterrupt_Mask;
	
	// включение подт€гивающего резистора
	SYSCFG_USBPuCmd(ENABLE);
	
	// PowerDown = 0(включает usb периферию), 
	// FORCE USB RESET = 1 (вызывает reset usb прерывание, при сбросе бита из 1 в 0)
	// (остальные биты - олтключены другие прерывани€)
	/* при включениии FRES и PWDN установлен в 1,
	  дополнительно выставл€ем  CNTR_FRES как в примере от ST*/
	CNTR = CNTR_FRES; 
	
	// —брасываем FRES - генерирует флаги прерывани€
	// при дальнейшем вкл. прерывани€ - произойдет вход в него
	// (остальные биты - олтключены все прерывани€)
	CNTR = 0;
	
	// —брос всех флагов прерывани€
  ISTR = 0;

	// включаем прерывани€ по USB RESET, 
	// Suspend mode (3 мс нет трафика)
	// Wakeup - выход из Suspend mode
  wInterrupt_Mask = CNTR_RESETM | CNTR_SUSPM | CNTR_WKUPM;
  CNTR = wInterrupt_Mask;
	
	// дальнейша€ настройка уже происходит в прерывание
}
