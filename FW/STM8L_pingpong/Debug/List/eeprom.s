///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:12
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\eeprom.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB31D.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\eeprom.c" -e -Ohz
//        --debug --code_model medium --data_model medium -o "D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\Obj" --dlib_config
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.3\stm8\LIB\dlstm8mmn.h" -D STM8L15X_LD -lcN "D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List" -lb
//        "D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List" -I
//        "D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\src\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\inc\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\" -I
//        "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\inc\"
//        --require_prototypes --vregs 16)
//    Locale       =  Russian_RUS.1251
//    List file    =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\eeprom.s
//
///////////////////////////////////////////////////////////////////////////////

        PUBLIC Abw
        PUBLIC AfcDcc
        PUBLIC AfcSetting
        PUBLIC BitRate
        PUBLIC Channel
        PUBLIC Dagc
        PUBLIC Deviation
        PUBLIC F_Base
        PUBLIC F_Offset
        PUBLIC F_Step
        PUBLIC LbOffset
        PUBLIC LnaSetting
        PUBLIC ModSetting
        PUBLIC NdAddr
        PUBLIC PkConfig1
        PUBLIC PkConfig2
        PUBLIC PkCount
        PUBLIC PkDelay
        PUBLIC PkLen
        PUBLIC RF69To
        PUBLIC Rbw
        PUBLIC RbwDcc
        PUBLIC RssiTo
        PUBLIC RssiTr
        PUBLIC RxDelay
        PUBLIC RxTo
        PUBLIC SyncWord
        PUBLIC Tcal
        PUBLIC TcalValue
        PUBLIC Tslope
        PUBLIC TxPower


        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(2)
F_Base:
        DC32 868000000

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
F_Step:
        DC32 25000

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
F_Offset:
        DC32 0

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
BitRate:
        DC32 38400

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Deviation:
        DC32 20000

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
PkCount:
        DC32 500

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Channel:
        DC8 4

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
ModSetting:
        DC8 1

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
TxPower:
        DC8 28

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
RbwDcc:
        DC8 224

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Rbw:
        DC8 19

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
AfcDcc:
        DC8 224

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Abw:
        DC8 19

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
AfcSetting:
        DC8 10

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
LbOffset:
        DC8 0

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
RssiTr:
        DC8 220

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Dagc:
        DC8 32

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
LnaSetting:
        DC8 129

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
SyncWord:
        DC8 35, 107, 201, 108, 107, 35, 108, 201

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
PkConfig1:
        DC8 208

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
PkConfig2:
        DC8 166

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
NdAddr:
        DC8 0

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
PkDelay:
        DC8 2

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
PkLen:
        DC8 43

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
RxTo:
        DC8 0

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
RssiTo:
        DC8 0

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
RF69To:
        DC16 10000

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
RxDelay:
        DC8 10

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Tcal:
        DC8 25

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
TcalValue:
        DC8 -115

        SECTION `.eeprom.data`:DATA:REORDER:NOROOT(0)
Tslope:
        DC16 0

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 58 bytes in section .eeprom.data
// 
// 58 bytes of DATA memory
//
//Errors: none
//Warnings: none
