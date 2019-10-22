#include "eeprom.h"

const uint8_t SYNC_INIT[8] = {WORK_SYNC1, WORK_SYNC2, WORK_SYNC3, WORK_SYNC4, WORK_SYNC5, WORK_SYNC6, WORK_SYNC7, WORK_SYNC8}; //32
//#pragma data_alignment=4

  uint32_t F_Base; // = F_BASE; //4 - 0x00D90000
  uint32_t F_Step; // = F_STEP; //8 - 0x000061A8
  int32_t  F_Offset; // = F_OFFSET; //12

  uint32_t BitRate; // = WORK_BITRATE; //16
  uint32_t Deviation; // = WORK_DEVIATION; //20
  uint32_t PkCount; // = PACKET_COUNT; //24

  uint8_t Channel; // = WORK_CHANNEL; //33 - alignment - ??? 
//tx settings
  uint8_t ModSetting; // = WORK_MOD_SETTING; //34
  uint8_t TxPower; // = WORK_TXPOWER; //35
//rx settings
  uint8_t RbwDcc; // = WORK_RBW_DCC; //36
  uint8_t Rbw; // = WORK_RBW_BW; //37
  uint8_t AfcDcc; // = WORK_AFC_DCC; //38
  uint8_t Abw; // = WORK_AFC_BW; //39
  uint8_t AfcSetting; // = WORK_AFCSETTING; //40
  int8_t  LbOffset; // = WORK_LBOFFSET; //41 //should be int8_t
  uint8_t RssiTr; // = WORK_RSSITR; //42
  uint8_t Dagc; // = WORK_TESTDAGC; //43
  uint8_t LnaSetting; // = WORK_LNASET; //44 - add LNA booster bit
  uint8_t SyncWord[8]; // = {WORK_SYNC1, WORK_SYNC2, WORK_SYNC3, WORK_SYNC4, WORK_SYNC5, WORK_SYNC6, WORK_SYNC7, WORK_SYNC8}; //32
  uint8_t PkConfig1; // = WORK_PACKETCONFIG1; //45
  uint8_t PkConfig2; // = WORK_PACKETCONFIG2; //46

  uint8_t NdAddr; // = 1; //47

  uint8_t PkDelay; // = PACKET_DELAY; //48
  uint8_t PkLen; // = WORK_PACKET_LEN; //49
//timeouts
  uint8_t RxTo; // = WORK_RXTO; //50
  uint8_t RssiTo; // = WORK_RSSITO; //51
  uint16_t RF69To; // = RF69TIMEOUT; //52
  uint8_t RxDelay; // = WORK_RXDELAY; //53 - inter-packet RX delay

//add temperature drift coeff. here!!!
  int8_t Tcal; // = TCAL;
  int8_t TcalValue; // = T_INIT;
  int16_t Tslope; // = F_TSLOPE; 




//EEPROM write routines

eeprom* params;

void EEPROM_init(void);
void EEPROM_readparameters(void);
void write_eeprom_word(uint32_t address, uint32_t data);
void write_eeprom_halfw(uint32_t address, uint16_t data);
void write_eeprom_byte(uint32_t address, uint8_t data);

/*
  * @brief  Clears the FLASH's pending flags.
  * @param  FLASH_FLAG: specifies the FLASH flags to clear.
  *   This parameter can be any combination of the following values:
  *     @arg FLASH_FLAG_EOP: FLASH End of Operation flag
  *     @arg FLASH_FLAG_WRPERR: FLASH Write protected error flag 
  *     @arg FLASH_FLAG_PGAERR: FLASH Programming Alignment error flag 
  *     @arg FLASH_FLAG_SIZERR: FLASH size error flag    
  *     @arg FLASH_FLAG_OPTVERR: FLASH Option validity error flag
  *     @arg FLASH_FLAG_OPTVERRUSR: FLASH Option User validity error flag
  *     @arg FLASH_FLAG_RDERR: FLASH Read protected error flag (available only in STM32L1XX_MDP devices)
  * @retval None

	
void FLASH_ClearFlag(uint32_t FLASH_FLAG)
  */

void write_eeprom_word(uint32_t address, uint32_t data){
    FLASH_Status status;
    
    if(IS_FLASH_DATA_ADDRESS(address)){
				DebugVar1 = 0;
        DATA_EEPROM_Unlock();
				DATA_EEPROM_FixedTimeProgramCmd(ENABLE); //???
				//FLASH_ClearFlag(FLASH_FLAG_WRPERR);
        status = DATA_EEPROM_ProgramWord(address, data);
				DebugVar1 = status;
//        if(status == FLASH_COMPLETE) {
//        } else {
//        }
        DATA_EEPROM_Lock();
    }
}

void write_eeprom_halfw(uint32_t address, uint16_t data){
    FLASH_Status status;
    
    if(IS_FLASH_DATA_ADDRESS(address)){
        DATA_EEPROM_Unlock();
        status = DATA_EEPROM_ProgramHalfWord(address, data);
        if(status == FLASH_COMPLETE) {
        } else {
        }
				DebugVar1 = status;
        DATA_EEPROM_Lock();
    }
}

void write_eeprom_byte(uint32_t address, uint8_t data){
    FLASH_Status status;
    
    if(IS_FLASH_DATA_ADDRESS(address)){
        DATA_EEPROM_Unlock();
        status = DATA_EEPROM_ProgramByte(address, data);
        if(status == FLASH_COMPLETE) {
        } else {
        }
				DebugVar1 = status;
        DATA_EEPROM_Lock();
    }
}
//EEPROM init

void EEPROM_init(void)
{

params = (eeprom*)START_EEPROM;
uint8_t i;
    
    if(params->f_write != 1)
    {

			write_eeprom_word((uint32_t)(&(params->F_Base)), F_BASE);
			write_eeprom_word((uint32_t)(&(params->F_Step)), F_STEP);
			write_eeprom_word((uint32_t)(&(params->F_Offset)), (uint32_t)F_OFFSET);

			write_eeprom_word((uint32_t)(&(params->BitRate)), WORK_BITRATE);
			write_eeprom_word((uint32_t)(&(params->Deviation)), WORK_DEVIATION);
			write_eeprom_word((uint32_t)(&(params->PkCount)), PACKET_COUNT);

			write_eeprom_byte((uint32_t)(&(params->Channel)), WORK_CHANNEL);
			write_eeprom_byte((uint32_t)(&(params->ModSetting)), WORK_MOD_SETTING);
			write_eeprom_byte((uint32_t)(&(params->TxPower)), WORK_TXPOWER);

		write_eeprom_byte((uint32_t)(&(params->RbwDcc)), WORK_RBW_DCC);
		write_eeprom_byte((uint32_t)(&(params->Rbw)), WORK_RBW_BW);
		write_eeprom_byte((uint32_t)(&(params->AfcDcc)), WORK_AFC_DCC);
		write_eeprom_byte((uint32_t)(&(params->Abw)), WORK_AFC_BW);

		write_eeprom_byte((uint32_t)(&(params->AfcSetting)), WORK_AFCSETTING);
		write_eeprom_byte((uint32_t)(&(params->LbOffset)), WORK_LBOFFSET);
		write_eeprom_byte((uint32_t)(&(params->RssiTr)), WORK_RSSITR);
		write_eeprom_byte((uint32_t)(&(params->Dagc)), WORK_TESTDAGC);
		write_eeprom_byte((uint32_t)(&(params->LnaSetting)), WORK_LNASET);
		
		for (i=0; i<8; i++) write_eeprom_byte((uint32_t)(&(params->SyncWord[i])), SYNC_INIT[i]);
		
		write_eeprom_byte((uint32_t)(&(params->PkConfig1)), WORK_PACKETCONFIG1);
		write_eeprom_byte((uint32_t)(&(params->PkConfig2)), WORK_PACKETCONFIG2);
		
		write_eeprom_byte((uint32_t)(&(params->NdAddr)), 1);

		write_eeprom_byte((uint32_t)(&(params->PkDelay)), PACKET_DELAY);
		write_eeprom_byte((uint32_t)(&(params->PkLen)), WORK_PACKET_LEN);

		write_eeprom_byte((uint32_t)(&(params->RxTo)), WORK_RXTO);
		write_eeprom_byte((uint32_t)(&(params->RssiTo)), WORK_RSSITO);
		write_eeprom_halfw((uint32_t)(&(params->RF69To)), RF69TIMEOUT);
		write_eeprom_byte((uint32_t)(&(params->RxDelay)), WORK_RXDELAY);


		write_eeprom_byte((uint32_t)(&(params->Tcal)), 25);
		write_eeprom_byte((uint32_t)(&(params->TcalValue)), (uint8_t)T_INIT);	
		write_eeprom_halfw((uint32_t)(&(params->Tslope)), (uint16_t)F_TSLOPE);
		
		write_eeprom_byte((uint32_t)(&(params->f_write)), 1); //here maybe CRC
		

    }
} //EEPROM_init

void EEPROM_readparameters(void)
{
	
params = (eeprom*)START_EEPROM;
uint8_t i;
	
	F_Base = params->F_Base;
	F_Step = params->F_Step;
	F_Offset = (int32_t)(params->F_Offset);
	BitRate = params->BitRate;
	Deviation = params->Deviation;
	PkCount = params->PkCount;
	Channel = params->Channel;
	ModSetting = params->ModSetting;
	TxPower = params->TxPower;
	RbwDcc = params->RbwDcc;
	Rbw = params->Rbw;
	AfcDcc = params->AfcDcc;
	Abw = params->Abw;
	AfcSetting = params->AfcSetting;
	LbOffset = params->LbOffset;
	RssiTr = params->RssiTr;
	Dagc = params->Dagc;
	LnaSetting = params->LnaSetting;
	for (i=0; i<8; i++) SyncWord[i] = params->SyncWord[i];
	PkConfig1 = params->PkConfig1;
	PkConfig2 = params->PkConfig2;
	NdAddr = params->NdAddr;
	PkDelay = params->PkDelay;
	PkLen = params->PkLen;
	RxTo = params->RxTo;
	RssiTo = params->RssiTo;
	RF69To = params->RF69To;
	RxDelay = params->RxDelay;
	Tcal = (int8_t)(params->Tcal);
	TcalValue = (int8_t)(params->TcalValue);
	Tslope = (int16_t)(params->Tslope);

}








