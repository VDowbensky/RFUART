// ---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#include <stdio.h>
#include <io.h>         //הכÿ נאבמעû ס פאיכאלט
#include <fcntl.h>      //הכÿ נאבמעû ס פאיכאלט
#include <fstream.h>
#include <sys\stat.h>   //הכÿ נאבמעû ס פאיכאלט
#include <locale.h>
#include <mmsystem.h>

#pragma hdrstop

#include "Unit_Cmd.h"
#include "Unit_Serial.h"
#include "Unit_Main.h"
//#include "Unit_Tare.h"

#pragma package(smart_init)
// ---------------------------------------------------------------------------

CRITICAL_SECTION thr_cmd_critsect;
DWORD thr_cmd_job;
//DWORD thr_cmd_ku;
HANDLE thr_cmd_event;
int thr_setup_comport;
int thr_setup_baud;

bool Ftest = false;
//int thr_setup_addr = 0;

int TimerID;

BYTE const BWindex[24] = {0,3,6,9,12,15,18,21,1,4,7,10,13,16,19,22,2,5,8,11,14,17,20,23};
BYTE const BWvalue[24] = {0,0x08,0x10,0x01,0x09,0x11,0x02,0x0A,0x12,0x03,0x0B,0x13,
						  0x04,0x0C,0x14,0x05,0x0D,0x15,0x06,0x0E,0x16,0x07,0x0F,0x17};

DWORD Channel;

DWORD PacketConfig1;
DWORD PacketConfig2;

TCmdThread *CmdThread;

__fastcall TCmdThread::TCmdThread(bool CreateSuspended) : TThread
(CreateSuspended) {
}

// ------------------------- TimerProc -------------------------------------
void CALLBACK TimerProc(unsigned int uID, unsigned int uMsg, DWORD dwUser,
	DWORD dw1, DWORD dw2) {
	EnterCriticalSection(&thr_cmd_critsect);
	thr_cmd_job = dwUser;
	LeaveCriticalSection(&thr_cmd_critsect);
	SetEvent(thr_cmd_event);
	return;
}
// ---------------------------------------------------------------------------

// ------------------------- set_thr_cmd -------------------------------------
void TCmdThread::SetThrCmd(DWORD cmd) {
	EnterCriticalSection(&thr_cmd_critsect);
	timeKillEvent(TimerID);
	thr_cmd_job = cmd;
	LeaveCriticalSection(&thr_cmd_critsect);
	SetEvent(thr_cmd_event);
}
// ---------------------------------------------------------------------------

// ------------------------- SetThrTimer -------------------------------------
void TCmdThread::SetThrTimer(DWORD Job, DWORD Period) {
	EnterCriticalSection(&thr_cmd_critsect);
	if (thr_cmd_job == THR_CMD_NOP) {
		timeKillEvent(TimerID);
		TimerID = timeSetEvent(Period, TIMER_ACCURACY, TimerProc, Job,
			TIME_ONESHOT | TIME_KILL_SYNCHRONOUS);
	}
	LeaveCriticalSection(&thr_cmd_critsect);
}
// ---------------------------------------------------------------------------

// --------------------- StatusBarPortUpdate ---------------------------------
void __fastcall TCmdThread::StatusBarPortUpdate() {
	Form1->StatusBar1->Panels->Items[0]->Text = sta_port[port_stat];
	return;
}
// ---------------------------------------------------------------------------

// -------------------- StatusBarDeviceUpdate ---------------------------------
void __fastcall TCmdThread::StatusBarDeviceUpdate() {
	Form1->StatusBar1->Panels->Items[1]->Text = sta_device[cmd_stat];
	return;
}
// ---------------------------------------------------------------------------

// ----------------------- ActivateMainPage ----------------------------------
void __fastcall TCmdThread::ActivateMainPage() {


	Form1->btnClosePort->Enabled = true;
	Form1->btnOpenPort->Enabled = false;
	Form1->CmbCom->Enabled = false;
	Form1->CmbBaud->Enabled = false;
	//Form1->btnStop->Enabled = true;
	//Form1->btnStart->Enabled = false;
	//Form1->spTimeSet->Enabled = false;

	//SetThrCmd(THR_CMD_READTEMP);
	return;
}
// ---------------------------------------------------------------------------

// ---------------------- DeactivateMainPage ---------------------------------
void __fastcall TCmdThread::DeactivateMainPage() {

	Form1->btnClosePort->Enabled = false;
	Form1->btnOpenPort->Enabled = true;
	Form1->CmbCom->Enabled = true;
	Form1->CmbBaud->Enabled = true;
	//Form1->btnStop->Enabled = false;

	SetThrCmd(THR_CMD_NOTHING);

	return;
}
// ---------------------------------------------------------------------------

// ----------------------- SetCursorDefault ----------------------------------
void __fastcall TCmdThread::SetCursorDefault() {
	Screen->Cursor = crDefault;
	return;
}
// ---------------------------------------------------------------------------

// ---------------------- SetCursorHourglass ---------------------------------
void __fastcall TCmdThread::SetCursorHourglass() {
	Screen->Cursor = crHourGlass;
	return;
}
// ---------------------------------------------------------------------------

// ----------------------- WriteComSettings ----------------------------------
void __fastcall TCmdThread::WriteComSettings() {
	Form1->write_comport_settings();
	Form1->CmbBaud->ItemIndex = Form1->CmbBaud->Items->IndexOf(thr_setup_baud);
   //	Form1->EditAddr->Text = thr_setup_addr;
	return;
}
// ---------------------------------------------------------------------------

// ############################ PROGRAM ######################################

//Open
void TCmdThread::JobOpen() {

	if (serial_init(thr_setup_comport, thr_setup_baud, NULL)) {
		MessageDlg("Port opening error!", mtError,
			TMsgDlgButtons() << mbOK, 0);
		port_stat = PORT_ERROR;
		Synchronize(&StatusBarPortUpdate);
	}
	else {
		port_stat = PORT_OPENED;
		//fill settings edt's
		Synchronize(&StatusBarDeviceUpdate);
		Synchronize(&StatusBarPortUpdate);
		Synchronize(&ActivateMainPage);
		SetThrCmd(THR_CMD_READALL);

	}

	return;
}

// Close
void TCmdThread::JobClose() {
	port_stat = PORT_CLOSED;
	Synchronize(&StatusBarPortUpdate);
	Synchronize(&DeactivateMainPage);
	serial_uninit();

	return;
}

//Read parameters_____________________________________________________________
bool TCmdThread::JobReadAll(DWORD JobOK, DWORD JobFail)
{
	cmd_stat = processcommand(READALL, 0, 58);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	Synchronize(&JobReadAllUpdate);
	//SetThrCmd(JobOK);

return true;
}

void __fastcall TCmdThread::JobReadAllUpdate(void)
{
	DWORD t;
	signed int t1;
	signed short t2;

	t = 16777216*comm_rxbuff[1] + 65536*comm_rxbuff[2] + 256*comm_rxbuff[3] + comm_rxbuff[4];
	Form1->edtFrequency->Text = t; //frequency
	t = 16777216*comm_rxbuff[5] + 65536*comm_rxbuff[6] + 256*comm_rxbuff[7] + comm_rxbuff[8];
	Form1->edtStep->Text = t; //channel step
	t = 16777216*comm_rxbuff[9] + 65536*comm_rxbuff[10] + 256*comm_rxbuff[11] + comm_rxbuff[12];
	Form1->edtOffset->Text = (int)t; //freq. offset
	t = 16777216*comm_rxbuff[13] + 65536*comm_rxbuff[14] + 256*comm_rxbuff[15] + comm_rxbuff[16];
	Form1->edtBitrate->Text = t;
	t = 16777216*comm_rxbuff[17] + 65536*comm_rxbuff[18] + 256*comm_rxbuff[19] + comm_rxbuff[20];
	Form1->edtDeviation->Text = t;
	//Form1->edtDeviation->Text = *(DWORD *)(&comm_rxbuff[17]); //deviation
	//Form1->edtDeviation->Text = ((DWORD)comm_rxbuff[17])<<24 + ((DWORD)comm_rxbuff[18])<<16 + ((DWORD)comm_rxbuff[19])<<8 + comm_rxbuff[20];
	//21 - mod. setting
	Form1->cmbShaping->ItemIndex = comm_rxbuff[21] & 0x03;
	//22 - TX power
	Form1->edtPower->Text = (signed char)(comm_rxbuff[22] - 18);
	//23
	Form1->edtChannel->Text = comm_rxbuff[23]; //channel
	//24 - RBW DCC
	Form1->cmbRDCC->ItemIndex = comm_rxbuff[24] >> 5;
	//25 - RBW
	t = comm_rxbuff[25] & 0x1F;
	Form1->cmbRBW->ItemIndex =  BWindex[t];
	//26 - AFC DCC
	Form1->cmbADCC->ItemIndex = comm_rxbuff[26] >> 5;
	//27 - ABW
	t = comm_rxbuff[27] & 0x1F;
	Form1->cmbABW->ItemIndex =  BWindex[t];
	//28 - AFC settings
	if(comm_rxbuff[28] & 0x04) Form1->cbAfc->Checked = true;
	else  Form1->cbAfc->Checked = false;
	if(comm_rxbuff[28] & 0x08) Form1->cbAFCautoclr->Checked = true;
	else  Form1->cbAFCautoclr->Checked = false;
	//29 - LB offset
	t =  comm_rxbuff[29]*488; //it's not correct!!!
	Form1->edtLBoffset->Text = t;
	//30 - RSSI tr.
	Form1->edtRssi->Text = -(float)(comm_rxbuff[30])/2;
	//31 - DAGC
	t =  comm_rxbuff[31] & 0x30;
	if(t == 0) Form1->cmbDagc->ItemIndex = 0;
	else
	{
		if(t & 0x10) Form1->cmbDagc->ItemIndex = 2;
		else  Form1->cmbDagc->ItemIndex = 1;
	}
	//32 - LNA settings
	Form1->cmbGain->ItemIndex = comm_rxbuff[32] & 0x07;
	//LNA boost indication
	if((comm_rxbuff[32]) & 0x40) Form1->cbLnaboost->Checked = true;
	else Form1->cbLnaboost->Checked = false;
	//33...40 - SYNC word
	//41 - packet config 1
	PacketConfig1 = comm_rxbuff[41];
	if(PacketConfig1 & 0x08) Form1->cbCRC->Checked = false;
	else Form1->cbCRC->Checked = true;
	//DC free settings - bits 5 and 6
	t =  (PacketConfig1 & 0x60) >> 5;
	if (t != 3) Form1->cmbDcFree->ItemIndex = t;
	else Form1->cmbDcFree->ItemIndex = -1;
    //42 - packet config 2
	PacketConfig2 = comm_rxbuff[42];
	//43 - node address
	//44 - RX timeout
	//45 - RSSI timeout
	//46, 47 - RF69 timeout
	//48 - RX delay
	//49 - Tcal
	//50 - TcalValue
	//51, 52 - Tslope
	t = 256*comm_rxbuff[51] + comm_rxbuff[52];
	Form1->edtDrift->Text = (signed short)t;
	//53...56 - packet count
	t = 16777216*comm_rxbuff[53] + 65536*comm_rxbuff[54] + 256*comm_rxbuff[55] + comm_rxbuff[56];
	Form1->edtPkCount->Text = t;
	//57 - packet interval
	Form1->edtPkInterval->Text = ((DWORD)comm_rxbuff[57])*100;

}

//Frequency test
bool TCmdThread::JobFreqTest(DWORD JobOK, DWORD JobFail)
{

	cmd_stat = processcommand(FREQTEST, 1, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	//invert freqtest flag
	if(Ftest == true) Ftest = false;
	else Ftest = true;

	Synchronize(&JobFreqTestUpdate);
	SetThrCmd(JobOK);

return true;
}
void __fastcall TCmdThread::JobFreqTestUpdate(void)
{

   if  (Ftest == true)
   {
	  Form1->btnStartTest->Caption = "Stop test";
   }
   else
   {
	  Form1->btnStartTest->Caption = "Start test";
   }

}

//set frequency parameters
bool TCmdThread::JobSetFreqParams(DWORD JobOK, DWORD JobFail)
{
	cmd_stat = processcommand(SETFREQPARAMS, 8, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}

	comm_txbuff[0] = (BYTE)Channel;
	cmd_stat = processcommand(SETCHANNEL, 1, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}

	Synchronize(&JobSetFreqParamsUpdate);
	SetThrCmd(JobOK);

return true;
}
void __fastcall TCmdThread::JobSetFreqParamsUpdate(void)
{

}
bool TCmdThread::JobSetFreqOffset(DWORD JobOK, DWORD JobFail)
{

	cmd_stat = processcommand(SETFREQOFFSET, 6, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	Synchronize(&JobFreqTestUpdate);
	SetThrCmd(JobOK);

return true;

}
void __fastcall TCmdThread::JobSetFreqOffsetUpdate(void)
{

}
//bool TCmdThread::JobSetSyncWord(DWORD JobOK, DWORD JobFail)
//{
//
//}
//void __fastcall TCmdThread::JobSetSyncWordUpdate(void)
//{
//
//}
//bool TCmdThread::JobSetChannel(DWORD JobOK, DWORD JobFail)
//{
//
//}
//void __fastcall TCmdThread::JobSetChannelUpdate(void)
//{
//
//}
//bool TCmdThread::JobSetBitRate(DWORD JobOK, DWORD JobFail)
//{
//
//}
//void __fastcall TCmdThread::JobSetBitRateUpdate(void);
bool TCmdThread::JobSetTxParams(DWORD JobOK, DWORD JobFail)
{
	DWORD t;
	//bit rate
	t = StrToInt(Form1->edtBitrate->Text);
	comm_txbuff[0] = HIGH(t);
	comm_txbuff[1] = HIGL(t);
	comm_txbuff[2] = LOWH(t);
	comm_txbuff[3] = LOWL(t);
	cmd_stat = processcommand(SETBITRATE, 4, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	//deviation
	t = StrToInt(Form1->edtDeviation->Text);
	comm_txbuff[0] = HIGH(t);
	comm_txbuff[1] = HIGL(t);
	comm_txbuff[2] = LOWH(t);
	comm_txbuff[3] = LOWL(t);
	//mod. settings
	comm_txbuff[4] = Form1->cmbShaping->ItemIndex; //it's for FSK and packet mode only!!!
	//TX power
	comm_txbuff[5] = StrToInt(Form1->edtPower->Text) + 18;  //for PA1 only!!!
	cmd_stat = processcommand(SETTXPARAMS, 6, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}

	Synchronize(&JobFreqTestUpdate);
	SetThrCmd(JobOK);

return true;
}


void __fastcall TCmdThread::JobSetTxParamsUpdate(void)
{

}
bool TCmdThread::JobSetRxParams(DWORD JobOK, DWORD JobFail)
{
	int t = 0;
	float f;
	comm_txbuff[0] = (Form1->cmbRDCC->ItemIndex)<<5;
	comm_txbuff[1] =  BWvalue[Form1->cmbRBW->ItemIndex];
	comm_txbuff[2] = (Form1->cmbADCC->ItemIndex)<<5;
	comm_txbuff[3] =  BWvalue[Form1->cmbABW->ItemIndex];
	//AFC setting
	//if(comm_rxbuff[28] & 0x04) Form1->cbAfc->Checked = true;
	//else  Form1->cbAfc->Checked = false;
	//if(comm_rxbuff[28] & 0x08) Form1->cbAFCautoclr->Checked = true;
	//else  Form1->cbAFCautoclr->Checked = false;
	if(Form1->cbAfc->Checked == true) t |= 0x04;
	if(Form1->cbAFCautoclr->Checked == true) t |= 0x08;
	comm_txbuff[4] = t;
	//lb offset
	//t =  comm_rxbuff[29]*488;
	t = (StrToInt(Form1->edtLBoffset->Text))/488;
	comm_txbuff[5] = t;
	//RSSI tr.
	//Form1->edtRssi->Text = -(float)(comm_rxbuff[30])/2;
	f = -(StrToFloat(Form1->edtRssi->Text)*2);
	comm_txbuff[6] = (signed char)f;
	//DAGC
	//t =  comm_rxbuff[31] & 0x30;
	//if(t == 0) Form1->cmbDagc->ItemIndex = 0;
	//else
	//{
	//	if(t & 0x10) Form1->cmbDagc->ItemIndex = 2;
	//	else  Form1->cmbDagc->ItemIndex = 1;
	//}
	if(Form1->cmbDagc->ItemIndex == 2) comm_txbuff[7] = 0x30;
	else
	{
		if(Form1->cmbDagc->ItemIndex == 1) comm_txbuff[7] = 0x20;
		else comm_txbuff[7] = 0;
	}
	//LNA setting
	//Form1->cmbGain->ItemIndex = comm_rxbuff[32] & 0x07;
	//if((comm_rxbuff[32]) & 0x40) Form1->cbLnaboost->Checked = true;
	//else Form1->cbLnaboost->Checked = false;
	t = Form1->cmbGain->ItemIndex;
	if(Form1->cbLnaboost->Checked == true) t |= 0x40;
	comm_txbuff[8] = t;

	cmd_stat = processcommand(SETRXPARAMS, 9, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	Synchronize(&JobSetRxParamsUpdate);
	SetThrCmd(JobOK);

return true;


}
void __fastcall TCmdThread::JobSetRxParamsUpdate(void)
{

}
bool TCmdThread::JobSetPacketConfig(DWORD JobOK, DWORD JobFail)
{
	comm_txbuff[0] =  PacketConfig1;
	comm_txbuff[1] =  PacketConfig2;
	cmd_stat = processcommand(SETPACKETCONFIG, 2, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	Synchronize(&JobSetPacketConfigUpdate);
	SetThrCmd(JobOK);

return true;
}
void __fastcall TCmdThread::JobSetPacketConfigUpdate(void)
{

}


bool TCmdThread::JobSetAdditional(DWORD JobOK, DWORD JobFail)
{
	DWORD t;
	t = StrToInt(Form1->edtPkCount->Text);
	comm_txbuff[0] = HIGH(t);
	comm_txbuff[1] = HIGL(t);
	comm_txbuff[2] = LOWH(t);
	comm_txbuff[3] = LOWL(t);
	comm_txbuff[4] = (StrToInt(Form1->edtPkInterval->Text))/100;

	cmd_stat = processcommand(SETADDITIONAL, 5, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	Synchronize(&JobSetAdditionalUpdate);
	SetThrCmd(JobOK);

return true;
}

void __fastcall TCmdThread::JobSetAdditionalUpdate(void)
{

}

bool TCmdThread::JobTempCalibration(DWORD JobOK, DWORD JobFail)
{
	int t;
	t =  StrToInt(Form1->edtTamb->Text);
	comm_txbuff[0] = t & 0x000000FF;
	cmd_stat = processcommand(SETTEMPOFFSET, 1, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}

	Synchronize(&JobTempCalibrationUpdate);
	SetThrCmd(JobOK);

return true;
}

void __fastcall TCmdThread::JobTempCalibrationUpdate(void)
{

}

bool TCmdThread::JobReadTemperature(DWORD JobOK, DWORD JobFail)
{
	cmd_stat = processcommand(READTEMP, 0, 1);
	Synchronize(&StatusBarDeviceUpdate);
	if (cmd_stat == ERR_NO_ANS) {
		reload_flag = 1;
		return true;
	}
	else if (cmd_stat != ERR_OK) {
		return true;
	}
	else if (reload_flag) {
		reload_flag = 0;
		SetThrCmd(JobFail);
		return false;
		}
	//invert freqtest flag
	//if(Ftest == true) Ftest = false;
	//else Ftest = true;
	Synchronize(&JobReadTemperatureUpdate);
	//SetThrCmd(JobOK);

return true;
}

void __fastcall TCmdThread::JobReadTemperatureUpdate(void)
{
   Form1->edtTmeas->Text = *(signed char *)(&comm_rxbuff[0]);
}

//bool TCmdThread::JobResetAll(DWORD JobOK, DWORD JobFail)
//{
//
//}
//void __fastcall TCmdThread::JobResetAllUpdate(void)
//{
//
//}



// ------------------------- Execute -----------------------------------------
void __fastcall TCmdThread::Execute() {
	DWORD job;

	while (!Terminated) {
		// wait event
		if (WaitForSingleObject(thr_cmd_event, 10) != WAIT_OBJECT_0)
			continue;
		EnterCriticalSection(&thr_cmd_critsect);
		job = thr_cmd_job;
		thr_cmd_job = THR_CMD_NOP;
		LeaveCriticalSection(&thr_cmd_critsect);


		switch(job) {
		case THR_CMD_OPEN:
			JobOpen();
			break;

		case THR_CMD_CLOSE:
			JobClose();
			break;

		case  THR_CMD_READALL:
		if(JobReadAll(THR_CMD_READTEMP, THR_CMD_READTEMP))
		{
		SetThrTimer(THR_CMD_READTEMP, TIMER_CMD_DATA_PERIOD);
		}
			break;

		case  THR_CMD_FREQTEST:
		JobFreqTest(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case  THR_CMD_SETFREQPARAMS:
		JobSetFreqParams(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case  THR_CMD_SETFREQOFFSET:
		JobSetFreqOffset(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case  THR_CMD_SETSYNCWORD:
		//JobSetSyncWord(THR_CMD_NOTHING, THR_CMD_NOTHING);
			break;

		case  THR_CMD_SETCHANNEL:
		//JobSetChannel(THR_CMD_NOTHING, THR_CMD_NOTHING);
			break;

		case  THR_CMD_SETBITRATE:
		//JobSetBitRate(THR_CMD_NOTHING, THR_CMD_NOTHING);
			break;

		case  THR_CMD_SETTXPARAMS:
		JobSetTxParams(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case  THR_CMD_SETRXPARAMS:
		JobSetRxParams(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case  THR_CMD_SETPACKETCONFIG:
		JobSetPacketConfig(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case  THR_CMD_SETADDITIONAL:
		JobSetAdditional(THR_CMD_READALL, THR_CMD_READTEMP);
			break;

		case THR_CMD_SETTEMPOFFSET:
		JobTempCalibration(THR_CMD_READALL, THR_CMD_READTEMP);
		break;

		case THR_CMD_READTEMP:
		if(JobReadTemperature(THR_CMD_NOTHING, THR_CMD_READTEMP))
			{
				SetThrTimer(THR_CMD_READTEMP, TIMER_CMD_DATA_PERIOD);
			}
		break;

		case  THR_CMD_RESETALL:
		//JobResetAll(THR_CMD_NOTHING, THR_CMD_NOTHING);
			break;

		case THR_CMD_SETALL:
		JobSetTxParams(THR_CMD_NOTHING, THR_CMD_NOTHING);
		JobSetRxParams(THR_CMD_NOTHING, THR_CMD_NOTHING);
		JobSetAdditional(THR_CMD_READALL, THR_CMD_READTEMP);
        	break;

			default:
			break;   //nothing to do
		} // switch (job)
	} // while (1)

	timeKillEvent(TimerID);
	Sleep(1);
	return;
}


// ---------------------------------------------------------------------------


