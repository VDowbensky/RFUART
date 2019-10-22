///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:17
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_usart.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC56D.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_usart.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_usart.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l3_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w4
        EXTERN ?w5
        EXTERN CLK_GetClockFreq

        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_Cmd
        PUBLIC USART_DMACmd
        PUBLIC USART_DeInit
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_ReceiveData8
        PUBLIC USART_ReceiveData9
        PUBLIC USART_ReceiverWakeUpCmd
        PUBLIC USART_SendBreak
        PUBLIC USART_SendData8
        PUBLIC USART_SendData9
        PUBLIC USART_SetAddress
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_WakeUpConfig


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_DeInit:
        LDW       Y, X
        LD        A, (X)
        INCW      X
        LD        A, (X)
        LDW       X, Y
        ADDW      X, #0x3
        CLR       (X)
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x4
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x5
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x6
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x7
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_Init:
        CALLF     L:?push_l2
        CALLF     L:?push_l3
        PUSH      S:?b6
        LDW       S:?w4, X
        CALLF     L:?mov_l3_l0
        LD        S:?b0, A
        ADDW      X, #0x4
        LD        A, (X)
        AND       A, #0xe9
        LD        (X), A
        LD        A, S:?b5
        OR        A, S:?b0
        OR        A, (X)
        LD        (X), A
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        A, (X)
        AND       A, #0xcf
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b4
        LD        (X), A
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        A, (X)
        LDW       X, S:?w4
        INCW      X
        INCW      X
        CLR       (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LDW       S:?w5, X
        LD        A, (X)
        AND       A, #0xf
        LD        (X), A
        LD        A, (X)
        AND       A, #0xf0
        LD        (X), A
        CALLF     CLK_GetClockFreq
        CALLF     L:?mov_l1_l3
        CALLF     L:?udiv32_l0_l0_l1
        LD        A, S:?b2
        AND       A, #0xf0
        LD        [S:?w5.w], A
        LD        A, S:?b3
        AND       A, #0xf
        OR        A, [S:?w5.w]
        LD        [S:?w5.w], A
        LDW       X, S:?w1
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        (X), A
        LDW       X, S:?w4
        ADDW      X, #0x5
        LD        A, (X)
        AND       A, #0xf3
        LD        (X), A
        LD        A, (0x1,SP)
        OR        A, (X)
        LD        (X), A
        ADD       SP, #0x1
        JPF       L:?epilogue_l2_l3

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ClockInit:
        LD        S:?b3, A
        ADDW      X, #0x6
        LD        A, (X)
        AND       A, #0xf8
        LD        (X), A
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, S:?b2
        OR        A, (X)
        LD        (X), A
        TNZ       S:?b3
        JREQ      L:??USART_ClockInit_0
        LD        A, (X)
        OR        A, #0x8
        JRA       ??USART_ClockInit_1
??USART_ClockInit_0:
        LD        A, (X)
        AND       A, #0xf7
??USART_ClockInit_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_Cmd:
        ADDW      X, #0x4
        TNZ       A
        JREQ      L:??USART_Cmd_0
        LD        A, (X)
        AND       A, #0xdf
        JRA       ??USART_Cmd_1
??USART_Cmd_0:
        LD        A, (X)
        OR        A, #0x20
??USART_Cmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SetPrescaler:
        ADDW      X, #0xa
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SendBreak:
        ADDW      X, #0x5
        LD        A, (X)
        OR        A, #0x1
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ReceiveData8:
        INCW      X
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ReceiveData9:
        LDW       Y, X
        ADDW      X, #0x4
        LD        A, (X)
        CLRW      X
        LD        XL, A
        SLLW      X
        RRWA      X, A
        CLR       A
        RLWA      X, A
        LDW       S:?w0, X
        EXGW      X, Y
        INCW      X
        LD        A, (X)
        CLRW      X
        LD        XL, A
        RLWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SendData8:
        INCW      X
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SendData9:
        LDW       S:?w0, X
        LDW       S:?w1, Y
        ADDW      X, #0x4
        LDW       Y, X
        LD        A, (X)
        AND       A, #0xbf
        LD        (X), A
        LDW       X, S:?w1
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        EXGW      X, Y
        OR        A, (X)
        LD        (X), A
        LDW       X, S:?w0
        INCW      X
        LD        A, S:?b3
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ReceiverWakeUpCmd:
        ADDW      X, #0x5
        TNZ       A
        JREQ      L:??USART_ReceiverWakeUpCmd_0
        LD        A, (X)
        OR        A, #0x2
        JRA       ??USART_ReceiverWakeUpCmd_1
??USART_ReceiverWakeUpCmd_0:
        LD        A, (X)
        AND       A, #0xfd
??USART_ReceiverWakeUpCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SetAddress:
        LD        S:?b0, A
        ADDW      X, #0x7
        LD        A, (X)
        AND       A, #0xf0
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_WakeUpConfig:
        LD        S:?b0, A
        ADDW      X, #0x4
        LD        A, (X)
        AND       A, #0xf7
        LD        (X), A
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_HalfDuplexCmd:
        ADDW      X, #0x8
        TNZ       A
        JREQ      L:??USART_HalfDuplexCmd_0
        LD        A, (X)
        OR        A, #0x8
        JRA       ??USART_HalfDuplexCmd_1
??USART_HalfDuplexCmd_0:
        LD        A, (X)
        AND       A, #0xf7
??USART_HalfDuplexCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SmartCardCmd:
        ADDW      X, #0x8
        TNZ       A
        JREQ      L:??USART_SmartCardCmd_0
        LD        A, (X)
        OR        A, #0x20
        JRA       ??USART_SmartCardCmd_1
??USART_SmartCardCmd_0:
        LD        A, (X)
        AND       A, #0xdf
??USART_SmartCardCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SmartCardNACKCmd:
        ADDW      X, #0x8
        TNZ       A
        JREQ      L:??USART_SmartCardNACKCmd_0
        LD        A, (X)
        OR        A, #0x10
        JRA       ??USART_SmartCardNACKCmd_1
??USART_SmartCardNACKCmd_0:
        LD        A, (X)
        AND       A, #0xef
??USART_SmartCardNACKCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SetGuardTime:
        ADDW      X, #0x9
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_IrDAConfig:
        ADDW      X, #0x8
        TNZ       A
        JREQ      L:??USART_IrDAConfig_0
        LD        A, (X)
        OR        A, #0x4
        JRA       ??USART_IrDAConfig_1
??USART_IrDAConfig_0:
        LD        A, (X)
        AND       A, #0xfb
??USART_IrDAConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_IrDACmd:
        ADDW      X, #0x8
        TNZ       A
        JREQ      L:??USART_IrDACmd_0
        LD        A, (X)
        OR        A, #0x2
        JRA       ??USART_IrDACmd_1
??USART_IrDACmd_0:
        LD        A, (X)
        AND       A, #0xfd
??USART_IrDACmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_DMACmd:
        LD        S:?b1, A
        ADDW      X, #0x8
        TNZ       S:?b0
        JREQ      L:??USART_DMACmd_0
        LD        A, (X)
        OR        A, S:?b1
        JRA       ??USART_DMACmd_1
??USART_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
??USART_DMACmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ITConfig:
        LDW       S:?w2, X
        LD        S:?b3, A
        RLWA      Y, A
        LD        S:?b2, A
        RRWA      Y, A
        EXG       A, YL
        CALLF     ?Subroutine1
??CrossCallReturnLabel_2:
        LD        S:?b6, A
        LDW       X, S:?w2
        ADDW      X, #0x5
        LDW       S:?w0, X
        LDW       X, S:?w2
        ADDW      X, #0x8
        LDW       Y, X
        LDW       X, S:?w2
        ADDW      X, #0x4
        TNZ       S:?b3
        JREQ      L:??USART_ITConfig_0
        LD        A, S:?b2
        DEC       A
        JRNE      L:??USART_ITConfig_1
        LD        A, (X)
        OR        A, S:?b6
        JRA       ??USART_ITConfig_2
??USART_ITConfig_1:
        LD        A, S:?b2
        CP        A, #0x5
        JRNE      L:??USART_ITConfig_3
        LD        A, (Y)
        OR        A, S:?b6
        JRA       ??USART_ITConfig_4
??USART_ITConfig_3:
        LD        A, [S:?w0.w]
        OR        A, S:?b6
        JRA       ??USART_ITConfig_5
??USART_ITConfig_0:
        CPL       S:?b6
        LD        A, S:?b2
        DEC       A
        JRNE      L:??USART_ITConfig_6
        LD        A, (X)
        AND       A, S:?b6
??USART_ITConfig_2:
        LD        (X), A
        RETF
??USART_ITConfig_6:
        LD        A, S:?b2
        CP        A, #0x5
        JRNE      L:??USART_ITConfig_7
        LD        A, (Y)
        AND       A, S:?b6
??USART_ITConfig_4:
        LD        (Y), A
        RETF
??USART_ITConfig_7:
        LD        A, [S:?w0.w]
        AND       A, S:?b6
??USART_ITConfig_5:
        LD        [S:?w0.w], A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        EXG       A, XL
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_GetFlagStatus:
        CLR       S:?b0
        CPW       Y, #0x101
        JRNE      L:??USART_GetFlagStatus_0
        ADDW      X, #0x5
        LD        A, (X)
        BCP       A, #0x1
        JRNE      L:??USART_GetFlagStatus_1
        JRA       L:??USART_GetFlagStatus_2
??USART_GetFlagStatus_0:
        EXG       A, YL
        BCP       A, (X)
        JREQ      L:??USART_GetFlagStatus_2
??USART_GetFlagStatus_1:
        MOV       S:?b0, #0x1
??USART_GetFlagStatus_2:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ClearFlag:
        EXG       A, YL
        CPL       A
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_GetITStatus:
        LDW       S:?w0, X
        CLR       S:?b2
        LD        A, YL
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        LD        S:?b5, A
        LD        A, YL
        SWAP      A
        CALLF     ?Subroutine1
??CrossCallReturnLabel_4:
        LD        S:?b3, A
        CPW       Y, #0x100
        JRNE      L:??USART_GetITStatus_0
        LDW       X, S:?w0
        ADDW      X, #0x4
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        JRNE      L:??USART_GetITStatus_1
        JRA       L:??USART_GetITStatus_2
??USART_GetITStatus_0:
        LDW       X, S:?w0
        ADDW      X, #0x5
        CPW       Y, #0x235
        JRNE      L:??USART_GetITStatus_3
        LD        A, (X)
        AND       A, S:?b3
        LD        S:?b3, A
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, (X)
        LD        S:?b4, A
        LD        A, [S:?w0.w]
        BCP       A, S:?b5
        JREQ      L:??USART_GetITStatus_2
        TNZ       S:?b3
        JRNE      L:??USART_GetITStatus_4
        LD        A, S:?b4
        BCP       A, #0x1
        JRNE      L:??USART_GetITStatus_4
        JRA       L:??USART_GetITStatus_2
??USART_GetITStatus_3:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        JREQ      L:??USART_GetITStatus_2
??USART_GetITStatus_1:
        TNZ       S:?b3
        JREQ      L:??USART_GetITStatus_2
??USART_GetITStatus_4:
        MOV       S:?b2, #0x1
??USART_GetITStatus_2:
        LD        A, S:?b2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        A, (X)
        AND       A, S:?b3
        LD        S:?b3, A
        LD        A, [S:?w0.w]
        BCP       A, S:?b5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_ClearITPendingBit:
        LD        A, (X)
        AND       A, #0xbf
        LD        (X), A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 698 bytes in section .far_func.text
// 
// 698 bytes of CODE memory
//
//Errors: none
//Warnings: none
