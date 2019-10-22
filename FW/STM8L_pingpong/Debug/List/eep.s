///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:12
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab equipment\RFUART\FW\pingpong\STM8L_pingpong\src\eep.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB31C.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\eep.c" -e -Ohz
//        --debug --code_model medium --data_model medium -o "D:\Projects\Lab
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\eep.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_IAR_NOINIT 0xabdc5467
        #define SHF_WRITE 0x1

        EXTERN ?push_l0

        PUBLIC _A_FLASH_CR2
        PUBLIC _A_FLASH_IAPSR
        PUBLIC __eeprom_program_byte
        PUBLIC __eeprom_program_long
        PUBLIC __eeprom_wait_for_last_operation


        ASEGN `.near.noinit`:DATA:NOROOT,05051H
        SECTION_TYPE SHT_IAR_NOINIT, SHF_WRITE
        SECTION_GROUP _A_FLASH_CR2
// union <unnamed> volatile _A_FLASH_CR2
_A_FLASH_CR2:
        DS8 1

        ASEGN `.near.noinit`:DATA:NOROOT,05054H
        SECTION_TYPE SHT_IAR_NOINIT, SHF_WRITE
        SECTION_GROUP _A_FLASH_IAPSR
// union <unnamed> volatile _A_FLASH_IAPSR
_A_FLASH_IAPSR:
        DS8 1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
__eeprom_wait_for_last_operation:
        BTJF      L:0x5054, #0x0, L:??__eeprom_wait_for_last_operation_0
        CLRW      X
        RETF
??__eeprom_wait_for_last_operation_0:
        BTJF      L:0x5054, #0x6, L:??__eeprom_wait_for_last_operation_0
        CLRW      X
        INCW      X
        RETF
        REQUIRE _A_FLASH_IAPSR

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
__eeprom_program_byte:
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
__eeprom_program_long:
        CALLF     L:?push_l0
        BSET      L:0x5051, #0x6
        LD        A, (0x1,SP)
        LD        (X), A
        INCW      X
        LD        A, (0x2,SP)
        LD        (X), A
        INCW      X
        LD        A, (0x3,SP)
        LD        (X), A
        INCW      X
        LD        A, (0x4,SP)
        LD        (X), A
        ADD       SP, #0x4
        RETF
        REQUIRE _A_FLASH_CR2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 43 bytes in section .far_func.text
//  2 bytes in section .near.noinit   (abs)
// 
// 43 bytes of CODE memory
//  0 bytes of DATA memory (+ 2 bytes shared)
//
//Errors: none
//Warnings: none
