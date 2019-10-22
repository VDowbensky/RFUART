///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:16
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_syscfg.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC1CD.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_syscfg.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_syscfg.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?sll16_x_x_a

        PUBLIC SYSCFG_REMAPDMAChannelConfig
        PUBLIC SYSCFG_REMAPDeInit
        PUBLIC SYSCFG_REMAPPinConfig
        PUBLIC SYSCFG_RIAnalogSwitchConfig
        PUBLIC SYSCFG_RIDeInit
        PUBLIC SYSCFG_RIIOSwitchConfig
        PUBLIC SYSCFG_RIResistorConfig
        PUBLIC SYSCFG_RITIMInputCaptureConfig


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_RIDeInit:
        CLR       L:0x5431
        CLR       L:0x5432
        CLR       L:0x5439
        CLR       L:0x543a
        CLR       L:0x543b
        CLR       L:0x5457
        CLR       L:0x543d
        CLR       L:0x543e
        CLR       L:0x543f
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_RITIMInputCaptureConfig:
        CP        A, #0x2
        JRNE      L:??SYSCFG_RITIMInputCaptureConfig_0
        LD        A, S:?b0
        LD        L:0x5431, A
        RETF
??SYSCFG_RITIMInputCaptureConfig_0:
        LD        A, S:?b0
        LD        L:0x5432, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_RIAnalogSwitchConfig:
        LD        S:?b1, A
        AND       A, #0xf0
        LD        S:?b2, A
        LD        A, S:?b1
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIAnalogSwitchConfig_0
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIAnalogSwitchConfig_1
        LD        A, L:0x543d
        OR        A, S:?b1
        JRA       ??SYSCFG_RIAnalogSwitchConfig_2
??SYSCFG_RIAnalogSwitchConfig_1:
        LD        A, L:0x543e
        OR        A, S:?b1
        JRA       ??SYSCFG_RIAnalogSwitchConfig_3
??SYSCFG_RIAnalogSwitchConfig_0:
        CPL       S:?b1
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIAnalogSwitchConfig_4
        LD        A, L:0x543d
        AND       A, S:?b1
??SYSCFG_RIAnalogSwitchConfig_2:
        LD        L:0x543d, A
        RETF
??SYSCFG_RIAnalogSwitchConfig_4:
        LD        A, L:0x543e
        AND       A, S:?b1
??SYSCFG_RIAnalogSwitchConfig_3:
        LD        L:0x543e, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_RIIOSwitchConfig:
        LD        S:?b1, A
        AND       A, #0xf
        LD        S:?b2, A
        LD        A, S:?b1
        AND       A, #0xf0
        LD        S:?b1, A
        CLRW      X
        INCW      X
        LD        A, S:?b2
        CALLF     L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b2, A
        LD        S:?b3, A
        CPL       S:?b3
        LD        A, S:?b1
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIIOSwitchConfig_0
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_1
        LD        A, L:0x5439
        OR        A, S:?b2
        JRA       ??SYSCFG_RIIOSwitchConfig_2
??SYSCFG_RIIOSwitchConfig_1:
        LD        A, L:0x5439
        AND       A, S:?b3
??SYSCFG_RIIOSwitchConfig_2:
        LD        L:0x5439, A
        RETF
??SYSCFG_RIIOSwitchConfig_0:
        CP        A, #0x20
        JRNE      L:??SYSCFG_RIIOSwitchConfig_3
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_4
        LD        A, L:0x543a
        OR        A, S:?b2
        JRA       ??SYSCFG_RIIOSwitchConfig_5
??SYSCFG_RIIOSwitchConfig_4:
        LD        A, L:0x543a
        AND       A, S:?b3
??SYSCFG_RIIOSwitchConfig_5:
        LD        L:0x543a, A
        RETF
??SYSCFG_RIIOSwitchConfig_3:
        CP        A, #0x30
        JRNE      L:??SYSCFG_RIIOSwitchConfig_6
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_7
        LD        A, L:0x543b
        OR        A, S:?b2
        JRA       ??SYSCFG_RIIOSwitchConfig_8
??SYSCFG_RIIOSwitchConfig_7:
        LD        A, L:0x543b
        AND       A, S:?b3
??SYSCFG_RIIOSwitchConfig_8:
        LD        L:0x543b, A
        RETF
??SYSCFG_RIIOSwitchConfig_6:
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_9
        LD        A, L:0x5457
        OR        A, S:?b2
        JRA       ??SYSCFG_RIIOSwitchConfig_10
??SYSCFG_RIIOSwitchConfig_9:
        LD        A, L:0x5457
        AND       A, S:?b3
??SYSCFG_RIIOSwitchConfig_10:
        LD        L:0x5457, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_RIResistorConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIResistorConfig_0
        LD        A, L:0x543f
        OR        A, S:?b1
        JRA       ??SYSCFG_RIResistorConfig_1
??SYSCFG_RIResistorConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x543f
??SYSCFG_RIResistorConfig_1:
        LD        L:0x543f, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_REMAPDeInit:
        MOV       L:0x509e, #0xc
        CLR       L:0x509f
        CLR       L:0x509d
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_REMAPPinConfig:
        LD        S:?b0, A
        LD        A, XH
        CP        A, #0x1
        JRNE      L:??SYSCFG_REMAPPinConfig_0
        LD        A, XL
        SWAP      A
        AND       A, #0xf0
        OR        A, #0xf
        AND       A, L:0x509e
        LD        L:0x509e, A
        TNZ       S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_1
        LD        A, XL
        AND       A, #0xf0
        OR        A, L:0x509e
        LD        L:0x509e, A
        RETF
??SYSCFG_REMAPPinConfig_0:
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
        CPL       S:?b1
        CP        A, #0x2
        JRNE      L:??SYSCFG_REMAPPinConfig_2
        TNZ       S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_3
        LD        A, XL
        OR        A, L:0x509f
        JRA       ??SYSCFG_REMAPPinConfig_4
??SYSCFG_REMAPPinConfig_3:
        LD        A, L:0x509f
        AND       A, S:?b1
??SYSCFG_REMAPPinConfig_4:
        LD        L:0x509f, A
        RETF
??SYSCFG_REMAPPinConfig_2:
        TNZ       S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_5
        LD        A, XL
        OR        A, L:0x509d
        JRA       ??SYSCFG_REMAPPinConfig_6
??SYSCFG_REMAPPinConfig_5:
        LD        A, L:0x509d
        AND       A, S:?b1
??SYSCFG_REMAPPinConfig_6:
        LD        L:0x509d, A
??SYSCFG_REMAPPinConfig_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SYSCFG_REMAPDMAChannelConfig:
        LD        S:?b0, A
        BCP       A, #0xf0
        JREQ      L:??SYSCFG_REMAPDMAChannelConfig_0
        LD        A, L:0x509e
        AND       A, #0xf3
        JRA       ??SYSCFG_REMAPDMAChannelConfig_1
??SYSCFG_REMAPDMAChannelConfig_0:
        LD        A, L:0x509e
        AND       A, #0xfc
??SYSCFG_REMAPDMAChannelConfig_1:
        LD        L:0x509e, A
        LD        A, S:?b0
        AND       A, #0xf
        OR        A, L:0x509e
        LD        L:0x509e, A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 393 bytes in section .far_func.text
// 
// 393 bytes of CODE memory
//
//Errors: none
//Warnings: none
