///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:17
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\uart_commands.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC7E2.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\uart_commands.c" -e
//        -Ohz --debug --code_model medium --data_model medium -o
//        "D:\Projects\Lab
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\uart_commands.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?load32_l0_0x
        EXTERN Abw
        EXTERN AfcDcc
        EXTERN AfcSetting
        EXTERN BitRate
        EXTERN Channel
        EXTERN Command
        EXTERN Dagc
        EXTERN Deviation
        EXTERN FLASH_Lock
        EXTERN FLASH_Unlock
        EXTERN F_Base
        EXTERN F_Offset
        EXTERN F_Step
        EXTERN FreqTest
        EXTERN LbOffset
        EXTERN LnaSetting
        EXTERN ModSetting
        EXTERN NdAddr
        EXTERN PkConfig1
        EXTERN PkConfig2
        EXTERN PkCount
        EXTERN PkDelay
        EXTERN RF69To
        EXTERN RF69_getversion
        EXTERN RF69_init
        EXTERN RF69_setchannel
        EXTERN RF69_setmodulation
        EXTERN RF69_setopmode
        EXTERN RF69_setpower
        EXTERN RF69_tempmeas
        EXTERN RXbuffer
        EXTERN Rbw
        EXTERN RbwDcc
        EXTERN RssiTo
        EXTERN RssiTr
        EXTERN RxDelay
        EXTERN RxTo
        EXTERN SyncWord
        EXTERN TXbuffer
        EXTERN Tcal
        EXTERN TcalValue
        EXTERN Temperature
        EXTERN Tslope
        EXTERN TxPower
        EXTERN USART_SendBlock
        EXTERN __eeprom_write_16
        EXTERN __eeprom_write_32
        EXTERN __eeprom_write_8
        EXTERN compTxCRC

        PUBLIC COMMANDLIST
        PUBLIC CommandFlag
        PUBLIC handlecommand
        PUBLIC sendERR
        PUBLIC sendOK
        PUBLIC sendtuningresponse


        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
CommandFlag:
        DS8 1

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
COMMANDLIST:
        DC8 176, 4, 177, 5, 178, 12, 179, 10, 180, 12, 181, 5, 182, 8, 183, 10
        DC8 184, 13, 185, 6, 186, 9, 187, 5, 188, 4, 191, 8

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
sendtuningresponse:
        PUSH      S:?b8
        LD        S:?b8, A
        MOV       L:TXbuffer, #0xc9
        MOV       L:TXbuffer + 1, #0x6c
        MOV       L:TXbuffer + 2, L:Command
        CALLF     compTxCRC
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, S:?b0
        LD        (L:TXbuffer,X), A
        LD        A, S:?b8
        CALLF     USART_SendBlock
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
sendOK:
        CLR       L:TXbuffer + 3
        LD        A, #0x4
        JPF       sendtuningresponse

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
handlecommand:
        SUB       A, #0xb0
        JREQ      L:??handlecommand_0
        DEC       A
        JRNE      ??lb_0
        JP        L:??handlecommand_1
??lb_0:
        DEC       A
        JRNE      ??lb_1
        JP        L:??handlecommand_2
??lb_1:
        DEC       A
        JRNE      ??lb_2
        JP        L:??handlecommand_3
??lb_2:
        SUB       A, #0x2
        JRNE      ??lb_3
        JP        L:??handlecommand_4
??lb_3:
        DEC       A
        JRNE      ??lb_4
        JP        L:??handlecommand_5
??lb_4:
        DEC       A
        JRNE      ??lb_5
        JP        L:??handlecommand_6
??lb_5:
        DEC       A
        JRNE      ??lb_6
        JP        L:??handlecommand_7
??lb_6:
        DEC       A
        JRNE      ??lb_7
        JP        L:??handlecommand_8
??lb_7:
        DEC       A
        JRNE      ??lb_8
        JP        L:??handlecommand_9
??lb_8:
        DEC       A
        JRNE      ??lb_9
        JP        L:??handlecommand_10
??lb_9:
        DEC       A
        JRNE      ??lb_10
        JP        L:??handlecommand_11
??lb_10:
        SUB       A, #0x3
        JRNE      ??lb_11
        JP        L:??handlecommand_12
??lb_11:
        RETF
??handlecommand_0:
        CALLF     RF69_getversion
        LD        L:TXbuffer + 3, A
        LDW       X, #F_Base
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        LD        L:TXbuffer + 4, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_6:
        LD        L:TXbuffer + 5, A
        CALLF     ?Subroutine2
??CrossCallReturnLabel_12:
        LD        L:TXbuffer + 6, A
        CALLF     ?Subroutine3
??CrossCallReturnLabel_18:
        LD        L:TXbuffer + 7, A
        LDW       X, #F_Step
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        LD        L:TXbuffer + 8, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_7:
        LD        L:TXbuffer + 9, A
        CALLF     ?Subroutine2
??CrossCallReturnLabel_13:
        LD        L:TXbuffer + 10, A
        CALLF     ?Subroutine3
??CrossCallReturnLabel_19:
        LD        L:TXbuffer + 11, A
        LDW       X, #F_Offset
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        LD        L:TXbuffer + 12, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_8:
        LD        L:TXbuffer + 13, A
        CALLF     ?Subroutine2
??CrossCallReturnLabel_14:
        LD        L:TXbuffer + 14, A
        CALLF     ?Subroutine3
??CrossCallReturnLabel_20:
        LD        L:TXbuffer + 15, A
        LDW       X, #BitRate
        CALLF     ?Subroutine0
??CrossCallReturnLabel_3:
        LD        L:TXbuffer + 16, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_9:
        LD        L:TXbuffer + 17, A
        CALLF     ?Subroutine2
??CrossCallReturnLabel_15:
        LD        L:TXbuffer + 18, A
        CALLF     ?Subroutine3
??CrossCallReturnLabel_21:
        LD        L:TXbuffer + 19, A
        LDW       X, #Deviation
        CALLF     ?Subroutine0
??CrossCallReturnLabel_4:
        LD        L:TXbuffer + 20, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_10:
        LD        L:TXbuffer + 21, A
        CALLF     ?Subroutine2
??CrossCallReturnLabel_16:
        LD        L:TXbuffer + 22, A
        CALLF     ?Subroutine3
??CrossCallReturnLabel_22:
        LD        L:TXbuffer + 23, A
        MOV       L:TXbuffer + 24, L:ModSetting
        MOV       L:TXbuffer + 25, L:TxPower
        MOV       L:TXbuffer + 26, L:Channel
        MOV       L:TXbuffer + 27, L:RbwDcc
        MOV       L:TXbuffer + 28, L:Rbw
        MOV       L:TXbuffer + 29, L:AfcDcc
        MOV       L:TXbuffer + 30, L:Abw
        MOV       L:TXbuffer + 31, L:AfcSetting
        MOV       L:TXbuffer + 32, L:LbOffset
        MOV       L:TXbuffer + 33, L:RssiTr
        MOV       L:TXbuffer + 34, L:Dagc
        MOV       L:TXbuffer + 35, L:LnaSetting
        CLR       S:?b0
??handlecommand_13:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, (L:SyncWord,X)
        ADDW      X, #TXbuffer + 36
        LD        (X), A
        INC       S:?b0
        LD        A, S:?b0
        CP        A, #0x8
        JRC       L:??handlecommand_13
        MOV       L:TXbuffer + 44, L:PkConfig1
        MOV       L:TXbuffer + 45, L:PkConfig2
        MOV       L:TXbuffer + 46, L:NdAddr
        MOV       L:TXbuffer + 47, L:RxTo
        MOV       L:TXbuffer + 48, L:RssiTo
        LDW       X, L:RF69To
        LD        A, XH
        LD        L:TXbuffer + 49, A
        LDW       X, L:RF69To
        LD        A, XL
        LD        L:TXbuffer + 50, A
        MOV       L:TXbuffer + 51, L:RxDelay
        MOV       L:TXbuffer + 52, L:Tcal
        MOV       L:TXbuffer + 53, L:TcalValue
        LDW       X, L:Tslope
        LD        A, XH
        LD        L:TXbuffer + 54, A
        LDW       X, L:Tslope
        LD        A, XL
        LD        L:TXbuffer + 55, A
        LDW       X, #PkCount
        CALLF     ?Subroutine0
??CrossCallReturnLabel_5:
        LD        L:TXbuffer + 56, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_11:
        LD        L:TXbuffer + 57, A
        CALLF     ?Subroutine2
??CrossCallReturnLabel_17:
        LD        L:TXbuffer + 58, A
        CALLF     ?Subroutine3
??CrossCallReturnLabel_23:
        LD        L:TXbuffer + 59, A
        MOV       L:TXbuffer + 60, L:PkDelay
        LD        A, #0x3d
        JPF       sendtuningresponse
??handlecommand_1:
        BTJF      L:RXbuffer + 3, #0x0, L:??handlecommand_14
        MOV       L:FreqTest, #0x1
        LD        A, #0x4
        CALLF     RF69_setopmode
        LD        A, #0xc8
        CALLF     RF69_setmodulation
??handlecommand_15:
        LD        A, #0xc
        CALLF     RF69_setopmode
??handlecommand_12:
        JPF       sendOK
??handlecommand_14:
        CALLF     RF69_init
        CLR       L:FreqTest
        JPF       sendOK
??handlecommand_2:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_28:
        LDW       X, #F_Base
        CALLF     L:__eeprom_write_32
        LDW       X, #RXbuffer + 7
        CALLF     L:?load32_l0_0x
        LDW       X, #F_Step
        CALLF     L:__eeprom_write_32
??handlecommand_16:
        LD        A, #0xf7
        CALLF     FLASH_Lock
        LD        A, L:Channel
        CALLF     RF69_setchannel
        JPF       sendOK
??handlecommand_3:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_27:
        LDW       X, #F_Offset
        CALLF     L:__eeprom_write_32
        LDW       Y, L:RXbuffer + 7
        LDW       X, #Tslope
        CALLF     L:__eeprom_write_16
        JRA       ??handlecommand_16
??handlecommand_4:
        CALLF     ?Subroutine5
??CrossCallReturnLabel_29:
        LDW       X, #Channel
        CALLF     L:__eeprom_write_8
        JRA       ??handlecommand_16
??handlecommand_5:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_26:
        LDW       X, #BitRate
        CALLF     L:__eeprom_write_32
??handlecommand_17:
        LD        A, #0xf7
        CALLF     FLASH_Lock
        JPF       sendOK
??handlecommand_6:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_25:
        LDW       X, #Deviation
        CALLF     L:__eeprom_write_32
        LD        A, L:RXbuffer + 7
        LDW       X, #ModSetting
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 8
        LDW       X, #TxPower
        CALLF     ?Subroutine6
??CrossCallReturnLabel_35:
        LD        A, L:TxPower
        CALLF     RF69_setpower
        JPF       sendOK
??handlecommand_7:
        CALLF     ?Subroutine5
??CrossCallReturnLabel_30:
        LDW       X, #RbwDcc
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 4
        LDW       X, #Rbw
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 5
        LDW       X, #AfcDcc
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 6
        LDW       X, #Abw
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 7
        LDW       X, #AfcSetting
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 8
        LDW       X, #LbOffset
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 9
        LDW       X, #RssiTr
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 10
        LDW       X, #Dagc
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 11
        LDW       X, #LnaSetting
??handlecommand_18:
        CALLF     L:__eeprom_write_8
        JPF       ??handlecommand_17
??handlecommand_8:
        CALLF     ?Subroutine5
??CrossCallReturnLabel_31:
        LDW       X, #PkConfig1
        CALLF     L:__eeprom_write_8
        LD        A, L:RXbuffer + 4
        LDW       X, #PkConfig2
        JRA       ??handlecommand_18
??handlecommand_9:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_24:
        LDW       X, #PkCount
        CALLF     L:__eeprom_write_32
        LD        A, L:RXbuffer + 7
        LDW       X, #PkDelay
        CALLF     ?Subroutine6
??CrossCallReturnLabel_34:
        CALLF     RF69_init
        JPF       sendOK
??handlecommand_10:
        LD        A, #0x4
        CALLF     RF69_setopmode
        CALLF     ?Subroutine5
??CrossCallReturnLabel_32:
        LDW       X, #Tcal
        CALLF     L:__eeprom_write_8
        CALLF     RF69_tempmeas
        LDW       X, #TcalValue
        CALLF     ?Subroutine6
??CrossCallReturnLabel_33:
        LD        A, L:FreqTest
        DEC       A
        JREQ      ??lb_12
        JP        L:??handlecommand_12
??lb_12:
        JPF       ??handlecommand_15
??handlecommand_11:
        MOV       L:TXbuffer + 3, L:Temperature
        LD        A, #0x4
        JPF       sendtuningresponse

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine6:
        CALLF     L:__eeprom_write_8
        LD        A, #0xf7
        JPF       FLASH_Lock

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine5:
        LD        A, #0xf7
        CALLF     FLASH_Unlock
        LD        A, L:RXbuffer + 3
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine4:
        LD        A, #0xf7
        CALLF     FLASH_Unlock
        LDW       X, #RXbuffer + 3
        JPF       L:?load32_l0_0x

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine3:
        CALLF     L:?load32_l0_0x
        LD        A, S:?b3
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine2:
        CALLF     L:?load32_l0_0x
        LD        A, S:?b2
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine1:
        CALLF     L:?load32_l0_0x
        LD        A, S:?b1
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine0:
        CALLF     L:?load32_l0_0x
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
sendERR:
        MOV       L:TXbuffer + 3, #0x1
        LD        A, #0x4
        JPF       sendtuningresponse

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 936 bytes in section .far_func.text
//   1 byte  in section .near.bss
//  28 bytes in section .near.rodata
// 
// 936 bytes of CODE  memory
//  28 bytes of CONST memory
//   1 byte  of DATA  memory
//
//Errors: none
//Warnings: none
