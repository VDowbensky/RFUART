///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:18
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\uart_interface.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWC86F.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\uart_interface.c" -e
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\uart_interface.s
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
        EXTERN GPIO_WriteBit
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

        PUBLIC DE_Off
        PUBLIC DE_On
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
        CALLF     DE_Off
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
        CALLF     DE_On
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
        CALLF     DE_Off
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
        LD        A, L:RxPointer
        INC       A
        LD        L:RxPointer, A
        LD        A, L:RxPointer
        CP        A, #0x80
        JRNE      L:??cbUSART1_RXirq_0
        CLR       L:RxPointer
??cbUSART1_RXirq_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DE_On:
        MOV       S:?b0, #0x1
        LD        A, #0x1
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DE_Off:
        CLR       S:?b0
        LD        A, #0x1
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 264 bytes in section .far_func.text
// 259 bytes in section .near.bss
// 
// 264 bytes of CODE memory
// 259 bytes of DATA memory
//
//Errors: none
//Warnings: none
