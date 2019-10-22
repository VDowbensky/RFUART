#include "usb_init.h"

// ������������� usb ���������
void usb_init(void)
{
	// ��������� ������������ ������ SYSCFG, ������� ��������� 
	// ��� ��������� �������������� 1.5 ��� ��������� � DP
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
	// APB1 - ������������ USB ������
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USB, ENABLE);
	// ��������� ���������� �� usb
	USB_Interrupts_Config();
}



// ��������� ����������� �� USB
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

// ��������� USB
void usb_on(void)
{
	uint16_t wInterrupt_Mask;
	
	// ��������� �������������� ���������
	SYSCFG_USBPuCmd(ENABLE);
	
	// PowerDown = 0(�������� usb ���������), 
	// FORCE USB RESET = 1 (�������� reset usb ����������, ��� ������ ���� �� 1 � 0)
	// (��������� ���� - ���������� ������ ����������)
	/* ��� ���������� FRES � PWDN ���������� � 1,
	  ������������� ����������  CNTR_FRES ��� � ������� �� ST*/
	CNTR = CNTR_FRES; 
	
	// ���������� FRES - ���������� ����� ����������
	// ��� ���������� ���. ���������� - ���������� ���� � ����
	// (��������� ���� - ���������� ��� ����������)
	CNTR = 0;
	
	// ����� ���� ������ ����������
  ISTR = 0;

	// �������� ���������� �� USB RESET, 
	// Suspend mode (3 �� ��� �������)
	// Wakeup - ����� �� Suspend mode
  wInterrupt_Mask = CNTR_RESETM | CNTR_SUSPM | CNTR_WKUPM;
  CNTR = wInterrupt_Mask;
	
	// ���������� ��������� ��� ���������� � ����������
}
