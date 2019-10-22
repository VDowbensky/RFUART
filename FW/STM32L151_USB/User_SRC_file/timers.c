#include "timers.h"

void initTIM6(void);
void delay_ms (uint16_t ms);
void check_keys(void);

volatile uint16_t TimingDelay;

void initTIM6(void)
{

	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	//TIM_DeInit(TIM6);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM6, ENABLE); //Clock enable
	
	TIM_TimeBaseStructure.TIM_Period = 1000; 
	TIM_TimeBaseStructure.TIM_Prescaler = 32; //1 MHz
	TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1; 
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;  //TIM up counting mode
	TIM_TimeBaseInit(TIM6, &TIM_TimeBaseStructure); 
	
  TIM_ClearFlag(TIM6,TIM_FLAG_Update);
	TIM_ITConfig(TIM6,TIM_IT_Update,ENABLE ); //Enable TIM6 interrupt, allow update interrupt

	NVIC_InitStructure.NVIC_IRQChannel = TIM6_IRQn; 
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;  
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1; 
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; 
	NVIC_Init(&NVIC_InitStructure);

	TIM_Cmd(TIM6, ENABLE);  
	
}


void TIM6_IRQHandler(void)   //TIM6 interrupt
{
static uint16_t pktimer; 
	
	if (TIM_GetITStatus(TIM6, TIM_IT_Update) != RESET)  //Check if the TIM6 update interrupt occurs or not
    {
      TIM_ClearITPendingBit(TIM6, TIM_IT_Update  );  //Clear TIMx update interrupt flag 
      TimingDelay--;
			RF69_RXtimeout++;
			check_keys();
			pktimer++;
			if(pktimer >= (PkDelay*100))
			{
				pktimer = 0;
				PacketFlag = 1;
			}
			
    }
}


void check_keys(void)
{
		static int8_t K0cnt = 0;
  static int8_t K1cnt = 0;
  static uint8_t Tim6cnt = 0;
  static uint8_t k0, k1;
	
	if(GPIO_ReadInputDataBit(KEYPORT, K0) == RESET)
   {
     K0cnt++;
   }
   else
   {
     K0cnt--;
     if(K0cnt <= 0) K0cnt = 0;
   }
   
   if(GPIO_ReadInputDataBit(KEYPORT, K1) == RESET)
   {
     K1cnt++;
   }
   else
   {
     K1cnt--;
     if(K1cnt <= 0) K1cnt = 0;
   }
   
   Tim6cnt++;
   if(Tim6cnt == KEYDELAY)
   {
     Tim6cnt = 0;
     if (K0cnt >= KEYDELAY/2) k0 = 1;
     else k0 = 0;
     if (K1cnt >= KEYDELAY/2) k1 = 1;
     else k1 = 0;
     Key = (k1 << 1) + k0;
   }
}


void delay_ms (uint16_t ms)
{
 
  TimingDelay = ms+1;
	while (TimingDelay > 0);
}

/*

INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
{

 static int8_t K0cnt = 0;
  static int8_t K1cnt = 0;
  static uint8_t Tim4cnt = 0;
  static uint8_t k0, k1;
  
  //if(checkDIO1()) RF69_RXtimeout++;
   RF69_RXtimeout++;
   
   TimingDelay_Decrement();
   TIM4_ClearITPendingBit(TIM4_IT_Update);
   if(GPIO_ReadInputDataBit(KEYPORT, K0) == RESET)
   {
     K0cnt++;
   }
   else
   {
     K0cnt--;
     if(K0cnt <= 0) K0cnt = 0;
   }
   
   if(GPIO_ReadInputDataBit(KEYPORT, K1) == RESET)
   {
     K1cnt++;
   }
   else
   {
     K1cnt--;
     if(K1cnt <= 0) K1cnt = 0;
   }
   
   Tim4cnt++;
   if(Tim4cnt == KEYDELAY)
   {
     Tim4cnt = 0;
     if (K0cnt >= KEYDELAY/2) k0 = 1;
     else k0 = 0;
     if (K1cnt >= KEYDELAY/2) k1 = 1;
     else k1 = 0;
     Key = (k1 << 1) + k0;
   }
   
}

*/

