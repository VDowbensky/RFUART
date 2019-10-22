///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:16
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim2.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC2A9.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim2.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_tim2.s
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

        PUBLIC TIM2_ARRPreloadConfig
        PUBLIC TIM2_BKRConfig
        PUBLIC TIM2_CCxCmd
        PUBLIC TIM2_ClearFlag
        PUBLIC TIM2_ClearITPendingBit
        PUBLIC TIM2_Cmd
        PUBLIC TIM2_CounterModeConfig
        PUBLIC TIM2_CtrlPWMOutputs
        PUBLIC TIM2_DMACmd
        PUBLIC TIM2_DeInit
        PUBLIC TIM2_ETRClockMode1Config
        PUBLIC TIM2_ETRClockMode2Config
        PUBLIC TIM2_ETRConfig
        PUBLIC TIM2_EncoderInterfaceConfig
        PUBLIC TIM2_ForcedOC1Config
        PUBLIC TIM2_ForcedOC2Config
        PUBLIC TIM2_GenerateEvent
        PUBLIC TIM2_GetCapture1
        PUBLIC TIM2_GetCapture2
        PUBLIC TIM2_GetCounter
        PUBLIC TIM2_GetFlagStatus
        PUBLIC TIM2_GetITStatus
        PUBLIC TIM2_GetPrescaler
        PUBLIC TIM2_ICInit
        PUBLIC TIM2_ITConfig
        PUBLIC TIM2_InternalClockConfig
        PUBLIC TIM2_OC1FastConfig
        PUBLIC TIM2_OC1Init
        PUBLIC TIM2_OC1PolarityConfig
        PUBLIC TIM2_OC1PreloadConfig
        PUBLIC TIM2_OC2FastConfig
        PUBLIC TIM2_OC2Init
        PUBLIC TIM2_OC2PolarityConfig
        PUBLIC TIM2_OC2PreloadConfig
        PUBLIC TIM2_PWMIConfig
        PUBLIC TIM2_PrescalerConfig
        PUBLIC TIM2_SelectCCDMA
        PUBLIC TIM2_SelectHallSensor
        PUBLIC TIM2_SelectInputTrigger
        PUBLIC TIM2_SelectMasterSlaveMode
        PUBLIC TIM2_SelectOCxM
        PUBLIC TIM2_SelectOnePulseMode
        PUBLIC TIM2_SelectOutputTrigger
        PUBLIC TIM2_SelectSlaveMode
        PUBLIC TIM2_SetAutoreload
        PUBLIC TIM2_SetCompare1
        PUBLIC TIM2_SetCompare2
        PUBLIC TIM2_SetCounter
        PUBLIC TIM2_SetIC1Prescaler
        PUBLIC TIM2_SetIC2Prescaler
        PUBLIC TIM2_TIxExternalClockConfig
        PUBLIC TIM2_TimeBaseInit
        PUBLIC TIM2_UpdateDisableConfig
        PUBLIC TIM2_UpdateRequestConfig


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_DeInit:
        CLR       L:0x5250
        CLR       L:0x5251
        CLR       L:0x5252
        CLR       L:0x5253
        CLR       L:0x5255
        CLR       L:0x5257
        CLR       L:0x525b
        MOV       L:0x5259, #0x1
        MOV       L:0x525a, #0x1
        CLR       L:0x525b
        CLR       L:0x5259
        CLR       L:0x525a
        CLR       L:0x525c
        CLR       L:0x525d
        CLR       L:0x525e
        MOV       L:0x525f, #0xff
        MOV       L:0x5260, #0xff
        CLR       L:0x5261
        CLR       L:0x5262
        CLR       L:0x5263
        CLR       L:0x5264
        CLR       L:0x5266
        MOV       L:0x5258, #0x1
        CLR       L:0x5265
        CLR       L:0x5256
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_TimeBaseInit:
        LD        S:?b1, A
        LD        A, XH
        LD        L:0x525f, A
        LD        A, XL
        LD        L:0x5260, A
        LD        A, S:?b1
        LD        L:0x525e, A
        LD        A, L:0x5250
        AND       A, #0x8f
        LD        L:0x5250, A
        LD        A, L:0x5250
        OR        A, S:?b0
        LD        L:0x5250, A
        MOV       L:0x5258, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_PrescalerConfig:
        LD        L:0x525e, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM2_PrescalerConfig_0
        BSET      L:0x5258, #0x0
        RETF
??TIM2_PrescalerConfig_0:
        BRES      L:0x5258, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_CounterModeConfig:
        LD        S:?b0, A
        LD        A, L:0x5250
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5250, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SetCounter:
        LD        A, XH
        LD        L:0x525c, A
        LD        A, XL
        LD        L:0x525d, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SetAutoreload:
        LD        A, XH
        LD        L:0x525f, A
        LD        A, XL
        LD        L:0x5260, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_GetCounter:
        LD        A, L:0x525c
        MOV       S:?b0, L:0x525d
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
TIM2_GetPrescaler:
        LD        A, L:0x525e
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM2_UpdateDisableConfig_0
        BSET      L:0x5250, #0x1
        RETF
??TIM2_UpdateDisableConfig_0:
        BRES      L:0x5250, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_UpdateRequestConfig:
        DEC       A
        JRNE      L:??TIM2_UpdateRequestConfig_0
        BSET      L:0x5250, #0x2
        RETF
??TIM2_UpdateRequestConfig_0:
        BRES      L:0x5250, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_ARRPreloadConfig_0
        BSET      L:0x5250, #0x7
        RETF
??TIM2_ARRPreloadConfig_0:
        BRES      L:0x5250, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectOnePulseMode:
        DEC       A
        JRNE      L:??TIM2_SelectOnePulseMode_0
        BSET      L:0x5250, #0x3
        RETF
??TIM2_SelectOnePulseMode_0:
        BRES      L:0x5250, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_Cmd:
        TNZ       A
        JREQ      L:??TIM2_Cmd_0
        BSET      L:0x5250, #0x0
        RETF
??TIM2_Cmd_0:
        BRES      L:0x5250, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC1Init:
        LD        S:?b3, A
        LD        A, L:0x5259
        BRES      L:0x525b, #0x0
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x5259, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM2_OC1Init_0
        BSET      L:0x525b, #0x0
        JRA       L:??TIM2_OC1Init_1
??TIM2_OC1Init_0:
        BRES      L:0x525b, #0x0
??TIM2_OC1Init_1:
        LD        A, S:?b1
        DEC       A
        JRNE      L:??TIM2_OC1Init_2
        BSET      L:0x525b, #0x1
        JRA       L:??TIM2_OC1Init_3
??TIM2_OC1Init_2:
        BRES      L:0x525b, #0x1
??TIM2_OC1Init_3:
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TIM2_OC1Init_4
        BSET      L:0x5266, #0x0
        JRA       L:??TIM2_OC1Init_5
??TIM2_OC1Init_4:
        BRES      L:0x5266, #0x0
??TIM2_OC1Init_5:
        LD        A, XH
        LD        L:0x5261, A
        LD        A, XL
        LD        L:0x5262, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC2Init:
        LD        S:?b3, A
        LD        A, L:0x525a
        BRES      L:0x525b, #0x4
        AND       A, #0x8f
        OR        A, S:?b3
        LD        L:0x525a, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM2_OC2Init_0
        BSET      L:0x525b, #0x4
        JRA       L:??TIM2_OC2Init_1
??TIM2_OC2Init_0:
        BRES      L:0x525b, #0x4
??TIM2_OC2Init_1:
        LD        A, S:?b1
        DEC       A
        JRNE      L:??TIM2_OC2Init_2
        BSET      L:0x525b, #0x5
        JRA       L:??TIM2_OC2Init_3
??TIM2_OC2Init_2:
        BRES      L:0x525b, #0x5
??TIM2_OC2Init_3:
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TIM2_OC2Init_4
        BSET      L:0x5266, #0x2
        JRA       L:??TIM2_OC2Init_5
??TIM2_OC2Init_4:
        BRES      L:0x5266, #0x2
??TIM2_OC2Init_5:
        LD        A, XH
        LD        L:0x5263, A
        LD        A, XL
        LD        L:0x5264, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_BKRConfig:
        LD        S:?b4, A
        LD        A, S:?b0
        OR        A, S:?b4
        OR        A, S:?b1
        OR        A, S:?b2
        OR        A, S:?b3
        LD        L:0x5265, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_CtrlPWMOutputs:
        TNZ       A
        JREQ      L:??TIM2_CtrlPWMOutputs_0
        BSET      L:0x5265, #0x7
        RETF
??TIM2_CtrlPWMOutputs_0:
        BRES      L:0x5265, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectOCxM:
        TNZ       A
        JRNE      L:??TIM2_SelectOCxM_0
        BRES      L:0x525b, #0x0
        LD        A, L:0x5259
        AND       A, #0x8f
        LD        L:0x5259, A
        LD        A, L:0x5259
        OR        A, S:?b0
        LD        L:0x5259, A
        RETF
??TIM2_SelectOCxM_0:
        BRES      L:0x525b, #0x4
        LD        A, L:0x525a
        AND       A, #0x8f
        LD        L:0x525a, A
        LD        A, L:0x525a
        OR        A, S:?b0
        LD        L:0x525a, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SetCompare1:
        LD        A, XH
        LD        L:0x5261, A
        LD        A, XL
        LD        L:0x5262, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SetCompare2:
        LD        A, XH
        LD        L:0x5263, A
        LD        A, XL
        LD        L:0x5264, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ForcedOC1Config:
        LD        S:?b0, A
        LD        A, L:0x5259
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5259, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ForcedOC2Config:
        LD        S:?b0, A
        LD        A, L:0x525a
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x525a, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC1PreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_OC1PreloadConfig_0
        BSET      L:0x5259, #0x3
        RETF
??TIM2_OC1PreloadConfig_0:
        BRES      L:0x5259, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC2PreloadConfig:
        TNZ       A
        JREQ      L:??TIM2_OC2PreloadConfig_0
        BSET      L:0x525a, #0x3
        RETF
??TIM2_OC2PreloadConfig_0:
        BRES      L:0x525a, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC1FastConfig:
        TNZ       A
        JREQ      L:??TIM2_OC1FastConfig_0
        BSET      L:0x5259, #0x2
        RETF
??TIM2_OC1FastConfig_0:
        BRES      L:0x5259, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC2FastConfig:
        TNZ       A
        JREQ      L:??TIM2_OC2FastConfig_0
        BSET      L:0x525a, #0x2
        RETF
??TIM2_OC2FastConfig_0:
        BRES      L:0x525a, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC1PolarityConfig:
        DEC       A
        JRNE      L:??TIM2_OC1PolarityConfig_0
        BSET      L:0x525b, #0x1
        RETF
??TIM2_OC1PolarityConfig_0:
        BRES      L:0x525b, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_OC2PolarityConfig:
        DEC       A
        JRNE      L:??TIM2_OC2PolarityConfig_0
        BSET      L:0x525b, #0x5
        RETF
??TIM2_OC2PolarityConfig_0:
        BRES      L:0x525b, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_CCxCmd:
        TNZ       A
        JRNE      L:??TIM2_CCxCmd_0
        TNZ       S:?b0
        JREQ      L:??TIM2_CCxCmd_1
        BSET      L:0x525b, #0x0
        RETF
??TIM2_CCxCmd_1:
        BRES      L:0x525b, #0x0
        RETF
??TIM2_CCxCmd_0:
        TNZ       S:?b0
        JREQ      L:??TIM2_CCxCmd_2
        BSET      L:0x525b, #0x4
        RETF
??TIM2_CCxCmd_2:
        BRES      L:0x525b, #0x4
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM2_SetIC2Prescaler:
        LD        S:?b0, A
        LD        A, L:0x525a
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x525a, A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TI2_Config:
        LD        S:?b2, A
        LD        A, L:0x525a
        BRES      L:0x525b, #0x4
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        LD        L:0x525a, A
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TI2_Config_0
        BSET      L:0x525b, #0x5
        JRA       L:??TI2_Config_1
??TI2_Config_0:
        BRES      L:0x525b, #0x5
??TI2_Config_1:
        BSET      L:0x525b, #0x4
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM2_SetIC1Prescaler:
        LD        S:?b0, A
        LD        A, L:0x5259
        AND       A, #0xf3
        OR        A, S:?b0
        LD        L:0x5259, A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TI1_Config:
        LD        S:?b2, A
        LD        A, L:0x5259
        BRES      L:0x525b, #0x0
        CALLF     ?Subroutine1
??CrossCallReturnLabel_4:
        LD        L:0x5259, A
        LD        A, S:?b2
        DEC       A
        JRNE      L:??TI1_Config_0
        BSET      L:0x525b, #0x1
        JRA       L:??TI1_Config_1
??TI1_Config_0:
        BRES      L:0x525b, #0x1
??TI1_Config_1:
        BSET      L:0x525b, #0x0
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
TIM2_ICInit:
        MOV       S:?b4, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b5, S:?b2
        MOV       S:?b1, S:?b3
        TNZ       A
        JRNE      L:??TIM2_ICInit_0
        LD        A, S:?b4
        CALLF     TI1_Config
        LD        A, S:?b5
        JPF       TIM2_SetIC1Prescaler
??TIM2_ICInit_0:
        LD        A, S:?b4
        CALLF     TI2_Config
        LD        A, S:?b5
        JPF       TIM2_SetIC2Prescaler

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
TIM2_PWMIConfig:
        PUSH      S:?b8
        LD        S:?b7, A
        MOV       S:?b6, S:?b0
        MOV       S:?b0, S:?b1
        MOV       S:?b8, S:?b2
        CLR       S:?b4
        MOV       S:?b5, #0x1
        TNZ       S:?b6
        JRNE      L:??TIM2_PWMIConfig_0
        MOV       S:?b4, #0x1
??TIM2_PWMIConfig_0:
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM2_PWMIConfig_1
        MOV       S:?b5, #0x2
??TIM2_PWMIConfig_1:
        TNZ       S:?b7
        MOV       S:?b1, S:?b3
        JRNE      L:??TIM2_PWMIConfig_2
        LD        A, S:?b6
        CALLF     ?Subroutine2
??CrossCallReturnLabel_6:
        MOV       S:?b1, S:?b3
        MOV       S:?b0, S:?b5
        LD        A, S:?b4
        CALLF     ?Subroutine3
??CrossCallReturnLabel_8:
        JRA       L:??CrossCallReturnLabel_5
??TIM2_PWMIConfig_2:
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
        JPF       TIM2_SetIC2Prescaler

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALLF     TI1_Config
        LD        A, S:?b8
        JPF       TIM2_SetIC1Prescaler

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_GetCapture1:
        LD        A, L:0x5261
        MOV       S:?b0, L:0x5262
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_GetCapture2:
        LD        A, L:0x5263
        MOV       S:?b0, L:0x5264
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ITConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??TIM2_ITConfig_0
        LD        A, L:0x5255
        OR        A, S:?b1
        JRA       ??TIM2_ITConfig_1
??TIM2_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5255
??TIM2_ITConfig_1:
        LD        L:0x5255, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_GenerateEvent:
        LD        S:?b0, A
        LD        A, L:0x5258
        OR        A, S:?b0
        LD        L:0x5258, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_GetFlagStatus:
        CLR       S:?b0
        MOV       S:?b2, L:0x5256
        MOV       S:?b1, L:0x5257
        LD        A, XH
        AND       A, S:?b1
        PUSH      A
        LD        A, XL
        AND       A, S:?b2
        LD        S:?b2, A
        POP       A
        OR        A, S:?b2
        JREQ      L:??TIM2_GetFlagStatus_0
        MOV       S:?b0, #0x1
??TIM2_GetFlagStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x5256, A
        LD        A, XH
        CPL       A
        LD        L:0x5257, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_GetITStatus:
        LD        S:?b2, A
        CLR       S:?b0
        MOV       S:?b3, L:0x5256
        LD        A, L:0x5255
        AND       A, S:?b2
        LD        S:?b1, A
        LD        A, S:?b2
        BCP       A, S:?b3
        JREQ      L:??TIM2_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM2_GetITStatus_0
        MOV       S:?b0, #0x1
??TIM2_GetITStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ClearITPendingBit:
        CPL       A
        LD        L:0x5256, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_DMACmd:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??TIM2_DMACmd_0
        LD        A, L:0x5254
        OR        A, S:?b1
        JRA       ??TIM2_DMACmd_1
??TIM2_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5254
??TIM2_DMACmd_1:
        LD        L:0x5254, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectCCDMA:
        TNZ       A
        JREQ      L:??TIM2_SelectCCDMA_0
        BSET      L:0x5251, #0x3
        RETF
??TIM2_SelectCCDMA_0:
        BRES      L:0x5251, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_InternalClockConfig:
        LD        A, L:0x5252
        AND       A, #0xf8
        LD        L:0x5252, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_TIxExternalClockConfig:
        LD        S:?b3, A
        MOV       S:?b2, S:?b0
        CP        A, #0x60
        MOV       S:?b0, #0x1
        JRNE      L:??TIM2_TIxExternalClockConfig_0
        LD        A, S:?b2
        CALLF     TI2_Config
        JRA       L:??TIM2_TIxExternalClockConfig_1
??TIM2_TIxExternalClockConfig_0:
        LD        A, S:?b2
        CALLF     TI1_Config
??TIM2_TIxExternalClockConfig_1:
        LD        A, S:?b3
        CALLF     TIM2_SelectInputTrigger
        LD        A, L:0x5252
        OR        A, #0x7
        LD        L:0x5252, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ETRClockMode1Config:
        CALLF     TIM2_ETRConfig
        LD        A, L:0x5252
        AND       A, #0xf8
        LD        L:0x5252, A
        LD        A, L:0x5252
        OR        A, #0x7
        LD        L:0x5252, A
        LD        A, L:0x5252
        AND       A, #0x8f
        LD        L:0x5252, A
        LD        A, L:0x5252
        OR        A, #0x70
        LD        L:0x5252, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ETRClockMode2Config:
        CALLF     TIM2_ETRConfig
        BSET      L:0x5253, #0x6
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectInputTrigger:
        LD        S:?b0, A
        LD        A, L:0x5252
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5252, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectOutputTrigger:
        LD        S:?b0, A
        LD        A, L:0x5251
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x5251, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectSlaveMode:
        LD        S:?b0, A
        LD        A, L:0x5252
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x5252, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectMasterSlaveMode:
        TNZ       A
        JREQ      L:??TIM2_SelectMasterSlaveMode_0
        BSET      L:0x5252, #0x7
        RETF
??TIM2_SelectMasterSlaveMode_0:
        BRES      L:0x5252, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_ETRConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, S:?b1
        OR        A, L:0x5253
        LD        L:0x5253, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_EncoderInterfaceConfig:
        LD        S:?b4, A
        LD        A, L:0x5252
        MOV       S:?b3, L:0x5259
        MOV       S:?b2, L:0x525a
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
        JRNE      L:??TIM2_EncoderInterfaceConfig_0
        BSET      L:0x525b, #0x1
        JRA       L:??TIM2_EncoderInterfaceConfig_1
??TIM2_EncoderInterfaceConfig_0:
        BRES      L:0x525b, #0x1
??TIM2_EncoderInterfaceConfig_1:
        LD        A, S:?b1
        DEC       A
        JRNE      L:??TIM2_EncoderInterfaceConfig_2
        BSET      L:0x525b, #0x5
        JRA       L:??TIM2_EncoderInterfaceConfig_3
??TIM2_EncoderInterfaceConfig_2:
        BRES      L:0x525b, #0x5
??TIM2_EncoderInterfaceConfig_3:
        LD        A, S:?b4
        LD        L:0x5252, A
        LD        A, S:?b3
        LD        L:0x5259, A
        LD        A, S:?b2
        LD        L:0x525a, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_SelectHallSensor:
        TNZ       A
        JREQ      L:??TIM2_SelectHallSensor_0
        BSET      L:0x5251, #0x7
        RETF
??TIM2_SelectHallSensor_0:
        BRES      L:0x5251, #0x7
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
