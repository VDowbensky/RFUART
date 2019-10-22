#ifndef _GPSPARSER_H_
#define _GPSPARSER_H_

#include "main.h"

#define GPSBUFFERSIZE 128

#define COMMACOUNT 8

extern void GPSparse(void);

extern uint8_t GPSflag;
extern uint8_t GPSok;
extern char validity;

#endif