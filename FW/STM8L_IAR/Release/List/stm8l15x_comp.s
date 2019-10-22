///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                17/Dec/2018  17:51:01
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_comp.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW2845.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\STM8L15x_StdPeriph_Driver\src\stm8l15x_comp.c"
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\stm8l15x_comp.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5

        PUBLIC COMP_ClearFlag
        PUBLIC COMP_ClearITPendingBit
        PUBLIC COMP_DeInit
        PUBLIC COMP_EdgeConfig
        PUBLIC COMP_GetFlagStatus
        PUBLIC COMP_GetITStatus
        PUBLIC COMP_GetOutputLevel
        PUBLIC COMP_ITConfig
        PUBLIC COMP_Init
        PUBLIC COMP_SchmittTriggerCmd
        PUBLIC COMP_TriggerConfig
        PUBLIC COMP_VrefintOutputCmd
        PUBLIC COMP_VrefintToCOMP1Connect
        PUBLIC COMP_WindowCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_DeInit:
        CLR       L:0x5440
        CLR       L:0x5441
        MOV       L:0x5442, #0xc0
        CLR       L:0x5443
        CLR       L:0x5444
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_Init:
        LD        S:?b2, A
        LD        A, L:0x5442
        AND       A, #0xc7
        LD        L:0x5442, A
        LD        A, L:0x5442
        OR        A, S:?b2
        LD        L:0x5442, A
        LD        A, L:0x5442
        AND       A, #0x3f
        LD        L:0x5442, A
        LD        A, L:0x5442
        OR        A, S:?b0
        LD        L:0x5442, A
        BRES      L:0x5441, #0x2
        LD        A, L:0x5441
        OR        A, S:?b1
        LD        L:0x5441, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_VrefintToCOMP1Connect:
        TNZ       A
        JREQ      L:??COMP_VrefintToCOMP1Connect_0
        BSET      L:0x5442, #0x2
        RETF
??COMP_VrefintToCOMP1Connect_0:
        BRES      L:0x5442, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_EdgeConfig:
        DEC       A
        JRNE      L:??COMP_EdgeConfig_0
        LD        A, L:0x5440
        AND       A, #0xfc
        LD        L:0x5440, A
        LD        A, L:0x5440
        OR        A, S:?b0
        LD        L:0x5440, A
        RETF
??COMP_EdgeConfig_0:
        LD        A, L:0x5441
        AND       A, #0xfc
        LD        L:0x5441, A
        LD        A, L:0x5441
        OR        A, S:?b0
        LD        L:0x5441, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_GetOutputLevel:
        DEC       A
        JRNE      L:??COMP_GetOutputLevel_0
        LD        A, L:0x5440
        BCP       A, #0x8
        JREQ      L:??COMP_GetOutputLevel_1
        LD        A, #0x1
        RETF
??COMP_GetOutputLevel_1:
        CLR       A
        RETF
??COMP_GetOutputLevel_0:
        LD        A, L:0x5441
        BCP       A, #0x8
        JREQ      L:??COMP_GetOutputLevel_2
        LD        A, #0x1
        RETF
??COMP_GetOutputLevel_2:
        CLR       A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_WindowCmd:
        TNZ       A
        JREQ      L:??COMP_WindowCmd_0
        BSET      L:0x5442, #0x1
        RETF
??COMP_WindowCmd_0:
        BRES      L:0x5442, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_VrefintOutputCmd:
        TNZ       A
        JREQ      L:??COMP_VrefintOutputCmd_0
        BSET      L:0x5442, #0x0
        RETF
??COMP_VrefintOutputCmd_0:
        BRES      L:0x5442, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_SchmittTriggerCmd:
        TNZ       A
        JREQ      L:??COMP_SchmittTriggerCmd_0
        BSET      L:0x5440, #0x2
        RETF
??COMP_SchmittTriggerCmd_0:
        BRES      L:0x5440, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_TriggerConfig:
        LD        S:?b2, A
        LD        A, S:?b0
        SLL       A
        SLL       A
        SLL       A
        LD        S:?b5, A
        LD        S:?b4, A
        CPL       S:?b4
        MOV       S:?b3, S:?b0
        CPL       S:?b3
        LD        A, S:?b2
        DEC       A
        JREQ      L:??COMP_TriggerConfig_0
        DEC       A
        JREQ      L:??COMP_TriggerConfig_1
        DEC       A
        JREQ      L:??COMP_TriggerConfig_2
        DEC       A
        JREQ      L:??COMP_TriggerConfig_3
        RETF
??COMP_TriggerConfig_0:
        TNZ       S:?b1
        JREQ      L:??COMP_TriggerConfig_4
        LD        A, L:0x5443
        AND       A, S:?b3
        JRA       ??COMP_TriggerConfig_5
??COMP_TriggerConfig_4:
        LD        A, L:0x5443
        OR        A, S:?b0
        JRA       ??COMP_TriggerConfig_5
??COMP_TriggerConfig_1:
        TNZ       S:?b1
        JREQ      L:??COMP_TriggerConfig_6
        LD        A, L:0x5443
        AND       A, S:?b4
        JRA       ??COMP_TriggerConfig_5
??COMP_TriggerConfig_6:
        LD        A, L:0x5443
        OR        A, S:?b5
??COMP_TriggerConfig_5:
        LD        L:0x5443, A
        RETF
??COMP_TriggerConfig_2:
        TNZ       S:?b1
        JREQ      L:??COMP_TriggerConfig_7
        LD        A, L:0x5444
        AND       A, S:?b3
        JRA       ??COMP_TriggerConfig_8
??COMP_TriggerConfig_7:
        LD        A, L:0x5444
        OR        A, S:?b0
        JRA       ??COMP_TriggerConfig_8
??COMP_TriggerConfig_3:
        TNZ       S:?b1
        JREQ      L:??COMP_TriggerConfig_9
        LD        A, L:0x5444
        AND       A, S:?b4
        JRA       ??COMP_TriggerConfig_8
??COMP_TriggerConfig_9:
        LD        A, L:0x5444
        OR        A, S:?b5
??COMP_TriggerConfig_8:
        LD        L:0x5444, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_ITConfig:
        DEC       A
        JRNE      L:??COMP_ITConfig_0
        TNZ       S:?b0
        JREQ      L:??COMP_ITConfig_1
        BSET      L:0x5440, #0x5
        RETF
??COMP_ITConfig_1:
        BRES      L:0x5440, #0x5
        RETF
??COMP_ITConfig_0:
        TNZ       S:?b0
        JREQ      L:??COMP_ITConfig_2
        BSET      L:0x5441, #0x5
        RETF
??COMP_ITConfig_2:
        BRES      L:0x5441, #0x5
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_GetFlagStatus:
        DEC       A
        JRNE      L:??COMP_GetFlagStatus_0
        LD        A, L:0x5440
        BCP       A, #0x10
        JREQ      L:??COMP_GetFlagStatus_1
        LD        A, #0x1
        RETF
??COMP_GetFlagStatus_1:
        CLR       A
        RETF
??COMP_GetFlagStatus_0:
        LD        A, L:0x5441
        BCP       A, #0x10
        JREQ      L:??COMP_GetFlagStatus_2
        LD        A, #0x1
        RETF
??COMP_GetFlagStatus_2:
        CLR       A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_ClearFlag:
        DEC       A
        JRNE      L:??COMP_ClearFlag_0
        BRES      L:0x5440, #0x4
        RETF
??COMP_ClearFlag_0:
        BRES      L:0x5441, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_GetITStatus:
        DEC       A
        JRNE      L:??COMP_GetITStatus_0
        LD        A, L:0x5440
        MOV       S:?b0, L:0x5440
        BCP       A, #0x10
        JREQ      L:??COMP_GetITStatus_1
        LD        A, S:?b0
        BCP       A, #0x20
        JREQ      L:??COMP_GetITStatus_1
        LD        A, #0x1
        RETF
??COMP_GetITStatus_1:
        CLR       A
        RETF
??COMP_GetITStatus_0:
        LD        A, L:0x5441
        MOV       S:?b0, L:0x5441
        BCP       A, #0x10
        JREQ      L:??COMP_GetITStatus_2
        LD        A, S:?b0
        BCP       A, #0x20
        JREQ      L:??COMP_GetITStatus_2
        LD        A, #0x1
        RETF
??COMP_GetITStatus_2:
        CLR       A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
COMP_ClearITPendingBit:
        DEC       A
        JRNE      L:??COMP_ClearITPendingBit_0
        BRES      L:0x5440, #0x4
        RETF
??COMP_ClearITPendingBit_0:
        BRES      L:0x5441, #0x4
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 426 bytes in section .far_func.text
// 
// 426 bytes of CODE memory
//
//Errors: none
//Warnings: none
