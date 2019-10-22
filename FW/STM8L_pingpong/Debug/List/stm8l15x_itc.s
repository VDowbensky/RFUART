///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:15
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_itc.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBC19.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_itc.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_itc.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?sll8_a_a_b0
        EXTERN ?srl8_a_a_b0

        PUBLIC ITC_DeInit
        PUBLIC ITC_GetCPUCC
        PUBLIC ITC_GetSoftIntStatus
        PUBLIC ITC_GetSoftwarePriority
        PUBLIC ITC_SetSoftwarePriority


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ITC_GetCPUCC:
        push cc
        pop a
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ITC_DeInit:
        MOV       L:0x7f70, #0xff
        MOV       L:0x7f71, #0xff
        MOV       L:0x7f72, #0xff
        MOV       L:0x7f73, #0xff
        MOV       L:0x7f74, #0xff
        MOV       L:0x7f75, #0xff
        MOV       L:0x7f76, #0xff
        MOV       L:0x7f77, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ITC_GetSoftIntStatus:
        CALLF     ITC_GetCPUCC
        AND       A, #0x28
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ITC_GetSoftwarePriority:
        LD        S:?b3, A
        CLR       S:?b2
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        LD        S:?b0, A
        LD        A, S:?b3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_3
        SUB       A, #0x2
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_5
        SUB       A, #0x3
        JREQ      L:??ITC_GetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_GetSoftwarePriority_7
        JRA       L:??ITC_GetSoftwarePriority_8
??ITC_GetSoftwarePriority_0:
        LD        A, L:0x7f70
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_1:
        LD        A, L:0x7f71
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_2:
        LD        A, L:0x7f72
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_3:
        LD        A, L:0x7f73
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_4:
        LD        A, L:0x7f74
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_5:
        LD        A, L:0x7f75
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_6:
        LD        A, L:0x7f76
        JRA       ??ITC_GetSoftwarePriority_9
??ITC_GetSoftwarePriority_7:
        LD        A, L:0x7f77
??ITC_GetSoftwarePriority_9:
        AND       A, S:?b0
        LD        S:?b2, A
??ITC_GetSoftwarePriority_8:
        MOV       S:?b0, S:?b1
        LD        A, S:?b2
        JPF       L:?srl8_a_a_b0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        SLL       A
        AND       A, #0x6
        LD        S:?b1, A
        LD        A, #0x3
        MOV       S:?b0, S:?b1
        JPF       L:?sll8_a_a_b0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ITC_SetSoftwarePriority:
        LD        S:?b2, A
        MOV       S:?b3, S:?b0
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        LD        S:?b4, A
        CPL       S:?b4
        MOV       S:?b0, S:?b1
        LD        A, S:?b3
        CALLF     L:?sll8_a_a_b0
        LD        S:?b0, A
        LD        A, S:?b2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_0
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_1
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_2
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_3
        SUB       A, #0x2
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_4
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_5
        SUB       A, #0x3
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_6
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        DEC       A
        JREQ      L:??ITC_SetSoftwarePriority_7
        RETF
??ITC_SetSoftwarePriority_0:
        LD        A, L:0x7f70
        AND       A, S:?b4
        LD        L:0x7f70, A
        LD        A, L:0x7f70
        OR        A, S:?b0
        LD        L:0x7f70, A
        RETF
??ITC_SetSoftwarePriority_1:
        LD        A, L:0x7f71
        AND       A, S:?b4
        LD        L:0x7f71, A
        LD        A, L:0x7f71
        OR        A, S:?b0
        LD        L:0x7f71, A
        RETF
??ITC_SetSoftwarePriority_2:
        LD        A, L:0x7f72
        AND       A, S:?b4
        LD        L:0x7f72, A
        LD        A, L:0x7f72
        OR        A, S:?b0
        LD        L:0x7f72, A
        RETF
??ITC_SetSoftwarePriority_3:
        LD        A, L:0x7f73
        AND       A, S:?b4
        LD        L:0x7f73, A
        LD        A, L:0x7f73
        OR        A, S:?b0
        LD        L:0x7f73, A
        RETF
??ITC_SetSoftwarePriority_4:
        LD        A, L:0x7f74
        AND       A, S:?b4
        LD        L:0x7f74, A
        LD        A, L:0x7f74
        OR        A, S:?b0
        LD        L:0x7f74, A
        RETF
??ITC_SetSoftwarePriority_5:
        LD        A, L:0x7f75
        AND       A, S:?b4
        LD        L:0x7f75, A
        LD        A, L:0x7f75
        OR        A, S:?b0
        LD        L:0x7f75, A
        RETF
??ITC_SetSoftwarePriority_6:
        LD        A, L:0x7f76
        AND       A, S:?b4
        LD        L:0x7f76, A
        LD        A, L:0x7f76
        OR        A, S:?b0
        LD        L:0x7f76, A
        RETF
??ITC_SetSoftwarePriority_7:
        LD        A, L:0x7f77
        AND       A, S:?b4
        LD        L:0x7f77, A
        LD        A, L:0x7f77
        OR        A, S:?b0
        LD        L:0x7f77, A
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 445 bytes in section .far_func.text
// 
// 445 bytes of CODE memory
//
//Errors: none
//Warnings: 1
