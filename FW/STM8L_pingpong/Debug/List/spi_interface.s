///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:13
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\spi_interface.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWB563.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\spi_interface.c" -e
//        -Ohz --debug --code_model medium --data_model medium -o
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\spi_interface.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN SPI_Cmd
        EXTERN SPI_DeInit
        EXTERN SPI_GetFlagStatus
        EXTERN SPI_Init
        EXTERN SPI_ReceiveData
        EXTERN SPI_SendData

        PUBLIC initSPI
        PUBLIC spi_transfer


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
initSPI:
        LDW       X, #0x5200
        CALLF     SPI_DeInit
        CLR       S:?b6
        MOV       S:?b5, #0x2
        CLR       S:?b4
        CLR       S:?b3
        CLR       S:?b2
        MOV       S:?b1, #0x4
        MOV       S:?b0, #0x18
        CLR       A
        LDW       X, #0x5200
        CALLF     SPI_Init
        LD        A, #0x1
        LDW       X, #0x5200
        JPF       SPI_Cmd

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
spi_transfer:
        PUSH      S:?b8
        LD        S:?b8, A
??spi_transfer_0:
        LD        A, #0x2
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        CP        A, #0x0
        JREQ      L:??spi_transfer_0
        LD        A, S:?b8
        LDW       X, #0x5200
        CALLF     SPI_SendData
??spi_transfer_1:
        LD        A, #0x1
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        CP        A, #0x0
        JREQ      L:??spi_transfer_1
        LDW       X, #0x5200
        CALLF     SPI_ReceiveData
        LD        S:?b8, A
??spi_transfer_2:
        LD        A, #0x80
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        DEC       A
        JREQ      L:??spi_transfer_2
        LD        A, S:?b8
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LDW       X, #0x5200
        JPF       SPI_GetFlagStatus

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 109 bytes in section .far_func.text
// 
// 109 bytes of CODE memory
//
//Errors: none
//Warnings: none
