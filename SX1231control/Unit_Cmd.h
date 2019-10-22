//---------------------------------------------------------------------------

#ifndef Unit_CmdH
#define Unit_CmdH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include "Unit_Serial.h"

#define RXPREFIX  0xC96C
#define TXPREFIX  0x236B

#define THR_CMD_NOP					0xFFFFFFFF
#define THR_CMD_NOTHING 			0
#define THR_CMD_OPEN    			1
#define THR_CMD_CLOSE   			2

#define THR_CMD_READALL 			3
#define THR_CMD_FREQTEST   			4
#define THR_CMD_SETFREQPARAMS		5
#define THR_CMD_SETFREQOFFSET 		6
#define THR_CMD_SETSYNCWORD			7
#define THR_CMD_SETCHANNEL 			8
#define THR_CMD_SETBITRATE 			9
#define THR_CMD_SETTXPARAMS 		10
#define THR_CMD_SETRXPARAMS			11
#define THR_CMD_SETPACKETCONFIG		12
#define THR_CMD_SETADDITIONAL		13
#define THR_CMD_SETTEMPOFFSET		14
#define THR_CMD_READTEMP			15
#define THR_CMD_RESETALL			16
#define THR_CMD_SETALL				17

#define TIMER_CMD_DATA_PERIOD	    500

#define TIMER_ACCURACY				10


#define CRCPOLY        0x18
#define RESP_OK         0x00
#define RESP_ERR        0x01

#define READALL         0xB0
#define FREQTEST        0xB1
#define SETFREQPARAMS   0xB2 //base freq., channel step
#define SETFREQOFFSET   0xB3 //frequency offset and XCO temperature slope
#define SETSYNCWORD     0xB4
#define SETCHANNEL      0xB5
#define SETBITRATE      0xB6
#define SETTXPARAMS     0xB7  //mod. setting, deviation, TX power
#define SETRXPARAMS     0xB8  //BW, AFC, low beta offset, RSSI tr., DAGC, LNA gain, timeouts
#define SETPACKETCONFIG 0xB9 //packet config 1 & 2
#define SETADDITIONAL   0xBA  //packet delay, packet count, temperature calibration
#define SETTEMPOFFSET   0xBB
#define READTEMP		0xBC

#define RESETALL        0xBF  //return to initial parameters


//---------------------------------------------------------------------------
class TCmdThread : public TThread
{
private:

	void __fastcall ActivateMainPage();
	void __fastcall DeactivateMainPage();
	void __fastcall SetCursorDefault();
	void __fastcall SetCursorHourglass();
	void __fastcall WriteComSettings();
	void __fastcall StatusBarPortUpdate();
	void __fastcall StatusBarDeviceUpdate();


	void JobOpen();
	void JobClose();

	bool JobReadAll(DWORD JobOK, DWORD JobFail);
	void __fastcall JobReadAllUpdate(void);
	bool JobFreqTest(DWORD JobOK, DWORD JobFail);
	void __fastcall JobFreqTestUpdate(void);
	bool JobSetFreqParams(DWORD JobOK, DWORD JobFail);
	void __fastcall JobSetFreqParamsUpdate(void);
	bool JobSetFreqOffset(DWORD JobOK, DWORD JobFail);
	void __fastcall JobSetFreqOffsetUpdate(void);
	//bool JobSetSyncWord(DWORD JobOK, DWORD JobFail);
	//void __fastcall JobSetSyncWordUpdate(void);
	//bool JobSetChannel(DWORD JobOK, DWORD JobFail);
	//void __fastcall JobSetChannelUpdate(void);
	//bool JobSetBitRate(DWORD JobOK, DWORD JobFail);
	//void __fastcall JobSetBitRateUpdate(void);
	bool JobSetTxParams(DWORD JobOK, DWORD JobFail);
	void __fastcall JobSetTxParamsUpdate(void);
	bool JobSetRxParams(DWORD JobOK, DWORD JobFail);
	void __fastcall JobSetRxParamsUpdate(void);
	bool JobSetPacketConfig(DWORD JobOK, DWORD JobFail);
	void __fastcall JobSetPacketConfigUpdate(void);
	bool JobSetAdditional(DWORD JobOK, DWORD JobFail);
	void __fastcall JobSetAdditionalUpdate(void);
	bool JobTempCalibration(DWORD JobOK, DWORD JobFail);
	void __fastcall JobTempCalibrationUpdate(void);
	bool JobReadTemperature(DWORD JobOK, DWORD JobFail);
	void __fastcall JobReadTemperatureUpdate(void);


	//bool JobResetAll(DWORD JobOK, DWORD JobFail);
	//void __fastcall JobResetAllUpdate(void);

	void  SetThrCmd(DWORD cmd);
	void  SetThrTimer(DWORD Job,DWORD Period);

	//operative procedures

	DWORD cmd_stat;
	DWORD port_stat;
	bool  reload_flag;




protected:
	void __fastcall Execute();
public:
	__fastcall TCmdThread(bool CreateSuspended);



};
//---------------------------------------------------------------------------
extern CRITICAL_SECTION  thr_cmd_critsect;
extern HANDLE	 		 thr_cmd_event;
extern DWORD             thr_cmd_job;
extern int 			     thr_setup_comport;
extern int 			     thr_setup_baud;
extern DWORD Channel;
extern bool Ftest;
extern DWORD PacketConfig1;
extern DWORD PacketConfig2;
extern int 			   	 TimerID;
extern TCmdThread		*CmdThread;


//---------------------------------------------------------------------------
#endif
