///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:16
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim4.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC413.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim4.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_tim4.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3

        PUBLIC TIM4_ARRPreloadConfig
        PUBLIC TIM4_ClearFlag
        PUBLIC TIM4_ClearITPendingBit
        PUBLIC TIM4_Cmd
        PUBLIC TIM4_DMACmd
        PUBLIC TIM4_DeInit
        PUBLIC TIM4_GenerateEvent
        PUBLIC TIM4_GetCounter
        PUBLIC TIM4_GetFlagStatus
        PUBLIC TIM4_GetITStatus
        PUBLIC TIM4_GetPrescaler
        PUBLIC TIM4_ITConfig
        PUBLIC TIM4_InternalClockConfig
        PUBLIC TIM4_PrescalerConfig
        PUBLIC TIM4_SelectInputTrigger
        PUBLIC TIM4_SelectMasterSlaveMode
        PUBLIC TIM4_SelectOnePulseMode
        PUBLIC TIM4_SelectOutputTrigger
        PUBLIC TIM4_SelectSlaveMode
        PUBLIC TIM4_SetAutoreload
        PUBLIC TIM4_SetCounter
        PUBLIC TIM4_TimeBaseInit
        PUBLIC TIM4_UpdateDisableConfig
        PUBLIC TIM4_UpdateRequestConfig


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_DeInit:
        CLR       L:0x52e0
        CLR       L:0x52e1
        CLR       L:0x52e2
        CLR       L:0x52e4
        CLR       L:0x52e7
        CLR       L:0x52e8
        MOV       L:0x52e9, #0xff
        CLR       L:0x52e5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_TimeBaseInit:
        LD        S:?b1, A
        LD        A, S:?b0
        LD        L:0x52e9, A
        LD        A, S:?b1
        LD        L:0x52e8, A
        MOV       L:0x52e6, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_PrescalerConfig:
        LD        L:0x52e8, A
        LD        A, S:?b0
        DEC       A
        JRNE      L:??TIM4_PrescalerConfig_0
        BSET      L:0x52e6, #0x0
        RETF
??TIM4_PrescalerConfig_0:
        BRES      L:0x52e6, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SetCounter:
        LD        L:0x52e7, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SetAutoreload:
        LD        L:0x52e9, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_GetCounter:
        LD        A, L:0x52e7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_GetPrescaler:
        LD        A, L:0x52e8
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM4_UpdateDisableConfig_0
        BSET      L:0x52e0, #0x1
        RETF
??TIM4_UpdateDisableConfig_0:
        BRES      L:0x52e0, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_UpdateRequestConfig:
        DEC       A
        JRNE      L:??TIM4_UpdateRequestConfig_0
        BSET      L:0x52e0, #0x2
        RETF
??TIM4_UpdateRequestConfig_0:
        BRES      L:0x52e0, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM4_ARRPreloadConfig_0
        BSET      L:0x52e0, #0x7
        RETF
??TIM4_ARRPreloadConfig_0:
        BRES      L:0x52e0, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SelectOnePulseMode:
        DEC       A
        JRNE      L:??TIM4_SelectOnePulseMode_0
        BSET      L:0x52e0, #0x3
        RETF
??TIM4_SelectOnePulseMode_0:
        BRES      L:0x52e0, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_Cmd:
        TNZ       A
        JREQ      L:??TIM4_Cmd_0
        BSET      L:0x52e0, #0x0
        RETF
??TIM4_Cmd_0:
        BRES      L:0x52e0, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_ITConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??TIM4_ITConfig_0
        LD        A, L:0x52e4
        OR        A, S:?b1
        JRA       ??TIM4_ITConfig_1
??TIM4_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x52e4
??TIM4_ITConfig_1:
        LD        L:0x52e4, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_GenerateEvent:
        LD        S:?b0, A
        LD        A, L:0x52e6
        OR        A, S:?b0
        LD        L:0x52e6, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b0
        LD        A, L:0x52e5
        BCP       A, S:?b1
        JREQ      L:??TIM4_GetFlagStatus_0
        MOV       S:?b0, #0x1
??TIM4_GetFlagStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_ClearFlag:
        CPL       A
        LD        L:0x52e5, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_GetITStatus:
        LD        S:?b2, A
        CLR       S:?b0
        MOV       S:?b3, L:0x52e5
        LD        A, L:0x52e4
        AND       A, S:?b2
        LD        S:?b1, A
        LD        A, S:?b2
        BCP       A, S:?b3
        JREQ      L:??TIM4_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??TIM4_GetITStatus_0
        MOV       S:?b0, #0x1
??TIM4_GetITStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_ClearITPendingBit:
        CPL       A
        LD        L:0x52e5, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_DMACmd:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??TIM4_DMACmd_0
        LD        A, L:0x52e3
        OR        A, S:?b1
        JRA       ??TIM4_DMACmd_1
??TIM4_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x52e3
??TIM4_DMACmd_1:
        LD        L:0x52e3, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_InternalClockConfig:
        LD        A, L:0x52e2
        AND       A, #0xf8
        LD        L:0x52e2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SelectInputTrigger:
        LD        S:?b0, A
        LD        A, L:0x52e2
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x52e2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SelectOutputTrigger:
        LD        S:?b0, A
        LD        A, L:0x52e1
        AND       A, #0x8f
        OR        A, S:?b0
        LD        L:0x52e1, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SelectSlaveMode:
        LD        S:?b0, A
        LD        A, L:0x52e2
        AND       A, #0xf8
        OR        A, S:?b0
        LD        L:0x52e2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_SelectMasterSlaveMode:
        TNZ       A
        JREQ      L:??TIM4_SelectMasterSlaveMode_0
        BSET      L:0x52e2, #0x7
        RETF
??TIM4_SelectMasterSlaveMode_0:
        BRES      L:0x52e2, #0x7
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 330 bytes in section .far_func.text
// 
// 330 bytes of CODE memory
//
//Errors: none
//Warnings: none
