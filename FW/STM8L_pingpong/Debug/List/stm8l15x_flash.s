///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:14
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_flash.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB983.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_flash.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_flash.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?add32_l0_l0_l1
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b8
        EXTERN ?load32_0x_l0
        EXTERN ?mov_l0_l1
        EXTERN ?mov_l1_l3
        EXTERN ?mov_l3_l0
        EXTERN ?pop_l3
        EXTERN ?pop_w5
        EXTERN ?push_l1
        EXTERN ?push_l3
        EXTERN ?push_w5
        EXTERN ?sll16_x_x_6
        EXTERN ?sll32_l0_l0_a
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w5

        PUBLIC FLASH_DeInit
        PUBLIC FLASH_EraseBlock
        PUBLIC FLASH_EraseByte
        PUBLIC FLASH_EraseOptionByte
        PUBLIC FLASH_GetBootSize
        PUBLIC FLASH_GetCodeSize
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetPowerStatus
        PUBLIC FLASH_GetProgrammingTime
        PUBLIC FLASH_GetReadOutProtectionStatus
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_PowerRunModeConfig
        PUBLIC FLASH_PowerWaitModeConfig
        PUBLIC FLASH_ProgramBlock
        PUBLIC FLASH_ProgramByte
        PUBLIC FLASH_ProgramOptionByte
        PUBLIC FLASH_ProgramWord
        PUBLIC FLASH_ReadByte
        PUBLIC FLASH_SetProgrammingTime
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_WaitForLastOperation


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_SetProgrammingTime:
        LD        S:?b0, A
        BRES      L:0x5050, #0x0
        LD        A, L:0x5050
        OR        A, S:?b0
        LD        L:0x5050, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_GetProgrammingTime:
        LD        A, L:0x5050
        AND       A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_PowerWaitModeConfig:
        DEC       A
        JREQ      L:??FLASH_PowerWaitModeConfig_0
        BSET      L:0x5050, #0x2
        RETF
??FLASH_PowerWaitModeConfig_0:
        BRES      L:0x5050, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_DeInit:
        CLR       L:0x5050
        CLR       L:0x5051
        MOV       L:0x5054, #0x40
        LD        A, L:0x5054
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_Unlock:
        CP        A, #0xfd
        JRNE      L:??FLASH_Unlock_0
        MOV       L:0x5052, #0x56
        MOV       L:0x5052, #0xae
        RETF
??FLASH_Unlock_0:
        CP        A, #0xf7
        JRNE      L:??FLASH_Unlock_1
        MOV       L:0x5053, #0xae
        MOV       L:0x5053, #0x56
??FLASH_Unlock_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_Lock:
        LD        S:?b0, A
        LD        A, L:0x5054
        AND       A, S:?b0
        LD        L:0x5054, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_ProgramByte:
        LDW       X, S:?w1
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_EraseByte:
        LDW       X, S:?w1
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_ProgramWord:
        CALLF     L:?push_l1
        BSET      L:0x5051, #0x6
        LDW       Y, S:?w1
        LD        A, (0x1,SP)
        LD        (Y), A
        LD        A, (0x2,SP)
        LDW       X, Y
        INCW      X
        LD        (X), A
        LD        A, (0x3,SP)
        LDW       X, Y
        INCW      X
        INCW      X
        LD        (X), A
        LD        A, (0x4,SP)
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
        ADD       SP, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_ReadByte:
        LDW       X, S:?w1
        LD        A, (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_ProgramOptionByte:
        BSET      L:0x5051, #0x7
        LD        (X), A
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        A, #0xfd
        CALLF     FLASH_WaitForLastOperation
        BRES      L:0x5051, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_EraseOptionByte:
        BSET      L:0x5051, #0x7
        CLR       (X)
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_GetReadOutProtectionStatus:
        CLR       S:?b0
        LD        A, L:0x4800
        CP        A, #0xaa
        JRNE      L:??FLASH_GetReadOutProtectionStatus_0
        MOV       S:?b0, #0x1
??FLASH_GetReadOutProtectionStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_GetBootSize:
        LD        A, L:0x4802
        CLRW      X
        LD        XL, A
        CLR       A
        SRLW      X
        RRC       A
        RLWA      X, A
        LD        A, L:0x4802
        CP        A, #0x80
        JRC       L:??FLASH_GetBootSize_0
        LDW       X, #0x2000
??FLASH_GetBootSize_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_GetCodeSize:
        LD        A, L:0x4807
        CLRW      X
        LD        XL, A
        CLR       A
        SRLW      X
        RRC       A
        RLWA      X, A
        LD        A, L:0x4807
        CP        A, #0x80
        JRC       L:??FLASH_GetCodeSize_0
        LDW       X, #0x2000
??FLASH_GetCodeSize_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_ITConfig:
        TNZ       A
        JREQ      L:??FLASH_ITConfig_0
        BSET      L:0x5050, #0x1
        RETF
??FLASH_ITConfig_0:
        BRES      L:0x5050, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_GetFlagStatus:
        LD        S:?b1, A
        CLR       S:?b0
        LD        A, L:0x5054
        BCP       A, S:?b1
        JREQ      L:??FLASH_GetFlagStatus_0
        MOV       S:?b0, #0x1
??FLASH_GetFlagStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_PowerRunModeConfig:
        DEC       A
        JREQ      L:??FLASH_PowerRunModeConfig_0
        BSET      L:0x5050, #0x3
        RETF
??FLASH_PowerRunModeConfig_0:
        BRES      L:0x5050, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_GetPowerStatus:
        LD        A, L:0x5050
        AND       A, #0xc
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_ProgramBlock:
        CALLF     L:?push_l3
        CALLF     L:?push_w5
        PUSH      S:?b8
        LDW       S:?w1, X
        MOV       S:?b8, S:?b0
        LDW       S:?w5, Y
        CLRW      Y
        CP        A, #0xfd
        JRNE      L:??FLASH_ProgramBlock_0
        LDW       X, #0x8000
        LDW       S:?w3, X
        SLLW      X
        JRA       ??FLASH_ProgramBlock_1
??FLASH_ProgramBlock_0:
        LDW       X, #0x1000
        LDW       S:?w3, X
        CLRW      X
??FLASH_ProgramBlock_1:
        LDW       S:?w2, X
        LDW       S:?w0, X
        LD        A, #0x6
        CALLF     L:?sll32_l0_l0_a
        CALLF     L:?mov_l3_l0
        CALLF     L:?mov_l0_l1
        CALLF     L:?mov_l1_l3
        CALLF     L:?add32_l0_l0_l1
        TNZ       S:?b8
        JRNE      L:??FLASH_ProgramBlock_2
        BSET      L:0x5051, #0x0
        JRA       L:??FLASH_ProgramBlock_3
??FLASH_ProgramBlock_2:
        BSET      L:0x5051, #0x4
??FLASH_ProgramBlock_3:
        LDW       X, S:?w1
        LDW       S:?w2, Y
        ADDW      X, S:?w2
        LDW       S:?w2, X
        LDW       X, Y
        ADDW      X, S:?w5
        LD        A, (X)
        LD        [S:?w2.w], A
        INCW      Y
        CPW       Y, #0x40
        JRC       L:??FLASH_ProgramBlock_3
        POP       S:?b8
        CALLF     L:?pop_w5
        CALLF     L:?pop_l3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_EraseBlock:
        CP        A, #0xfd
        JRNE      L:??FLASH_EraseBlock_0
        LDW       Y, #0x8000
        JRA       L:??FLASH_EraseBlock_1
??FLASH_EraseBlock_0:
        LDW       Y, #0x1000
??FLASH_EraseBlock_1:
        BSET      L:0x5051, #0x5
        CALLF     L:?sll16_x_x_6
        LDW       S:?w0, Y
        ADDW      X, S:?w0
        LDW       Y, X
        CLRW      X
        LDW       S:?w1, X
        LDW       S:?w0, X
        LDW       X, Y
        JPF       L:?load32_0x_l0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_WaitForLastOperation:
        CLRW      X
        DECW      X
        CP        A, #0xfd
        JRNE      L:??FLASH_WaitForLastOperation_0
??FLASH_WaitForLastOperation_1:
        LD        A, L:0x5054
        AND       A, #0x5
        DECW      X
        TNZ       A
        JRNE      L:??FLASH_WaitForLastOperation_2
        TNZW      X
        JRNE      L:??FLASH_WaitForLastOperation_1
        JRA       L:??FLASH_WaitForLastOperation_3
??FLASH_WaitForLastOperation_4:
        TNZW      X
        JREQ      L:??FLASH_WaitForLastOperation_3
??FLASH_WaitForLastOperation_0:
        LD        A, L:0x5054
        AND       A, #0x41
        DECW      X
        TNZ       A
        JREQ      L:??FLASH_WaitForLastOperation_4
??FLASH_WaitForLastOperation_2:
        TNZW      X
        JRNE      L:??FLASH_WaitForLastOperation_5
??FLASH_WaitForLastOperation_3:
        LD        A, #0x2
??FLASH_WaitForLastOperation_5:
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 470 bytes in section .far_func.text
// 
// 470 bytes of CODE memory
//
//Errors: none
//Warnings: none
