///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                23/Jan/2019  18:06:13
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\src\uart_interface.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW5A99.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\src\uart_interface.c" -e -Ohz --debug
//        --code_model medium --data_model medium -o "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\Obj" --dlib_config "C:\Program
//        Files (x86)\IAR Systems\Embedded Workbench 8.0\stm8\LIB\dlstm8mmn.h"
//        -D STM8L15X_LD -lcN "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\List" -lb "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\List" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\src\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\inc\" -I "D:\Projects\Lab
//        equipment\RFUART\FW\IAR\STM8L15x_StdPeriph_Driver\src\" -I
//        "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\" -I
//        "D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\inc\" -I
//        "D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\inc\"
//        --require_prototypes --vregs 16)
//    Locale       =  Russian_RUS.1251
//    List file    =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\Release\List\uart_interface.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?epilogue_l2
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?push_l2
        EXTERN GPSflag
        EXTERN SYSCFG_REMAPDeInit
        EXTERN SYSCFG_REMAPPinConfig
        EXTERN USART_ClearITPendingBit
        EXTERN USART_Cmd
        EXTERN USART_DeInit
        EXTERN USART_GetFlagStatus
        EXTERN USART_ITConfig
        EXTERN USART_Init
        EXTERN USART_ReceiveData8
        EXTERN USART_SendData8

        PUBLIC RXbuffer
        PUBLIC RxPointer
        PUBLIC TXbuffer
        PUBLIC TxCount
        PUBLIC TxPointer
        PUBLIC USART_SendBlock
        PUBLIC cbUSART1_RXirq
        PUBLIC cbUSART1_TXirq
        PUBLIC clearRXbuffer
        PUBLIC initUART


        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
TXbuffer:
        DS8 128

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RXbuffer:
        DS8 128

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
TxCount:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
TxPointer:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
RxPointer:
        DS8 1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
initUART:
        CALLF     L:?push_l2
        CALLF     L:?mov_l2_l0
        CALLF     SYSCFG_REMAPDeInit
        LD        A, #0x1
        LDW       X, #0x11c
        CALLF     SYSCFG_REMAPPinConfig
        LDW       X, #0x5230
        CALLF     USART_DeInit
        MOV       S:?b6, #0xc
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        CALLF     L:?mov_l0_l2
        LDW       X, #0x5230
        CALLF     USART_Init
        LD        A, #0x1
        LDW       Y, #0x255
        LDW       X, #0x5230
        CALLF     USART_ITConfig
        LD        A, #0x1
        LDW       Y, #0x266
        LDW       X, #0x5230
        CALLF     USART_ITConfig
        LD        A, #0x1
        LDW       X, #0x5230
        CALLF     USART_Cmd
        JPF       L:?epilogue_l2

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART_SendBlock:
        CLR       L:TxPointer
        LD        L:TxCount, A
        LD        A, L:TXbuffer
        LDW       X, #0x5230
        JPF       USART_SendData8

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
clearRXbuffer:
        SIM
        CLR       L:RXbuffer
        CLR       L:RxPointer
        RIM
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
cbUSART1_TXirq:
        LDW       Y, #0x40
        LDW       X, #0x5230
        CALLF     USART_GetFlagStatus
        DEC       A
        JRNE      L:??cbUSART1_TXirq_0
        LDW       Y, #0x266
        LDW       X, #0x5230
        CALLF     USART_ClearITPendingBit
        LD        A, L:TxPointer
        CP        A, L:TxCount
        JRNC      L:??cbUSART1_TXirq_1
        INC       L:TxPointer
        LD        A, L:TxPointer
        CLRW      X
        LD        XL, A
        LD        A, (L:TXbuffer,X)
        LDW       X, #0x5230
        JPF       USART_SendData8
??cbUSART1_TXirq_1:
        CLR       L:TxCount
        CLR       L:TxPointer
??cbUSART1_TXirq_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
cbUSART1_RXirq:
        LDW       Y, #0x20
        LDW       X, #0x5230
        CALLF     USART_GetFlagStatus
        DEC       A
        JRNE      L:??cbUSART1_RXirq_0
        LDW       X, #0x5230
        CALLF     USART_ReceiveData8
        LD        S:?b0, A
        LD        A, L:RxPointer
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        LD        (L:RXbuffer,X), A
        CP        A, #0xa
        JRNE      L:??cbUSART1_RXirq_1
        MOV       L:GPSflag, #0x1
        RETF
??cbUSART1_RXirq_1:
        LD        A, L:RxPointer
        INC       A
        LD        L:RxPointer, A
        LD        A, L:RxPointer
        CP        A, #0x80
        JRNE      L:??cbUSART1_RXirq_0
        CLR       L:RxPointer
??cbUSART1_RXirq_0:
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 237 bytes in section .far_func.text
// 259 bytes in section .near.bss
// 
// 237 bytes of CODE memory
// 259 bytes of DATA memory
//
//Errors: none
//Warnings: 1
