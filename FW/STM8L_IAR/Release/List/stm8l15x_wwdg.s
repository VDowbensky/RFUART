///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:05
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_wwdg.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW36B5.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_wwdg.c"
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_wwdg.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0

        PUBLIC WWDG_Enable
        PUBLIC WWDG_GetCounter
        PUBLIC WWDG_Init
        PUBLIC WWDG_SWReset
        PUBLIC WWDG_SetCounter
        PUBLIC WWDG_SetWindowValue


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WWDG_Init:
        MOV       L:0x50d4, #0x7f
        OR        A, #0x80
        LD        L:0x50d3, A
        LD        A, S:?b0
        AND       A, #0x7f
        LD        L:0x50d4, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WWDG_SetWindowValue:
        SUB       SP, #0x1
        CLR       (0x1,SP)
        AND       A, #0x7f
        OR        A, (0x1,SP)
        LD        (0x1,SP), A
        LD        A, (0x1,SP)
        LD        L:0x50d4, A
        ADD       SP, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WWDG_SetCounter:
        AND       A, #0x7f
        LD        L:0x50d3, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WWDG_Enable:
        OR        A, #0x80
        LD        L:0x50d3, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WWDG_GetCounter:
        LD        A, L:0x50d3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
WWDG_SWReset:
        MOV       L:0x50d3, #0x80
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 56 bytes in section .far_func.text
// 
// 56 bytes of CODE memory
//
//Errors: none
//Warnings: none
