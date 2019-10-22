//---------------------------------------------------------------------------

#ifndef Unit_mainH
#define Unit_mainH

#define HI(x) ((x)>>8)
#define LO(x) ((x)& 0xFF)

#define HIGH(x) (x>>24)
#define HIGL(x) ((x>>16) & 0xFF)
#define LOWH(x) ((x>>8) & 0xFF)
#define LOWL(x) ((x) & 0xFF)

#define LNG_FILENAME	"sx1231control.lng"
#define INI_FILENAME	"sx1231control.ini"
#define WORKSET_FILENAME "sx1231settings.ini"
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>

#include <Menus.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include "Spin.hpp"
#include "cspin.h"
#include "Unit_Serial.h"
#include <ExtDlgs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *MainMenu1;
	TMenuItem *File;
	TMenuItem *Actions;
	TMenuItem *fHelp;
	TMenuItem *fLoadConfig;
	TMenuItem *fSaveconfig;
	TMenuItem *fExit;
	TMenuItem *fAbout;
	TMenuItem *aReadFrom;
	TMenuItem *aStore;
	TGroupBox *gbComm;
	TLabel *Label1;
	TLabel *Label2;
	TComboBox *CmbCom;
	TButton *btnOpenPort;
	TButton *btnClosePort;
	TComboBox *CmbBaud;
	TGroupBox *gbFreqset;
	TEdit *edtFrequency;
	TLabel *Label3;
	TEdit *edtStep;
	TLabel *Label4;
	TEdit *edtChannel;
	TLabel *Label5;
	TButton *btnFreqSet;
	TSpinButton *sbFreq;
	TSpinButton *SbChannel;
	TSpinButton *SbStep;
	TGroupBox *gbFteqOffset;
	TEdit *edtOffset;
	TLabel *Label6;
	TEdit *edtDrift;
	TLabel *Label7;
	TSpinButton *sbFreqOffset;
	TSpinButton *sbTempDrift;
	TButton *btnStartTest;
	TGroupBox *gbTX;
	TEdit *edtBitrate;
	TLabel *Label9;
	TEdit *edtDeviation;
	TLabel *Label10;
	TComboBox *cmbShaping;
	TLabel *Label11;
	TGroupBox *gbRX;
	TLabel *Label12;
	TEdit *edtPower;
	TSpinButton *sbPower;
	TButton *btnTxSet;
	TLabel *Label13;
	TLabel *Label14;
	TLabel *Label15;
	TLabel *Label16;
	TLabel *Label20;
	TLabel *Label21;
	TButton *btnRxSet;
	TGroupBox *gbTemperature;
	TButton *btnTempSet;
	TEdit *edtTamb;
	TEdit *edtTmeas;
	TLabel *Label8;
	TLabel *Label24;
	TSpinButton *sbSetAmbient;
	TGroupBox *gbTimings;
	TEdit *edtPkCount;
	TLabel *Label25;
	TEdit *edtPkInterval;
	TLabel *Label26;
	TCheckBox *cbAfc;
	TCheckBox *cbAFCautoclr;
	TEdit *edtLBoffset;
	TSpinButton *sbLbOffset;
	TSpinButton *sbPacketCount;
	TSpinButton *sbPacketInterval;
	TButton *btnTimingsSet;
	TButton *btnSetFreqOffset;
	TComboBox *cmbRDCC;
	TComboBox *cmbRBW;
	TComboBox *cmbADCC;
	TComboBox *cmbABW;
	TCheckBox *cbLnaboost;
	TComboBox *cmbGain;
	TStatusBar *StatusBar1;
	TLabel *Label17;
	TLabel *Label18;
	TLabel *Label19;
	TLabel *Label22;
	TLabel *Label23;
	TButton *btnReadAll;
	TComboBox *cmbDagc;
	TLabel *Label27;
	TButton *btnWriteAll;
	TButton *btnReadFile;
	TButton *btnWriteFile;
	TSpinButton *sbBitRate;
	TSpinButton *sbDeviation;
	TEdit *edtRssi;
	TLabel *Label28;
	TSpinButton *sbRssi;
	TOpenTextFileDialog *opnSettingsDlg;
	TOpenTextFileDialog *opnCalDlg;
	TButton *btnSetAll;
	TGroupBox *gbPacketConfig;
	TCheckBox *cbCRC;
	TButton *btnCRC;
	TComboBox *cmbDcFree;
	TLabel *Label29;
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall btnOpenPortClick(TObject *Sender);
	void __fastcall btnClosePortClick(TObject *Sender);
	void __fastcall CmbComChange(TObject *Sender);
	void __fastcall CmbBaudChange(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall btnReadAllClick(TObject *Sender);
	void __fastcall btnTimingsSetClick(TObject *Sender);
	void __fastcall btnRxSetClick(TObject *Sender);
	void __fastcall btnTxSetClick(TObject *Sender);
	void __fastcall btnFreqSetClick(TObject *Sender);
	void __fastcall btnStartTestClick(TObject *Sender);
	void __fastcall btnSetFreqOffsetClick(TObject *Sender);
	void __fastcall btnTempSetClick(TObject *Sender);
	void __fastcall sbFreqDownClick(TObject *Sender);
	void __fastcall sbFreqUpClick(TObject *Sender);
	void __fastcall SbStepDownClick(TObject *Sender);
	void __fastcall SbStepUpClick(TObject *Sender);
	void __fastcall SbChannelDownClick(TObject *Sender);
	void __fastcall SbChannelUpClick(TObject *Sender);
	void __fastcall sbFreqOffsetDownClick(TObject *Sender);
	void __fastcall sbFreqOffsetUpClick(TObject *Sender);
	void __fastcall sbTempDriftDownClick(TObject *Sender);
	void __fastcall sbTempDriftUpClick(TObject *Sender);
	void __fastcall sbSetAmbientDownClick(TObject *Sender);
	void __fastcall sbSetAmbientUpClick(TObject *Sender);
	void __fastcall sbPowerDownClick(TObject *Sender);
	void __fastcall sbPowerUpClick(TObject *Sender);
	void __fastcall sbLbOffsetDownClick(TObject *Sender);
	void __fastcall sbLbOffsetUpClick(TObject *Sender);
	void __fastcall sbPacketCountDownClick(TObject *Sender);
	void __fastcall sbPacketCountUpClick(TObject *Sender);
	void __fastcall sbPacketIntervalDownClick(TObject *Sender);
	void __fastcall sbPacketIntervalUpClick(TObject *Sender);
	void __fastcall sbBitRateDownClick(TObject *Sender);
	void __fastcall sbDeviationDownClick(TObject *Sender);
	void __fastcall sbDeviationUpClick(TObject *Sender);
	void __fastcall sbBitRateUpClick(TObject *Sender);
	void __fastcall sbRssiDownClick(TObject *Sender);
	void __fastcall sbRssiUpClick(TObject *Sender);
	void __fastcall btnWriteFileClick(TObject *Sender);
	void __fastcall btnReadFileClick(TObject *Sender);
	void __fastcall btnWriteAllClick(TObject *Sender);
	void __fastcall btnSetAllClick(TObject *Sender);
	void __fastcall cbCRCClick(TObject *Sender);
	void __fastcall btnCRCClick(TObject *Sender);
	void __fastcall cmbDcFreeChange(TObject *Sender);
private:	// User declarations

	void fill_comports(void);
	void set_thr_cmd(DWORD cmd);


public:		// User declarations
	__fastcall TForm1(TComponent* Owner);

	int read_comport_settings(void);
	int write_comport_settings(void);
	int read_program_settings(void);
	int write_program_settings(void);
	int write_device_settings(void);
	int read_device_settings(void);
	int write_calibration(void);
	int read_calibration(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------

extern String sta_device[];
extern String sta_port[];

#endif
