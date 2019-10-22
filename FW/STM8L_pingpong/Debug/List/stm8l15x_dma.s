///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:14
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_dma.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB897.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_dma.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_dma.s
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
        EXTERN ?w2

        PUBLIC DMA_ClearFlag
        PUBLIC DMA_ClearITPendingBit
        PUBLIC DMA_Cmd
        PUBLIC DMA_DeInit
        PUBLIC DMA_GetCurrDataCounter
        PUBLIC DMA_GetFlagStatus
        PUBLIC DMA_GetITStatus
        PUBLIC DMA_GlobalCmd
        PUBLIC DMA_GlobalDeInit
        PUBLIC DMA_ITConfig
        PUBLIC DMA_Init
        PUBLIC DMA_SetCurrDataCounter
        PUBLIC DMA_SetTimeOut


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_GlobalDeInit:
        BRES      L:0x5070, #0x0
        MOV       L:0x5070, #0xfc
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_DeInit:
        LDW       Y, X
        LD        A, (X)
        AND       A, #0xfe
        LD        (X), A
        CLR       (Y)
        INCW      X
        INCW      X
        CLR       (X)
        CPW       Y, #0x5093
        JRNE      L:??DMA_DeInit_0
        MOV       L:0x5096, #0x40
        CLR       L:0x5098
        JRA       L:??DMA_DeInit_1
??DMA_DeInit_0:
        LD        A, #0x52
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
??DMA_DeInit_1:
        LDW       X, Y
        ADDW      X, #0x4
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x6
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x7
        CLR       (X)
        EXGW      X, Y
        INCW      X
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_Init:
        PUSH      S:?b8
        LD        S:?b8, A
        LD        A, (X)
        AND       A, #0xfe
        LD        (X), A
        CLR       (X)
        LD        A, S:?b5
        OR        A, S:?b4
        OR        A, S:?b6
        OR        A, (X)
        LD        (X), A
        PUSHW     X
        INCW      X
        LDW       S:?w2, X
        POPW      X
        LD        A, [S:?w2.w]
        AND       A, #0xc7
        LD        [S:?w2.w], A
        LD        A, (0x5,SP)
        OR        A, S:?b7
        OR        A, [S:?w2.w]
        LD        [S:?w2.w], A
        PUSHW     X
        INCW      X
        INCW      X
        LDW       S:?w2, X
        POPW      X
        LD        A, S:?b8
        LD        [S:?w2.w], A
        LD        A, YH
        ADDW      X, #0x3
        LD        (X), A
        INCW      X
        EXG       A, YL
        LD        (X), A
        SUBW      X, #0x4
        CPW       X, #0x5093
        JRNE      L:??DMA_Init_0
        LD        A, S:?b1
        LD        L:0x5098, A
??DMA_Init_0:
        LD        A, S:?b2
        ADDW      X, #0x6
        LD        (X), A
        INCW      X
        LD        A, S:?b3
        LD        (X), A
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_GlobalCmd:
        TNZ       A
        JREQ      L:??DMA_GlobalCmd_0
        BSET      L:0x5070, #0x0
        RETF
??DMA_GlobalCmd_0:
        BRES      L:0x5070, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_Cmd:
        TNZ       A
        JREQ      L:??DMA_Cmd_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??DMA_Cmd_1
??DMA_Cmd_0:
        LD        A, (X)
        AND       A, #0xfe
??DMA_Cmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_SetTimeOut:
        CLR       L:0x5070
        SLL       A
        SLL       A
        LD        L:0x5070, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_SetCurrDataCounter:
        INCW      X
        INCW      X
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_GetCurrDataCounter:
        INCW      X
        INCW      X
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_ITConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??DMA_ITConfig_0
        LD        A, (X)
        OR        A, S:?b1
        JRA       ??DMA_ITConfig_1
??DMA_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
??DMA_ITConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_GetFlagStatus:
        LD        A, L:0x5070
        MOV       S:?b0, L:0x5071
        EXGW      X, Y
        LDW       X, Y
        RLWA      X, A
        AND       A, #0xf
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        EXGW      X, Y
        EXGW      X, Y
        LDW       X, Y
        JREQ      L:??DMA_GetFlagStatus_0
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        EXGW      X, Y
        JREQ      L:??DMA_GetFlagStatus_1
        LDW       Y, #0x5076
        JRA       L:??DMA_GetFlagStatus_2
??DMA_GetFlagStatus_1:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        JREQ      L:??DMA_GetFlagStatus_3
        LDW       Y, #0x5080
        JRA       L:??DMA_GetFlagStatus_2
??DMA_GetFlagStatus_3:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_2:
        JREQ      L:??DMA_GetFlagStatus_4
        LDW       Y, #0x508a
        JRA       L:??DMA_GetFlagStatus_2
??DMA_GetFlagStatus_4:
        LDW       Y, #0x5094
??DMA_GetFlagStatus_2:
        LD        A, XL
        AND       A, (Y)
        RETF
??DMA_GetFlagStatus_0:
        RLWA      X, A
        AND       A, #0x10
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        EXGW      X, Y
        JREQ      L:??DMA_GetFlagStatus_5
        LD        A, XL
        AND       A, S:?b0
        RETF
??DMA_GetFlagStatus_5:
        AND       A, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        EXGW      X, Y
        LDW       X, Y
        RLWA      X, A
        AND       A, #0x4
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        EXGW      X, Y
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        EXGW      X, Y
        LDW       X, Y
        RLWA      X, A
        AND       A, #0x2
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        EXGW      X, Y
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_ClearFlag:
        EXGW      X, Y
        LDW       X, Y
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        CLR       A
        RLWA      X, A
        TNZW      X
        EXGW      X, Y
        JREQ      L:??DMA_ClearFlag_0
        LDW       Y, #0x5076
        JRA       L:??DMA_ClearFlag_1
??DMA_ClearFlag_0:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        JREQ      L:??DMA_ClearFlag_2
        LDW       Y, #0x5080
        JRA       L:??DMA_ClearFlag_1
??DMA_ClearFlag_2:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_3:
        JREQ      L:??DMA_ClearFlag_3
        LDW       Y, #0x508a
        JRA       L:??DMA_ClearFlag_1
??DMA_ClearFlag_3:
        LDW       Y, #0x5094
??DMA_ClearFlag_1:
        LD        A, XL
        AND       A, #0x6
        CPL       A
        EXGW      X, Y
        AND       A, (X)
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_GetITStatus:
        LD        S:?b1, A
        LDW       Y, #0x5075
        BCP       A, #0x10
        JRNE      L:??DMA_GetITStatus_0
        LD        A, S:?b1
        BCP       A, #0x20
        JREQ      L:??DMA_GetITStatus_1
        LDW       Y, #0x507f
        JRA       L:??DMA_GetITStatus_0
??DMA_GetITStatus_1:
        LD        A, S:?b1
        BCP       A, #0x40
        JREQ      L:??DMA_GetITStatus_2
        LDW       Y, #0x5089
        JRA       L:??DMA_GetITStatus_0
??DMA_GetITStatus_2:
        LDW       Y, #0x5093
??DMA_GetITStatus_0:
        LDW       X, Y
        INCW      X
        LD        A, (X)
        LD        S:?b0, A
        LD        A, (Y)
        AND       A, S:?b0
        AND       A, S:?b1
        AND       A, #0x6
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA_ClearITPendingBit:
        LD        S:?b0, A
        BCP       A, #0x10
        JREQ      L:??DMA_ClearITPendingBit_0
        LDW       X, #0x5076
        JRA       L:??DMA_ClearITPendingBit_1
??DMA_ClearITPendingBit_0:
        LD        A, S:?b0
        BCP       A, #0x20
        JREQ      L:??DMA_ClearITPendingBit_2
        LDW       X, #0x5080
        JRA       L:??DMA_ClearITPendingBit_1
??DMA_ClearITPendingBit_2:
        LD        A, S:?b0
        BCP       A, #0x40
        JREQ      L:??DMA_ClearITPendingBit_3
        LDW       X, #0x508a
        JRA       L:??DMA_ClearITPendingBit_1
??DMA_ClearITPendingBit_3:
        LDW       X, #0x5094
??DMA_ClearITPendingBit_1:
        LD        A, S:?b0
        AND       A, #0x6
        CPL       A
        AND       A, (X)
        LD        (X), A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 471 bytes in section .far_func.text
// 
// 471 bytes of CODE memory
//
//Errors: none
//Warnings: none
