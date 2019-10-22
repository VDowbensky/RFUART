///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:02
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_exti.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW2A5C.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_exti.c"
//        -e -Ohz --debug --code_model medium --data_model medium -o
//        "D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\Release\Obj"
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\stm8\LIB\dlstm8mmn.h" -D STM8L15X_LD -lcN "D:\Projects\Lab
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_exti.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?sll16_x_x_a
        EXTERN ?sll8_a_a_6
        EXTERN ?sra16_x_x_a
        EXTERN ?srl8_a_a_6

        PUBLIC EXTI_ClearITPendingBit
        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GetITStatus
        PUBLIC EXTI_GetPinSensitivity
        PUBLIC EXTI_GetPortSensitivity
        PUBLIC EXTI_SelectPort
        PUBLIC EXTI_SetHalfPortSelection
        PUBLIC EXTI_SetPinSensitivity
        PUBLIC EXTI_SetPortSensitivity


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_DeInit:
        CLR       L:0x50a0
        CLR       L:0x50a1
        CLR       L:0x50a2
        CLR       L:0x50aa
        MOV       L:0x50a3, #0xff
        MOV       L:0x50a4, #0xff
        CLR       L:0x50a5
        CLR       L:0x50ab
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_SetPinSensitivity:
        LD        S:?b1, A
        LD        A, S:?b0
        SLL       A
        SLL       A
        LD        S:?b2, A
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        LD        S:?b3, A
        LD        A, S:?b0
        CALLF     L:?sll8_a_a_6
        LD        S:?b4, A
        LD        A, S:?b1
        JREQ      L:??EXTI_SetPinSensitivity_0
        SUB       A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_1
        SUB       A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_2
        SUB       A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_3
        SUB       A, #0xa
        JREQ      L:??EXTI_SetPinSensitivity_4
        SUB       A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_5
        SUB       A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_6
        SUB       A, #0x2
        JREQ      L:??EXTI_SetPinSensitivity_7
        RETF
??EXTI_SetPinSensitivity_0:
        LD        A, L:0x50a0
        AND       A, #0xfc
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        OR        A, S:?b0
        JRA       ??EXTI_SetPinSensitivity_8
??EXTI_SetPinSensitivity_1:
        LD        A, L:0x50a0
        AND       A, #0xf3
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        OR        A, S:?b2
        JRA       ??EXTI_SetPinSensitivity_8
??EXTI_SetPinSensitivity_2:
        LD        A, L:0x50a0
        AND       A, #0xcf
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        OR        A, S:?b3
        JRA       ??EXTI_SetPinSensitivity_8
??EXTI_SetPinSensitivity_3:
        LD        A, L:0x50a0
        AND       A, #0x3f
        CALLF     ?Subroutine0
??CrossCallReturnLabel_3:
        OR        A, S:?b4
??EXTI_SetPinSensitivity_8:
        LD        L:0x50a0, A
        RETF
??EXTI_SetPinSensitivity_4:
        LD        A, L:0x50a1
        AND       A, #0xfc
        CALLF     ?Subroutine1
??CrossCallReturnLabel_4:
        OR        A, S:?b0
        JRA       ??EXTI_SetPinSensitivity_9
??EXTI_SetPinSensitivity_5:
        LD        A, L:0x50a1
        AND       A, #0xf3
        CALLF     ?Subroutine1
??CrossCallReturnLabel_5:
        OR        A, S:?b2
        JRA       ??EXTI_SetPinSensitivity_9
??EXTI_SetPinSensitivity_6:
        LD        A, L:0x50a1
        AND       A, #0xcf
        CALLF     ?Subroutine1
??CrossCallReturnLabel_6:
        OR        A, S:?b3
        JRA       ??EXTI_SetPinSensitivity_9
??EXTI_SetPinSensitivity_7:
        LD        A, L:0x50a1
        AND       A, #0x3f
        CALLF     ?Subroutine1
??CrossCallReturnLabel_7:
        OR        A, S:?b4
??EXTI_SetPinSensitivity_9:
        LD        L:0x50a1, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        LD        L:0x50a1, A
        LD        A, L:0x50a1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LD        L:0x50a0, A
        LD        A, L:0x50a0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_SelectPort:
        TNZ       A
        JRNE      L:??EXTI_SelectPort_0
        BRES      L:0x50ab, #0x5
        RETF
??EXTI_SelectPort_0:
        CP        A, #0x2
        JRNE      L:??EXTI_SelectPort_1
        BRES      L:0x50ab, #0x6
        RETF
??EXTI_SelectPort_1:
        CP        A, #0x4
        JRNE      L:??EXTI_SelectPort_2
        BRES      L:0x50a5, #0x7
        RETF
??EXTI_SelectPort_2:
        CP        A, #0x6
        JRNE      L:??EXTI_SelectPort_3
        BSET      L:0x50a5, #0x7
        RETF
??EXTI_SelectPort_3:
        CP        A, #0x10
        JRNE      L:??EXTI_SelectPort_4
        BSET      L:0x50ab, #0x5
        RETF
??EXTI_SelectPort_4:
        BSET      L:0x50ab, #0x6
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_SetHalfPortSelection:
        LD        S:?b1, A
        BCP       A, #0x80
        JRNE      L:??EXTI_SetHalfPortSelection_0
        TNZ       S:?b0
        JREQ      L:??EXTI_SetHalfPortSelection_1
        LD        A, L:0x50a5
        OR        A, S:?b1
        JRA       ??EXTI_SetHalfPortSelection_2
??EXTI_SetHalfPortSelection_1:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50a5
??EXTI_SetHalfPortSelection_2:
        LD        L:0x50a5, A
        RETF
??EXTI_SetHalfPortSelection_0:
        LD        A, S:?b1
        AND       A, #0x7f
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??EXTI_SetHalfPortSelection_3
        LD        A, L:0x50ab
        OR        A, S:?b1
        JRA       ??EXTI_SetHalfPortSelection_4
??EXTI_SetHalfPortSelection_3:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x50ab
??EXTI_SetHalfPortSelection_4:
        LD        L:0x50ab, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_SetPortSensitivity:
        LD        S:?b1, A
        LD        A, S:?b0
        CLRW      Y
        EXG       A, YL
        LD        A, S:?b1
        BCP       A, #0xf0
        JRNE      L:??EXTI_SetPortSensitivity_0
        LDW       X, #0x3
        LD        A, S:?b1
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50a2
        LD        L:0x50a2, A
        LD        A, S:?b1
        LDW       X, Y
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50a2
        LD        L:0x50a2, A
        RETF
??EXTI_SetPortSensitivity_0:
        LD        A, S:?b1
        AND       A, #0xf
        LD        S:?b0, A
        LDW       X, #0x3
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50aa
        LD        L:0x50aa, A
        LD        A, S:?b0
        LDW       X, Y
        CALLF     L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50aa
        LD        L:0x50aa, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_GetPinSensitivity:
        CLR       S:?b0
        TNZ       A
        JREQ      L:??EXTI_GetPinSensitivity_0
        SUB       A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_1
        SUB       A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_2
        SUB       A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_3
        SUB       A, #0xa
        JREQ      L:??EXTI_GetPinSensitivity_4
        SUB       A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_5
        SUB       A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_6
        SUB       A, #0x2
        JREQ      L:??EXTI_GetPinSensitivity_7
        JRA       L:??EXTI_GetPinSensitivity_8
??EXTI_GetPinSensitivity_0:
        LD        A, L:0x50a0
        JRA       ??EXTI_GetPinSensitivity_9
??EXTI_GetPinSensitivity_1:
        LD        A, L:0x50a0
        JRA       ??EXTI_GetPinSensitivity_10
??EXTI_GetPinSensitivity_2:
        LD        A, L:0x50a0
        JRA       ??EXTI_GetPinSensitivity_11
??EXTI_GetPinSensitivity_3:
        LD        A, L:0x50a0
        JRA       ??EXTI_GetPinSensitivity_12
??EXTI_GetPinSensitivity_4:
        LD        A, L:0x50a1
        JRA       ??EXTI_GetPinSensitivity_9
??EXTI_GetPinSensitivity_5:
        LD        A, L:0x50a1
??EXTI_GetPinSensitivity_10:
        SRL       A
        SRL       A
        JRA       ??EXTI_GetPinSensitivity_9
??EXTI_GetPinSensitivity_6:
        LD        A, L:0x50a1
??EXTI_GetPinSensitivity_11:
        SWAP      A
        AND       A, #0xf
??EXTI_GetPinSensitivity_9:
        AND       A, #0x3
        JRA       ??EXTI_GetPinSensitivity_13
??EXTI_GetPinSensitivity_7:
        LD        A, L:0x50a1
??EXTI_GetPinSensitivity_12:
        CALLF     L:?srl8_a_a_6
??EXTI_GetPinSensitivity_13:
        LD        S:?b0, A
??EXTI_GetPinSensitivity_8:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_GetPortSensitivity:
        LD        S:?b0, A
        BCP       A, #0xf0
        JRNE      L:??EXTI_GetPortSensitivity_0
        LD        A, L:0x50a2
        JRA       ??EXTI_GetPortSensitivity_1
??EXTI_GetPortSensitivity_0:
        LD        A, S:?b0
        AND       A, #0xf
        LD        S:?b0, A
        LD        A, L:0x50aa
??EXTI_GetPortSensitivity_1:
        CLRW      X
        LD        XL, A
        LD        A, S:?b0
        CALLF     L:?sra16_x_x_a
        LD        A, XL
        AND       A, #0x3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_GetITStatus:
        CALLF     ?Subroutine2
??CrossCallReturnLabel_8:
        JRNE      L:??EXTI_GetITStatus_0
        AND       A, L:0x50a4
        RETF
??EXTI_GetITStatus_0:
        AND       A, L:0x50a3
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        EXGW      X, Y
        LDW       X, Y
        RRWA      X, A
        CLR       A
        RLWA      X, A
        CPW       X, #0x100
        EXGW      X, Y
        LD        A, XL
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
EXTI_ClearITPendingBit:
        CALLF     ?Subroutine2
??CrossCallReturnLabel_9:
        JRNE      L:??EXTI_ClearITPendingBit_0
        LD        L:0x50a4, A
        RETF
??EXTI_ClearITPendingBit_0:
        LD        L:0x50a3, A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 557 bytes in section .far_func.text
// 
// 557 bytes of CODE memory
//
//Errors: none
//Warnings: none
