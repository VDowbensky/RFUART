///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:15
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\stm8l15x_it.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBC18.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\src\stm8l15x_it.c" -e
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_it.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN GPIO_ReadInputDataBit
        EXTERN Key
        EXTERN PacketDelay
        EXTERN PacketFlag
        EXTERN PkDelay
        EXTERN RF69_RXtimeout
        EXTERN RTC_ClearITPendingBit
        EXTERN TIM4_ClearITPendingBit
        EXTERN TestMode
        EXTERN TimingDelay_Decrement
        EXTERN cbDIO0irq
        EXTERN cbDIO1irq
        EXTERN cbUSART1_RXirq
        EXTERN cbUSART1_RXtestirq
        EXTERN cbUSART1_TXirq

        PUBLIC ADC1_COMP_IRQHandler
        PUBLIC DMA1_CHANNEL0_1_IRQHandler
        PUBLIC DMA1_CHANNEL2_3_IRQHandler
        PUBLIC EXTI0_IRQHandler
        PUBLIC EXTI1_IRQHandler
        PUBLIC EXTI2_IRQHandler
        PUBLIC EXTI3_IRQHandler
        PUBLIC EXTI4_IRQHandler
        PUBLIC EXTI5_IRQHandler
        PUBLIC EXTI6_IRQHandler
        PUBLIC EXTI7_IRQHandler
        PUBLIC EXTIB_G_IRQHandler
        PUBLIC EXTID_H_IRQHandler
        PUBLIC EXTIE_F_PVD_IRQHandler
        PUBLIC FLASH_IRQHandler
        PUBLIC I2C1_SPI2_IRQHandler
        PUBLIC LCD_AES_IRQHandler
        PUBLIC RTC_CSSLSE_IRQHandler
        PUBLIC SPI1_IRQHandler
        PUBLIC SWITCH_CSS_BREAK_DAC_IRQHandler
        PUBLIC TIM1_CC_IRQHandler
        PUBLIC TIM1_UPD_OVF_TRG_COM_IRQHandler
        PUBLIC TIM2_CC_USART2_RX_IRQHandler
        PUBLIC TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
        PUBLIC TIM3_CC_USART3_RX_IRQHandler
        PUBLIC TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
        PUBLIC TIM4_UPD_OVF_TRG_IRQHandler
        PUBLIC TRAP_IRQHandler
        PUBLIC USART1_RX_TIM5_CC_IRQHandler
        PUBLIC USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC _interrupt_1
        PUBLIC _interrupt_10
        PUBLIC _interrupt_11
        PUBLIC _interrupt_12
        PUBLIC _interrupt_13
        PUBLIC _interrupt_14
        PUBLIC _interrupt_15
        PUBLIC _interrupt_16
        PUBLIC _interrupt_17
        PUBLIC _interrupt_18
        PUBLIC _interrupt_19
        PUBLIC _interrupt_20
        PUBLIC _interrupt_21
        PUBLIC _interrupt_22
        PUBLIC _interrupt_23
        PUBLIC _interrupt_24
        PUBLIC _interrupt_25
        PUBLIC _interrupt_26
        PUBLIC _interrupt_27
        PUBLIC _interrupt_28
        PUBLIC _interrupt_29
        PUBLIC _interrupt_3
        PUBLIC _interrupt_30
        PUBLIC _interrupt_31
        PUBLIC _interrupt_4
        PUBLIC _interrupt_5
        PUBLIC _interrupt_6
        PUBLIC _interrupt_7
        PUBLIC _interrupt_8
        PUBLIC _interrupt_9


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TRAP_IRQHandler:
_interrupt_1:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
FLASH_IRQHandler:
_interrupt_3:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA1_CHANNEL0_1_IRQHandler:
_interrupt_4:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
DMA1_CHANNEL2_3_IRQHandler:
_interrupt_5:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_CSSLSE_IRQHandler:
_interrupt_6:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        LDW       X, #0x40
        CALLF     RTC_ClearITPendingBit
        LD        A, L:PacketDelay
        DEC       A
        LD        L:PacketDelay, A
        LD        A, L:PacketDelay
        JRNE      L:??RTC_CSSLSE_IRQHandler_0
        MOV       L:PacketDelay, L:PkDelay
        MOV       L:PacketFlag, #0x1
??RTC_CSSLSE_IRQHandler_0:
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTIE_F_PVD_IRQHandler:
_interrupt_7:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTIB_G_IRQHandler:
_interrupt_8:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTID_H_IRQHandler:
_interrupt_9:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI0_IRQHandler:
_interrupt_10:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        CALLF     cbDIO0irq
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI1_IRQHandler:
_interrupt_11:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        CALLF     cbDIO1irq
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI2_IRQHandler:
_interrupt_12:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI3_IRQHandler:
_interrupt_13:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI4_IRQHandler:
_interrupt_14:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI5_IRQHandler:
_interrupt_15:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI6_IRQHandler:
_interrupt_16:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI7_IRQHandler:
_interrupt_17:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
LCD_AES_IRQHandler:
_interrupt_18:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SWITCH_CSS_BREAK_DAC_IRQHandler:
_interrupt_19:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ADC1_COMP_IRQHandler:
_interrupt_20:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
_interrupt_21:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM2_CC_USART2_RX_IRQHandler:
_interrupt_22:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
_interrupt_23:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM3_CC_USART3_RX_IRQHandler:
_interrupt_24:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM1_UPD_OVF_TRG_COM_IRQHandler:
_interrupt_25:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM1_CC_IRQHandler:
_interrupt_26:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
TIM4_UPD_OVF_TRG_IRQHandler:
_interrupt_27:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_3:
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        LDW       X, L:RF69_RXtimeout
        INCW      X
        LDW       L:RF69_RXtimeout, X
        CALLF     TimingDelay_Decrement
        LD        A, #0x1
        CALLF     TIM4_ClearITPendingBit
        LD        A, #0x20
        LDW       X, #0x500a
        CALLF     GPIO_ReadInputDataBit
        CP        A, #0x0
        JRNE      L:??TIM4_UPD_OVF_TRG_IRQHandler_0
        INC       L:`TIM4_UPD_OVF_TRG_IRQHandler::K0cnt`
        JRA       L:??TIM4_UPD_OVF_TRG_IRQHandler_1
??TIM4_UPD_OVF_TRG_IRQHandler_0:
        DEC       L:`TIM4_UPD_OVF_TRG_IRQHandler::K0cnt`
        LD        A, L:`TIM4_UPD_OVF_TRG_IRQHandler::K0cnt`
        DEC       A
        JRSGE     L:??TIM4_UPD_OVF_TRG_IRQHandler_1
        CLR       L:`TIM4_UPD_OVF_TRG_IRQHandler::K0cnt`
??TIM4_UPD_OVF_TRG_IRQHandler_1:
        LD        A, #0x40
        LDW       X, #0x500a
        CALLF     GPIO_ReadInputDataBit
        CP        A, #0x0
        JRNE      L:??TIM4_UPD_OVF_TRG_IRQHandler_2
        INC       L:`TIM4_UPD_OVF_TRG_IRQHandler::K1cnt`
        JRA       L:??TIM4_UPD_OVF_TRG_IRQHandler_3
??TIM4_UPD_OVF_TRG_IRQHandler_2:
        DEC       L:`TIM4_UPD_OVF_TRG_IRQHandler::K1cnt`
        LD        A, L:`TIM4_UPD_OVF_TRG_IRQHandler::K1cnt`
        DEC       A
        JRSGE     L:??TIM4_UPD_OVF_TRG_IRQHandler_3
        CLR       L:`TIM4_UPD_OVF_TRG_IRQHandler::K1cnt`
??TIM4_UPD_OVF_TRG_IRQHandler_3:
        INC       L:`TIM4_UPD_OVF_TRG_IRQHandler::Tim4cnt`
        LD        A, L:`TIM4_UPD_OVF_TRG_IRQHandler::Tim4cnt`
        CP        A, #0x64
        JRNE      L:??TIM4_UPD_OVF_TRG_IRQHandler_4
        CLR       L:`TIM4_UPD_OVF_TRG_IRQHandler::Tim4cnt`
        LD        A, L:`TIM4_UPD_OVF_TRG_IRQHandler::K0cnt`
        CP        A, #0x32
        JRSLT     L:??TIM4_UPD_OVF_TRG_IRQHandler_5
        MOV       L:`TIM4_UPD_OVF_TRG_IRQHandler::k0`, #0x1
        JRA       L:??TIM4_UPD_OVF_TRG_IRQHandler_6
??TIM4_UPD_OVF_TRG_IRQHandler_5:
        CLR       L:`TIM4_UPD_OVF_TRG_IRQHandler::k0`
??TIM4_UPD_OVF_TRG_IRQHandler_6:
        LD        A, L:`TIM4_UPD_OVF_TRG_IRQHandler::K1cnt`
        CP        A, #0x32
        JRSLT     L:??TIM4_UPD_OVF_TRG_IRQHandler_7
        MOV       L:`TIM4_UPD_OVF_TRG_IRQHandler::k1`, #0x1
        JRA       L:??TIM4_UPD_OVF_TRG_IRQHandler_8
??TIM4_UPD_OVF_TRG_IRQHandler_7:
        CLR       L:`TIM4_UPD_OVF_TRG_IRQHandler::k1`
??TIM4_UPD_OVF_TRG_IRQHandler_8:
        LD        A, L:`TIM4_UPD_OVF_TRG_IRQHandler::k1`
        SLL       A
        ADD       A, L:`TIM4_UPD_OVF_TRG_IRQHandler::k0`
        LD        L:Key, A
??TIM4_UPD_OVF_TRG_IRQHandler_4:
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
`TIM4_UPD_OVF_TRG_IRQHandler::K0cnt`:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
`TIM4_UPD_OVF_TRG_IRQHandler::K1cnt`:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
`TIM4_UPD_OVF_TRG_IRQHandler::Tim4cnt`:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
`TIM4_UPD_OVF_TRG_IRQHandler::k0`:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
`TIM4_UPD_OVF_TRG_IRQHandler::k1`:
        DS8 1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
SPI1_IRQHandler:
_interrupt_28:
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_29:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_4:
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        CALLF     cbUSART1_TXirq
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
USART1_RX_TIM5_CC_IRQHandler:
_interrupt_30:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_5:
        CALLF     L:?push_l0
        CALLF     L:?push_l1
        LD        A, L:TestMode
        JRNE      L:??USART1_RX_TIM5_CC_IRQHandler_0
        CALLF     cbUSART1_RXirq
        JRA       L:??USART1_RX_TIM5_CC_IRQHandler_1
??USART1_RX_TIM5_CC_IRQHandler_0:
        CALLF     cbUSART1_RXtestirq
??USART1_RX_TIM5_CC_IRQHandler_1:
        CALLF     L:?pop_l1
        CALLF     L:?pop_l0
        IRET

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
I2C1_SPI2_IRQHandler:
_interrupt_31:
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 354 bytes in section .far_func.text
//   5 bytes in section .near.bss
// 
// 354 bytes of CODE memory
//   5 bytes of DATA memory
//
//Errors: none
//Warnings: none
