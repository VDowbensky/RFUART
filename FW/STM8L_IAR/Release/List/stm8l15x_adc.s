///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:01
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_adc.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW2544.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_adc.c"
//        -e -Ohz --debug --code_model medium --data_model medium -o
//        "D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\Release\Obj"
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\stm8\LIB\dlstm8mmn.h" -D STM8L15X_LD -lcN "D:\Projects\Lab
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
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_adc.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?w1

        PUBLIC ADC_AnalogWatchdogChannelSelect
        PUBLIC ADC_AnalogWatchdogConfig
        PUBLIC ADC_AnalogWatchdogThresholdsConfig
        PUBLIC ADC_ChannelCmd
        PUBLIC ADC_ClearFlag
        PUBLIC ADC_ClearITPendingBit
        PUBLIC ADC_Cmd
        PUBLIC ADC_DMACmd
        PUBLIC ADC_DeInit
        PUBLIC ADC_ExternalTrigConfig
        PUBLIC ADC_GetConversionValue
        PUBLIC ADC_GetFlagStatus
        PUBLIC ADC_GetITStatus
        PUBLIC ADC_ITConfig
        PUBLIC ADC_Init
        PUBLIC ADC_SamplingTimeConfig
        PUBLIC ADC_SchmittTriggerConfig
        PUBLIC ADC_SoftwareStartConv
        PUBLIC ADC_TempSensorCmd
        PUBLIC ADC_VrefintCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_DeInit:
        LDW       Y, X
        CLR       (Y)
        INCW      X
        CLR       (X)
        LDW       X, Y
        INCW      X
        INCW      X
        LD        A, #0x1f
        LD        (X), A
        LD        A, #0xff
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
        LD        A, #0xf
        LDW       X, Y
        ADDW      X, #0x6
        LD        (X), A
        LD        A, #0xff
        LDW       X, Y
        ADDW      X, #0x7
        LD        (X), A
        LDW       X, Y
        ADDW      X, #0x8
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x9
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0xa
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0xb
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0xc
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0xd
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0xe
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0xf
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x10
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x11
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_Init:
        LD        S:?b2, A
        LD        A, (X)
        AND       A, #0x9b
        LD        (X), A
        LD        A, S:?b0
        OR        A, S:?b2
        OR        A, (X)
        LD        (X), A
        INCW      X
        LD        A, (X)
        AND       A, #0x7f
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b1
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_Cmd:
        TNZ       A
        JREQ      L:??ADC_Cmd_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??ADC_Cmd_1
??ADC_Cmd_0:
        LD        A, (X)
        AND       A, #0xfe
??ADC_Cmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_SoftwareStartConv:
        LD        A, (X)
        OR        A, #0x2
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_ExternalTrigConfig:
        LD        S:?b1, A
        INCW      X
        LD        A, (X)
        AND       A, #0x87
        LD        (X), A
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, (X)
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_AnalogWatchdogChannelSelect:
        LD        S:?b0, A
        INCW      X
        INCW      X
        LD        A, (X)
        AND       A, #0xe0
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_AnalogWatchdogThresholdsConfig:
        LD        A, YH
        ADDW      X, #0x6
        LD        (X), A
        INCW      X
        EXG       A, YL
        LD        (X), A
        INCW      X
        LD        A, S:?b0
        LD        (X), A
        INCW      X
        LD        A, S:?b1
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_AnalogWatchdogConfig:
        LDW       S:?w1, X
        LD        S:?b4, A
        INCW      X
        INCW      X
        LD        A, (X)
        AND       A, #0xe0
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b4
        LD        (X), A
        LD        A, YH
        LDW       X, S:?w1
        ADDW      X, #0x6
        LD        (X), A
        EXG       A, YL
        LDW       X, S:?w1
        ADDW      X, #0x7
        LD        (X), A
        LD        A, S:?b0
        LDW       X, S:?w1
        ADDW      X, #0x8
        LD        (X), A
        LD        A, S:?b1
        LDW       X, S:?w1
        ADDW      X, #0x9
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_TempSensorCmd:
        TNZ       A
        JREQ      L:??ADC_TempSensorCmd_0
        BSET      L:0x534e, #0x5
        RETF
??ADC_TempSensorCmd_0:
        BRES      L:0x534e, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_VrefintCmd:
        TNZ       A
        JREQ      L:??ADC_VrefintCmd_0
        BSET      L:0x534e, #0x4
        RETF
??ADC_VrefintCmd_0:
        BRES      L:0x534e, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_ChannelCmd:
        SUB       SP, #0x1
        LDW       S:?w1, X
        LD        S:?b0, A
        CLR       (0x1,SP)
        LD        A, YH
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w1
        ADDW      X, #0xa
        TNZ       S:?b0
        EXG       A, YL
        JREQ      L:??ADC_ChannelCmd_0
        OR        A, (X)
        JRA       ??ADC_ChannelCmd_1
??ADC_ChannelCmd_0:
        CPL       A
        AND       A, (X)
??ADC_ChannelCmd_1:
        LD        (X), A
        ADD       SP, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_SamplingTimeConfig:
        TNZ       A
        JREQ      L:??ADC_SamplingTimeConfig_0
        INCW      X
        INCW      X
        LD        A, (X)
        AND       A, #0x1f
        LD        (X), A
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        SLL       A
        OR        A, (X)
        JRA       ??ADC_SamplingTimeConfig_1
??ADC_SamplingTimeConfig_0:
        INCW      X
        LD        A, (X)
        AND       A, #0xf8
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b0
??ADC_SamplingTimeConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_SchmittTriggerConfig:
        SUB       SP, #0x1
        LDW       S:?w1, X
        LD        S:?b0, A
        CLR       (0x1,SP)
        LD        A, YH
        CLRW      X
        LD        XL, A
        ADDW      X, S:?w1
        ADDW      X, #0xe
        TNZ       S:?b0
        EXG       A, YL
        JREQ      L:??ADC_SchmittTriggerConfig_0
        CPL       A
        AND       A, (X)
        JRA       ??ADC_SchmittTriggerConfig_1
??ADC_SchmittTriggerConfig_0:
        OR        A, (X)
??ADC_SchmittTriggerConfig_1:
        LD        (X), A
        ADD       SP, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_GetConversionValue:
        EXGW      X, Y
        LDW       X, Y
        ADDW      X, #0x4
        LD        A, (X)
        EXGW      X, Y
        LD        S:?b0, A
        ADDW      X, #0x5
        LD        A, (X)
        LD        S:?b1, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        OR        A, S:?b1
        RLWA      X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_DMACmd:
        ADDW      X, #0xa
        TNZ       A
        JREQ      L:??ADC_DMACmd_0
        LD        A, (X)
        AND       A, #0x7f
        JRA       ??ADC_DMACmd_1
??ADC_DMACmd_0:
        LD        A, (X)
        OR        A, #0x80
??ADC_DMACmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_ITConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??ADC_ITConfig_0
        LD        A, (X)
        OR        A, S:?b1
        JRA       ??ADC_ITConfig_1
??ADC_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
??ADC_ITConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b0
        ADDW      X, #0x3
        LD        A, (X)
        BCP       A, S:?b1
        JREQ      L:??ADC_GetFlagStatus_0
        MOV       S:?b0, #0x1
??ADC_GetFlagStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_ClearFlag:
        CPL       A
        ADDW      X, #0x3
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_GetITStatus:
        LD        S:?b1, A
        CLR       S:?b0
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b2, A
        LD        A, (X)
        AND       A, S:?b1
        LD        S:?b1, A
        LD        A, S:?b2
        AND       A, #0x10
        SRA       A
        SRA       A
        LD        S:?b3, A
        LD        A, S:?b2
        AND       A, #0x3
        OR        A, S:?b3
        ADDW      X, #0x3
        BCP       A, (X)
        JREQ      L:??ADC_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??ADC_GetITStatus_0
        MOV       S:?b0, #0x1
??ADC_GetITStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC_ClearITPendingBit:
        SRL       A
        SRL       A
        SRL       A
        LD        S:?b0, A
        SRL       A
        SRL       A
        AND       A, #0x4
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0x3
        OR        A, S:?b1
        CPL       A
        ADDW      X, #0x3
        LD        (X), A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 486 bytes in section .far_func.text
// 
// 486 bytes of CODE memory
//
//Errors: none
//Warnings: none
