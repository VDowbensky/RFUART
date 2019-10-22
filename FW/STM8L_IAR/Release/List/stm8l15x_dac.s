///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:02
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_dac.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW2950.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_dac.c"
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_dac.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?sll16_x_x_a
        EXTERN ?sra16_x_x_a
        EXTERN ?w0
        EXTERN ?w1

        PUBLIC DAC_ClearFlag
        PUBLIC DAC_ClearITPendingBit
        PUBLIC DAC_Cmd
        PUBLIC DAC_DMACmd
        PUBLIC DAC_DeInit
        PUBLIC DAC_DualSoftwareTriggerCmd
        PUBLIC DAC_GetDataOutputValue
        PUBLIC DAC_GetFlagStatus
        PUBLIC DAC_GetITStatus
        PUBLIC DAC_ITConfig
        PUBLIC DAC_Init
        PUBLIC DAC_SetChannel1Data
        PUBLIC DAC_SetChannel2Data
        PUBLIC DAC_SetDualChannelData
        PUBLIC DAC_SetNoiseWaveLFSR
        PUBLIC DAC_SetTriangleWaveAmplitude
        PUBLIC DAC_SoftwareTriggerCmd
        PUBLIC DAC_WaveGenerationCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_DeInit:
        CLR       L:0x5380
        CLR       L:0x5381
        CLR       L:0x5382
        CLR       L:0x5383
        CLR       L:0x5384
        MOV       L:0x5385, #0xff
        CLR       L:0x5388
        CLR       L:0x5389
        CLR       L:0x538c
        CLR       L:0x538d
        CLR       L:0x5390
        CLR       L:0x5394
        CLR       L:0x5395
        CLR       L:0x5398
        CLR       L:0x5399
        CLR       L:0x539c
        CLR       L:0x53a0
        CLR       L:0x53a1
        CLR       L:0x53a2
        CLR       L:0x53a3
        CLR       L:0x53a4
        CLR       L:0x53a5
        CLR       L:0x53a6
        CLR       L:0x53a7
        CLR       L:0x53a8
        CLR       L:0x53a9
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_Init:
        CALLF     ?Subroutine2
??CrossCallReturnLabel_5:
        AND       A, #0xc1
        OR        A, S:?b1
        LD        S:?b1, A
        LD        A, S:?b0
        CP        A, #0x30
        JREQ      L:??DAC_Init_0
        OR        A, #0x4
        OR        A, S:?b1
        LD        S:?b1, A
??DAC_Init_0:
        LD        A, S:?b1
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5380
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_Cmd:
        CALLF     ?Subroutine2
??CrossCallReturnLabel_4:
        TNZ       S:?b0
        JREQ      L:??DAC_Cmd_0
        OR        A, #0x1
        JRA       ??DAC_Cmd_1
??DAC_Cmd_0:
        AND       A, #0xfe
??DAC_Cmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_SoftwareTriggerCmd:
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??DAC_SoftwareTriggerCmd_0
        LD        A, L:0x5384
        OR        A, S:?b1
        JRA       ??DAC_SoftwareTriggerCmd_1
??DAC_SoftwareTriggerCmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5384
??DAC_SoftwareTriggerCmd_1:
        LD        L:0x5384, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_DualSoftwareTriggerCmd:
        TNZ       A
        JREQ      L:??DAC_DualSoftwareTriggerCmd_0
        LD        A, L:0x5384
        OR        A, #0x3
        JRA       ??DAC_DualSoftwareTriggerCmd_1
??DAC_DualSoftwareTriggerCmd_0:
        LD        A, L:0x5384
        AND       A, #0xfc
??DAC_DualSoftwareTriggerCmd_1:
        LD        L:0x5384, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_WaveGenerationCmd:
        CALLF     ?Subroutine2
??CrossCallReturnLabel_6:
        AND       A, #0x3f
        LD        S:?b2, A
        TNZ       S:?b1
        JREQ      L:??DAC_WaveGenerationCmd_0
        LD        A, S:?b0
        OR        A, S:?b2
        LD        S:?b2, A
??DAC_WaveGenerationCmd_0:
        LD        A, S:?b2
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_SetNoiseWaveLFSR:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        CALLF     ?Subroutine3
??CrossCallReturnLabel_7:
        AND       A, #0xf0
        OR        A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_SetTriangleWaveAmplitude:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_SetChannel1Data:
        LDW       S:?w0, X
        CP        A, #0x8
        JREQ      L:??DAC_SetChannel1Data_0
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        EXGW      X, Y
        LDW       X, Y
        ADDW      X, #0x5388
        LD        (X), A
        EXGW      X, Y
        ADDW      X, #0x5389
        LD        A, S:?b1
        LD        (X), A
        RETF
??DAC_SetChannel1Data_0:
        LD        A, S:?b1
        LD        L:0x5390, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_SetChannel2Data:
        LDW       S:?w0, X
        CP        A, #0x8
        JREQ      L:??DAC_SetChannel2Data_0
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        EXGW      X, Y
        LDW       X, Y
        ADDW      X, #0x5394
        LD        (X), A
        EXGW      X, Y
        ADDW      X, #0x5395
        LD        A, S:?b1
        LD        (X), A
        RETF
??DAC_SetChannel2Data_0:
        LD        A, S:?b1
        LD        L:0x539c, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_SetDualChannelData:
        LDW       S:?w0, X
        CP        A, #0x8
        JREQ      L:??DAC_SetDualChannelData_0
        CLRW      X
        LD        XL, A
        ADDW      X, #0x53a0
        LDW       S:?w1, X
        LD        A, YH
        LD        (X), A
        INCW      X
        EXG       A, YL
        LD        (X), A
        LD        A, S:?b0
        LDW       X, S:?w1
        INCW      X
        INCW      X
        LD        (X), A
        LDW       X, S:?w1
        ADDW      X, #0x3
        LD        A, S:?b1
        LD        (X), A
        RETF
??DAC_SetDualChannelData_0:
        EXG       A, YL
        LD        L:0x53a8, A
        LD        A, S:?b1
        LD        L:0x53a9, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_GetDataOutputValue:
        TNZ       A
        JRNE      L:??DAC_GetDataOutputValue_0
        LD        A, L:0x53ac
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LD        A, L:0x53ad
        JRA       ??DAC_GetDataOutputValue_1
??DAC_GetDataOutputValue_0:
        LD        A, L:0x53b0
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LD        A, L:0x53b1
??DAC_GetDataOutputValue_1:
        LD        S:?b1, A
        RRWA      X, A
        OR        A, S:?b1
        RLWA      X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_DMACmd:
        CALLF     ?Subroutine3
??CrossCallReturnLabel_8:
        TNZ       S:?b0
        JREQ      L:??DAC_DMACmd_0
        OR        A, #0x10
        JRA       ??DAC_DMACmd_1
??DAC_DMACmd_0:
        AND       A, #0xef
??DAC_DMACmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_ITConfig:
        CALLF     ?Subroutine3
??CrossCallReturnLabel_9:
        LD        S:?b2, A
        TNZ       S:?b1
        JREQ      L:??DAC_ITConfig_0
        LD        A, S:?b0
        OR        A, S:?b2
        JRA       ??DAC_ITConfig_1
??DAC_ITConfig_0:
        CPL       S:?b0
        LD        A, S:?b0
        AND       A, S:?b2
??DAC_ITConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b2
        CALLF     ?Subroutine1
??CrossCallReturnLabel_2:
        BCP       A, L:0x5385
        JREQ      L:??DAC_GetFlagStatus_0
        MOV       S:?b2, #0x1
??DAC_GetFlagStatus_0:
        LD        A, S:?b2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, S:?b1
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_ClearFlag:
        LD        S:?b1, A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        CPL       A
        LD        L:0x5385, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_GetITStatus:
        LD        S:?b3, A
        LD        A, S:?b0
        CLR       S:?b2
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b3
        SLL       A
        SLL       A
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5381
        LDW       S:?w0, X
        LD        A, S:?b3
        LDW       X, Y
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        AND       A, [S:?w0.w]
        LD        S:?b0, A
        MOV       S:?b1, L:0x5385
        LD        A, #0x5
        SUB       A, S:?b3
        LDW       X, Y
        CALLF     L:?sra16_x_x_a
        LD        A, XL
        BCP       A, S:?b1
        JREQ      L:??DAC_GetITStatus_0
        TNZ       S:?b0
        JREQ      L:??DAC_GetITStatus_0
        MOV       S:?b2, #0x1
??DAC_GetITStatus_0:
        LD        A, S:?b2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DAC_ClearITPendingBit:
        LD        S:?b1, A
        LD        A, #0x5
        SUB       A, S:?b1
        LD        S:?b1, A
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, S:?b1
        CALLF     L:?sra16_x_x_a
        LD        A, XL
        CPL       A
        LD        L:0x5385, A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 562 bytes in section .far_func.text
// 
// 562 bytes of CODE memory
//
//Errors: none
//Warnings: none
