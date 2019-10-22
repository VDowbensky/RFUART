///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:17
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\testmode.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC783.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\testmode.c" -e -Ohz
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\testmode.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN COMMANDLIST
        EXTERN CommandFlag
        EXTERN RF69_RXtimeout
        EXTERN RF69_calctemp
        EXTERN RF69_setopmode
        EXTERN RXbuffer
        EXTERN Red_On
        EXTERN RxPointer
        EXTERN TXbuffer
        EXTERN USART_GetFlagStatus
        EXTERN USART_ReceiveData8
        EXTERN handlecommand

        PUBLIC CRC
        PUBLIC Command
        PUBLIC FreqTest
        PUBLIC TestMode
        PUBLIC cbUSART1_RXtestirq
        PUBLIC checkpacket
        PUBLIC clearRxBuff
        PUBLIC compTxCRC
        PUBLIC comp_crc
        PUBLIC nocommand
        PUBLIC rec_command
        PUBLIC rec_headH
        PUBLIC rec_headL
        PUBLIC rec_param
        PUBLIC test_loop


        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
TestMode:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
FreqTest:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
Command:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
temp:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
plen:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
rxstatus:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
rxcount:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
CRC:
        DS8 1

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
clearRxBuff:
        CLR       L:RxPointer
        CLR       L:RXbuffer
        CLR       L:CommandFlag
        CLR       L:rxstatus
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
comp_crc:
        LD        S:?b2, A
        MOV       S:?b0, #0x8
??comp_crc_0:
        LD        A, L:CRC
        SRL       A
        LD        S:?b1, A
        LD        A, L:CRC
        AND       A, #0x1
        PUSH      A
        LD        A, S:?b2
        AND       A, #0x1
        LD        S:?b4, A
        POP       A
        XOR       A, S:?b4
        JREQ      L:??comp_crc_1
        LD        A, S:?b1
        XOR       A, #0x8c
        JRA       ??comp_crc_2
??comp_crc_1:
        LD        A, S:?b1
??comp_crc_2:
        LD        L:CRC, A
        LD        A, S:?b2
        SRL       A
        LD        S:?b2, A
        DEC       S:?b0
        JRNE      L:??comp_crc_0
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
checkpacket:
        LD        S:?b6, A
        CLR       L:CRC
        CLR       S:?b5
        JRA       L:??checkpacket_0
??checkpacket_1:
        LD        XL, A
        LD        A, (L:RXbuffer,X)
        CALLF     comp_crc
        INC       S:?b5
??checkpacket_0:
        LD        A, S:?b5
        CP        A, S:?b6
        CLRW      X
        JRC       L:??checkpacket_1
        LD        A, S:?b6
        LD        XL, A
        LD        A, L:CRC
        CP        A, (L:RXbuffer,X)
        JRNE      L:??checkpacket_2
        MOV       L:CommandFlag, #0x1
        MOV       L:Command, L:RXbuffer + 2
        RETF
??checkpacket_2:
        JPF       clearRxBuff

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
test_loop:
        MOV       L:TestMode, #0x1
        LD        A, #0x4
        CALLF     RF69_setopmode
        CALLF     Red_On
??test_loop_0:
        LD        A, L:rxstatus
        CP        A, #0x4
        JRNE      L:??test_loop_1
        LD        A, L:plen
        DEC       A
        CALLF     checkpacket
??test_loop_1:
        LD        A, L:CommandFlag
        JREQ      L:??test_loop_2
        LD        A, L:Command
        CALLF     handlecommand
        CALLF     clearRxBuff
??test_loop_2:
        LDW       X, L:RF69_RXtimeout
        CPW       X, #0x3e8
        JRC       L:??test_loop_0
        LD        A, #0x4
        CALLF     RF69_setopmode
        CALLF     RF69_calctemp
        LD        A, L:FreqTest
        DEC       A
        JRNE      L:??test_loop_3
        LD        A, #0xc
        CALLF     RF69_setopmode
??test_loop_3:
        CLRW      X
        LDW       L:RF69_RXtimeout, X
        JRA       L:??test_loop_0

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
nocommand:
        CLR       L:CommandFlag
        CLR       L:rxcount
        JPF       clearRxBuff

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
rec_param:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_2:
        DEC       L:rxcount
        JRNE      L:??rec_param_0
        MOV       L:rxstatus, #0x4
??rec_param_0:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
rec_command:
        CLR       S:?b0
        JRA       L:??rec_command_0
??rec_command_1:
        INC       S:?b0
        INC       S:?b0
??rec_command_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        ADDW      X, #COMMANDLIST
        LD        A, (X)
        LD        S:?b1, A
        JREQ      L:??rec_command_2
        LD        A, L:temp
        CP        A, S:?b1
        JRNE      L:??rec_command_1
        INCW      X
        LD        A, (X)
        LD        L:plen, A
        DEC       A
        DEC       A
        DEC       A
        LD        L:rxcount, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        MOV       L:rxstatus, #0x3
        RETF
??rec_command_2:
        LD        A, L:rxstatus
        CP        A, #0x3
        JREQ      L:??rec_command_3
        CLR       L:rxcount
        CALLF     clearRxBuff
??rec_command_3:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine1:
        LD        A, L:RxPointer
        CLRW      X
        LD        XL, A
        LD        A, L:temp
        CALLF     ?Subroutine2
??CrossCallReturnLabel_4:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine2:
        LD        (L:RXbuffer,X), A
        LD        A, L:RxPointer
        INC       A
        LD        L:RxPointer, A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
rec_headL:
        LD        A, L:temp
        CP        A, #0x6b
        JRNE      L:??rec_headL_0
        LD        A, L:RxPointer
        CLRW      X
        LD        XL, A
        LD        A, #0x6b
        CALLF     ?Subroutine2
??CrossCallReturnLabel_5:
        MOV       L:rxstatus, #0x2
        RETF
??rec_headL_0:
        CP        A, #0x23
        JRNE      L:??rec_headL_1
        CLR       L:RxPointer
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        RETF
??rec_headL_1:
        JPF       nocommand

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
rec_headH:
        LD        A, L:temp
        CP        A, #0x23
        JRNE      L:??rec_headH_0
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        RETF
??rec_headH_0:
        JPF       nocommand

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine0:
        LD        A, L:RxPointer
        CLRW      X
        LD        XL, A
        LD        A, #0x23
        CALLF     ?Subroutine2
??CrossCallReturnLabel_6:
        MOV       L:rxstatus, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
cbUSART1_RXtestirq:
        LDW       Y, #0x20
        LDW       X, #0x5230
        CALLF     USART_GetFlagStatus
        DEC       A
        JRNE      L:??cbUSART1_RXtestirq_0
        LDW       X, #0x5230
        CALLF     USART_ReceiveData8
        LD        L:temp, A
        LD        A, L:rxstatus
        JREQ      L:??cbUSART1_RXtestirq_1
        DEC       A
        JREQ      L:??cbUSART1_RXtestirq_2
        DEC       A
        JREQ      L:??cbUSART1_RXtestirq_3
        DEC       A
        JREQ      L:??cbUSART1_RXtestirq_4
        DEC       A
        JREQ      L:??cbUSART1_RXtestirq_0
        JRA       L:??cbUSART1_RXtestirq_5
??cbUSART1_RXtestirq_1:
        JPF       rec_headH
??cbUSART1_RXtestirq_2:
        JPF       rec_headL
??cbUSART1_RXtestirq_3:
        JPF       rec_command
??cbUSART1_RXtestirq_4:
        JPF       rec_param
??cbUSART1_RXtestirq_5:
        CALLF     nocommand
??cbUSART1_RXtestirq_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
compTxCRC:
        LD        S:?b6, A
        CLR       L:CRC
        CLR       S:?b5
        JRA       L:??compTxCRC_0
??compTxCRC_1:
        CLRW      X
        LD        XL, A
        LD        A, (L:TXbuffer,X)
        CALLF     comp_crc
        INC       S:?b5
??compTxCRC_0:
        LD        A, S:?b5
        CP        A, S:?b6
        JRC       L:??compTxCRC_1
        LD        A, L:CRC
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 481 bytes in section .far_func.text
//   8 bytes in section .near.bss
// 
// 481 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none
