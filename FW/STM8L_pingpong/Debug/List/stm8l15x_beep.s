///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:13
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_beep.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB70C.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_beep.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_beep.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?mul16_x_x_w0
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2

        PUBLIC BEEP_Cmd
        PUBLIC BEEP_DeInit
        PUBLIC BEEP_Init
        PUBLIC BEEP_LSClockToTIMConnectCmd
        PUBLIC BEEP_LSICalibrationConfig


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
BEEP_DeInit:
        CLR       L:0x50f0
        MOV       L:0x50f3, #0x1f
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
BEEP_Init:
        LD        S:?b0, A
        LD        A, L:0x50f3
        AND       A, #0x1f
        CP        A, #0x1f
        JRNE      L:??BEEP_Init_0
        LD        A, L:0x50f3
        AND       A, #0xe0
        LD        L:0x50f3, A
        BSET      L:0x50f3, #0x0
??BEEP_Init_0:
        LD        A, L:0x50f3
        AND       A, #0x3f
        LD        L:0x50f3, A
        LD        A, L:0x50f3
        OR        A, S:?b0
        LD        L:0x50f3, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
BEEP_Cmd:
        TNZ       A
        JREQ      L:??BEEP_Cmd_0
        BSET      L:0x50f3, #0x5
        RETF
??BEEP_Cmd_0:
        BRES      L:0x50f3, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
BEEP_LSClockToTIMConnectCmd:
        TNZ       A
        JREQ      L:??BEEP_LSClockToTIMConnectCmd_0
        BSET      L:0x50f0, #0x0
        RETF
??BEEP_LSClockToTIMConnectCmd_0:
        BRES      L:0x50f0, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
BEEP_LSICalibrationConfig:
        CALLF     L:?udiv32_l0_l0_dl
        DATA
        DC32      0x3e8
        CODE
        LD        A, L:0x50f3
        AND       A, #0xe0
        LD        L:0x50f3, A
        LDW       X, S:?w1
        SRLW      X
        SRLW      X
        SRLW      X
        LDW       Y, X
        SLLW      X
        SLLW      X
        SLLW      X
        LDW       S:?w2, X
        LDW       X, Y
        SLLW      X
        INCW      X
        LDW       S:?w0, X
        LDW       X, S:?w1
        SUBW      X, S:?w2
        CALLF     L:?mul16_x_x_w0
        LDW       S:?w1, X
        LDW       X, S:?w2
        CPW       X, S:?w1
        EXG       A, YL
        JRC       L:??BEEP_LSICalibrationConfig_0
        DEC       A
??BEEP_LSICalibrationConfig_0:
        DEC       A
        OR        A, L:0x50f3
        LD        L:0x50f3, A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 136 bytes in section .far_func.text
// 
// 136 bytes of CODE memory
//
//Errors: none
//Warnings: none
