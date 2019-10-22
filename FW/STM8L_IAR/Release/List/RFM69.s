///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                23/Jan/2019  18:06:13
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\src\RFM69.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW595E.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\src\RFM69.c" -e -Ohz --debug
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
//        D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\Release\List\RFM69.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?add32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_w4
        EXTERN ?load32_l0_0x
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?sll32_l0_l0_a
        EXTERN ?srl8_a_a_6
        EXTERN ?udiv32_l0_dl_l1
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN RF69_HWreset
        EXTERN RF69_RXtimeout
        EXTERN RF69_deselect
        EXTERN RF69_select
        EXTERN RxState
        EXTERN checkDIO0
        EXTERN delay_ms
        EXTERN spi_transfer

        PUBLIC Bitrate
        PUBLIC Channel
        PUBLIC Deviation
        PUBLIC NodeAddr
        PUBLIC RF69_AesKey
        PUBLIC RF69_RXbuffer
        PUBLIC RF69_SyncValue
        PUBLIC RF69_TXbuffer
        PUBLIC RF69_checkRCcal
        PUBLIC RF69_checkRSSI
        PUBLIC RF69_clearFIFO
        PUBLIC RF69_getAFC
        PUBLIC RF69_getFEI
        PUBLIC RF69_getIRQflags
        PUBLIC RF69_getLNAgain
        PUBLIC RF69_getRSSI
        PUBLIC RF69_getRSSItr
        PUBLIC RF69_getversion
        PUBLIC RF69_init
        PUBLIC RF69_readFIFO
        PUBLIC RF69_readreg
        PUBLIC RF69_restartRX
        PUBLIC RF69_sendpacket
        PUBLIC RF69_setAESkey
        PUBLIC RF69_setAFC
        PUBLIC RF69_setAFCBW
        PUBLIC RF69_setAFClowbeta
        PUBLIC RF69_setAutoModes
        PUBLIC RF69_setBrAddr
        PUBLIC RF69_setDIOmapping
        PUBLIC RF69_setFIFOtr
        PUBLIC RF69_setLNAgain
        PUBLIC RF69_setListenMode
        PUBLIC RF69_setNodeAddr
        PUBLIC RF69_setPAramp
        PUBLIC RF69_setPacketConfig1
        PUBLIC RF69_setPacketConfig2
        PUBLIC RF69_setPayLen
        PUBLIC RF69_setPreambleSize
        PUBLIC RF69_setRSSItr
        PUBLIC RF69_setRXBW
        PUBLIC RF69_setRXtimeouts
        PUBLIC RF69_setSyncConfig
        PUBLIC RF69_setSyncValue
        PUBLIC RF69_setbitrate
        PUBLIC RF69_setchannel
        PUBLIC RF69_setdeviation
        PUBLIC RF69_setmodulation
        PUBLIC RF69_setopmode
        PUBLIC RF69_setpower
        PUBLIC RF69_startRCcal
        PUBLIC RF69_startRSSI
        PUBLIC RF69_writeFIFO
        PUBLIC RF69_writereg
        PUBLIC Txpower


        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RF69_TXbuffer:
        DS8 66

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RF69_RXbuffer:
        DS8 66

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
RF69_SyncValue:
        DC8 35, 107, 201, 108, 107, 35, 108, 201

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RF69_AesKey:
        DS8 16

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
Channel:
        DC8 4

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
Bitrate:
        DC32 38400

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
Deviation:
        DC32 20000

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
Txpower:
        DC8 31

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
NodeAddr:
        DS8 1

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_writereg:
        CALLF     L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        CALLF     RF69_select
        LD        A, S:?b8
        OR        A, #0x80
        CALLF     spi_transfer
        LD        A, S:?b9
        CALLF     spi_transfer
        CALLF     RF69_deselect
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setPacketConfig2:
        LD        S:?b0, A
        LD        A, #0x3d
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setDIOmapping:
        PUSH      S:?b8
        MOV       S:?b8, S:?b0
        LD        S:?b0, A
        LD        A, #0x25
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        LD        A, #0x26
        CALLF     RF69_writereg
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setAFC:
        LD        S:?b0, A
        LD        A, #0x1e
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setopmode:
        LD        S:?b0, A
        LD        A, #0x1
        CALLF     RF69_writereg
??RF69_setopmode_0:
        LD        A, #0x27
        CALLF     RF69_readreg
        BCP       A, #0x80
        JREQ      L:??RF69_setopmode_0
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_restartRX:
        CLRW      X
        LDW       L:RF69_RXtimeout, X
        CLR       L:RxState
        LD        A, #0x4
        CALLF     RF69_setopmode
        CALLF     ?Subroutine3
??CrossCallReturnLabel_11:
        LD        A, #0xc
        CALLF     RF69_setAFC
        MOV       S:?b0, #0x57
        LD        A, #0x70
        CALLF     RF69_setDIOmapping
        LD        A, #0xa6
        CALLF     RF69_setPacketConfig2
        LD        A, #0x10
        CALLF     RF69_setopmode
        MOV       S:?b0, #0x1
        LD        A, #0x23
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine3:
        MOV       S:?b0, #0x10
        REQUIRE ??Subroutine4_0
        ;               // Fall through to label ??Subroutine4_0

        SECTION `.far_func.text`:CODE:NOROOT(0)
??Subroutine4_0:
        LD        A, #0x28
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setBrAddr:
        LD        S:?b0, A
        LD        A, #0x3a
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setNodeAddr:
        LD        S:?b0, A
        LD        A, #0x39
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setPacketConfig1:
        LD        S:?b0, A
        LD        A, #0x37
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setPayLen:
        LD        S:?b0, A
        LD        A, #0x38
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setSyncValue:
        PUSH      S:?b8
        CLR       S:?b8
??RF69_setSyncValue_0:
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, (L:RF69_SyncValue,X)
        LD        S:?b0, A
        LD        A, S:?b8
        ADD       A, #0x2f
        CALLF     RF69_writereg
        INC       S:?b8
        LD        A, S:?b8
        CP        A, #0x4
        JRC       L:??RF69_setSyncValue_0
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setSyncConfig:
        LD        S:?b0, A
        LD        A, #0x2e
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setPreambleSize:
        CALLF     L:?push_w4
        LDW       S:?w4, X
        MOV       S:?b0, S:?b8
        CLR       A
        CALLF     RF69_writereg
        MOV       S:?b0, S:?b9
        CALLF     ??Subroutine4_0
??CrossCallReturnLabel_9:
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setRXtimeouts:
        PUSH      S:?b8
        MOV       S:?b8, S:?b0
        LD        S:?b0, A
        LD        A, #0x2a
        CALLF     ?Subroutine1
??CrossCallReturnLabel_4:
        LD        A, #0x2b
        CALLF     RF69_writereg
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine1:
        CALLF     RF69_writereg
        MOV       S:?b0, S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setRSSItr:
        LD        S:?b0, A
        LD        A, #0x29
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setAFClowbeta:
        LD        S:?b0, A
        LD        A, #0xb
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setAFCBW:
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, S:?b1
        LD        S:?b0, A
        LD        A, #0x1a
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setRXBW:
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, S:?b1
        LD        S:?b0, A
        LD        A, #0x19
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setLNAgain:
        LD        S:?b0, A
        LD        A, #0x18
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setPAramp:
        LD        S:?b0, A
        LD        A, #0x12
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setpower:
        LD        A, L:Txpower
        ADD       A, #0x40
        LD        S:?b0, A
        LD        A, #0x11
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setdeviation:
        CALLF     L:?push_l2
        LD        A, #0x8
        CALLF     L:?sll32_l0_l0_a
        CALLF     L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3d09
        CODE
        CALLF     L:?mov_l2_l0
        MOV       S:?b0, S:?b10
        LD        A, #0x5
        CALLF     ?Subroutine2
??CrossCallReturnLabel_6:
        LD        A, #0x6
        CALLF     RF69_writereg
        JPF       L:?epilogue_l2

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setmodulation:
        LD        S:?b0, A
        LD        A, #0x2
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setbitrate:
        CALLF     L:?push_l2
        CALLF     L:?mov_l1_l0
        CALLF     L:?udiv32_l0_dl_l1
        DATA
        DC32      0x1e84800
        CODE
        CALLF     L:?mov_l2_l0
        MOV       S:?b0, S:?b10
        LD        A, #0x3
        CALLF     ?Subroutine2
??CrossCallReturnLabel_7:
        LD        A, #0x4
        CALLF     RF69_writereg
        JPF       L:?epilogue_l2

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine2:
        CALLF     RF69_writereg
        MOV       S:?b0, S:?b11
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setchannel:
        CALLF     L:?push_l2
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0xa800
        LDW       S:?w3, X
        LDW       X, #0x61
        LDW       S:?w2, X
        CALLF     L:?mul32_l0_l0_l1
        CALLF     L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3d09
        CODE
        LDW       X, #0xc000
        LDW       S:?w3, X
        LDW       X, #0xd8
        LDW       S:?w2, X
        CALLF     L:?add32_l0_l0_l1
        CALLF     L:?mov_l2_l0
        MOV       S:?b0, S:?b9
        LD        A, #0x7
        CALLF     RF69_writereg
        MOV       S:?b0, S:?b10
        LD        A, #0x8
        CALLF     ?Subroutine2
??CrossCallReturnLabel_8:
        LD        A, #0x9
        CALLF     RF69_writereg
        JPF       L:?epilogue_l2

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_init:
        CALLF     RF69_HWreset
        LDW       X, #0x64
        CALLF     delay_ms
        LD        A, #0x4
        CALLF     RF69_setopmode
        LD        A, L:Channel
        CALLF     RF69_setchannel
        LDW       X, #Bitrate
        CALLF     L:?load32_l0_0x
        CALLF     RF69_setbitrate
        LD        A, #0x1
        CALLF     RF69_setmodulation
        LDW       X, #Deviation
        CALLF     L:?load32_l0_0x
        CALLF     RF69_setdeviation
        LD        A, L:Txpower
        CALLF     RF69_setpower
        LD        A, #0x3
        CALLF     RF69_setPAramp
        LD        A, #0x81
        CALLF     RF69_setLNAgain
        MOV       S:?b0, #0x12
        LD        A, #0xe0
        CALLF     RF69_setRXBW
        MOV       S:?b0, #0xa
        LD        A, #0xe0
        CALLF     RF69_setAFCBW
        LD        A, #0xc
        CALLF     RF69_setAFC
        LD        A, #0x1
        CALLF     RF69_setAFClowbeta
        MOV       S:?b0, #0x20
        LD        A, #0x6f
        CALLF     RF69_writereg
        MOV       S:?b0, #0x6
        LD        A, #0x71
        CALLF     RF69_writereg
        MOV       S:?b0, #0x1b
        LD        A, #0x58
        CALLF     RF69_writereg
        LD        A, #0xc8
        CALLF     RF69_setRSSItr
        MOV       S:?b0, #0x40
        CLR       A
        CALLF     RF69_setRXtimeouts
        LDW       X, #0x20
        CALLF     RF69_setPreambleSize
        LD        A, #0x98
        CALLF     RF69_setSyncConfig
        CALLF     RF69_setSyncValue
        LD        A, #0x42
        CALLF     RF69_setPayLen
        LD        A, #0xd0
        CALLF     RF69_setPacketConfig1
        LD        A, #0xa6
        CALLF     RF69_setPacketConfig2
        LD        A, L:NodeAddr
        CALLF     RF69_setNodeAddr
        LD        A, #0xff
        CALLF     RF69_setBrAddr
        MOV       S:?b0, #0xa0
        LD        A, #0x3c
        CALLF     RF69_writereg
        JPF       RF69_restartRX

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_readreg:
        PUSH      S:?b8
        LD        S:?b8, A
        CALLF     RF69_select
        LD        A, S:?b8
        AND       A, #0x7f
        CALLF     spi_transfer
        CLR       A
        CALLF     spi_transfer
        LD        S:?b8, A
        CALLF     RF69_deselect
        LD        A, S:?b8
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getversion:
        LD        A, #0x10
        JPF       RF69_readreg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_startRCcal:
        MOV       S:?b0, #0x80
        LD        A, #0xa
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_checkRCcal:
        LD        A, #0xa
        CALLF     RF69_readreg
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setListenMode:
        CALLF     L:?push_w4
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        LD        S:?b0, A
        LD        A, #0xd
        CALLF     ?Subroutine1
??CrossCallReturnLabel_5:
        LD        A, #0xe
        CALLF     RF69_writereg
        MOV       S:?b0, S:?b9
        LD        A, #0xf
        CALLF     RF69_writereg
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getLNAgain:
        LD        A, #0x18
        CALLF     RF69_readreg
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x7
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getAFC:
        PUSH      S:?b8
        LD        A, #0x1f
        CALLF     RF69_readreg
        LD        S:?b8, A
        LD        A, #0x20
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getFEI:
        PUSH      S:?b8
        LD        A, #0x21
        CALLF     RF69_readreg
        LD        S:?b8, A
        LD        A, #0x22
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine0:
        CALLF     RF69_readreg
        ADD       A, #0x8
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, S:?b0
        JPF       L:?sll16_x_x_a

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_startRSSI:
        MOV       S:?b0, #0x1
        LD        A, #0x23
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_checkRSSI:
        LD        A, #0x23
        CALLF     RF69_readreg
        AND       A, #0x2
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getRSSI:
        LD        A, #0x24
        CALLF     RF69_readreg
        SRL       A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getIRQflags:
        PUSH      S:?b8
        LD        A, #0x27
        CALLF     RF69_readreg
        LD        S:?b8, A
        LD        A, #0x28
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_getRSSItr:
        LD        A, #0x29
        CALLF     RF69_readreg
        SRL       A
        NEG       A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setAutoModes:
        LD        S:?b0, A
        LD        A, #0x3b
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setFIFOtr:
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0x7f
        PUSH      A
        LD        A, S:?b1
        SRL       A
        CLR       A
        RRC       A
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        S:?b0, A
        LD        A, #0x3c
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_setAESkey:
        PUSH      S:?b8
        CLR       S:?b8
??RF69_setAESkey_0:
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, (L:RF69_AesKey,X)
        LD        S:?b0, A
        LD        A, S:?b8
        ADD       A, #0x3e
        CALLF     RF69_writereg
        INC       S:?b8
        LD        A, S:?b8
        CP        A, #0x10
        JRC       L:??RF69_setAESkey_0
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_writeFIFO:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
RF69_readFIFO:
        CALLF     L:?push_w4
        LD        S:?b9, A
        CLR       S:?b8
        JRA       L:??RF69_readFIFO_0
??RF69_readFIFO_1:
        CLR       A
        CALLF     RF69_readreg
        LD        S:?b0, A
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, S:?b0
        LD        (L:RF69_RXbuffer,X), A
        INC       S:?b8
??RF69_readFIFO_0:
        LD        A, S:?b8
        CP        A, S:?b9
        JRC       L:??RF69_readFIFO_1
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RF69_clearFIFO:
        MOV       S:?b0, #0x10
        LD        A, #0x28
        JPF       RF69_writereg

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RF69_sendpacket:
        CALLF     L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
        CP        A, #0x42
        JRC       L:??RF69_sendpacket_0
        MOV       S:?b9, #0x41
??RF69_sendpacket_0:
        CALLF     ?Subroutine3
??CrossCallReturnLabel_10:
        LD        A, #0xc
        CALLF     RF69_setopmode
        LD        A, S:?b9
        INC       A
        LD        L:RF69_TXbuffer, A
        LD        A, S:?b8
        LD        L:RF69_TXbuffer + 1, A
        CLR       S:?b8
??RF69_sendpacket_1:
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        LD        A, (L:RF69_TXbuffer,X)
        LD        S:?b0, A
        CLR       A
        CALLF     RF69_writereg
        INC       S:?b8
        CLR       S:?b0
        MOV       S:?b1, S:?b9
        LDW       X, S:?w0
        INCW      X
        INCW      X
        LDW       S:?w0, X
        CLRW      X
        LD        A, S:?b8
        LD        XL, A
        CPW       X, S:?w0
        JRSLT     L:??RF69_sendpacket_1
        CALLF     checkDIO0
        JPF       L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 1 177 bytes in section .far_func.text
//   149 bytes in section .near.bss
//    18 bytes in section .near.data
// 
// 1 177 bytes of CODE memory
//   167 bytes of DATA memory
//
//Errors: none
//Warnings: none
