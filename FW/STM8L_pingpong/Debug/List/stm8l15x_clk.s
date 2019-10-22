///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:13
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_clk.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB72D.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_clk.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_clk.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3

        PUBLIC CLK_AdjustHSICalibrationValue
        PUBLIC CLK_BEEPClockConfig
        PUBLIC CLK_CCOConfig
        PUBLIC CLK_ClearFlag
        PUBLIC CLK_ClearITPendingBit
        PUBLIC CLK_ClockSecuritySystemEnable
        PUBLIC CLK_ClockSecuritySytemDeglitchCmd
        PUBLIC CLK_DeInit
        PUBLIC CLK_GetClockFreq
        PUBLIC CLK_GetFlagStatus
        PUBLIC CLK_GetITStatus
        PUBLIC CLK_GetSYSCLKSource
        PUBLIC CLK_HSEConfig
        PUBLIC CLK_HSICmd
        PUBLIC CLK_HaltConfig
        PUBLIC CLK_ITConfig
        PUBLIC CLK_LSEClockSecuritySystemEnable
        PUBLIC CLK_LSEConfig
        PUBLIC CLK_LSICmd
        PUBLIC CLK_MainRegulatorCmd
        PUBLIC CLK_PeripheralClockConfig
        PUBLIC CLK_RTCCLKSwitchOnLSEFailureEnable
        PUBLIC CLK_RTCClockConfig
        PUBLIC CLK_SYSCLKDivConfig
        PUBLIC CLK_SYSCLKSourceConfig
        PUBLIC CLK_SYSCLKSourceSwitchCmd
        PUBLIC SYSDivFactor


        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
SYSDivFactor:
        DC8 1, 2, 4, 8, 16

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_DeInit:
        MOV       L:0x50c2, #0x11
        CLR       L:0x50c6
        CLR       L:0x50c1
        CLR       L:0x50cb
        MOV       L:0x50c8, #0x1
        CLR       L:0x50c9
        MOV       L:0x50c0, #0x3
        CLR       L:0x50c3
        MOV       L:0x50c4, #0x80
        CLR       L:0x50d0
        CLR       L:0x50ca
        CLR       L:0x50c5
        CLR       L:0x50cd
        CLR       L:0x50cc
        CLR       L:0x50ce
        MOV       L:0x50cf, #0xb9
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_HSICmd:
        TNZ       A
        JREQ      L:??CLK_HSICmd_0
        BSET      L:0x50c2, #0x0
        RETF
??CLK_HSICmd_0:
        BRES      L:0x50c2, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_AdjustHSICalibrationValue:
        MOV       L:0x50ce, #0xac
        MOV       L:0x50ce, #0x35
        LD        L:0x50cd, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_LSICmd:
        TNZ       A
        JREQ      L:??CLK_LSICmd_0
        BSET      L:0x50c2, #0x2
        RETF
??CLK_LSICmd_0:
        BRES      L:0x50c2, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_HSEConfig:
        LD        S:?b0, A
        BRES      L:0x50c6, #0x0
        BRES      L:0x50c6, #0x4
        LD        A, L:0x50c6
        OR        A, S:?b0
        LD        L:0x50c6, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_LSEConfig:
        LD        S:?b0, A
        BRES      L:0x50c6, #0x2
        BRES      L:0x50c6, #0x5
        LD        A, L:0x50c6
        OR        A, S:?b0
        LD        L:0x50c6, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_ClockSecuritySystemEnable:
        BSET      L:0x50ca, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_ClockSecuritySytemDeglitchCmd:
        TNZ       A
        JREQ      L:??CLK_ClockSecuritySytemDeglitchCmd_0
        BSET      L:0x50ca, #0x4
        RETF
??CLK_ClockSecuritySytemDeglitchCmd_0:
        BRES      L:0x50ca, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_CCOConfig:
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, S:?b1
        LD        L:0x50c5, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_SYSCLKSourceConfig:
        LD        L:0x50c8, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_GetSYSCLKSource:
        LD        A, L:0x50c7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_GetClockFreq:
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        LD        A, L:0x50c7
        CP        A, #0x1
        JRNE      L:??CLK_GetClockFreq_0
        LDW       X, #0x2400
        LDW       S:?w1, X
        LDW       X, #0xf4
        JRA       ??CLK_GetClockFreq_1
??CLK_GetClockFreq_0:
        CP        A, #0x2
        JRNE      L:??CLK_GetClockFreq_2
        LDW       X, #0x9470
        LDW       S:?w1, X
        JRA       L:??CLK_GetClockFreq_3
??CLK_GetClockFreq_2:
        CP        A, #0x4
        JRNE      L:??CLK_GetClockFreq_3
        LDW       X, #0x1200
        LDW       S:?w1, X
        LDW       X, #0x7a
??CLK_GetClockFreq_1:
        LDW       S:?w0, X
??CLK_GetClockFreq_3:
        LD        A, L:0x50c0
        AND       A, #0x7
        CLRW      X
        LD        XL, A
        LD        A, (L:SYSDivFactor,X)
        LD        XL, A
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        JPF       L:?udiv32_l0_l0_l1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_SYSCLKDivConfig:
        LD        L:0x50c0, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_SYSCLKSourceSwitchCmd:
        TNZ       A
        JREQ      L:??CLK_SYSCLKSourceSwitchCmd_0
        BSET      L:0x50c9, #0x1
        RETF
??CLK_SYSCLKSourceSwitchCmd_0:
        BRES      L:0x50c9, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_RTCClockConfig:
        LD        S:?b1, A
        LD        A, S:?b0
        OR        A, S:?b1
        LD        L:0x50c1, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_BEEPClockConfig:
        LD        L:0x50cb, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_PeripheralClockConfig:
        LD        S:?b2, A
        AND       A, #0xf0
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b2, A
        LD        S:?b3, A
        CPL       S:?b3
        TNZ       S:?b1
        JRNE      L:??CLK_PeripheralClockConfig_0
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_1
        LD        A, L:0x50c3
        OR        A, S:?b2
        JRA       ??CLK_PeripheralClockConfig_2
??CLK_PeripheralClockConfig_1:
        LD        A, L:0x50c3
        AND       A, S:?b3
??CLK_PeripheralClockConfig_2:
        LD        L:0x50c3, A
        RETF
??CLK_PeripheralClockConfig_0:
        LD        A, S:?b1
        CP        A, #0x10
        JRNE      L:??CLK_PeripheralClockConfig_3
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_4
        LD        A, L:0x50c4
        OR        A, S:?b2
        JRA       ??CLK_PeripheralClockConfig_5
??CLK_PeripheralClockConfig_4:
        LD        A, L:0x50c4
        AND       A, S:?b3
??CLK_PeripheralClockConfig_5:
        LD        L:0x50c4, A
        RETF
??CLK_PeripheralClockConfig_3:
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_6
        LD        A, L:0x50d0
        OR        A, S:?b2
        JRA       ??CLK_PeripheralClockConfig_7
??CLK_PeripheralClockConfig_6:
        LD        A, L:0x50d0
        AND       A, S:?b3
??CLK_PeripheralClockConfig_7:
        LD        L:0x50d0, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_LSEClockSecuritySystemEnable:
        BSET      L:0x5190, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_RTCCLKSwitchOnLSEFailureEnable:
        BSET      L:0x5190, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_HaltConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??CLK_HaltConfig_0
        LD        A, L:0x50c2
        OR        A, S:?b1
        JRA       ??CLK_HaltConfig_1
??CLK_HaltConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50c2
??CLK_HaltConfig_1:
        LD        L:0x50c2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_MainRegulatorCmd:
        TNZ       A
        JREQ      L:??CLK_MainRegulatorCmd_0
        BRES      L:0x50cf, #0x1
        RETF
??CLK_MainRegulatorCmd_0:
        BSET      L:0x50cf, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_ITConfig:
        TNZ       S:?b0
        JREQ      L:??CLK_ITConfig_0
        CP        A, #0x1c
        JRNE      L:??CLK_ITConfig_1
        BSET      L:0x50c9, #0x2
        RETF
??CLK_ITConfig_1:
        CP        A, #0x2c
        JRNE      L:??CLK_ITConfig_2
        BSET      L:0x5190, #0x2
        RETF
??CLK_ITConfig_2:
        BSET      L:0x50ca, #0x2
        RETF
??CLK_ITConfig_0:
        CP        A, #0x1c
        JRNE      L:??CLK_ITConfig_3
        BRES      L:0x50c9, #0x2
        RETF
??CLK_ITConfig_3:
        CP        A, #0x2c
        JRNE      L:??CLK_ITConfig_4
        BRES      L:0x5190, #0x2
        RETF
??CLK_ITConfig_4:
        BRES      L:0x50ca, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b0
        AND       A, #0xf0
        LD        S:?b2, A
        LD        A, S:?b1
        AND       A, #0xf
        LD        S:?b1, A
        TNZ       S:?b2
        JRNE      L:??CLK_GetFlagStatus_0
        MOV       S:?b2, L:0x50c1
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_0:
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??CLK_GetFlagStatus_2
        MOV       S:?b2, L:0x50c2
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_2:
        CP        A, #0x20
        JRNE      L:??CLK_GetFlagStatus_3
        MOV       S:?b2, L:0x50c5
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_3:
        CP        A, #0x30
        JRNE      L:??CLK_GetFlagStatus_4
        MOV       S:?b2, L:0x50c6
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_4:
        CP        A, #0x40
        JRNE      L:??CLK_GetFlagStatus_5
        MOV       S:?b2, L:0x50c9
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_5:
        CP        A, #0x50
        JRNE      L:??CLK_GetFlagStatus_6
        MOV       S:?b2, L:0x50ca
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_6:
        CP        A, #0x70
        JRNE      L:??CLK_GetFlagStatus_7
        MOV       S:?b2, L:0x50cf
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_7:
        CP        A, #0x80
        JRNE      L:??CLK_GetFlagStatus_8
        MOV       S:?b2, L:0x5190
        JRA       L:??CLK_GetFlagStatus_1
??CLK_GetFlagStatus_8:
        MOV       S:?b2, L:0x50cb
??CLK_GetFlagStatus_1:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        BCP       A, S:?b2
        JREQ      L:??CLK_GetFlagStatus_9
        MOV       S:?b0, #0x1
??CLK_GetFlagStatus_9:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_ClearFlag:
        BRES      L:0x5190, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_GetITStatus:
        LD        S:?b1, A
        CLR       S:?b0
        CP        A, #0x1c
        JRNE      L:??CLK_GetITStatus_0
        LD        A, L:0x50c9
        AND       A, #0x1c
        JRA       ??CLK_GetITStatus_1
??CLK_GetITStatus_0:
        CP        A, #0x2c
        JRNE      L:??CLK_GetITStatus_2
        LD        A, L:0x5190
        AND       A, #0x2c
??CLK_GetITStatus_1:
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_3
        JRA       L:??CLK_GetITStatus_4
??CLK_GetITStatus_2:
        LD        A, L:0x50ca
        AND       A, S:?b1
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_3
??CLK_GetITStatus_4:
        MOV       S:?b0, #0x1
??CLK_GetITStatus_3:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
CLK_ClearITPendingBit:
        AND       A, #0xf0
        CP        A, #0x20
        JRNE      L:??CLK_ClearITPendingBit_0
        BRES      L:0x5190, #0x3
        RETF
??CLK_ClearITPendingBit_0:
        BRES      L:0x50c9, #0x3
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 661 bytes in section .far_func.text
//   5 bytes in section .near.rodata
// 
// 661 bytes of CODE  memory
//   5 bytes of CONST memory
//
//Errors: none
//Warnings: none
