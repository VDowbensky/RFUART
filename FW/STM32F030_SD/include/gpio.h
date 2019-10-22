#ifndef _USER_INTERFACE_H_
#define _USER_INTERFACE_H_
#include <stdint.h>
#include "stm32f0xx_gpio.h"
#include "main.h"


#define KEYDELAY 50
#define KEY_LEFT 1
#define KEY_RIGHT 2
#define KEY_BOTH 3

//hardware

#define UARTPORT GPIOA
#define TXD_PIN GPIO_Pin_9
#define RXD_PIN GPIO_Pin_10
#define TXD_PINSOURCE GPIO_PinSource9
#define RXD_PINSOURCE GPIO_PinSource10

#define LEDPORT GPIOA
#define RED GPIO_Pin_11
#define GREEN GPIO_Pin_11
#define BLUE GPIO_Pin_11


#define KEYPORT GPIOB
#define K1PORT GPIOA
//#define PRG_PIN GPIO_Pin_1
#define K0 GPIO_Pin_0 //SW3 - clean
#define K1 GPIO_Pin_0 //maybe not correct


#define RFPORT GPIOB
#define DIO0_PIN GPIO_Pin_7
#define DIO0_EXTI_PORTSOURCE EXTI_PortSourceGPIOB
#define DIO0_EXTI_PINSOURCE EXTI_PinSource7
#define DIO0_EXTI_LINE EXTI_Line7

#define DIO0_IRQn EXTI4_15_IRQn
#define DIO0_IRQhandler EXTI4_15_IRQHandler

#define RESET_PIN GPIO_Pin_6

extern void initIO(void);
extern void Green_On (void);
extern void Green_Off (void);
extern void Red_On (void);
extern void Red_Off (void);

extern void DIO0_enableIRQ(void);
extern void DIO0_disableIRQ(void);



#endif


