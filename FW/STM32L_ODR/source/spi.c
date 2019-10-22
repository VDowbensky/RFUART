#include "spi.h"
#include "gpio.h"
#include "main.h"



void RF69_select(void);
void RF69_deselect(void);
void RF69_HWreset (void);
void initSPI(void);
uint8_t spi_transfer(uint8_t b);
void checkDIO0(void);

//init SPI and RF GPIO
void initSPI(void)
{
	
		
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
  //RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA | RCC_AHBPeriph_GPIOB, ENABLE); //spi port and rf port
	
	// NSS pin configuration	
		GPIO_InitTypeDef gpio;                    
		GPIO_StructInit(&gpio);
		gpio.GPIO_Pin = NSS_PIN;
		gpio.GPIO_Speed = GPIO_Speed_10MHz;
		gpio.GPIO_Mode = GPIO_Mode_OUT;
		gpio.GPIO_OType = GPIO_OType_PP;
		GPIO_Init(SPIPORT, &gpio);
	  GPIO_SetBits(SPIPORT, NSS_PIN); //
	
	//SPI pins configurations

	GPIO_PinAFConfig(SPIPORT, SCK_PINSOURCE, GPIO_AF_SPI1);
  GPIO_PinAFConfig(SPIPORT, MOSI_PINSOURCE, GPIO_AF_SPI1);
  GPIO_PinAFConfig(SPIPORT,   MISO_PINSOURCE, GPIO_AF_SPI1);

  GPIO_StructInit(&gpio);                   // configuration of MOSI and SCK pins
  gpio.GPIO_Pin = SCK_PIN;
  gpio.GPIO_Speed = GPIO_Speed_10MHz;
  gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(SPIPORT, &gpio);
	
	GPIO_StructInit(&gpio);                   // configuration of MOSI and SCK pins
  gpio.GPIO_Pin = MOSI_PIN;
  gpio.GPIO_Speed = GPIO_Speed_10MHz;
  gpio.GPIO_Mode = GPIO_Mode_AF;
	gpio.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(SPIPORT, &gpio);

  GPIO_StructInit(&gpio);                   // MISO pin configuration
  gpio.GPIO_Pin = MISO_PIN;
  gpio.GPIO_Speed = GPIO_Speed_10MHz;
  gpio.GPIO_Mode = GPIO_Mode_AF;
  gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(SPIPORT, &gpio);



	//init SPI module
	SPI_InitTypeDef spi;

  SPI_StructInit(&spi);
  spi.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  spi.SPI_Mode = SPI_Mode_Master;
  spi.SPI_DataSize = SPI_DataSize_8b;
  spi.SPI_CPOL = SPI_CPOL_Low;
  spi.SPI_CPHA = SPI_CPHA_1Edge;
  spi.SPI_NSS = SPI_NSS_Soft;
  spi.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_16;
  spi.SPI_FirstBit = SPI_FirstBit_MSB;
	spi.SPI_CRCPolynomial = 7;
  SPI_Init(SPI1, &spi);

  //SPI_SSOutputCmd(SPI1, DISABLE);
  //SPI_NSSInternalSoftwareConfig(SPI1, SPI_NSSInternalSoft_Set);
  GPIO_SetBits(SPIPORT, NSS_PIN);
  SPI_Cmd(SPI1, ENABLE);
	SPI_I2S_ClearFlag(SPI1, SPI_I2S_IT_TXE);
	//SPI_I2S_ClearFlag(SPI1, SPI_I2S_IT_RXNE);	
	  
}

void RF69_select(void)
{
	GPIO_ResetBits(SPIPORT, NSS_PIN);
}
void RF69_deselect(void)
{
	GPIO_SetBits(SPIPORT, NSS_PIN);
}

uint8_t spi_transfer(uint8_t b)
{
	uint8_t data;
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET);
	SPI_I2S_SendData(SPI1, b);
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET);
	SPI_I2S_ReceiveData(SPI1);
	//while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET);
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET);
	data = (uint8_t)SPI_I2S_ReceiveData(SPI1);
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET);
	return data;
}

void RF69_HWreset (void)
{
    //set reset port as output
	  GPIO_InitTypeDef gpio;                    // RESET pin configuration
		GPIO_StructInit(&gpio);
		gpio.GPIO_Pin = RESET_PIN;
		gpio.GPIO_Speed = GPIO_Speed_10MHz;
		gpio.GPIO_Mode = GPIO_Mode_OUT;
		gpio.GPIO_OType = GPIO_OType_PP;
		GPIO_Init(RFPORT, &gpio);
	
	  GPIO_SetBits(RFPORT, RESET_PIN);
	  delay_ms(10);
		GPIO_ResetBits(RFPORT, RESET_PIN);
		delay_ms(10);
	
	//set RESET pin to HI_Z mode again
		gpio.GPIO_Pin = RESET_PIN;
		gpio.GPIO_Speed = GPIO_Speed_10MHz;
		gpio.GPIO_Mode = GPIO_Mode_IN;
		gpio.GPIO_OType = GPIO_OType_OD;
		GPIO_Init(RFPORT, &gpio);
	  delay_ms(10);

}
void checkDIO0(void)
{
	while (GPIO_ReadInputDataBit(RFPORT, DIO0_PIN) == Bit_RESET);
}
