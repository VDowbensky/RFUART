///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                23/Jan/2019  18:11:10
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\src\main.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWE227.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\src\main.c" -e -Ohz --debug
//        --code_model medium --data_model medium -o "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\Obj" --dlib_config "C:\Program
//        Files (x86)\IAR Systems\Embedded Workbench 8.0\stm8\LIB\dlstm8mmn.h"
//        -D STM8L15X_LD -lcN "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\List" -lb "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\List" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\src\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\inc\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\STM8L15x_StdPeriph_Driver\src\" -I
//        "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\" -I
//        "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\inc\" -I
//        "D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\inc\"
//        --require_prototypes --vregs 16)
//    Locale       =  Russian_RUS.1251
//    List file    =  
//        D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\Release\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?push_w4
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w4
        EXTERN CLK_DeInit
        EXTERN CLK_LSICmd
        EXTERN CLK_PeripheralClockConfig
        EXTERN CLK_RTCClockConfig
        EXTERN CLK_SYSCLKDivConfig
        EXTERN GPIO_Init
        EXTERN GPSflag
        EXTERN GPSok
        EXTERN GPSparse
        EXTERN Green_Off
        EXTERN Green_On
        EXTERN NodeAddr
        EXTERN RF69_RXbuffer
        EXTERN RF69_TXbuffer
        EXTERN RF69_clearFIFO
        EXTERN RF69_getRSSI
        EXTERN RF69_init
        EXTERN RF69_readreg
        EXTERN RF69_restartRX
        EXTERN RF69_sendpacket
        EXTERN RF69_setNodeAddr
        EXTERN RF69_setopmode
        EXTERN RF69_writereg
        EXTERN RTC_ITConfig
        EXTERN RTC_SetWakeUpCounter
        EXTERN RTC_WakeUpClockConfig
        EXTERN RTC_WakeUpCmd
        EXTERN Red_Off
        EXTERN Red_On
        EXTERN TIM4_ClearFlag
        EXTERN TIM4_Cmd
        EXTERN TIM4_DeInit
        EXTERN TIM4_ITConfig
        EXTERN TIM4_TimeBaseInit
        EXTERN TXbuffer
        EXTERN USART_SendBlock
        EXTERN initIO
        EXTERN initSPI
        EXTERN initUART
        EXTERN validity

        PUBLIC DebugVar0
        PUBLIC DebugVar1
        PUBLIC DebugVar2
        PUBLIC DebugVar3
        PUBLIC DebugVar4
        PUBLIC DebugVar5
        PUBLIC DebugVar6
        PUBLIC DebugVar7
        PUBLIC GPSdef
        PUBLIC GPSstring
        PUBLIC Key
        PUBLIC PacketDelay
        PUBLIC PacketFlag
        PUBLIC PacketNumber
        PUBLIC Periodic_Mode
        PUBLIC RF69_RXflag
        PUBLIC RF69_RXtimeout
        PUBLIC Rssi
        PUBLIC RxLen
        PUBLIC RxState
        PUBLIC TESTstring
        PUBLIC TimingDelay
        PUBLIC TimingDelay_Decrement
        PUBLIC UART_senddata
        PUBLIC UARTtxflag
        PUBLIC c8
        PUBLIC convert
        PUBLIC convert8
        PUBLIC delay_ms
        PUBLIC initCLK
        PUBLIC initRTC
        PUBLIC initTIM4
        PUBLIC main
        PUBLIC packnum
        PUBLIC sendGPSpacket
        PUBLIC sendtestpacket
        PUBLIC switch_to_rx
        PUBLIC switch_to_tx
        PUBLIC work_mode


        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
TimingDelay:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
Key:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
work_mode:
        DS8 1

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
GPSstring:
        DC8 "235959.999,1111.2222,N,11111.2222,E"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
GPSdef:
        DC8 "235959.000,0000.0000,N,00000.0000,E"

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
TESTstring:
        DC8 "010101.000,0000.0000,X,00000.0000,Y"

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
PacketFlag:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
Periodic_Mode:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
PacketDelay:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
PacketNumber:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RF69_RXflag:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RF69_RXtimeout:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RxState:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RxLen:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
c8:
        DS8 3

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
UARTtxflag:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
Rssi:
        DS8 1

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
packnum:
        DC8 48, 48, 48, 48, 48

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar0:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar1:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar2:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar3:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar4:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar5:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar6:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
DebugVar7:
        DS8 1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
initCLK:
        CALLF     CLK_DeInit
        CLR       A
        CALLF     CLK_SYSCLKDivConfig
        MOV       S:?b0, #0x1
        LD        A, #0x2
        CALLF     CLK_PeripheralClockConfig
        MOV       S:?b0, #0x1
        LD        A, #0x4
        CALLF     CLK_PeripheralClockConfig
        MOV       S:?b0, #0x1
        LD        A, #0x5
        CALLF     CLK_PeripheralClockConfig
        LD        A, #0x1
        CALLF     CLK_LSICmd
        CLR       S:?b0
        LD        A, #0x4
        CALLF     CLK_RTCClockConfig
        MOV       S:?b0, #0x1
        LD        A, #0x12
        JPF       CLK_PeripheralClockConfig

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
switch_to_tx:
        CLR       S:?b0
        CALLF     ?Subroutine2
??CrossCallReturnLabel_14:
        CLR       S:?b0
        LD        A, #0x2
        CALLF     ??Subroutine8_0
??CrossCallReturnLabel_12:
        LD        A, #0x4
        CALLF     RF69_setopmode
        INC       L:NodeAddr
        LD        A, L:NodeAddr
        INC       A
        JRNE      L:??switch_to_tx_0
        CLR       L:NodeAddr
??switch_to_tx_0:
        LD        A, L:NodeAddr
        CALLF     RF69_setNodeAddr
        CLR       S:?b0
        LD        A, #0x25
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine2:
        LD        A, #0x1
        REQUIRE ??Subroutine8_0
        ;               // Fall through to label ??Subroutine8_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine8_0:
        LDW       X, #0x500a
        JPF       GPIO_Init

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
switch_to_rx:
        MOV       S:?b0, #0x20
        CALLF     ?Subroutine2
??CrossCallReturnLabel_13:
        CALLF     RF69_restartRX
        MOV       L:work_mode, #0x1
        CLR       L:RF69_RXflag
        JPF       Red_Off

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
sendtestpacket:
        CALLF     Red_On
        CALLF     ?Subroutine1
??CrossCallReturnLabel_2:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_6:
        JRC       L:??CrossCallReturnLabel_2
        MOV       L:RF69_TXbuffer + 7, #0x2c
        MOV       L:RF69_TXbuffer + 8, #0x54
        MOV       L:RF69_TXbuffer + 9, #0x2c
        CLR       S:?b0
??sendtestpacket_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, (L:TESTstring,X)
        CALLF     ?Subroutine6
??CrossCallReturnLabel_8:
        JRC       L:??sendtestpacket_0
        CALLF     ?Subroutine3
??CrossCallReturnLabel_5:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        JPF       Red_Off

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine6:
        ADDW      X, #RF69_TXbuffer + 10
        LD        (X), A
        INC       S:?b0
        LD        A, S:?b0
        CP        A, #0x29
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, (L:packnum,X)
        ADDW      X, #RF69_TXbuffer + 2
        LD        (X), A
        INC       S:?b0
        LD        A, S:?b0
        CP        A, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        CLRW      X
        INCW      X
        CALLF     delay_ms
        MOV       S:?b0, L:NodeAddr
        LD        A, #0x2b
        JPF       RF69_sendpacket

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        MOV       L:work_mode, #0x2
        LD        A, #0xc
        CALLF     RF69_setopmode
        LDW       X, L:PacketNumber
        CALLF     convert
        CLR       S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        A, #0x4
        CALLF     RF69_setopmode
        LDW       X, L:PacketNumber
        INCW      X
        LDW       L:PacketNumber, X
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
sendGPSpacket:
        CALLF     Red_On
        CALLF     switch_to_tx
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_7:
        JRC       L:??CrossCallReturnLabel_3
        MOV       L:RF69_TXbuffer + 7, #0x2c
        MOV       L:RF69_TXbuffer + 8, L:validity
        MOV       L:RF69_TXbuffer + 9, #0x2c
        CLR       S:?b0
??sendGPSpacket_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, (L:GPSstring,X)
        CALLF     ?Subroutine6
??CrossCallReturnLabel_9:
        JRC       L:??sendGPSpacket_0
        CALLF     ?Subroutine3
??CrossCallReturnLabel_4:
        CLRW      X
        INCW      X
        CALLF     delay_ms
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        JPF       Red_Off

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
initTIM4:
        CALLF     TIM4_DeInit
        MOV       S:?b0, #0xfa
        LD        A, #0x6
        CALLF     TIM4_TimeBaseInit
        LD        A, #0x1
        CALLF     TIM4_ClearFlag
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALLF     TIM4_ITConfig
        LD        A, #0x1
        JPF       TIM4_Cmd

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
delay_ms:
        LDW       L:TimingDelay, X
??delay_ms_0:
        LDW       X, L:TimingDelay
        JRNE      L:??delay_ms_0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TimingDelay_Decrement:
        LDW       X, L:TimingDelay
        DECW      X
        LDW       L:TimingDelay, X
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
initRTC:
        CLR       A
        CALLF     RTC_WakeUpClockConfig
        LD        A, #0x1
        LDW       X, #0x40
        CALLF     RTC_ITConfig
        LDW       X, #0x947
        CALLF     RTC_SetWakeUpCounter
        LD        A, #0x1
        JPF       RTC_WakeUpCmd

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
convert:
        LDW       S:?w0, X
        LDW       Y, #0x2710
        DIVW      X, Y
        LD        A, XL
        ADD       A, #0x30
        LD        L:packnum, A
        LDW       Y, #0x2710
        LDW       X, S:?w0
        DIVW      X, Y
        LDW       S:?w0, Y
        LDW       Y, #0x3e8
        LDW       X, S:?w0
        DIVW      X, Y
        LD        A, XL
        ADD       A, #0x30
        LD        L:packnum + 1, A
        LDW       Y, #0x3e8
        LDW       X, S:?w0
        DIVW      X, Y
        LDW       S:?w0, Y
        LDW       Y, #0x64
        LDW       X, S:?w0
        DIVW      X, Y
        LD        A, XL
        ADD       A, #0x30
        LD        L:packnum + 2, A
        LDW       Y, #0x64
        LDW       X, S:?w0
        DIVW      X, Y
        LDW       S:?w0, Y
        LDW       Y, #0xa
        LDW       X, S:?w0
        DIVW      X, Y
        LD        A, XL
        ADD       A, #0x30
        LD        L:packnum + 3, A
        LDW       Y, #0xa
        LDW       X, S:?w0
        DIVW      X, Y
        EXG       A, YL
        ADD       A, #0x30
        LD        L:packnum + 4, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
convert8:
        LD        S:?b0, A
        CALLF     ?Subroutine5
??CrossCallReturnLabel_17:
        LD        A, XL
        ADD       A, #0x30
        LD        L:c8, A
        CALLF     ?Subroutine5
??CrossCallReturnLabel_18:
        LD        S:?b0, A
        LD        A, #0xa
        CALLF     ??Subroutine9_0
??CrossCallReturnLabel_15:
        LD        A, XL
        ADD       A, #0x30
        LD        L:c8 + 1, A
        LD        A, #0xa
        CALLF     ??Subroutine9_0
??CrossCallReturnLabel_16:
        ADD       A, #0x30
        LD        L:c8 + 2, A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine5:
        LD        A, #0x64
        REQUIRE ??Subroutine9_0
        ;               // Fall through to label ??Subroutine9_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine9_0:
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
UART_senddata:
        CLR       L:UARTtxflag
        CALLF     Green_On
        LD        A, L:RF69_RXbuffer
        CALLF     convert8
        MOV       L:TXbuffer, L:c8
        MOV       L:TXbuffer + 1, L:c8 + 1
        MOV       L:TXbuffer + 2, L:c8 + 2
        MOV       L:TXbuffer + 3, #0x2c
        LD        A, L:RF69_RXbuffer + 1
        CALLF     convert8
        MOV       L:TXbuffer + 4, L:c8
        MOV       L:TXbuffer + 5, L:c8 + 1
        MOV       L:TXbuffer + 6, L:c8 + 2
        MOV       L:TXbuffer + 7, #0x2c
        LD        A, L:Rssi
        CALLF     convert8
        MOV       L:TXbuffer + 8, #0x2d
        MOV       L:TXbuffer + 9, L:c8
        MOV       L:TXbuffer + 10, L:c8 + 1
        MOV       L:TXbuffer + 11, L:c8 + 2
        MOV       L:TXbuffer + 12, #0x2c
        CLR       S:?b1
        JRA       L:??UART_senddata_0
??UART_senddata_1:
        ADDW      X, #RF69_RXbuffer + 2
        LD        A, (X)
        LD        (Y), A
        INC       S:?b1
??UART_senddata_0:
        CLR       S:?b2
        MOV       S:?b3, S:?b1
        LDW       Y, S:?w1
        ADDW      Y, #TXbuffer + 13
        LD        A, L:RxLen
        CLR       S:?b4
        LD        S:?b5, A
        LDW       X, S:?w2
        DECW      X
        LDW       S:?w2, X
        LDW       X, S:?w1
        CPW       X, S:?w2
        JRSLT     L:??UART_senddata_1
        LD        A, #0xd
        LD        (Y), A
        INC       S:?b1
        LD        A, S:?b1
        LD        XL, A
        LD        A, #0xa
        LD        (L:TXbuffer + 13,X), A
        LD        A, L:RxLen
        ADD       A, #0xd
        CALLF     USART_SendBlock
        JPF       Green_Off

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
main:
        CALLF     L:?push_w4
        PUSH      S:?b10
        CALLF     initCLK
        CALLF     initIO
        CALLF     initSPI
        LDW       X, #0xc200
        LDW       S:?w1, X
        CLRW      X
        INCW      X
        LDW       S:?w0, X
        CALLF     initUART
        CALLF     initTIM4
        CALLF     initRTC
        RIM
        CALLF     Green_On
        CALLF     Red_On
        LDW       X, #0xc8
        CALLF     delay_ms
        CALLF     RF69_init
        LDW       X, #0xc8
        CALLF     delay_ms
        CALLF     Red_Off
        MOV       L:PacketDelay, #0x1
        MOV       L:work_mode, #0x1
        CALLF     Green_Off
        CALLF     switch_to_rx
        JRA       L:??main_0
??main_1:
        CLR       A
        CALLF     RF69_readreg
        LDW       X, S:?w4
        LD        (L:RF69_RXbuffer,X), A
        INC       S:?b10
??main_2:
        CLR       S:?b8
        MOV       S:?b9, S:?b10
        LD        A, L:RxLen
        CLR       S:?b0
        LD        S:?b1, A
        LDW       X, S:?w0
        INCW      X
        LDW       S:?w0, X
        LDW       X, S:?w4
        CPW       X, S:?w0
        JRSLT     L:??main_1
        CALLF     RF69_clearFIFO
        CLR       L:RF69_RXflag
        CALLF     RF69_restartRX
        MOV       L:UARTtxflag, #0x1
??main_3:
        LD        A, L:work_mode
        DEC       A
        JRNE      L:??main_4
        LDW       X, L:RF69_RXtimeout
        CPW       X, #0x64
        JRC       L:??main_4
        CALLF     ?Subroutine7
??CrossCallReturnLabel_10:
        LDW       X, L:RF69_RXtimeout
        LD        A, XL
        LD        L:DebugVar4, A
        CALLF     RF69_restartRX
??main_4:
        LD        A, L:GPSflag
        JREQ      L:??main_5
        CLR       L:GPSflag
        CALLF     GPSparse
??main_5:
        LD        A, L:UARTtxflag
        JREQ      L:??main_0
        CALLF     UART_senddata
??main_0:
        LD        A, L:Key
        DEC       A
        JREQ      L:??main_6
        DEC       A
        JREQ      L:??main_7
        DEC       A
        JREQ      L:??main_8
        JRA       L:??main_9
??main_6:
        LD        A, L:Key
        JRNE      L:??main_6
        LD        A, L:Periodic_Mode
        JRNE      L:??main_9
        CALLF     switch_to_tx
        MOV       L:Periodic_Mode, #0x1
        CLRW      X
        LDW       L:PacketNumber, X
        JRA       L:??main_9
??main_7:
        LD        A, L:Key
        JRNE      L:??main_7
        CALLF     switch_to_rx
        CLR       L:Periodic_Mode
        JRA       L:??main_9
??main_8:
        LD        A, L:Key
        JRNE      L:??main_8
??main_9:
        LD        A, L:PacketFlag
        JREQ      L:??main_10
        CLR       L:PacketFlag
        LD        A, L:Periodic_Mode
        JREQ      L:??main_10
        LD        A, L:GPSok
        JREQ      L:??main_11
        CALLF     sendGPSpacket
        CLR       L:GPSok
        JRA       L:??main_10
??main_11:
        CALLF     sendtestpacket
??main_10:
        LD        A, L:RF69_RXflag
        JRNE      ??lb_0
        JP        L:??main_3
??lb_0:
        CALLF     ?Subroutine7
??CrossCallReturnLabel_11:
        CALLF     RF69_getRSSI
        LD        L:Rssi, A
        CLR       A
        CALLF     RF69_readreg
        LD        L:RxLen, A
        MOV       L:RF69_RXbuffer, L:RxLen
        MOV       S:?b10, #0x1
        JP        L:??main_2

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine7:
        LD        A, #0x27
        CALLF     RF69_readreg
        LD        L:DebugVar0, A
        LD        A, #0x28
        CALLF     RF69_readreg
        LD        L:DebugVar1, A
        LD        A, #0x2a
        CALLF     RF69_readreg
        LD        L:DebugVar2, A
        LD        A, #0x2b
        CALLF     RF69_readreg
        LD        L:DebugVar3, A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 1 086 bytes in section .far_func.text
//    27 bytes in section .near.bss
//    77 bytes in section .near.data
//    36 bytes in section .near.rodata
// 
// 1 086 bytes of CODE  memory
//    36 bytes of CONST memory
//   104 bytes of DATA  memory
//
//Errors: none
//Warnings: none
