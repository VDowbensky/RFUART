#include "gpsparser.h"

void GPSparse(void);
void resetGPSparser(void);
uint8_t checkheader(void);

uint8_t GPSflag;
char GPSbuffer[GPSBUFFERSIZE];
const char GPShead1[8] = "$GPRMC,";
const char GPShead2[8] = "$GNRMC,";
char validity;

//const char GPSheader[] = "$GPRMC";

uint8_t GPSstatus = 0;
uint8_t CommaPos[20];
uint8_t commacount;
uint8_t GPSok;

uint8_t readpointer = 0;

void GPSparse(void)
{
  uint8_t i;
  uint8_t j;
  uint8_t len;
  //copy RX buffer
  disableInterrupts();
  for(i = 0; i < RxPointer; i++) GPSbuffer[i] = RXbuffer[i];
  len = RxPointer;
  clearRXbuffer();
  enableInterrupts();
  //check GPS string
 //GPSok = 0;
  if(checkheader())
  {
    //find and count commas in string
  i = 0;
  commacount = 0;
  j = 0;
 for (i = 0; i < len; i++)
 {
   if (GPSbuffer[i] == ',')
   {
      commacount++;
      CommaPos[j] = i;
      j++;
   }
  
   
 }
 
 //find strings 
 //char GPSstring[] = "235959.000,0000.0000,N,00000.0000,E"; 
 //time
 for(i = 0; i < 10; i++) GPSstring [i] = GPSbuffer[i+CommaPos[0]+1];
 GPSstring [10] = ',';
 validity = GPSbuffer[CommaPos[1]+1];
 //latitude
 if ((CommaPos[3] - CommaPos[2]) > 1)
  {
    for(i = 0; i < (CommaPos[3] - CommaPos[2]); i++) GPSstring [i + 11] = GPSbuffer[i+CommaPos[2]+1];
    GPSstring[21] = GPSbuffer[CommaPos[3]+1];
  }
 GPSstring[20] = ','; //comma
 
 //longitude
 if ((CommaPos[5] - CommaPos[4]) > 1) 
  {
    for(i = 0; i < (CommaPos[5] - CommaPos[4]); i++) GPSstring [i + 23] = GPSbuffer[i+CommaPos[4]+1];
    GPSstring[34] = GPSbuffer[CommaPos[5] +1];
  }
  GPSstring[33] = ','; //comma
  GPSok = 1;
  }
  //check incoming command here - search command in GPSbuffer
  
  resetGPSparser();
  
}

uint8_t checkheader(void)
{
  uint8_t i;
  for(i = 0; i < 7; i++)
  {
    if ((GPSbuffer[i] != GPShead1[i]) && (GPSbuffer[i] != GPShead2[i])) return 0;
  }
  return 1;
}

void resetGPSparser(void)
{
  
  GPSstatus = 0;
  commacount = 0;
  readpointer = 0;
  clearRXbuffer();
  
}
