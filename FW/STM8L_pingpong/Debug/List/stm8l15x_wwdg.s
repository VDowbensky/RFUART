///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:17
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_wwdg.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC734.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_wwdg.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_wwdg.s
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
