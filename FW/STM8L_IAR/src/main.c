/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/main.c
  * @author  MCD Application Team
  * @version V1.6.1
  * @date    30-September-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"
#include "main.h"
#include "user_settings.h"

/** @addtogroup STM8L15x_StdPeriph_Template
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
__IO uint16_t TimingDelay = 0;
volatile uint8_t Key;
uint8_t work_mode;
uint8_t Crcok;

//char GPSstring[] = "235959.999,1111.2222,N,11111.2222,E"; 
//const char GPSdef[] = "235959.000,0000.0000,N,00000.0000,E"; 
char TESTstring[] = "TESTER.V10,0000.0000,X,00000.0000,Y"; 

/* Private function prototypes -----------------------------------------------*/
void initCLK(void);

void initTIM4(void);
void delay_ms (uint16_t ms);
void initRTC(void);

void sendtestpacket(void);
void sendGPSpacket(void);
void switch_to_tx (void);
void switch_to_rx (void);
void user_loop(void);


void TimingDelay_Decrement(void);

void convert(uint16_t v);
void convert8(uint8_t v);

void UART_senddata(void);

bool PacketFlag;
bool Periodic_Mode;
volatile uint8_t PacketDelay;
uint16_t PacketNumber = 1;

volatile uint8_t RF69_RXflag = 0;
volatile uint16_t RF69_RXtimeout = 0;
//bool RxState = FALSE;
uint8_t RxLen; //packet length
uint8_t c8[3] = {0,0,0};
bool UARTtxflag;
int8_t Rssi;
int8_t Temperature;
int8_t packnum[5] = {0x30, 0x30, 0x30, 0x30, 0x30};

//debug variables
int32_t DebugVar0;
int32_t DebugVar1;
int32_t DebugVar2;
int32_t DebugVar3;


/* Private functions ---------------------------------------------------------*/

void initCLK(void)
{
  CLK_DeInit();
  //CLK_HSEConfig(CLK_HSE_ON);
  //CLK_HSEConfig(CLK_HSI_ON);
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  //CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);
  //CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  //CLK_SYSCLKSourceSwitchCmd(ENABLE);
  
  //enable peripheral clocks
  //CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
  //CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  //CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  
  //CLK_LSEConfig(CLK_LSE_ON);
  CLK_LSICmd(ENABLE);
  //CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
  CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
  CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
  
  
}

void switch_to_tx (void)
{
  GPIO_Init(RFPORT, DIO0_PIN, GPIO_Mode_In_FL_No_IT);
  GPIO_Init(RFPORT, DIO1_PIN, GPIO_Mode_In_FL_No_IT);
  RF69_setopmode (RF_OPMODE_STANDBY);
  //increment address on changing testing point
  //NodeAddr++;
  //if(NodeAddr > 254) NodeAddr = 0;
  //RF69_setNodeAddr(NodeAddr);
  RF69_writereg(REG_DIOMAPPING1, DIOM1_TX);

}

void switch_to_rx (void)
{
  GPIO_Init(RFPORT, DIO0_PIN, GPIO_Mode_In_FL_IT);
  //GPIO_Init(RFPORT, DIO1_PIN, GPIO_Mode_In_FL_IT);
  RF69_restartRX();
  //GPIO_Init(RFPORT, DIO1_PIN, GPIO_Mode_In_FL_IT);
  work_mode = WORK_MODE_RX;
  RF69_RXflag = 0;
  Red_Off();
}


  

void sendtestpacket(void)
{
  uint8_t i;
  Red_On();
  work_mode = WORK_MODE_TX;
  //RF69_setopmode (RF_OPMODE_TRANSMITTER);
  //wait for TX ready - ???
  //2,3,4,5,6
  convert(PacketNumber);
  for(i = 0; i < 5; i++) RF69_TXbuffer[i+2] = packnum[i];
  RF69_TXbuffer[7] = ',';
  RF69_TXbuffer[8] = 'T';
  RF69_TXbuffer[9] = ',';
  //7 and up; add 3 bytes to WORK_PACKET_LEN
  for(i  = 0; i < PkLen-2; i++) RF69_TXbuffer[i+10] = TESTstring[i]; //ABCD.......
  delay_ms(1);
  RF69_sendpacket(PkLen, NodeAddr); //32 bytes, address 0xFF will be changed
  RF69_setopmode (RF_OPMODE_STANDBY); //maybe receiver
  PacketNumber++;
  if (PacketNumber > PkCount)
  {
    //switch to rx mode
    switch_to_rx();
    Periodic_Mode = FALSE;
  }
  Red_Off();
}

void sendGPSpacket(void)
{
 // uint8_t i;
//  Red_On();
 // switch_to_tx();
//  work_mode = WORK_MODE_TX;
  //RF69_setopmode (RF_OPMODE_TRANSMITTER);
  //2,3,4,5,6
  //convert(PacketNumber);
  //for(i = 0; i < 5; i++) RF69_TXbuffer[i+2] = packnum[i];
  //RF69_TXbuffer[7] = ',';
  //RF69_TXbuffer[8] = validity;
  //RF69_TXbuffer[9] = ',';
  //7 and up; add 3 bytes to WORK_PACKET_LEN
  //for(i  = 0; i < PkLen-2; i++) RF69_TXbuffer[i+10] = GPSstring[i]; //ABCD.......
//  delay_ms(1);
  //RF69_sendpacket(PkLen, NodeAddr); //
//   delay_ms(1);
//  RF69_setopmode (RF_OPMODE_STANDBY); //maybe receiver
//  PacketNumber++;
//  Red_Off();
}

void initTIM4(void)
{
  TIM4_DeInit();
  TIM4_TimeBaseInit(TIM4_Prescaler_64, (F_CPU/64)/1000); //1 ms
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);
  TIM4_Cmd(ENABLE);
}

void delay_ms (uint16_t ms)
{
 
  TimingDelay = ms;
  while (TimingDelay != 0);

}

void TimingDelay_Decrement(void)
{
  TimingDelay--;
}
    

void initRTC(void)
{
  //RTC_DeInit(); //maybe removed
  RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);
  RTC_ITConfig(RTC_IT_WUT, ENABLE);
  //set 1 s wkup period
 // RTC_SetWakeUpCounter(2375);
  RTC_SetWakeUpCounter(238); //~100 ms
//  RTC_SetWakeUpCounter(600);
  RTC_WakeUpCmd(ENABLE);
    
}

//convert number to string
void convert(uint16_t v)
{
  uint16_t tmp;
  tmp = v;
  packnum[0] = v/10000 + 0x30;
  tmp = v%10000;
  packnum[1] = tmp/1000 + 0x30;
  tmp = tmp%1000;
  packnum[2] = tmp/100 + 0x30;
  tmp = tmp%100;
  packnum[3] = tmp/10 + 0x30;
  packnum[4] = tmp%10 + 0x30;
  
}

void convert8(uint8_t v)
{
  uint8_t tmp;
  tmp = v;
  c8[0] = tmp/100 + 0x30;
  tmp = tmp%100;
  c8[1] = tmp/10 + 0x30;
  c8[2] = tmp%10 + 0x30;
}

 void UART_senddata(void)
 {
      //send packet to UART 
      //fill UART buffer
      uint8_t i;
      UARTtxflag = FALSE;
      Green_On();
      convert8(RF69_RXbuffer[0]); //lenght
      TXbuffer[0] = c8[0];
      TXbuffer[1] = c8[1];
      TXbuffer[2] = c8[2];
      TXbuffer[3] = ',';
      convert8(RF69_RXbuffer[1]); //address
      TXbuffer[4] = c8[0];
      TXbuffer[5] = c8[1];
      TXbuffer[6] = c8[2];
      TXbuffer[7] = ',';
      convert8(Rssi);
      TXbuffer[8] = '-';
      TXbuffer[9] = c8[0];
      TXbuffer[10] = c8[1];
      TXbuffer[11] = c8[2];
      TXbuffer[12] = ',';
      //for (i = 0; i < tmp+1; i++) TXbuffer[i+1] = RF69_RXbuffer[i];
      for (i = 0; i < RxLen-1; i++) TXbuffer[i+13] = RF69_RXbuffer[i+2];
      TXbuffer[i+13] = ',';
      i++;
      if(Crcok) TXbuffer[i+13] = 'G'; //good packet - CRC ok
      else TXbuffer[i+13] = 'B'; //bad packet - CRC not match
      i++;
      TXbuffer[i+13] = 0x0D;
      i++;
      TXbuffer[i+13] = 0x0A;
      USART_SendBlock(RxLen+15); //set correct value
      delay_ms(10);
      Green_Off();
 }  


/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  //init clock - HSE 16 MHz
   initCLK();
  //IO config
  initIO();
  initSPI();
  initUART(BAUDRATE);
  initTIM4();
  initRTC();
  enableInterrupts();
  Green_On();
  Red_On();
  delay_ms(200);
  RF69_init();
  delay_ms(200);
  Red_Off();
  NodeAddr = NdAddr;
  PacketDelay = PkDelay;
  Green_Off();
  switch_to_rx();
  //check keypress
  delay_ms(100);
  //if(Key == KEY_LEFT) test_mode(); 
  if(GPIO_ReadInputDataBit(KEYPORT, K0) == RESET) test_loop(); 
  else user_loop();
}//main
  
  
  /* Work mode loop */
void user_loop(void)
{
  TestMode = FALSE; //for interrupt switching
  while (1)
  {
    
    switch (Key)
    {
    case KEY_LEFT:
      while (Key); //wait for release
      if(!Periodic_Mode) 
      {
    //increment address on changing testing point
      NodeAddr++;
      if(NodeAddr > 254) NodeAddr = 0;
      RF69_setNodeAddr(NodeAddr);     
      switch_to_tx();
      Periodic_Mode = TRUE;
      PacketNumber = 1;
      }
      else {}
      break;
      
    case KEY_RIGHT:
      while (Key); //wait for release
      switch_to_rx();
      Periodic_Mode = FALSE;
      break;
      
    case KEY_BOTH:
      while (Key); //wait for release
      break;
      
    default:
      break; //nothing to do
      
    }
    
    if (PacketFlag)
    {
      
      PacketFlag = FALSE;
      if (Periodic_Mode) 
       // if(GPSok)
       // {
       //   sendGPSpacket();
       //   GPSok = 0;
          
       // }
      //else 
        sendtestpacket();

    }
    
    //check and decode RX packets here!!!
    if(RF69_RXflag)
    {
      //add new variable - RX state;
      uint8_t i;
     
      //DebugVar0 = RF69_readreg(REG_IRQFLAGS1);
      //DebugVar1 = RF69_readreg(REG_IRQFLAGS2);
     // DebugVar2 = RF69_readreg(REG_RXTIMEOUT1);
     // DebugVar3 = RF69_readreg(REG_RXTIMEOUT2);

      Rssi = RF69_getRSSI();
      //Crcok
      if(RF69_readreg(REG_IRQFLAGS2) & CRC_OK) Crcok = 1;
      else Crcok = 0;
      //read data length
      RxLen = RF69_readreg(REG_FIFO);
      //fill buffer
      RF69_RXbuffer[0] = RxLen;
      for (i = 1; i < RxLen+1; i++) RF69_RXbuffer[i] = RF69_readreg(REG_FIFO);
      RF69_clearFIFO();
      RF69_RXflag = FALSE;
      RF69_restartRX();
      //set flag for UART
      UARTtxflag = TRUE;
    }
    
    //RX timeout - restart RX (separate function in RF69 driver)
    if ((work_mode == WORK_MODE_RX) && (RF69_RXtimeout >= RF69To)) //reset after extended timeout defined by user
    //if ((work_mode == WORK_MODE_RX) && checkDIO1()) //reset RX immediately on RF69 timeout
    {
      //DebugVar0 = RF69_readreg(REG_IRQFLAGS1);
      //DebugVar1 = RF69_readreg(REG_IRQFLAGS2);
      //DebugVar2 = RF69_readreg(REG_RXTIMEOUT1);
      //DebugVar3 = RF69_readreg(REG_RXTIMEOUT2);
      //DebugVar4 = RF69_RXtimeout;
      RF69_restartRX();

    }
    
    
    
    //check UART commands and GPS data
   
    //prepare and send GPS packet if ready
    
    //if(GPSflag)
    //{
      
    //  GPSflag = 0;
    //  GPSparse();
     
   // }

    
    if (UARTtxflag) UART_senddata();
    
    
   }//while(1)
}//work_mode()

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */


  
  

  

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
