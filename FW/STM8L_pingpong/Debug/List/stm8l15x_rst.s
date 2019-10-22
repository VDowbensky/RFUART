///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:15
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_rst.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBF59.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_rst.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_rst.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0

        PUBLIC RST_ClearFlag
        PUBLIC RST_GPOutputEnable
        PUBLIC RST_GetFlagStatus


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RST_GetFlagStatus:
        LD        S:?b0, A
        LD        A, L:0x50b1
        BCP       A, S:?b0
        JRNE      L:??RST_GetFlagStatus_0
        CLR       A
        RETF
??RST_GetFlagStatus_0:
        LD        A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RST_ClearFlag:
        LD        L:0x50b1, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RST_GPOutputEnable:
        MOV       L:0x50b0, #0xd0
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 23 bytes in section .far_func.text
// 
// 23 bytes of CODE memory
//
//Errors: none
//Warnings: none
