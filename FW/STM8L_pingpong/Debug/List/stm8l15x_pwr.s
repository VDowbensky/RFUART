///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:15
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_pwr.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBECB.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_pwr.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_pwr.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1

        PUBLIC PWR_DeInit
        PUBLIC PWR_FastWakeUpCmd
        PUBLIC PWR_GetFlagStatus
        PUBLIC PWR_PVDClearFlag
        PUBLIC PWR_PVDClearITPendingBit
        PUBLIC PWR_PVDCmd
        PUBLIC PWR_PVDGetITStatus
        PUBLIC PWR_PVDITConfig
        PUBLIC PWR_PVDLevelConfig
        PUBLIC PWR_UltraLowPowerCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_DeInit:
        MOV       L:0x50b2, #0x20
        CLR       L:0x50b3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_PVDLevelConfig:
        LD        S:?b0, A
        LD        A, L:0x50b2
        AND       A, #0xf1
        LD        L:0x50b2, A
        LD        A, L:0x50b2
        OR        A, S:?b0
        LD        L:0x50b2, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_PVDCmd:
        TNZ       A
        JREQ      L:??PWR_PVDCmd_0
        BSET      L:0x50b2, #0x0
        RETF
??PWR_PVDCmd_0:
        BRES      L:0x50b2, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_FastWakeUpCmd:
        TNZ       A
        JREQ      L:??PWR_FastWakeUpCmd_0
        BSET      L:0x50b3, #0x2
        RETF
??PWR_FastWakeUpCmd_0:
        BRES      L:0x50b3, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_UltraLowPowerCmd:
        TNZ       A
        JREQ      L:??PWR_UltraLowPowerCmd_0
        BSET      L:0x50b3, #0x1
        RETF
??PWR_UltraLowPowerCmd_0:
        BRES      L:0x50b3, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_PVDITConfig:
        TNZ       A
        JREQ      L:??PWR_PVDITConfig_0
        BSET      L:0x50b2, #0x4
        RETF
??PWR_PVDITConfig_0:
        BRES      L:0x50b2, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b0
        BCP       A, #0x1
        JREQ      L:??PWR_GetFlagStatus_0
        LD        A, L:0x50b3
        AND       A, #0x1
        LD        S:?b0, A
        JRA       L:??PWR_GetFlagStatus_1
??PWR_GetFlagStatus_0:
        LD        A, L:0x50b2
        BCP       A, S:?b1
        JREQ      L:??PWR_GetFlagStatus_1
        MOV       S:?b0, #0x1
??PWR_GetFlagStatus_1:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_PVDClearFlag:
        BSET      L:0x50b2, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_PVDGetITStatus:
        MOV       S:?b0, L:0x50b2
        LD        A, L:0x50b2
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        PUSH      A
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        LD        S:?b0, A
        POP       A
        AND       A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
PWR_PVDClearITPendingBit:
        BSET      L:0x50b2, #0x5
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 149 bytes in section .far_func.text
// 
// 149 bytes of CODE memory
//
//Errors: none
//Warnings: none
