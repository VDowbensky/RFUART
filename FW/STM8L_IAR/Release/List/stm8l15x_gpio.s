///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:02
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_gpio.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW2BD5.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_gpio.c"
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?w0

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ExternalPullUpConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_ToggleBits
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_DeInit:
        LDW       Y, X
        ADDW      X, #0x4
        CLR       (X)
        CLR       (Y)
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
        EXGW      X, Y
        ADDW      X, #0x3
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_Init:
        LDW       Y, X
        LD        S:?b4, A
        MOV       S:?b2, S:?b0
        LD        S:?b3, A
        CPL       S:?b3
        ADDW      X, #0x4
        LDW       S:?w0, X
        LD        A, (X)
        AND       A, S:?b3
        LD        (X), A
        LDW       X, Y
        INCW      X
        INCW      X
        LD        A, S:?b2
        BCP       A, #0x80
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b2
        BCP       A, #0x10
        JREQ      L:??GPIO_Init_1
        LD        A, (Y)
        OR        A, S:?b4
        JRA       ??GPIO_Init_2
??GPIO_Init_1:
        LD        A, (Y)
        AND       A, S:?b3
??GPIO_Init_2:
        LD        (Y), A
        LD        A, (X)
        OR        A, S:?b4
        JRA       ??GPIO_Init_3
??GPIO_Init_0:
        LD        A, (X)
        AND       A, S:?b3
??GPIO_Init_3:
        LD        (X), A
        ADDW      Y, #0x3
        LD        A, S:?b2
        BCP       A, #0x40
        JREQ      L:??GPIO_Init_4
        LD        A, (Y)
        OR        A, S:?b4
        JRA       ??GPIO_Init_5
??GPIO_Init_4:
        LD        A, (Y)
        AND       A, S:?b3
??GPIO_Init_5:
        LD        (Y), A
        LD        A, S:?b2
        BCP       A, #0x20
        JREQ      L:??GPIO_Init_6
        LD        A, [S:?w0.w]
        OR        A, S:?b4
        JRA       ??GPIO_Init_7
??GPIO_Init_6:
        LD        A, [S:?w0.w]
        AND       A, S:?b3
??GPIO_Init_7:
        LD        [S:?w0.w], A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ExternalPullUpConfig:
        LD        S:?b1, A
        ADDW      X, #0x3
        TNZ       S:?b0
        JREQ      L:??GPIO_ExternalPullUpConfig_0
        LD        A, (X)
        OR        A, S:?b1
        JRA       ??GPIO_ExternalPullUpConfig_1
??GPIO_ExternalPullUpConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
??GPIO_ExternalPullUpConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_Write:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_WriteBit:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??GPIO_WriteBit_0
        LD        A, (X)
        OR        A, S:?b1
        JRA       ??GPIO_WriteBit_1
??GPIO_WriteBit_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
??GPIO_WriteBit_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_SetBits:
        LD        S:?b0, A
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ResetBits:
        CPL       A
        AND       A, (X)
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ToggleBits:
        LD        S:?b0, A
        LD        A, (X)
        XOR       A, S:?b0
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ReadInputData:
        INCW      X
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ReadOutputData:
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ReadInputDataBit:
        LD        S:?b0, A
        INCW      X
        LD        A, (X)
        AND       A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPIO_ReadOutputDataBit:
        LD        S:?b0, A
        LD        A, (X)
        AND       A, S:?b0
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 195 bytes in section .far_func.text
// 
// 195 bytes of CODE memory
//
//Errors: none
//Warnings: none
