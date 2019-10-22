//---------------------------------------------------------------------------

#include <vcl.h>
#include <vcl\inifiles.hpp>
#include <Registry.hpp>
#include <math.h>
#include <stdio.h>
#include <io.h>         //הכÿ נאבמעû ס פאיכאלט
#include <fcntl.h>      //הכÿ נאבמעû ס פאיכאלט
#include <fstream.h>
#include <sys\stat.h>   //הכÿ נאבמעû ס פאיכאלט
#include <locale.h>
#include <mmsystem.h>
#pragma hdrstop

#include "Unit_main.h"
#include "Unit_Cmd.h"
#include "Unit_Serial.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cspin"
#pragma link "Spin"
#pragma resource "*.dfm"
TForm1 *Form1;

//---------------------------------------------------------------------------

String sta_device[9] = {"OK", "Command error", "Parameters error", "CRC error", "Packet lenght error",
"Wrong answer", "No answer", "Transmit error", "COM port error"};
String sta_port[3] = {"Port opened", "Port closed", "Port opening error"};

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------


//######################### COMPORT #########################################

//--------------------- read_comport_settings -------------------------------
int TForm1::read_comport_settings(void){
TIniFile  *IniFile;
  IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+INI_FILENAME);
  EnterCriticalSection(&thr_cmd_critsect);
  thr_setup_comport     =IniFile->ReadInteger ("PORT","NUM",1);
  thr_setup_baud        =IniFile->ReadInteger ("PORT","BAUD",115200);
  LeaveCriticalSection(&thr_cmd_critsect);
  IniFile->Free();

return 0;
}

//--------------------- read_program_settings -------------------------------
int TForm1::read_program_settings(void){
TIniFile  *IniFile;
  IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+INI_FILENAME);
  EnterCriticalSection(&thr_cmd_critsect);
//  Cap1     = IniFile->ReadFloat   ("Cap","C1"  ,C1_DEFAULT);
//  Cap2     = IniFile->ReadFloat   ("Cap","C2"  ,C2_DEFAULT);
  //Form1->PageControl1->Pages[PAGE_TARE]->TabVisible =
	//		 IniFile->ReadInteger   ("Program","PageTareVisible",false);
  LeaveCriticalSection(&thr_cmd_critsect);
  IniFile->Free();
return 0;
}


//--------------------- write_comport_settings ------------------------------
int TForm1::write_comport_settings(void){
TIniFile  *IniFile;
  IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+INI_FILENAME);
  EnterCriticalSection(&thr_cmd_critsect);
  IniFile->WriteInteger("PORT","NUM" ,thr_setup_comport);
  IniFile->WriteInteger("PORT","BAUD",thr_setup_baud);
  //IniFile->WriteInteger("PORT","ADDR",thr_setup_addr);
  LeaveCriticalSection(&thr_cmd_critsect);
  IniFile->Free();

return 0;
}
//---------------------------------------------------------------------------

//--------------------- write_program_settings ------------------------------
int TForm1::write_program_settings(void){
TIniFile  *IniFile;
  IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+INI_FILENAME);
  //IniFile->WriteInteger("Program","GValue",StrToInt(EditGValue->Text));
  IniFile->Free();

return 0;
}

//--------------------- write_device_settings ------------------------------

int TForm1::write_device_settings(void){
TIniFile  *IniFile;

  if(Form1->opnSettingsDlg->Execute())
  {
  IniFile = new TIniFile(Form1->opnSettingsDlg->FileName);

  IniFile->WriteInteger("SETTINGS","Bitrate" ,StrToInt(Form1->edtBitrate->Text));
  IniFile->WriteInteger("SETTINGS","Deviation" ,StrToInt(Form1->edtDeviation->Text));
  IniFile->WriteInteger("SETTINGS","Shaping" ,Form1->cmbShaping->ItemIndex);
  IniFile->WriteInteger("SETTINGS","Power" ,StrToInt(Form1->edtPower->Text));
  IniFile->WriteInteger("SETTINGS","RBW_DCC" ,Form1->cmbRDCC->ItemIndex);
  IniFile->WriteInteger("SETTINGS","RBW" ,Form1->cmbRBW->ItemIndex);
  IniFile->WriteInteger("SETTINGS","AFC_DCC" ,Form1->cmbADCC->ItemIndex);
  IniFile->WriteInteger("SETTINGS","ABW" ,Form1->cmbABW->ItemIndex);
  IniFile->WriteInteger("SETTINGS","LB_offset" ,StrToInt(Form1->edtLBoffset->Text));
  IniFile->WriteInteger("SETTINGS","LNA_gain" ,Form1->cmbGain->ItemIndex);
  IniFile->WriteFloat("SETTINGS","RSSI" ,StrToFloat(Form1->edtRssi->Text));
  IniFile->WriteInteger("SETTINGS","DAGC" ,Form1->cmbDagc->ItemIndex);

  IniFile->WriteInteger("SETTINGS","Count" ,StrToInt(Form1->edtPkCount->Text));
  IniFile->WriteInteger("SETTINGS","Interval" ,StrToInt(Form1->edtPkInterval->Text));


  LeaveCriticalSection(&thr_cmd_critsect);
  IniFile->Free();
  }

return 0;
}

//--------------------- write_calibration ------------------------------

int TForm1::write_calibration(void){
TIniFile  *IniFile;

  if(Form1->opnCalDlg->Execute())
  {
  IniFile = new TIniFile(Form1->opnCalDlg->FileName);
  //IniFile = new TIniFile(ExtractFilePath(Application->ExeName)+WORKSET_FILENAME);
  EnterCriticalSection(&thr_cmd_critsect);
  IniFile->WriteInteger("CALIBRATION","Frequency" ,StrToInt(Form1->edtFrequency->Text));
  IniFile->WriteInteger("CALIBRATION","Step" ,StrToInt(Form1->edtStep->Text));
  IniFile->WriteInteger("CALIBRATION","Channel" ,StrToInt(Form1->edtChannel->Text));
  IniFile->WriteInteger("CALIBRATION","Offset" ,StrToInt(Form1->edtOffset->Text));
  IniFile->WriteInteger("CALIBRATION","Drift" ,StrToInt(Form1->edtDrift->Text));

  LeaveCriticalSection(&thr_cmd_critsect);
  IniFile->Free();
  }

return 0;
}

//--------------------- read_device_settings -------------------------------

int TForm1::read_device_settings(void){
TIniFile  *IniFile;

	if(Form1->opnSettingsDlg->Execute())
	{
	IniFile = new TIniFile(Form1->opnSettingsDlg->FileName);
	EnterCriticalSection(&thr_cmd_critsect);

	Form1->edtBitrate->Text = IniFile->ReadInteger("SETTINGS","Bitrate",0);
	Form1->edtDeviation->Text = IniFile->ReadInteger("SETTINGS","Deviation",0);
	Form1->cmbShaping->ItemIndex = IniFile->ReadInteger("SETTINGS","Shaping",0);
	Form1->edtPower->Text = IniFile->ReadInteger("SETTINGS","Power",0);
	Form1->cmbRDCC->ItemIndex = IniFile->ReadInteger("SETTINGS","RBW_DCC",0);
	Form1->cmbRBW->ItemIndex = IniFile->ReadInteger("SETTINGS","RBW",0);
	Form1->cmbADCC->ItemIndex = IniFile->ReadInteger("SETTINGS","AFC_DCC",0);
	Form1->cmbABW->ItemIndex = IniFile->ReadInteger("SETTINGS","ABW",0);
	Form1->edtLBoffset->Text = IniFile->ReadInteger("SETTINGS","LB_offset",0);
	Form1->cmbGain->ItemIndex = IniFile->ReadInteger("SETTINGS","LNA_gain",0);
	Form1->edtRssi->Text = IniFile->ReadFloat("SETTINGS","RSSI",0);
	Form1->cmbDagc->ItemIndex = IniFile->ReadInteger("SETTINGS","DAGC",0);

	Form1->edtPkCount->Text = IniFile->ReadInteger("SETTINGS","Count",0);
	Form1->edtPkInterval->Text = IniFile->ReadInteger("SETTINGS","Interval",0);

  //Form1->PageControl1->Pages[PAGE_TARE]->TabVisible =
	//		 IniFile->ReadInteger   ("Program","PageTareVisible",false);
	LeaveCriticalSection(&thr_cmd_critsect);
	IniFile->Free();
	}
return 0;
}




//--------------------- read_calibration ------------------------------
int TForm1::read_calibration(void){
TIniFile  *IniFile;

	if(Form1->opnCalDlg->Execute())
	{
	IniFile = new TIniFile(Form1->opnCalDlg->FileName);
	EnterCriticalSection(&thr_cmd_critsect);
	Form1->edtFrequency->Text = IniFile->ReadInteger("CALIBRATION","Frequency",0);
	Form1->edtStep->Text = IniFile->ReadInteger("CALIBRATION","Step",0);
	Form1->edtChannel->Text = IniFile->ReadInteger("CALIBRATION","Channel",0);
	Form1->edtOffset->Text = IniFile->ReadInteger("CALIBRATION","Offset",0);
	Form1->edtDrift->Text = IniFile->ReadInteger("CALIBRATION","Drift",0);

	LeaveCriticalSection(&thr_cmd_critsect);
	IniFile->Free();
	}
return 0;
}

//--------------------- fill_comports ---------------------------------------
void TForm1::fill_comports(void){

TRegistry   * Reg;
TStringList * List;
int x;
String comx;

  CmbCom->Clear();
  Reg  = new TRegistry;
  List = new TStringList;
  Reg->RootKey=HKEY_LOCAL_MACHINE;
  Reg->OpenKeyReadOnly("HARDWARE\\DEVICEMAP\\SERIALCOMM");
  Reg->GetValueNames(List);
	for (x=0;x<List->Count;x++){
	  if (Reg->ReadString(List->Strings[x]).SetLength(3)=="COM")
	  CmbCom->Items->Add(Reg->ReadString(List->Strings[x]));
	}

  List->Free();
  Reg->CloseKey();
  Reg->Free();

return;
}

//---------------------------------------------------------------------------



//------------------------- set_thr_cmd -------------------------------------
void TForm1::set_thr_cmd(DWORD cmd)
{
  EnterCriticalSection(&thr_cmd_critsect);
  timeKillEvent(TimerID);
  thr_cmd_job=cmd;
  LeaveCriticalSection(&thr_cmd_critsect);
  SetEvent(thr_cmd_event);
}
//---------------------------------------------------------
void __fastcall TForm1::FormActivate(TObject *Sender)
{


return;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormDestroy(TObject *Sender)
{
		 timeKillEvent(TimerID);
  Sleep(1);
  CmdThread->Terminate();
  CloseHandle(thr_cmd_event);
  DeleteCriticalSection(&thr_cmd_critsect);
  serial_uninit();

}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnOpenPortClick(TObject *Sender)
{
	set_thr_cmd (THR_CMD_OPEN);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::btnClosePortClick(TObject *Sender)
{
	set_thr_cmd(THR_CMD_CLOSE );
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CmbComChange(TObject *Sender)
{
  EnterCriticalSection(&thr_cmd_critsect);
	if (CmbCom->ItemIndex==-1) {
	thr_setup_comport=0;
	return;
	}

  thr_setup_comport=StrToInt(CmbCom->Text.Delete(1,3));
  LeaveCriticalSection(&thr_cmd_critsect);
  write_comport_settings();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::CmbBaudChange(TObject *Sender)
{
  EnterCriticalSection(&thr_cmd_critsect);
  thr_setup_baud=StrToInt(CmbBaud->Items->Strings[CmbBaud->ItemIndex]);
  LeaveCriticalSection(&thr_cmd_critsect);
  write_comport_settings();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormShow(TObject *Sender)
{
      	     InitializeCriticalSection(&thr_cmd_critsect);
  thr_cmd_event=CreateEvent(NULL,false,false,NULL);
  CmdThread = new TCmdThread(false);

  setlocale(LC_ALL, "");

  //fill_language();

  fill_comports();

  read_comport_settings();

  read_program_settings();

  StatusBar1->Panels->Items[0]->Text=sta_port[PORT_CLOSED];
  StatusBar1->Panels->Items[1]->Text=sta_device[ERR_OK];


  CmbCom->ItemIndex = CmbCom->Items->IndexOf("COM"+IntToStr((int)thr_setup_comport));
  CmbBaud   -> ItemIndex = CmbBaud-> Items->IndexOf(thr_setup_baud);

}

//---------------------------------------------------------------------------



//---------------------------------------------------------------------------


//---------------------------------------------------------------------------

//---------------------------------------------------------------------------



void __fastcall TForm1::btnReadAllClick(TObject *Sender)
{
	Form1->read_calibration();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnTimingsSetClick(TObject *Sender)
{
	set_thr_cmd(THR_CMD_SETADDITIONAL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnRxSetClick(TObject *Sender)
{
	set_thr_cmd(THR_CMD_SETRXPARAMS);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnTxSetClick(TObject *Sender)
{
	set_thr_cmd(THR_CMD_SETTXPARAMS);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnFreqSetClick(TObject *Sender)
{
	//fill TX buffer
	DWORD t;
	t = StrToInt(Form1->edtFrequency->Text);
	comm_txbuff[0] = HIGH(t);
	comm_txbuff[1] = HIGL(t);
	comm_txbuff[2] = LOWH(t);
	comm_txbuff[3] = LOWL(t);
	t = StrToInt(Form1->edtStep->Text);
	comm_txbuff[4] = HIGH(t);
	comm_txbuff[5] = HIGL(t);
	comm_txbuff[6] = LOWH(t);
	comm_txbuff[7] = LOWL(t);
	Channel = StrToInt(Form1->edtChannel->Text);
	set_thr_cmd(THR_CMD_SETFREQPARAMS);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnStartTestClick(TObject *Sender)
{

	if(Ftest == false)
	{
	comm_txbuff[0] = 1;
	//Ftest == true;
	//Form1->btnStartTest->Caption = "Stop test";
	}
	else
	{
	comm_txbuff[0] = 0;
	//Ftest == false;
	//Form1->btnStartTest->Caption = "Start test";
	}
	set_thr_cmd(THR_CMD_FREQTEST);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnSetFreqOffsetClick(TObject *Sender)
{
	int t;
	t =  StrToInt(Form1->edtOffset->Text);
	comm_txbuff[0] = HIGH(t);
	comm_txbuff[1] = HIGL(t);
	comm_txbuff[2] = LOWH(t);
	comm_txbuff[3] = LOWL(t);
	t =  StrToInt(Form1->edtDrift->Text) & 0x0000FFFF;
	comm_txbuff[4] = HI(t);
	comm_txbuff[5] = LO(t);
	set_thr_cmd(THR_CMD_SETFREQOFFSET);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnTempSetClick(TObject *Sender)
{

	set_thr_cmd(THR_CMD_SETTEMPOFFSET);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbFreqDownClick(TObject *Sender)
{
	int f;
	f =  StrToInt(Form1->edtFrequency->Text);
	f -= 100000; //1kHz
	if(f < 862000000) f = 862000000;
	Form1->edtFrequency->Text = f;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbFreqUpClick(TObject *Sender)
{
	int f;
	f =  StrToInt(Form1->edtFrequency->Text);
	f += 100000; //1kHz
	if(f > 870000000) f = 870000000;
	Form1->edtFrequency->Text = f;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SbStepDownClick(TObject *Sender)
{
	int s;
	s =  StrToInt(Form1->edtStep->Text);
	s -= 5000; //1kHz
	if(s < 5000) s = 5000;
	Form1->edtStep->Text = s;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SbStepUpClick(TObject *Sender)
{
	int s;
	s =  StrToInt(Form1->edtStep->Text);
	s += 5000; //1kHz
	if(s > 100000) s = 100000;
	Form1->edtStep->Text = s;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SbChannelDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtChannel->Text);
	c--;
	if(c < 0) c = 0;
	Form1->edtChannel->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SbChannelUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtChannel->Text);
	c++;
	if(c > 250) c = 250;
	Form1->edtChannel->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbFreqOffsetDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtOffset->Text);
	c -= 100;
	if(c < -20000) c = -20000;
	Form1->edtOffset->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbFreqOffsetUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtOffset->Text);
	c += 100;
	if(c > 20000) c = 20000;
	Form1->edtOffset->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbTempDriftDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtDrift->Text);
	c --;
	if(c < -500) c = -500;
	Form1->edtDrift->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbTempDriftUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtDrift->Text);
	c ++;
	if(c > 500) c = 500;
	Form1->edtDrift->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbSetAmbientDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtTamb->Text);
	c --;
	if(c < -40) c = -40;
	Form1->edtTamb->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbSetAmbientUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtTamb->Text);
	c ++;
	if(c > 85) c = 85;
	Form1->edtTamb->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPowerDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtPower->Text);
	c --;
	if(c < -2) c = -2;
	Form1->edtPower->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPowerUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtPower->Text);
	c ++;
	if(c > 13) c = 13;
	Form1->edtPower->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbLbOffsetDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtLBoffset->Text);
	c -= 488;
	if(c < -4880) c = -4880;
	Form1->edtLBoffset->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbLbOffsetUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtLBoffset->Text);
	c += 488;
	if(c > 4880) c = 4880;
	Form1->edtLBoffset->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPacketCountDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtPkCount->Text);
	c -= 50;
	if(c < 0) c = 0;
	Form1->edtPkCount->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPacketCountUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtPkCount->Text);
	c += 50;
	if(c > 100000) c = 100000;
	Form1->edtPkCount->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPacketIntervalDownClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtPkInterval->Text);
	c -=100;
	if(c < 100) c = 100;
	Form1->edtPkInterval->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPacketIntervalUpClick(TObject *Sender)
{
	int c;
	c =  StrToInt(Form1->edtPkInterval->Text);
	c += 100;
	if(c > 10000) c = 10000;
	Form1->edtPkInterval->Text = c;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::sbBitRateDownClick(TObject *Sender)
{
	DWORD c;
	c =  StrToInt(Form1->edtBitrate->Text);
	c -=100;
	if(c < 600) c = 600;
	Form1->edtBitrate->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbBitRateUpClick(TObject *Sender)
{
	DWORD c;
	c =  StrToInt(Form1->edtBitrate->Text);
	c += 100;
	if(c > 600000) c = 600000;
	Form1->edtBitrate->Text = c;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::sbDeviationDownClick(TObject *Sender)
{
	DWORD c;
	c =  StrToInt(Form1->edtDeviation->Text);
	c -=500;
	if(c < 2000) c = 2000;
	Form1->edtDeviation->Text = c;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbDeviationUpClick(TObject *Sender)
{
	DWORD c;
	c =  StrToInt(Form1->edtDeviation->Text);
	c += 500;
	if(c > 300000) c = 300000;
	Form1->edtDeviation->Text = c;
}
//---------------------------------------------------------------------------



void __fastcall TForm1::sbRssiDownClick(TObject *Sender)
{
	float f;
	f = StrToFloat(Form1->edtRssi->Text);
	if(f > -30) f = -30;
	f = f-0.5f;
	if(f < -127.5) f = -127.5;
	Form1->edtRssi->Text = f;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::sbRssiUpClick(TObject *Sender)
{
	float f;
	f = StrToFloat(Form1->edtRssi->Text);
	f = f+0.5f;
	if(f > -30) f = -30;
	Form1->edtRssi->Text = f;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::btnWriteFileClick(TObject *Sender)
{
	Form1->write_device_settings();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnReadFileClick(TObject *Sender)
{
	Form1->read_device_settings();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnWriteAllClick(TObject *Sender)
{
	Form1->write_calibration();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnSetAllClick(TObject *Sender)
{
	set_thr_cmd(THR_CMD_SETALL);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::cbCRCClick(TObject *Sender)
{
	if(Form1->cbCRC->Checked == false) PacketConfig1 |= 0x08; //CrcAutoClearOff = 1
	else PacketConfig1 &= ~0x08; //CrcAutoClearOff = 0
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnCRCClick(TObject *Sender)
{
	set_thr_cmd(THR_CMD_SETPACKETCONFIG);
}
//---------------------------------------------------------------------------


void __fastcall TForm1::cmbDcFreeChange(TObject *Sender)
{
    PacketConfig1 = (PacketConfig1 & ~0x60) | (Form1->cmbDcFree->ItemIndex << 5);
}
//---------------------------------------------------------------------------

