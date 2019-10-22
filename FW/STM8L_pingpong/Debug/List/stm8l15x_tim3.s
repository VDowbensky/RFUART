///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:17
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim3.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC3D3.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim3.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_tim3.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?w0

        PUBLIC TIM3_ARRPreloadConfig
        PUBLIC TIM3_BKRConfig
        PUBLIC TIM3_CCxCmd
        PUBLIC TIM3_ClearFlag
        PUBLIC TIM3_ClearITPendingBit
        PUBLIC TIM3_Cmd
        PUBLIC TIM3_CounterModeConfig
        PUBLIC TIM3_CtrlPWMOutputs
        PUBLIC TIM3_DMACmd
        PUBLIC TIM3_DeInit
        PUBLIC TIM3_ETRClockMode1Config
        PUBLIC TIM3_ETRClockMode2Config
        PUBLIC TIM3_ETRConfig
        PUBLIC TIM3_EncoderInterfaceConfig
        PUBLIC TIM3_ForcedOC1Config
        PUBLIC TIM3_ForcedOC2Config
        PUBLIC TIM3_GenerateEvent
        PUBLIC TIM3_GetCapture1
        PUBLIC TIM3_GetCapture2
        PUBLIC TIM3_GetCounter
        PUBLIC TIM3_GetFlagStatus
        PUBLIC TIM3_GetITStatus
        PUBLIC TIM3_GetPrescaler
        PUBLIC TIM3_ICInit
        PUBLIC TIM3_ITConfig
        PUBLIC TIM3_InternalClockConfig
        PUBLIC TIM3_OC1FastConfig
        PUBLIC TIM3_OC1Init
        PUBLIC TIM3_OC1PolarityConfig
        PUBLIC TIM3_OC1PreloadConfig
        PUBLIC TIM3_OC2FastConfig
        PUBLIC TIM3_OC2Init
        PUBLIC TIM3_OC2PolarityConfig
        PUBLIC TIM3_OC2PreloadConfig
        PUBLIC TIM3_PWMIConfig
        PUBLIC TIM3_PrescalerConfig
        PUBLIC TIM3_SelectCCDMA
        PUBLIC TIM3_SelectHallSensor
        PUBLIC TIM3_SelectInputTrigger
        PUBLIC TIM3_SelectMasterSlaveMode
        PUBLIC TIM3_SelectOCxM
        PUBLIC TIM3_SelectOnePulseMode
        PUBLIC TIM3_SelectOutputTrigger
        PUBLIC TIM3_SelectSlaveMode
        PUBLIC TIM3_SetAutoreload
        PUBLIC TIM3_SetCompare1
        PUBLIC TIM3_SetCompare2
        PUBLIC TIM3_SetCounter
        PUBLIC TIM3_SetIC1Prescaler
        PUBLIC TIM3_SetIC2Prescaler
        PUBLIC TIM3_TIxExternalClockConfig
        PUBLIC TIM3_TimeBaseInit
        PUBLIC TIM3_UpdateDisableConfig
        PUBLIC TIM3_UpdateRequestConfig


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_DeInit:
        CLR       L:0x5280
        CLR       L:0x5281
        CLR       L:0x5282
        CLR       L:0x5283
        CLR       L:0x5285
        CLR       L:0x5287
        CLR       L:0x528b
        MOV       L:0x5289, #0x1
        MOV       L:0x528a, #0x1
        CLR       L:0x528b
        CLR       L:0x5289
        CLR       L:0x528a
        CLR       L:0x528c
        CLR       L:0x528d
        CLR       L:0x528e
        MOV       L:0x528f, #0xff
        MOV       L:0x5290, #0xff
        CLR       L:0x5291
        CLR       L:0x5292
        CLR       L:0x5293
        CLR       L:0x5294
        CLR       L:0x5296
        MOV       L:0x5288, #0x1
        CLR       L:0x5295
        CLR       L:0x5286
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_TimeBaseInit:
        LD        S:?b1, A
        LD        A, XH
        LD        L:0x528f, A
        LD        A, XL
        LD        L:0x5290, A
        LD        A, S:?b1
        LD        L:0x528e, A
        LD        A, L:0x5280
        AND       A, #0x8f
        LD        L:0x5280, A
        LD        A, L:0x5280
        OR        A, S:?b0
        LD        L:0x5280, A
        MOV       L:0x5288, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_PrescalerConfig:
        LD        L:0x528e, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM3_PrescalerConfig_0
        BSET      L:0x5288, #0x0
        RETF
??TIM3_PrescalerConfig_0:
        BRES      L:0x5288, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_CounterModeConfig:
        LD        S:?b0, A
        LD        A, L:0x5280
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5280, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SetCounter:
        LD        A, XH
        LD        L:0x528c, A
        LD        A, XL
        LD        L:0x528d, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SetAutoreload:
        LD        A, XH
        LD        L:0x528f, A
        LD        A, XL
        LD        L:0x5290, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GetCounter:
        LD        A, L:0x528c
        MOV       S:?b0, L:0x528d
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        LDW       S:?w0, X
        LDW       X, Y
        RLWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GetPrescaler:
        LD        A, L:0x528e
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM3_UpdateDisableConfig_0
        BSET      L:0x5280, #0x1
        RETF
??TIM3_UpdateDisableConfig_0:
        BRES      L:0x5280, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_UpdateRequestConfig:
        DEC       A
        JRNE      L:??TIM3_UpdateRequestConfig_0
        BSET      L:0x5280, #0x2
        RETF
??TIM3_UpdateRequestConfig_0:
        BRES      L:0x5280, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM3_ARRPreloadConfig_0
        BSET      L:0x5280, #0x7
        RETF
??TIM3_ARRPreloadConfig_0:
        BRES      L:0x5280, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectOnePulseMode:
        DEC       A
        JRNE      L:??TIM3_SelectOnePulseMode_0
        BSET      L:0x5280, #0x3
        RETF
??TIM3_SelectOnePulseMode_0:
        BRES      L:0x5280, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_Cmd:
        TNZ       A
        JREQ      L:??TIM3_Cmd_0
        BSET      L:0x5280, #0x0
        RETF
??TIM3_Cmd_0:
        BRES      L:0x5280, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC1Init:
        LD        S:?b3, A
        LD        A, L:0x5289
        BRES      L:0x528b, #0x0
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x5289, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM3_OC1Init_0
        BSET      L:0x528b, #0x0
        JRA       L:??TIM3_OC1Init_1
??TIM3_OC1Init_0:
        BRES      L:0x528b, #0x0
??TIM3_OC1Init_1:
        LD        A, S:?b1
        DEC       A
        JRNE      L:??TIM3_OC1Init_2
        BSET      L:0x528b, #0x1
        JRA       L:??TIM3_OC1Init_3
??TIM3_OC1Init_2:
        BRES      L:0x528b, #0x1
??TIM3_OC1Init_3:
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TIM3_OC1Init_4
        BSET      L:0x5296, #0x0
        JRA       L:??TIM3_OC1Init_5
??TIM3_OC1Init_4:
        BRES      L:0x5296, #0x0
??TIM3_OC1Init_5:
        LD        A, XH
        LD        L:0x5291, A
        LD        A, XL
        LD        L:0x5292, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC2Init:
        LD        S:?b3, A
        LD        A, L:0x528a
        BRES      L:0x528b, #0x4
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x528a, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM3_OC2Init_0
        BSET      L:0x528b, #0x4
        JRA       L:??TIM3_OC2Init_1
??TIM3_OC2Init_0:
        BRES      L:0x528b, #0x4
??TIM3_OC2Init_1:
        LD        A, S:?b1
        DEC       A
        JRNE      L:??TIM3_OC2Init_2
        BSET      L:0x528b, #0x5
        JRA       L:??TIM3_OC2Init_3
??TIM3_OC2Init_2:
        BRES      L:0x528b, #0x5
??TIM3_OC2Init_3:
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TIM3_OC2Init_4
        BSET      L:0x5296, #0x2
        JRA       L:??TIM3_OC2Init_5
??TIM3_OC2Init_4:
        BRES      L:0x5296, #0x2
??TIM3_OC2Init_5:
        LD        A, XH
        LD        L:0x5293, A
        LD        A, XL
        LD        L:0x5294, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_BKRConfig:
        LD        S:?b4, A
        LD        A, S:?b0
        OR        A, S:?b4
        OR        A, S:?b1
        OR        A, S:?b2
        OR        A, S:?b3
        LD        L:0x5295, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_CtrlPWMOutputs:
        TNZ       A
        JREQ      L:??TIM3_CtrlPWMOutputs_0
        BSET      L:0x5295, #0x7
        RETF
??TIM3_CtrlPWMOutputs_0:
        BRES      L:0x5295, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectOCxM:
        TNZ       A
        JRNE      L:??TIM3_SelectOCxM_0
        BRES      L:0x528b, #0x0
        LD        A, L:0x5289
        AND       A, #0x8f
        LD        L:0x5289, A
        LD        A, L:0x5289
        OR        A, S:?b0
        LD        L:0x5289, A
        RETF
??TIM3_SelectOCxM_0:
        BRES      L:0x528b, #0x4
        LD        A, L:0x528a
        AND       A, #0x8f
        LD        L:0x528a, A
        LD        A, L:0x528a
        OR        A, S:?b0
        LD        L:0x528a, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SetCompare1:
        LD        A, XH
        LD        L:0x5291, A
        LD        A, XL
        LD        L:0x5292, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SetCompare2:
        LD        A, XH
        LD        L:0x5293, A
        LD        A, XL
        LD        L:0x5294, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ForcedOC1Config:
        LD        S:?b0, A
        LD        A, L:0x5289
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5289, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ForcedOC2Config:
        LD        S:?b0, A
        LD        A, L:0x528a
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x528a, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC1PreloadConfig:
        TNZ       A
        JREQ      L:??TIM3_OC1PreloadConfig_0
        BSET      L:0x5289, #0x3
        RETF
??TIM3_OC1PreloadConfig_0:
        BRES      L:0x5289, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC2PreloadConfig:
        TNZ       A
        JREQ      L:??TIM3_OC2PreloadConfig_0
        BSET      L:0x528a, #0x3
        RETF
??TIM3_OC2PreloadConfig_0:
        BRES      L:0x528a, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC1FastConfig:
        TNZ       A
        JREQ      L:??TIM3_OC1FastConfig_0
        BSET      L:0x5289, #0x2
        RETF
??TIM3_OC1FastConfig_0:
        BRES      L:0x5289, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC2FastConfig:
        TNZ       A
        JREQ      L:??TIM3_OC2FastConfig_0
        BSET      L:0x528a, #0x2
        RETF
??TIM3_OC2FastConfig_0:
        BRES      L:0x528a, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC1PolarityConfig:
        DEC       A
        JRNE      L:??TIM3_OC1PolarityConfig_0
        BSET      L:0x528b, #0x1
        RETF
??TIM3_OC1PolarityConfig_0:
        BRES      L:0x528b, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_OC2PolarityConfig:
        DEC       A
        JRNE      L:??TIM3_OC2PolarityConfig_0
        BSET      L:0x528b, #0x5
        RETF
??TIM3_OC2PolarityConfig_0:
        BRES      L:0x528b, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_CCxCmd:
        TNZ       A
        JRNE      L:??TIM3_CCxCmd_0
        TNZ       S:?b0
        JREQ      L:??TIM3_CCxCmd_1
        BSET      L:0x528b, #0x0
        RETF
??TIM3_CCxCmd_1:
        BRES      L:0x528b, #0x0
        RETF
??TIM3_CCxCmd_0:
        TNZ       S:?b0
        JREQ      L:??TIM3_CCxCmd_2
        BSET      L:0x528b, #0x4
        RETF
??TIM3_CCxCmd_2:
        BRES      L:0x528b, #0x4
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM3_SetIC2Prescaler:
        LD        S:?b0, A
        LD        A, L:0x528a
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x528a, A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TI2_Config:
        LD        S:?b2, A
        LD        A, L:0x528a
        BRES      L:0x528b, #0x4
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        LD        L:0x528a, A
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TI2_Config_0
        BSET      L:0x528b, #0x5
        JRA       L:??TI2_Config_1
??TI2_Config_0:
        BRES      L:0x528b, #0x5
??TI2_Config_1:
        BSET      L:0x528b, #0x4
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM3_SetIC1Prescaler:
        LD        S:?b0, A
        LD        A, L:0x5289
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5289, A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TI1_Config:
        LD        S:?b2, A
        LD        A, L:0x5289
        BRES      L:0x528b, #0x0
        CALLF     ?Subroutine1
??CrossCallReturnLabel_4:
        LD        L:0x5289, A
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TI1_Config_0
        BSET      L:0x528b, #0x1
        JRA       L:??TI1_Config_1
??TI1_Config_0:
        BRES      L:0x528b, #0x1
??TI1_Config_1:
        BSET      L:0x528b, #0x0
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine1:
        AND       A, #0xc
        OR        A, S:?b0
        LD        S:?b0, A
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM3_ICInit:
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b5, S:?b2
        MOV       S:?b1, S:?b3
        TNZ       A
        JRNE      L:??TIM3_ICInit_0
        LD        A, S:?b4
        CALLF     TI1_Config
        LD        A, S:?b5
        JPF       TIM3_SetIC1Prescaler
??TIM3_ICInit_0:
        LD        A, S:?b4
        CALLF     TI2_Config
        LD        A, S:?b5
        JPF       TIM3_SetIC2Prescaler

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM3_PWMIConfig:
        PUSH      S:?b8
        LD        S:?b7, A
        MOV       S:?b6, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b8, S:?b2
        CLR       S:?b4
        MOV       S:?b5, #0x1
        TNZ       S:?b6
        JRNE      L:??TIM3_PWMIConfig_0
        MOV       S:?b4, #0x1
??TIM3_PWMIConfig_0:
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM3_PWMIConfig_1
        MOV       S:?b5, #0x2
??TIM3_PWMIConfig_1:
        TNZ       S:?b7
        MOV       S:?b1, S:?b3
        JRNE      L:??TIM3_PWMIConfig_2
        LD        A, S:?b6
        CALLF     ?Subroutine2
??CrossCallReturnLabel_6:
        MOV       S:?b1, S:?b3
        MOV       S:?b0, S:?b5
        LD        A, S:?b4
        CALLF     ?Subroutine3
??CrossCallReturnLabel_8:
        JRA       L:??CrossCallReturnLabel_5
??TIM3_PWMIConfig_2:
        LD        A, S:?b6
        CALLF     ?Subroutine3
??CrossCallReturnLabel_7:
        MOV       S:?b1, S:?b3
        MOV       S:?b0, S:?b5
        LD        A, S:?b4
        CALLF     ?Subroutine2
??CrossCallReturnLabel_5:
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine3:
        CALLF     TI2_Config
        LD        A, S:?b8
        JPF       TIM3_SetIC2Prescaler

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALLF     TI1_Config
        LD        A, S:?b8
        JPF       TIM3_SetIC1Prescaler

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GetCapture1:
        LD        A, L:0x5291
        MOV       S:?b0, L:0x5292
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GetCapture2:
        LD        A, L:0x5293
        MOV       S:?b0, L:0x5294
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ITConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??TIM3_ITConfig_0
        LD        A, L:0x5285
        OR        A, S:?b1
        JRA       ??TIM3_ITConfig_1
??TIM3_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5285
??TIM3_ITConfig_1:
        LD        L:0x5285, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GenerateEvent:
        LD        S:?b0, A
        LD        A, L:0x5288
        OR        A, S:?b0
        LD        L:0x5288, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GetFlagStatus:
        CLR       S:?b0
        MOV       S:?b2, L:0x5286
        MOV       S:?b1, L:0x5287
        LD        A, XH
        AND       A, S:?b1
        PUSH      A
        LD        A, XL
        AND       A, S:?b2
        LD        S:?b2, A
        POP       A
        OR        A, S:?b2
        JREQ      L:??TIM3_GetFlagStatus_0
        MOV       S:?b0, #0x1
??TIM3_GetFlagStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5286, A
        LD        A, XH
        CPL       A
        LD        L:0x5287, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_GetITStatus:
        LD        S:?b2, A
        CLR       S:?b0
        MOV       S:?b3, L:0x5286
        LD        A, L:0x5285
        AND       A, S:?b2
        LD        S:?b1, A
        LD        A, S:?b2
        BCP       A, S:?b3
        JREQ      L:??TIM3_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM3_GetITStatus_0
        MOV       S:?b0, #0x1
??TIM3_GetITStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ClearITPendingBit:
        CPL       A
        LD        L:0x5286, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_DMACmd:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??TIM3_DMACmd_0
        LD        A, L:0x5284
        OR        A, S:?b1
        JRA       ??TIM3_DMACmd_1
??TIM3_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5284
??TIM3_DMACmd_1:
        LD        L:0x5284, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectCCDMA:
        TNZ       A
        JREQ      L:??TIM3_SelectCCDMA_0
        BSET      L:0x5281, #0x3
        RETF
??TIM3_SelectCCDMA_0:
        BRES      L:0x5281, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_InternalClockConfig:
        LD        A, L:0x5282
        AND       A, #0xf8
        LD        L:0x5282, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_TIxExternalClockConfig:
        LD        S:?b3, A
        MOV       S:?b2, S:?b0
        CP        A, #0x60
        MOV       S:?b0, #0x1
        JRNE      L:??TIM3_TIxExternalClockConfig_0
        LD        A, S:?b2
        CALLF     TI2_Config
        JRA       L:??TIM3_TIxExternalClockConfig_1
??TIM3_TIxExternalClockConfig_0:
        LD        A, S:?b2
        CALLF     TI1_Config
??TIM3_TIxExternalClockConfig_1:
        LD        A, S:?b3
        CALLF     TIM3_SelectInputTrigger
        LD        A, L:0x5282
        OR        A, #0x7
        LD        L:0x5282, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ETRClockMode1Config:
        CALLF     TIM3_ETRConfig
        LD        A, L:0x5282
        AND       A, #0xf8
        LD        L:0x5282, A
        LD        A, L:0x5282
        OR        A, #0x7
        LD        L:0x5282, A
        LD        A, L:0x5282
        AND       A, #0x8f
        LD        L:0x5282, A
        LD        A, L:0x5282
        OR        A, #0x70
        LD        L:0x5282, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ETRClockMode2Config:
        CALLF     TIM3_ETRConfig
        BSET      L:0x5283, #0x6
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectInputTrigger:
        LD        S:?b0, A
        LD        A, L:0x5282
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5282, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectOutputTrigger:
        LD        S:?b0, A
        LD        A, L:0x5281
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5281, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectSlaveMode:
        LD        S:?b0, A
        LD        A, L:0x5282
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x5282, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectMasterSlaveMode:
        TNZ       A
        JREQ      L:??TIM3_SelectMasterSlaveMode_0
        BSET      L:0x5282, #0x7
        RETF
??TIM3_SelectMasterSlaveMode_0:
        BRES      L:0x5282, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_ETRConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5283
        LD        L:0x5283, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_EncoderInterfaceConfig:
        LD        S:?b4, A
        LD        A, L:0x5282
        MOV       S:?b3, L:0x5289
        MOV       S:?b2, L:0x528a
        AND       A, #0xf0
        OR        A, S:?b4
        LD        S:?b4, A
        LD        A, S:?b3
        AND       A, #0xfc
        OR        A, #0x1
        LD        S:?b3, A
        LD        A, S:?b2
        AND       A, #0xfc
        OR        A, #0x1
        LD        S:?b2, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM3_EncoderInterfaceConfig_0
        BSET      L:0x528b, #0x1
        JRA       L:??TIM3_EncoderInterfaceConfig_1
??TIM3_EncoderInterfaceConfig_0:
        BRES      L:0x528b, #0x1
??TIM3_EncoderInterfaceConfig_1:
        LD        A, S:?b1
        DEC       A
        JRNE      L:??TIM3_EncoderInterfaceConfig_2
        BSET      L:0x528b, #0x5
        JRA       L:??TIM3_EncoderInterfaceConfig_3
??TIM3_EncoderInterfaceConfig_2:
        BRES      L:0x528b, #0x5
??TIM3_EncoderInterfaceConfig_3:
        LD        A, S:?b4
        LD        L:0x5282, A
        LD        A, S:?b3
        LD        L:0x5289, A
        LD        A, S:?b2
        LD        L:0x528a, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_SelectHallSensor:
        TNZ       A
        JREQ      L:??TIM3_SelectHallSensor_0
        BSET      L:0x5281, #0x7
        RETF
??TIM3_SelectHallSensor_0:
        BRES      L:0x5281, #0x7
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 1 350 bytes in section .far_func.text
// 
// 1 350 bytes of CODE memory
//
//Errors: none
//Warnings: none
