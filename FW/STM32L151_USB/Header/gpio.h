#ifndef _USER_INTERFACE_H_
#define _USER_INTERFACE_H_
#include <stdint.h>
#include "stm32l1xx_gpio.h"
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

//#define LEDPORT GPIOB
//#define RED GPIO_Pin_7
//#define GREEN GPIO_Pin_8
//#define BLUE GPIO_Pin_6

#define LEDPORT GPIOA
#define RED GPIO_Pin_6
#define GREEN GPIO_Pin_5
#define BLUE GPIO_Pin_7


#define KEYPORT GPIOC
//#define PRG_PIN GPIO_Pin_1
#define K0 GPIO_Pin_13
#define K1 GPIO_Pin_12


#define DIO0_PORT GPIOB
#define DIO0_PIN GPIO_Pin_9
#define DIO0_EXTI_PORTSOURCE EXTI_PortSourceGPIOB
#define DIO0_EXTI_PINSOURCE EXTI_PinSource9
#define DIO0_EXTI_LINE EXTI_Line9

#define DIO0_IRQn EXTI9_5_IRQn
#define DIO0_IRQhandler EXTI9_5_IRQHandler

//#define CSACC_PIN GPIO_Pin_0
#define RESET_PORT GPIOB
#define RESET_PIN GPIO_Pin_8

extern void initIO(void);
extern void Green_On (void);
extern void Green_Off (void);
extern void Red_On (void);
extern void Red_Off (void);

extern void DIO0_enableIRQ(void);
extern void DIO0_disableIRQ(void);



#endif


