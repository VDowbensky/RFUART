///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:03
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_spi.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW30B1.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_spi.c"
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_spi.s
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
        EXTERN ?sll16_x_x_a
        EXTERN ?w1

        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRCCmd
        PUBLIC SPI_ClearFlag
        PUBLIC SPI_ClearITPendingBit
        PUBLIC SPI_Cmd
        PUBLIC SPI_DMACmd
        PUBLIC SPI_DeInit
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_GetFlagStatus
        PUBLIC SPI_GetITStatus
        PUBLIC SPI_ITConfig
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareCmd
        PUBLIC SPI_ReceiveData
        PUBLIC SPI_ResetCRC
        PUBLIC SPI_SendData
        PUBLIC SPI_TransmitCRC


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_DeInit:
        LDW       Y, X
        CLR       (Y)
        INCW      X
        CLR       (X)
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
        LD        A, #0x2
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
        LD        A, #0x7
        LDW       X, Y
        ADDW      X, #0x5
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_Init:
        LDW       Y, X
        LD        S:?b7, A
        LD        A, S:?b0
        OR        A, S:?b7
        OR        A, S:?b2
        OR        A, S:?b3
        LD        (X), A
        INCW      X
        LD        A, S:?b5
        OR        A, S:?b4
        LD        (X), A
        LD        A, S:?b1
        CP        A, #0x4
        JRNE      L:??SPI_Init_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??SPI_Init_1
??SPI_Init_0:
        LD        A, (X)
        AND       A, #0xfe
??SPI_Init_1:
        LD        (X), A
        LD        A, (Y)
        OR        A, S:?b1
        LD        (Y), A
        LD        A, S:?b6
        LDW       X, Y
        ADDW      X, #0x5
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_Cmd:
        TNZ       A
        JREQ      L:??SPI_Cmd_0
        LD        A, (X)
        OR        A, #0x40
        JRA       ??SPI_Cmd_1
??SPI_Cmd_0:
        LD        A, (X)
        AND       A, #0xbf
??SPI_Cmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_NSSInternalSoftwareCmd:
        INCW      X
        TNZ       A
        JREQ      L:??SPI_NSSInternalSoftwareCmd_0
        LD        A, (X)
        OR        A, #0x1
        JRA       ??SPI_NSSInternalSoftwareCmd_1
??SPI_NSSInternalSoftwareCmd_0:
        LD        A, (X)
        AND       A, #0xfe
??SPI_NSSInternalSoftwareCmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_BiDirectionalLineConfig:
        INCW      X
        TNZ       A
        JREQ      L:??SPI_BiDirectionalLineConfig_0
        LD        A, (X)
        OR        A, #0x40
        JRA       ??SPI_BiDirectionalLineConfig_1
??SPI_BiDirectionalLineConfig_0:
        LD        A, (X)
        AND       A, #0xbf
??SPI_BiDirectionalLineConfig_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_SendData:
        ADDW      X, #0x4
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_ReceiveData:
        ADDW      X, #0x4
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_TransmitCRC:
        INCW      X
        LD        A, (X)
        OR        A, #0x10
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_CalculateCRCCmd:
        LDW       Y, X
        LD        S:?b0, A
        CLR       A
        LDW       X, #0x5200
        CALLF     SPI_Cmd
        INCW      Y
        TNZ       S:?b0
        JREQ      L:??SPI_CalculateCRCCmd_0
        LD        A, (Y)
        OR        A, #0x20
        JRA       ??SPI_CalculateCRCCmd_1
??SPI_CalculateCRCCmd_0:
        LD        A, (Y)
        AND       A, #0xdf
??SPI_CalculateCRCCmd_1:
        LD        (Y), A
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
        CODE
SPI_GetCRC:
        TNZ       A
        JREQ      L:??SPI_GetCRC_0
        ADDW      X, #0x7
        JRA       ??SPI_GetCRC_1
??SPI_GetCRC_0:
        ADDW      X, #0x6
??SPI_GetCRC_1:
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ResetCRC:
        LDW       S:?w1, X
        LD        A, #0x1
        CALLF     SPI_CalculateCRCCmd
        LD        A, #0x1
        LDW       X, S:?w1
        JPF       SPI_Cmd

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_GetCRCPolynomial:
        ADDW      X, #0x5
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_DMACmd:
        LD        S:?b1, A
        INCW      X
        INCW      X
        TNZ       S:?b0
        JREQ      L:??SPI_DMACmd_0
        LD        A, (X)
        OR        A, S:?b1
        JRA       ??SPI_DMACmd_1
??SPI_DMACmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (X)
??SPI_DMACmd_1:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ITConfig:
        LDW       Y, X
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        EXG       A, XL
        LD        S:?b1, A
        INCW      Y
        INCW      Y
        TNZ       S:?b0
        JREQ      L:??SPI_ITConfig_0
        LD        A, (Y)
        OR        A, S:?b1
        JRA       ??SPI_ITConfig_1
??SPI_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, (Y)
??SPI_ITConfig_1:
        LD        (Y), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b0
        ADDW      X, #0x3
        LD        A, (X)
        BCP       A, S:?b1
        JREQ      L:??SPI_GetFlagStatus_0
        MOV       S:?b0, #0x1
??SPI_GetFlagStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ClearFlag:
        CPL       A
        ADDW      X, #0x3
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_GetITStatus:
        SUB       SP, #0x1
        LDW       Y, X
        LD        S:?b1, A
        CLR       S:?b0
        CLR       (0x1,SP)
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        LDW       X, Y
        ADDW      X, #0x3
        AND       A, (X)
        LD        (0x1,SP), A
        LD        A, S:?b1
        CALLF     ??Subroutine1_0
??CrossCallReturnLabel_0:
        EXGW      X, Y
        INCW      X
        INCW      X
        BCP       A, (X)
        JREQ      L:??SPI_GetITStatus_0
        TNZ       (0x1,SP)
        JREQ      L:??SPI_GetITStatus_0
        MOV       S:?b0, #0x1
??SPI_GetITStatus_0:
        LD        A, S:?b0
        ADD       SP, #0x1
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine0:
        SWAP      A
        REQUIRE ??Subroutine1_0
        ;               // Fall through to label ??Subroutine1_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine1_0:
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI_ClearITPendingBit:
        LDW       Y, X
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        CPL       A
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 346 bytes in section .far_func.text
// 
// 346 bytes of CODE memory
//
//Errors: none
//Warnings: none
