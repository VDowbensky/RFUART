#include "gpio.h"


void delay_ms (uint16_t ms);
void initIO(void);
void Green_On (void);
void Green_Off (void);
void Red_On (void);
void Red_Off (void);

void DIO0_enableIRQ(void);
void DIO0_disableIRQ(void);


//init delay timer, key and LED GPIO
void initIO(void)
{
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
	//init key and LED's lines
		GPIO_InitTypeDef gpio;                    
		GPIO_StructInit(&gpio);
		gpio.GPIO_Pin = RED | GREEN | BLUE;
		gpio.GPIO_Speed = GPIO_Speed_10MHz;
		gpio.GPIO_Mode = GPIO_Mode_OUT;
		gpio.GPIO_OType = GPIO_OType_OD;
		GPIO_Init(LEDPORT, &gpio);
		//GPIO_SetBits(LEDPORT, BLUE);
		Green_Off();
	  Red_Off();
	
		GPIO_StructInit(&gpio);
		gpio.GPIO_Pin = K0;
		gpio.GPIO_Speed = GPIO_Speed_10MHz;
		gpio.GPIO_Mode = GPIO_Mode_IN;
		gpio.GPIO_PuPd = GPIO_PuPd_UP;
		GPIO_Init(KEYPORT, &gpio);
		
		GPIO_StructInit(&gpio);
		gpio.GPIO_Pin = K1;
		gpio.GPIO_Speed = GPIO_Speed_10MHz;
		gpio.GPIO_Mode = GPIO_Mode_IN;
		gpio.GPIO_PuPd = GPIO_PuPd_UP;
		GPIO_Init(K1PORT, &gpio);
		
		
//DIO0 input pin configuration

	GPIO_StructInit(&gpio);                   // DIO0 (IRQ)
  gpio.GPIO_Pin = DIO0_PIN;
  gpio.GPIO_Speed = GPIO_Speed_10MHz;
  gpio.GPIO_Mode = GPIO_Mode_IN;
  gpio.GPIO_PuPd = GPIO_PuPd_DOWN;
  GPIO_Init(RFPORT, &gpio);
	
		EXTI_InitTypeDef exti_is;
		EXTI_StructInit(&exti_is);
		exti_is.EXTI_Line = DIO0_EXTI_LINE; //EXTI_Line10
		exti_is.EXTI_Mode = EXTI_Mode_Interrupt;
		exti_is.EXTI_Trigger = EXTI_Trigger_Rising;
		exti_is.EXTI_LineCmd = ENABLE;
		EXTI_Init(&exti_is);
		
		SYSCFG_EXTILineConfig(DIO0_EXTI_PORTSOURCE, DIO0_EXTI_PINSOURCE); //DIO0
		
		NVIC_InitTypeDef NVIC_InitStructure;
		NVIC_EnableIRQ(DIO0_IRQn);	
	
		NVIC_InitStructure.NVIC_IRQChannel = DIO0_IRQn; 
		NVIC_InitStructure.NVIC_IRQChannelPriority = 0;  
//		NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
		NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;	
		NVIC_Init(&NVIC_InitStructure);

}

void DIO0_enableIRQ(void)
{
	NVIC_EnableIRQ(DIO0_IRQn);	
}



void DIO0_disableIRQ(void)
{
	NVIC_DisableIRQ(DIO0_IRQn);
}


//DIO0 interrupt (used in RX mode only)

void DIO0_IRQhandler(void) //EXTI15_10_IRQn
{
  if(EXTI_GetITStatus(DIO0_EXTI_LINE) == SET)
  {
    EXTI_ClearITPendingBit(DIO0_EXTI_LINE);
		RF69_RXflag = 1;
	}
}

//indication
void Green_On (void)
{
	GPIO_ResetBits(LEDPORT, GREEN);
}
void Green_Off (void)
{
	GPIO_SetBits(LEDPORT, GREEN);
}
void Red_On (void)
{
	GPIO_ResetBits(LEDPORT, RED);
}
void Red_Off (void)
{
	GPIO_SetBits(LEDPORT, RED);
}

