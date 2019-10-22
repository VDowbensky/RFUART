///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:02
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_i2c.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW2BF5.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_i2c.c"
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_i2c.s
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
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?mul16_x_x_w0
        EXTERN ?mul32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sdiv16_x_x_y
        EXTERN ?sll32_l0_l0_a
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w6
        EXTERN ?w7
        EXTERN CLK_GetClockFreq

        PUBLIC I2C_ARPCmd
        PUBLIC I2C_AckPositionConfig
        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_CalculatePEC
        PUBLIC I2C_CheckEvent
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_Cmd
        PUBLIC I2C_DMACmd
        PUBLIC I2C_DMALastTransferCmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_DualAddressCmd
        PUBLIC I2C_FastModeDutyCycleConfig
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetLastEvent
        PUBLIC I2C_GetPEC
        PUBLIC I2C_ITConfig
        PUBLIC I2C_Init
        PUBLIC I2C_OwnAddress2Config
        PUBLIC I2C_PECPositionConfig
        PUBLIC I2C_ReadRegister
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_SMBusAlertConfig
        PUBLIC I2C_Send7bitAddress
        PUBLIC I2C_SendData
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StretchClockCmd
        PUBLIC I2C_TransmitPEC


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_DeInit:
        LDW       Y, X
        CLR       (Y)
        INCW      X
        CLR       (X)
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x3
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x4
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x5
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
        LD        A, #0x2
        LDW       X, Y
        ADDW      X, #0xd
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_Init:
        CALLF     L:?push_l2
        CALLF     L:?push_l3
        PUSHW     X
        PUSHW     Y
        PUSH      A
        PUSH      S:?b4
        PUSH      S:?b5
        PUSH      S:?b6
        SUB       SP, #0x8
        CALLF     L:?mov_l3_l0
        CLR       (0x2,SP)
        CALLF     CLK_GetClockFreq
        CALLF     L:?udiv32_l0_l0_dl
        DATA
        DC32      0xf4240
        CODE
        LD        A, S:?b3
        LD        (0x1,SP), A
        LDW       X, (0xf,SP)
        INCW      X
        INCW      X
        LD        A, (X)
        AND       A, #0xc0
        LD        (X), A
        LD        A, (0x1,SP)
        OR        A, (X)
        LD        (X), A
        LDW       X, (0xf,SP)
        LD        A, (X)
        AND       A, #0xfe
        LD        (X), A
        LDW       X, (0xf,SP)
        ADDW      X, #0xc
        LDW       (0x5,SP), X
        LD        A, (X)
        AND       A, #0x30
        LD        (X), A
        LDW       X, (0xf,SP)
        ADDW      X, #0xb
        LDW       (0x3,SP), X
        LD        A, (X)
        CLR       (X)
        LD        A, (0x1,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #0x4240
        LDW       S:?w3, X
        LDW       X, #0xf
        LDW       S:?w2, X
        CALLF     L:?mul32_l0_l0_l1
        CALLF     L:?mov_l2_l0
        LDW       X, (0xf,SP)
        ADDW      X, #0xd
        LDW       (0x7,SP), X
        LDW       X, S:?w6
        CPW       X, #0x1
        JRNE      L:??I2C_Init_0
        LDW       X, S:?w7
        CPW       X, #0x86a1
??I2C_Init_0:
        JRC       L:??I2C_Init_1
        LD        A, #0x80
        LD        (0x2,SP), A
        TNZ       (0xb,SP)
        JRNE      L:??I2C_Init_2
        LDW       X, #0x3
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        JRA       L:??I2C_Init_3
??I2C_Init_2:
        LDW       X, #0x19
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        LD        A, #0xc0
        LD        (0x2,SP), A
??I2C_Init_3:
        LDW       X, S:?w2
        JRNE      L:??I2C_Init_4
        LDW       X, S:?w3
??I2C_Init_4:
        JRNE      L:??I2C_Init_5
        CLRW      X
        INCW      X
        LDW       S:?w3, X
??I2C_Init_5:
        LD        A, (0x1,SP)
        CLRW      Y
        EXG       A, YL
        LDW       X, #0x3
        LDW       S:?w0, X
        LDW       X, Y
        CALLF     L:?mul16_x_x_w0
        LDW       Y, #0xa
        CALLF     L:?sdiv16_x_x_y
        LD        A, XL
        JRA       ??I2C_Init_6
??I2C_Init_1:
        CALLF     L:?mov_l0_l3
        LD        A, #0x1
        CALLF     L:?sll32_l0_l0_a
        CALLF     ?Subroutine2
??CrossCallReturnLabel_4:
        LDW       X, S:?w1
        LDW       S:?w3, X
        CLRW      X
        CPW       X, #0x0
        JRNE      L:??I2C_Init_7
        LDW       X, S:?w3
        CPW       X, #0x4
??I2C_Init_7:
        JRNC      L:??I2C_Init_8
        LDW       X, #0x4
        LDW       S:?w3, X
??I2C_Init_8:
        LD        A, (0x1,SP)
??I2C_Init_6:
        INC       A
        LDW       X, (0x7,SP)
        LD        (X), A
        LD        A, S:?b7
        LDW       X, (0x3,SP)
        LD        (X), A
        LD        A, (0x2,SP)
        LDW       X, (0x5,SP)
        LD        (X), A
        LD        A, (0xc,SP)
        OR        A, #0x1
        LDW       X, (0xf,SP)
        OR        A, (X)
        LD        (X), A
        LDW       X, (0xf,SP)
        INCW      X
        LD        A, (0xa,SP)
        OR        A, (X)
        LD        (X), A
        LDW       X, (0xf,SP)
        LD        A, (0xe,SP)
        ADDW      X, #0x3
        LD        (X), A
        LDW       X, (0xd,SP)
        CLR       A
        SLLW      X
        RLC       A
        RRWA      X, A
        LD        A, XL
        AND       A, #0x6
        OR        A, (0x9,SP)
        OR        A, #0x40
        LDW       X, (0xf,SP)
        ADDW      X, #0x4
        LD        (X), A
        ADD       SP, #0x10
        JPF       L:?epilogue_l2_l3

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALLF     L:?mov_l0_l3
        CALLF     L:?mul32_l0_l0_l1
        CALLF     ?Subroutine2
??CrossCallReturnLabel_5:
        JPF       L:?mov_l1_l0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALLF     L:?mov_l1_l0
        CALLF     L:?mov_l0_l2
        JPF       L:?udiv32_l0_l0_l1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_Cmd:
        TNZ       A
        JREQ      L:??I2C_Cmd_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??I2C_Cmd_1
??I2C_Cmd_0:
        LD        A, (X)
        AND       A, #0xfe
??I2C_Cmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GeneralCallCmd:
        TNZ       A
        JREQ      L:??I2C_GeneralCallCmd_0
        LD        A, (X)
        OR        A, #0x40
        JRA       ??I2C_GeneralCallCmd_1
??I2C_GeneralCallCmd_0:
        LD        A, (X)
        AND       A, #0xbf
??I2C_GeneralCallCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GenerateSTART:
        INCW      X
        TNZ       A
        JREQ      L:??I2C_GenerateSTART_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??I2C_GenerateSTART_1
??I2C_GenerateSTART_0:
        LD        A, (X)
        AND       A, #0xfe
??I2C_GenerateSTART_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GenerateSTOP:
        INCW      X
        TNZ       A
        JREQ      L:??I2C_GenerateSTOP_0
        LD        A, (X)
        OR        A, #0x2
        JRA       ??I2C_GenerateSTOP_1
??I2C_GenerateSTOP_0:
        LD        A, (X)
        AND       A, #0xfd
??I2C_GenerateSTOP_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_SoftwareResetCmd:
        INCW      X
        TNZ       A
        JREQ      L:??I2C_SoftwareResetCmd_0
        LD        A, (X)
        OR        A, #0x80
        JRA       ??I2C_SoftwareResetCmd_1
??I2C_SoftwareResetCmd_0:
        LD        A, (X)
        AND       A, #0x7f
??I2C_SoftwareResetCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_StretchClockCmd:
        TNZ       A
        JREQ      L:??I2C_StretchClockCmd_0
        LD        A, (X)
        AND       A, #0x7f
        JRA       ??I2C_StretchClockCmd_1
??I2C_StretchClockCmd_0:
        LD        A, (X)
        OR        A, #0x80
??I2C_StretchClockCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_ARPCmd:
        TNZ       A
        JREQ      L:??I2C_ARPCmd_0
        LD        A, (X)
        OR        A, #0x10
        JRA       ??I2C_ARPCmd_1
??I2C_ARPCmd_0:
        LD        A, (X)
        AND       A, #0xef
??I2C_ARPCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_AcknowledgeConfig:
        INCW      X
        TNZ       A
        JREQ      L:??I2C_AcknowledgeConfig_0
        LD        A, (X)
        OR        A, #0x4
        JRA       ??I2C_AcknowledgeConfig_1
??I2C_AcknowledgeConfig_0:
        LD        A, (X)
        AND       A, #0xfb
??I2C_AcknowledgeConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_OwnAddress2Config:
        LD        S:?b0, A
        ADDW      X, #0x5
        LD        A, (X)
        AND       A, #0x1
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0xfe
        OR        A, S:?b1
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_DualAddressCmd:
        ADDW      X, #0x5
        TNZ       A
        JREQ      L:??I2C_DualAddressCmd_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??I2C_DualAddressCmd_1
??I2C_DualAddressCmd_0:
        LD        A, (X)
        AND       A, #0xfe
??I2C_DualAddressCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_AckPositionConfig:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_2:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        LD        S:?b0, A
        INCW      X
        LD        A, (X)
        AND       A, #0xf7
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_SMBusAlertConfig:
        INCW      X
        TNZ       A
        JREQ      L:??I2C_SMBusAlertConfig_0
        LD        A, (X)
        OR        A, #0x20
        JRA       ??I2C_SMBusAlertConfig_1
??I2C_SMBusAlertConfig_0:
        LD        A, (X)
        AND       A, #0xdf
??I2C_SMBusAlertConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_FastModeDutyCycleConfig:
        ADDW      X, #0xc
        CP        A, #0x40
        JRNE      L:??I2C_FastModeDutyCycleConfig_0
        LD        A, (X)
        OR        A, #0x40
        JRA       ??I2C_FastModeDutyCycleConfig_1
??I2C_FastModeDutyCycleConfig_0:
        LD        A, (X)
        AND       A, #0xbf
??I2C_FastModeDutyCycleConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_Send7bitAddress:
        TNZ       S:?b0
        JREQ      L:??I2C_Send7bitAddress_0
        OR        A, #0x1
        JRA       L:??I2C_Send7bitAddress_1
??I2C_Send7bitAddress_0:
        AND       A, #0xfe
??I2C_Send7bitAddress_1:
        ADDW      X, #0x6
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_SendData:
        ADDW      X, #0x6
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_ReceiveData:
        ADDW      X, #0x6
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_TransmitPEC:
        INCW      X
        TNZ       A
        JREQ      L:??I2C_TransmitPEC_0
        LD        A, (X)
        OR        A, #0x10
        JRA       ??I2C_TransmitPEC_1
??I2C_TransmitPEC_0:
        LD        A, (X)
        AND       A, #0xef
??I2C_TransmitPEC_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_CalculatePEC:
        TNZ       A
        JREQ      L:??I2C_CalculatePEC_0
        LD        A, (X)
        OR        A, #0x20
        JRA       ??I2C_CalculatePEC_1
??I2C_CalculatePEC_0:
        LD        A, (X)
        AND       A, #0xdf
??I2C_CalculatePEC_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_PECPositionConfig:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GetPEC:
        ADDW      X, #0xe
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_DMACmd:
        ADDW      X, #0xa
        TNZ       A
        JREQ      L:??I2C_DMACmd_0
        LD        A, (X)
        OR        A, #0x8
        JRA       ??I2C_DMACmd_1
??I2C_DMACmd_0:
        LD        A, (X)
        AND       A, #0xf7
??I2C_DMACmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_DMALastTransferCmd:
        ADDW      X, #0xa
        TNZ       A
        JREQ      L:??I2C_DMALastTransferCmd_0
        LD        A, (X)
        OR        A, #0x10
        JRA       ??I2C_DMALastTransferCmd_1
??I2C_DMALastTransferCmd_0:
        LD        A, (X)
        AND       A, #0xef
??I2C_DMALastTransferCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_ITConfig:
        ADDW      X, #0xa
        TNZ       A
        EXG       A, YL
        JREQ      L:??I2C_ITConfig_0
        OR        A, (X)
        JRA       ??I2C_ITConfig_1
??I2C_ITConfig_0:
        CPL       A
        AND       A, (X)
??I2C_ITConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_ReadRegister:
        SUB       SP, #0x2
        CLRW      Y
        LDW       (0x1,SP), Y
        LDW       (0x1,SP), X
        CLRW      X
        LD        XL, A
        ADDW      X, (0x1,SP)
        LDW       (0x1,SP), X
        LDW       X, (0x1,SP)
        LD        A, (X)
        ADD       SP, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_CheckEvent:
        SUB       SP, #0x2
        LDW       S:?w0, X
        LDW       S:?w3, Y
        CLRW      X
        LDW       (0x1,SP), X
        CLR       S:?b4
        LDW       X, S:?w3
        CPW       X, #0x4
        JRNE      L:??I2C_CheckEvent_0
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, (X)
        AND       A, #0x4
        CLRW      X
        LD        XL, A
        JRA       ??I2C_CheckEvent_1
??I2C_CheckEvent_0:
        LDW       X, S:?w0
        ADDW      X, #0x7
        LD        A, (X)
        LD        S:?b3, A
        LDW       X, S:?w0
        ADDW      X, #0x9
        LD        A, (X)
        CLRW      X
        LD        XL, A
        CLR       A
        OR        A, S:?b3
        RLWA      X, A
??I2C_CheckEvent_1:
        LDW       (0x1,SP), X
        LDW       X, (0x1,SP)
        RRWA      X, A
        AND       A, S:?b7
        RRWA      X, A
        AND       A, S:?b6
        RRWA      X, A
        CPW       X, S:?w3
        JRNE      L:??I2C_CheckEvent_2
        MOV       S:?b4, #0x1
??I2C_CheckEvent_2:
        LD        A, S:?b4
        ADD       SP, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GetLastEvent:
        SUB       SP, #0x2
        EXGW      X, Y
        CLRW      X
        LDW       (0x1,SP), X
        LDW       X, Y
        ADDW      X, #0x8
        LD        A, (X)
        BCP       A, #0x4
        JREQ      L:??I2C_GetLastEvent_0
        LDW       X, #0x4
        JRA       ??I2C_GetLastEvent_1
??I2C_GetLastEvent_0:
        LDW       X, Y
        ADDW      X, #0x7
        LD        A, (X)
        EXGW      X, Y
        LD        S:?b1, A
        ADDW      X, #0x9
        LD        A, (X)
        CLRW      X
        LD        XL, A
        CLR       A
        OR        A, S:?b1
        RLWA      X, A
??I2C_GetLastEvent_1:
        LDW       (0x1,SP), X
        LDW       X, (0x1,SP)
        ADD       SP, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GetFlagStatus:
        CLR       S:?b1
        CLR       S:?b0
        LD        A, YH
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_0
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_1
        DEC       A
        JREQ      L:??I2C_GetFlagStatus_2
        JRA       L:??I2C_GetFlagStatus_3
??I2C_GetFlagStatus_0:
        ADDW      X, #0x7
        JRA       ??I2C_GetFlagStatus_4
??I2C_GetFlagStatus_1:
        ADDW      X, #0x8
        JRA       ??I2C_GetFlagStatus_4
??I2C_GetFlagStatus_2:
        ADDW      X, #0x9
??I2C_GetFlagStatus_4:
        LD        A, (X)
        LD        S:?b1, A
??I2C_GetFlagStatus_3:
        EXG       A, YL
        BCP       A, S:?b1
        JREQ      L:??I2C_GetFlagStatus_5
        MOV       S:?b0, #0x1
??I2C_GetFlagStatus_5:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_ClearFlag:
        EXG       A, YL
        CPL       A
        ADDW      X, #0x8
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_GetITStatus:
        SUB       SP, #0x1
        LDW       S:?w0, X
        LDW       X, Y
        CLR       S:?b2
        CLR       (0x1,SP)
        LD        A, XH
        EXGW      X, Y
        LDW       X, S:?w0
        ADDW      X, #0xa
        AND       A, (X)
        AND       A, #0x7
        LD        (0x1,SP), A
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, YL
        BCP       A, (X)
        JREQ      L:??I2C_GetITStatus_0
        TNZ       (0x1,SP)
        JREQ      L:??I2C_GetITStatus_0
        MOV       S:?b2, #0x1
??I2C_GetITStatus_0:
        LD        A, S:?b2
        ADD       SP, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C_ClearITPendingBit:
        EXG       A, YL
        CPL       A
        ADDW      X, #0x8
        LD        (X), A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 920 bytes in section .far_func.text
// 
// 920 bytes of CODE memory
//
//Errors: none
//Warnings: none
