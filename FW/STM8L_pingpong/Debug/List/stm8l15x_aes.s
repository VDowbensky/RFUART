///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:13
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_aes.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB650.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_aes.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_aes.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2

        PUBLIC AES_ClearFlag
        PUBLIC AES_ClearITPendingBit
        PUBLIC AES_Cmd
        PUBLIC AES_DMAConfig
        PUBLIC AES_DeInit
        PUBLIC AES_GetFlagStatus
        PUBLIC AES_GetITStatus
        PUBLIC AES_ITConfig
        PUBLIC AES_OperationModeConfig
        PUBLIC AES_ReadSubData
        PUBLIC AES_ReadSubKey
        PUBLIC AES_WriteSubData
        PUBLIC AES_WriteSubKey


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_DeInit:
        MOV       L:0x53d0, #0x18
        CLR       L:0x53d2
        CLR       L:0x53d3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_OperationModeConfig:
        LD        S:?b0, A
        LD        A, L:0x53d0
        AND       A, #0xf9
        LD        L:0x53d0, A
        LD        A, L:0x53d0
        OR        A, S:?b0
        LD        L:0x53d0, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_Cmd:
        TNZ       A
        JREQ      L:??AES_Cmd_0
        BSET      L:0x53d0, #0x0
        RETF
??AES_Cmd_0:
        BRES      L:0x53d0, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_WriteSubData:
        LD        L:0x53d2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_WriteSubKey:
        LD        L:0x53d2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_ReadSubData:
        LD        A, L:0x53d3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_ReadSubKey:
        LD        A, L:0x53d3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_DMAConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??AES_DMAConfig_0
        LD        A, L:0x53d0
        OR        A, S:?b1
        JRA       ??AES_DMAConfig_1
??AES_DMAConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x53d0
??AES_DMAConfig_1:
        LD        L:0x53d0, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_ITConfig:
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??AES_ITConfig_0
        LD        A, L:0x53d0
        OR        A, S:?b1
        JRA       ??AES_ITConfig_1
??AES_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x53d0
??AES_ITConfig_1:
        LD        L:0x53d0, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_GetFlagStatus:
        CP        A, #0x1
        JRNE      L:??AES_GetFlagStatus_0
        LD        A, L:0x53d1
        AND       A, #0x1
        RETF
??AES_GetFlagStatus_0:
        CP        A, #0x2
        JRNE      L:??AES_GetFlagStatus_1
        LD        A, L:0x53d1
        BCP       A, #0x2
        JREQ      L:??AES_GetFlagStatus_2
        LD        A, #0x1
        RETF
??AES_GetFlagStatus_2:
        CLR       A
        RETF
??AES_GetFlagStatus_1:
        LD        A, L:0x53d1
        BCP       A, #0x4
        JREQ      L:??AES_GetFlagStatus_3
        LD        A, #0x1
        RETF
??AES_GetFlagStatus_3:
        CLR       A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_ClearFlag:
        DEC       A
        JRNE      L:??AES_ClearFlag_0
        BSET      L:0x53d0, #0x3
        RETF
??AES_ClearFlag_0:
        BSET      L:0x53d0, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_GetITStatus:
        CLR       S:?b0
        MOV       S:?b2, L:0x53d0
        MOV       S:?b1, L:0x53d1
        CP        A, #0x20
        JRNE      L:??AES_GetITStatus_0
        LD        A, S:?b2
        BCP       A, #0x20
        JREQ      L:??AES_GetITStatus_1
        LD        A, S:?b1
        BCP       A, #0x1
        JRA       ??AES_GetITStatus_2
??AES_GetITStatus_0:
        BTJF      L:0x53d0, #0x6, L:??AES_GetITStatus_1
        LD        A, L:0x53d1
        BCP       A, #0x6
??AES_GetITStatus_2:
        JREQ      L:??AES_GetITStatus_1
        MOV       S:?b0, #0x1
??AES_GetITStatus_1:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
AES_ClearITPendingBit:
        CP        A, #0x20
        JRNE      L:??AES_ClearITPendingBit_0
        BSET      L:0x53d0, #0x3
        RETF
??AES_ClearITPendingBit_0:
        BSET      L:0x53d0, #0x4
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 221 bytes in section .far_func.text
// 
// 221 bytes of CODE memory
//
//Errors: none
//Warnings: none
