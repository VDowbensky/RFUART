#ifndef _EEPROM_H_
#define _EEPROM_H_

#include "main.h"
#include  "stm8l15x_flash.h"

extern volatile __eeprom uint32_t F_Base;
extern volatile __eeprom uint32_t F_Step;
extern volatile __eeprom int32_t F_Offset;
extern volatile __eeprom uint32_t BitRate;
extern volatile __eeprom uint32_t Deviation;
extern volatile __eeprom uint32_t PkCount;
extern volatile __eeprom uint8_t SyncWord[];

extern volatile __eeprom uint8_t Channel;
//tx settings
extern volatile __eeprom uint8_t ModSetting;
extern volatile __eeprom uint8_t TxPower;
//rx settings
extern volatile __eeprom uint8_t RbwDcc;
extern volatile __eeprom uint8_t Rbw;
extern volatile __eeprom uint8_t AfcDcc;
extern volatile __eeprom uint8_t Abw;
extern volatile __eeprom uint8_t AfcSetting;
extern volatile __eeprom int8_t LbOffset;
extern volatile __eeprom uint8_t RssiTr;
extern volatile __eeprom uint8_t Dagc;
extern volatile __eeprom uint8_t LnaSetting;
extern volatile __eeprom uint8_t PkConfig1;
extern volatile __eeprom uint8_t PkConfig2;

extern volatile __eeprom uint8_t NdAddr;

extern volatile __eeprom uint8_t PkDelay;
extern volatile __eeprom uint8_t PkLen;
//timeouts
extern volatile __eeprom uint8_t RxTo;
extern volatile __eeprom uint8_t RssiTo;
extern volatile __eeprom uint16_t RF69To;
extern volatile __eeprom uint8_t RxDelay;

extern volatile __eeprom int8_t Tcal;
extern volatile __eeprom int8_t TcalValue;
extern volatile __eeprom int16_t Tslope;
/*
extern void writepar8(uint8_t d, uint8_t s);
extern void writepars8(int8_t d, int8_t s);
extern void writepar32(uint32_t d, uint32_t s);
*/
#endif
