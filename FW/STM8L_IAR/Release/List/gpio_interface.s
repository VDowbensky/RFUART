///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                23/Jan/2019  18:06:12
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\src\gpio_interface.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW5842.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\src\gpio_interface.c" -e -Ohz --debug
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\gpio_interface.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_DeInit
        EXTERN EXTI_GetITStatus
        EXTERN EXTI_SetPinSensitivity
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_WriteBit
        EXTERN RF69_RXflag
        EXTERN RF69_RXtimeout
        EXTERN delay_ms

        PUBLIC Green_Off
        PUBLIC Green_On
        PUBLIC RF69_HWreset
        PUBLIC RF69_deselect
        PUBLIC RF69_select
        PUBLIC Red_Off
        PUBLIC Red_On
        PUBLIC cbDIO0irq
        PUBLIC cbDIO1irq
        PUBLIC checkDIO0
        PUBLIC checkDIO1
        PUBLIC initIO


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
initIO:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        MOV       S:?b0, #0x90
        LD        A, #0x2
        CALLF     ?Subroutine3
??CrossCallReturnLabel_7:
        MOV       S:?b0, #0x90
        LD        A, #0x4
        CALLF     ?Subroutine3
??CrossCallReturnLabel_6:
        MOV       S:?b0, #0xf0
        LD        A, #0x10
        CALLF     ?Subroutine2
??CrossCallReturnLabel_2:
        LD        A, #0x20
        CALLF     ?Subroutine2
??CrossCallReturnLabel_3:
        LD        A, #0x40
        CALLF     ?Subroutine3
??CrossCallReturnLabel_5:
        CLR       S:?b0
        LD        A, #0x80
        CALLF     ?Subroutine3
??CrossCallReturnLabel_4:
        MOV       S:?b0, #0x1
        LD        A, #0x10
        LDW       X, #0x5005
        CALLF     GPIO_WriteBit
        CLR       S:?b0
        LD        A, #0x1
        CALLF     ?Subroutine5
??CrossCallReturnLabel_13:
        CLR       S:?b0
        LD        A, #0x2
        CALLF     ?Subroutine5
??CrossCallReturnLabel_12:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_16:
        MOV       S:?b0, #0x40
        LD        A, #0x20
        CALLF     ?Subroutine5
??CrossCallReturnLabel_11:
        MOV       S:?b0, #0x40
        LD        A, #0x40
        CALLF     ?Subroutine5
??CrossCallReturnLabel_10:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        CALLF     EXTI_DeInit
        MOV       S:?b0, #0x1
        CLR       A
        CALLF     EXTI_SetPinSensitivity
        MOV       S:?b0, #0x1
        LD        A, #0x2
        JPF       EXTI_SetPinSensitivity

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine5:
        LDW       X, #0x500a
        JPF       GPIO_Init

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        LDW       X, #0x5005
        JPF       GPIO_Init

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        LDW       X, #0x5005
        CALLF     GPIO_Init
        MOV       S:?b0, #0xe0
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine1:
        CLR       S:?b0
        REQUIRE ??Subroutine6_0
        ;               // Fall through to label ??Subroutine6_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine6_0:
        LD        A, #0x10
        LDW       X, #0x500a
        JPF       GPIO_Init

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        MOV       S:?b0, #0xf0
        LD        A, #0x4
        LDW       X, #0x5000
        CALLF     GPIO_Init
        MOV       S:?b0, #0x40
        LD        A, #0x8
        LDW       X, #0x5000
        JPF       GPIO_Init

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
cbDIO0irq:
        CLRW      X
        INCW      X
        CALLF     EXTI_GetITStatus
        DEC       A
        JRNE      L:??cbDIO0irq_0
        CLRW      X
        INCW      X
        CALLF     EXTI_ClearITPendingBit
        MOV       L:RF69_RXflag, #0x1
??cbDIO0irq_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
cbDIO1irq:
        LDW       X, #0x2
        CALLF     EXTI_GetITStatus
        DEC       A
        JRNE      L:??cbDIO1irq_0
        LDW       X, #0x2
        CALLF     EXTI_ClearITPendingBit
        CLRW      X
        INCW      X
        LDW       L:RF69_RXtimeout, X
??cbDIO1irq_0:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
Green_On:
        CLR       S:?b0
        LD        A, #0x4
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
Green_Off:
        MOV       S:?b0, #0x1
        LD        A, #0x4
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
Red_On:
        CLR       S:?b0
        LD        A, #0x2
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
Red_Off:
        MOV       S:?b0, #0x1
        LD        A, #0x2
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RF69_select:
        CLR       S:?b0
        LD        A, #0x10
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RF69_deselect:
        MOV       S:?b0, #0x1
        LD        A, #0x10
        LDW       X, #0x5005
        JPF       GPIO_WriteBit

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
checkDIO0:
??checkDIO0_0:
        LD        A, #0x1
        LDW       X, #0x500a
        CALLF     GPIO_ReadInputDataBit
        CP        A, #0x0
        JREQ      L:??checkDIO0_0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
checkDIO1:
        LD        A, #0x2
        LDW       X, #0x500a
        CALLF     GPIO_ReadInputDataBit
        CP        A, #0x0
        JRNE      L:??checkDIO1_0
        CLR       A
        RETF
??checkDIO1_0:
        LD        A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RF69_HWreset:
        MOV       S:?b0, #0xe0
        CALLF     ??Subroutine6_0
??CrossCallReturnLabel_14:
        MOV       S:?b0, #0x1
        CALLF     ?Subroutine4
??CrossCallReturnLabel_9:
        LDW       X, #0xa
        CALLF     delay_ms
        CLR       S:?b0
        CALLF     ?Subroutine4
??CrossCallReturnLabel_8:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_15:
        LDW       X, #0xa
        JPF       delay_ms

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine4:
        LD        A, #0x10
        LDW       X, #0x500a
        JPF       GPIO_WriteBit

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 393 bytes in section .far_func.text
// 
// 393 bytes of CODE memory
//
//Errors: none
//Warnings: none
