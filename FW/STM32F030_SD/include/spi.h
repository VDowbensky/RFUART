#ifndef _RF69_INTERFACE_H_
#define _RF69_INTERFACE_H_

#include <stdint.h>
#include "stm32f0xx_gpio.h"
#include "stm32f0xx_spi.h"



#define NSSPORT	GPIOA
#define NSS_PIN GPIO_Pin_15

#define SPIPORT GPIOB
#define SCK_PIN GPIO_Pin_3
#define MOSI_PIN GPIO_Pin_5
#define MISO_PIN GPIO_Pin_4

#define SCK_PINSOURCE GPIO_PinSource3
#define MOSI_PINSOURCE GPIO_PinSource5
#define MISO_PINSOURCE GPIO_PinSource4


extern void initSPI(void);
extern void RF69_select(void);
extern void RF69_deselect(void);
extern uint8_t spi_transfer(uint8_t b);
extern void checkDIO0(void);

#endif

