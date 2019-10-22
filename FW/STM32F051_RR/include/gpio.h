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
#define TXD_PIN GPIO_Pin_2 
//#define RXD_PIN GPIO_Pin_3
#define RXD_PIN GPIO_Pin_3
#define TXD_PINSOURCE GPIO_PinSource2
#define RXD_PINSOURCE GPIO_PinSource3
//#define RXD_PINSOURCE GPIO_PinSource15

#define LEDPORT GPIOA
//1911
//#define RED GPIO_Pin_9
//#define GREEN GPIO_Pin_9
//#define BLUE GPIO_Pin_9
//1927
#define RED GPIO_Pin_15
#define GREEN GPIO_Pin_15
#define BLUE GPIO_Pin_15


#define KEYPORT GPIOA//fucKKK! 
#define K1PORT GPIOA
//1911
//#define K0 GPIO_Pin_10 //
//#define K1 GPIO_Pin_12 //
//1927
#define K0 GPIO_Pin_9 //
#define K1 GPIO_Pin_10 //


#define RFPORT GPIOB
#define DIO0_PIN GPIO_Pin_0
#define DIO0_EXTI_PORTSOURCE EXTI_PortSourceGPIOB
#define DIO0_EXTI_PINSOURCE EXTI_PinSource0
#define DIO0_EXTI_LINE EXTI_Line0

#define DIO0_IRQn EXTI0_1_IRQn
#define DIO0_IRQhandler EXTI0_1_IRQHandler

#define RESET_PIN GPIO_Pin_1

extern void initIO(void);
extern void Green_On (void);
extern void Green_Off (void);
extern void Red_On (void);
extern void Red_Off (void);

extern void DIO0_enableIRQ(void);
extern void DIO0_disableIRQ(void);



#endif


