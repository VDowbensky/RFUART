///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:14
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_irtim.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBB0D.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_irtim.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_irtim.s
//
///////////////////////////////////////////////////////////////////////////////

        PUBLIC IRTIM_Cmd
        PUBLIC IRTIM_DeInit
        PUBLIC IRTIM_GetHighSinkODStatus
        PUBLIC IRTIM_GetStatus
        PUBLIC IRTIM_HighSinkODCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
IRTIM_DeInit:
        CLR       L:0x52ff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
IRTIM_Cmd:
        TNZ       A
        JRNE      L:??IRTIM_Cmd_0
        BRES      L:0x52ff, #0x0
        RETF
??IRTIM_Cmd_0:
        BSET      L:0x52ff, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
IRTIM_HighSinkODCmd:
        TNZ       A
        JRNE      L:??IRTIM_HighSinkODCmd_0
        BRES      L:0x52ff, #0x1
        RETF
??IRTIM_HighSinkODCmd_0:
        BSET      L:0x52ff, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
IRTIM_GetStatus:
        LD        A, L:0x52ff
        AND       A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
IRTIM_GetHighSinkODStatus:
        LD        A, L:0x52ff
        AND       A, #0x2
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 43 bytes in section .far_func.text
// 
// 43 bytes of CODE memory
//
//Errors: none
//Warnings: none
