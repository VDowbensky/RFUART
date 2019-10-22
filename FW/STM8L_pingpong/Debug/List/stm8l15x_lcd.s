///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:15
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_lcd.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBE5D.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_lcd.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_lcd.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4

        PUBLIC LCD_BlinkConfig
        PUBLIC LCD_ClearFlag
        PUBLIC LCD_ClearITPendingBit
        PUBLIC LCD_Cmd
        PUBLIC LCD_ContrastConfig
        PUBLIC LCD_DeInit
        PUBLIC LCD_DeadTimeConfig
        PUBLIC LCD_GetFlagStatus
        PUBLIC LCD_GetITStatus
        PUBLIC LCD_HighDriveCmd
        PUBLIC LCD_ITConfig
        PUBLIC LCD_Init
        PUBLIC LCD_PageSelect
        PUBLIC LCD_PortMaskConfig
        PUBLIC LCD_PulseOnDurationConfig
        PUBLIC LCD_WriteRAM


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_DeInit:
        CLR       A
        LD        L:0x5400, A
        LD        L:0x5401, A
        LD        L:0x5402, A
        LD        L:0x5403, A
??LCD_DeInit_0:
        CLRW      X
        LD        XL, A
        ADDW      X, #0x5404
        CLR       (X)
        INC       A
        CP        A, #0x5
        JRC       L:??LCD_DeInit_0
        CLR       A
??LCD_DeInit_1:
        CLRW      X
        LD        XL, A
        ADDW      X, #0x540c
        CLR       (X)
        INC       A
        CP        A, #0x16
        JRC       L:??LCD_DeInit_1
        CLR       L:0x542f
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_Init:
        LD        S:?b4, A
        LD        A, L:0x5403
        AND       A, #0xf
        LD        L:0x5403, A
        LD        A, L:0x5403
        OR        A, S:?b4
        LD        L:0x5403, A
        LD        A, L:0x5403
        AND       A, #0xf0
        LD        L:0x5403, A
        LD        A, L:0x5403
        OR        A, S:?b0
        LD        L:0x5403, A
        LD        A, L:0x5400
        AND       A, #0xf9
        LD        L:0x5400, A
        BRES      L:0x542f, #0x1
        LD        A, S:?b1
        CP        A, #0x20
        JRNE      L:??LCD_Init_0
        BSET      L:0x542f, #0x1
        JRA       L:??LCD_Init_1
??LCD_Init_0:
        AND       A, #0xf
        OR        A, L:0x5400
        LD        L:0x5400, A
??LCD_Init_1:
        BRES      L:0x5400, #0x0
        BRES      L:0x542f, #0x0
        LD        A, S:?b2
        CP        A, #0x10
        JRNE      L:??LCD_Init_2
        MOV       L:0x5400, L:0x5400
        BSET      L:0x542f, #0x0
        JRA       L:??LCD_Init_3
??LCD_Init_2:
        AND       A, #0xf
        OR        A, L:0x5400
        LD        L:0x5400, A
??LCD_Init_3:
        BRES      L:0x5401, #0x0
        LD        A, L:0x5401
        OR        A, S:?b3
        LD        L:0x5401, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_PortMaskConfig:
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        ADDW      X, #0x5404
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_Cmd:
        TNZ       A
        JREQ      L:??LCD_Cmd_0
        BSET      L:0x5402, #0x6
        RETF
??LCD_Cmd_0:
        BRES      L:0x5402, #0x6
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_HighDriveCmd:
        TNZ       A
        JREQ      L:??LCD_HighDriveCmd_0
        BSET      L:0x5401, #0x4
        RETF
??LCD_HighDriveCmd_0:
        BRES      L:0x5401, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_PulseOnDurationConfig:
        LD        S:?b0, A
        LD        A, L:0x5401
        AND       A, #0x1f
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        L:0x5401, A
        LD        A, L:0x5401
        OR        A, S:?b0
        LD        L:0x5401, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_DeadTimeConfig:
        LD        S:?b0, A
        LD        A, L:0x5402
        AND       A, #0xf8
        LD        L:0x5402, A
        LD        A, L:0x5402
        OR        A, S:?b0
        LD        L:0x5402, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_BlinkConfig:
        LD        S:?b1, A
        LD        A, L:0x5400
        AND       A, #0x3f
        LD        L:0x5400, A
        LD        A, L:0x5400
        OR        A, S:?b1
        LD        L:0x5400, A
        LD        A, L:0x5400
        AND       A, #0xc7
        LD        L:0x5400, A
        LD        A, L:0x5400
        OR        A, S:?b0
        LD        L:0x5400, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_ContrastConfig:
        LD        S:?b0, A
        LD        A, L:0x5401
        AND       A, #0xf1
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_WriteRAM:
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        ADDW      X, #0x540c
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_PageSelect:
        LD        S:?b0, A
        BRES      L:0x542f, #0x2
        LD        A, L:0x542f
        OR        A, S:?b0
        LD        L:0x542f, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_ITConfig:
        TNZ       A
        JREQ      L:??LCD_ITConfig_0
        BSET      L:0x5402, #0x5
        RETF
??LCD_ITConfig_0:
        BRES      L:0x5402, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_GetFlagStatus:
        LD        A, L:0x5402
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_ClearFlag:
        BSET      L:0x5402, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_GetITStatus:
        LD        A, L:0x5402
        MOV       S:?b0, L:0x5402
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        PUSH      A
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf
        AND       A, #0x1
        LD        S:?b0, A
        POP       A
        AND       A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_ClearITPendingBit:
        BSET      L:0x5402, #0x3
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 362 bytes in section .far_func.text
// 
// 362 bytes of CODE memory
//
//Errors: none
//Warnings: none
