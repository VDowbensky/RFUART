///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:17
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_wfe.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC677.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_wfe.c"
//        -e -Ohz --debug --code_model medium --data_model medium -o
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_wfe.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?switch16vlt_0x_x_0y
        EXTERN ?w1

        PUBLIC WFE_DeInit
        PUBLIC WFE_GetWakeUpSourceEventStatus
        PUBLIC WFE_WakeUpSourceEventCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WFE_DeInit:
        CLR       L:0x50a6
        CLR       L:0x50a7
        CLR       L:0x50a8
        CLR       L:0x50a9
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WFE_WakeUpSourceEventCmd:
        RLWA      X, A
        LD        S:?b0, A
        RRWA      X, A
        TNZ       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_0
        LD        A, S:?b0
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_1
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_2
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_3
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_4
        RETF
??WFE_WakeUpSourceEventCmd_1:
        LD        A, XL
        OR        A, L:0x50a6
        JRA       ??WFE_WakeUpSourceEventCmd_5
??WFE_WakeUpSourceEventCmd_2:
        LD        A, XL
        OR        A, L:0x50a7
        JRA       ??WFE_WakeUpSourceEventCmd_6
??WFE_WakeUpSourceEventCmd_3:
        LD        A, XL
        OR        A, L:0x50a8
        JRA       ??WFE_WakeUpSourceEventCmd_7
??WFE_WakeUpSourceEventCmd_4:
        LD        A, XL
        OR        A, L:0x50a9
        JRA       ??WFE_WakeUpSourceEventCmd_8
??WFE_WakeUpSourceEventCmd_0:
        EXG       A, XL
        LD        S:?b1, A
        CPL       S:?b1
        LD        A, S:?b0
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_9
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_10
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_11
        DEC       A
        JREQ      L:??WFE_WakeUpSourceEventCmd_12
        RETF
??WFE_WakeUpSourceEventCmd_9:
        LD        A, L:0x50a6
        AND       A, S:?b1
??WFE_WakeUpSourceEventCmd_5:
        LD        L:0x50a6, A
        RETF
??WFE_WakeUpSourceEventCmd_10:
        LD        A, L:0x50a7
        AND       A, S:?b1
??WFE_WakeUpSourceEventCmd_6:
        LD        L:0x50a7, A
        RETF
??WFE_WakeUpSourceEventCmd_11:
        LD        A, L:0x50a8
        AND       A, S:?b1
??WFE_WakeUpSourceEventCmd_7:
        LD        L:0x50a8, A
        RETF
??WFE_WakeUpSourceEventCmd_12:
        LD        A, L:0x50a9
        AND       A, S:?b1
??WFE_WakeUpSourceEventCmd_8:
        LD        L:0x50a9, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WFE_GetWakeUpSourceEventStatus:
        LDW       S:?w1, X
        CLR       S:?b4
        LDW       Y, #??switch_table_0
        CALLF     L:?switch16vlt_0x_x_0y
        JP        (X)
??WFE_GetWakeUpSourceEventStatus_0:
        LD        A, S:?b3
        AND       A, L:0x50a6
        JRA       ??WFE_GetWakeUpSourceEventStatus_1
??WFE_GetWakeUpSourceEventStatus_2:
        LD        A, S:?b3
        AND       A, L:0x50a7
        JRA       ??WFE_GetWakeUpSourceEventStatus_1
??WFE_GetWakeUpSourceEventStatus_3:
        LD        A, S:?b3
        AND       A, L:0x50a8
??WFE_GetWakeUpSourceEventStatus_1:
        CP        A, #0x0
        JRNE      L:??WFE_GetWakeUpSourceEventStatus_4
        JRA       L:??WFE_GetWakeUpSourceEventStatus_5
??WFE_GetWakeUpSourceEventStatus_6:
        LD        A, S:?b3
        BCP       A, L:0x50a9
        JREQ      L:??WFE_GetWakeUpSourceEventStatus_5
??WFE_GetWakeUpSourceEventStatus_4:
        MOV       S:?b4, #0x1
??WFE_GetWakeUpSourceEventStatus_5:
        LD        A, S:?b4
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
??switch_table_0:
        DC16      0x101
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x102
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x104
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x108
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x110
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x120
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x140
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x180
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_0)
        DC16      0x201
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x202
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x204
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x208
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x210
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x220
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x240
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x280
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_2)
        DC16      0x301
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x302
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x304
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x308
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x310
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x320
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x340
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x380
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_3)
        DC16      0x401
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x402
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x404
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x408
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x410
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x420
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x440
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_6)
        DC16      0x0
        DC16      LWRD(??WFE_GetWakeUpSourceEventStatus_5)

        END
// 
// 171 bytes in section .far_func.text
// 128 bytes in section .near_func.text
// 
// 299 bytes of CODE memory
//
//Errors: none
//Warnings: none
