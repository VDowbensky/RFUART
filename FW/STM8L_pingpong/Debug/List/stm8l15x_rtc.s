///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.11.1.207 for STM8                26/Jul/2019  14:50:16
// Copyright 2010-2019 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_rtc.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EWBFF6.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\STM8L15x_StdPeriph_Driver\src\stm8l15x_rtc.c"
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
//        equipment\RFUART\FW\pingpong\STM8L_pingpong\Debug\List\stm8l15x_rtc.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_w4
        EXTERN ?mov_w1_w0
        EXTERN ?mov_w3_w1
        EXTERN ?push_w4
        EXTERN ?srl8_a_a_6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4

        PUBLIC RTC_AlarmCmd
        PUBLIC RTC_AlarmStructInit
        PUBLIC RTC_AlarmSubSecondConfig
        PUBLIC RTC_BypassShadowCmd
        PUBLIC RTC_CalibOutputCmd
        PUBLIC RTC_CalibOutputConfig
        PUBLIC RTC_ClearFlag
        PUBLIC RTC_ClearITPendingBit
        PUBLIC RTC_DateStructInit
        PUBLIC RTC_DayLightSavingConfig
        PUBLIC RTC_DeInit
        PUBLIC RTC_EnterInitMode
        PUBLIC RTC_ExitInitMode
        PUBLIC RTC_GetAlarm
        PUBLIC RTC_GetDate
        PUBLIC RTC_GetFlagStatus
        PUBLIC RTC_GetITStatus
        PUBLIC RTC_GetStoreOperation
        PUBLIC RTC_GetSubSecond
        PUBLIC RTC_GetTime
        PUBLIC RTC_GetWakeUpCounter
        PUBLIC RTC_ITConfig
        PUBLIC RTC_Init
        PUBLIC RTC_OutputConfig
        PUBLIC RTC_RatioCmd
        PUBLIC RTC_SetAlarm
        PUBLIC RTC_SetDate
        PUBLIC RTC_SetTime
        PUBLIC RTC_SetWakeUpCounter
        PUBLIC RTC_SmoothCalibConfig
        PUBLIC RTC_StructInit
        PUBLIC RTC_SynchroShiftConfig
        PUBLIC RTC_TamperCmd
        PUBLIC RTC_TamperFilterConfig
        PUBLIC RTC_TamperLevelConfig
        PUBLIC RTC_TamperPinsPrechargeDuration
        PUBLIC RTC_TamperSamplingFreqConfig
        PUBLIC RTC_TimeStructInit
        PUBLIC RTC_WaitForSynchro
        PUBLIC RTC_WakeUpClockConfig
        PUBLIC RTC_WakeUpCmd
        PUBLIC RTC_WriteProtectionCmd


        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_DeInit:
        CALLF     L:?push_w4
        PUSH      S:?b10
        CLR       S:?b10
        CLR       S:?b9
        CLR       S:?b8
        CALLF     ?Subroutine2
??CrossCallReturnLabel_9:
        JRNE      ??lb_0
        JP        L:??RTC_DeInit_0
??lb_0:
        CLR       L:0x5140
        CLR       L:0x5141
        CLR       L:0x5142
        MOV       L:0x5144, #0x1
        MOV       L:0x5145, #0x21
        CLR       L:0x5146
        CLR       L:0x5150
        MOV       L:0x5151, #0xff
        MOV       L:0x5152, #0x7f
        CLR       L:0x516c
        CLR       L:0x516d
        CLR       L:0x5148
        CLR       L:0x5149
        CLR       L:0x514a
        CLRW      X
        JRA       ??RTC_DeInit_1
??RTC_DeInit_2:
        CLR       L:0x514c
??RTC_DeInit_1:
        DECW      X
        BTJT      L:0x514c, #0x2, L:??RTC_DeInit_3
        JRNE      L:??RTC_DeInit_2
??RTC_DeInit_3:
        BTJF      L:0x514c, #0x2, L:??RTC_DeInit_0
        CLR       L:0x5148
        MOV       L:0x5154, #0xff
        MOV       L:0x5155, #0xff
        CLR       L:0x515c
        CLR       L:0x515d
        CLR       L:0x515e
        CLR       L:0x515f
        CLR       L:0x5164
        CLR       L:0x5165
        CLR       L:0x5166
        CLR       L:0x514c
        CLR       L:0x514d
        BTJT      L:0x514c, #0x1, L:??RTC_DeInit_4
        JRA       L:??RTC_DeInit_5
??RTC_DeInit_6:
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
??RTC_DeInit_4:
        BTJF      L:0x514c, #0x1, L:??RTC_DeInit_5
        LDW       X, S:?w4
        INCW      X
        JRNE      L:??RTC_DeInit_6
??RTC_DeInit_5:
        BTJT      L:0x514c, #0x1, L:??RTC_DeInit_0
        CLR       L:0x516a
        CLR       L:0x516b
        CALLF     RTC_WaitForSynchro
        CP        A, #0x0
        JREQ      L:??RTC_DeInit_0
        MOV       S:?b10, #0x1
??RTC_DeInit_0:
        MOV       L:0x5159, #0xff
        LD        A, S:?b10
        POP       S:?b10
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        CALLF     ?Subroutine10
??CrossCallReturnLabel_41:
        CALLF     RTC_EnterInitMode
        CP        A, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine10:
        MOV       L:0x5159, #0xca
        MOV       L:0x5159, #0x53
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_Init:
        CALLF     L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
        CLR       S:?b10
        CALLF     ?Subroutine2
??CrossCallReturnLabel_10:
        JREQ      L:??RTC_Init_0
        BRES      L:0x5148, #0x6
        LD        A, [S:?w4.w]
        OR        A, L:0x5148
        LD        L:0x5148, A
        EXGW      X, Y
        LDW       X, S:?w4
        INCW      X
        INCW      X
        EXGW      X, Y
        LDW       X, Y
        LDW       X, (X)
        LD        A, XH
        LD        L:0x5150, A
        LDW       X, Y
        LDW       X, (X)
        LD        A, XL
        LD        L:0x5151, A
        LDW       X, S:?w4
        INCW      X
        LD        A, (X)
        LD        L:0x5152, A
        BRES      L:0x514c, #0x7
        MOV       S:?b10, #0x1
??RTC_Init_0:
        MOV       L:0x5159, #0xff
        LD        A, S:?b10
        POP       S:?b10
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_StructInit:
        LDW       Y, X
        CLR       (Y)
        INCW      X
        LD        A, #0x7f
        LD        (X), A
        EXGW      X, Y
        INCW      X
        INCW      X
        LDW       Y, #0xff
        LDW       (X), Y
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_WriteProtectionCmd:
        TNZ       A
        JREQ      L:??RTC_WriteProtectionCmd_0
        MOV       L:0x5159, #0xff
        RETF
??RTC_WriteProtectionCmd_0:
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_30:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine4:
        LD        S:?b0, A
        REQUIRE ??Subroutine13_0
        ;               // Fall through to label ??Subroutine13_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine13_0:
        CALLF     ?Subroutine10
??CrossCallReturnLabel_44:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_EnterInitMode:
        BTJT      L:0x514c, #0x6, L:??RTC_EnterInitMode_0
        MOV       L:0x514c, #0x80
        CLRW      X
??RTC_EnterInitMode_1:
        DECW      X
        BTJT      L:0x514c, #0x6, L:??RTC_EnterInitMode_0
        JRNE      L:??RTC_EnterInitMode_1
??RTC_EnterInitMode_0:
        LD        A, L:0x514c
        CALLF     L:?srl8_a_a_6
        AND       A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_ExitInitMode:
        BRES      L:0x514c, #0x7
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_WaitForSynchro:
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_31:
        LD        A, L:0x514c
        AND       A, #0x5f
        LD        L:0x514c, A
        CLRW      X
??RTC_WaitForSynchro_0:
        DECW      X
        BTJT      L:0x514c, #0x5, L:??RTC_WaitForSynchro_1
        JRNE      L:??RTC_WaitForSynchro_0
??RTC_WaitForSynchro_1:
        LD        A, L:0x514c
        MOV       L:0x5159, #0xff
        SWAP      A
        AND       A, #0xf
        SRL       A
        AND       A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_RatioCmd:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_0:
        JREQ      L:??RTC_RatioCmd_0
        BSET      L:0x5148, #0x5
        JRA       L:??RTC_RatioCmd_1
??RTC_RatioCmd_0:
        BRES      L:0x5148, #0x5
??RTC_RatioCmd_1:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        CALLF     ?Subroutine10
??CrossCallReturnLabel_43:
        TNZ       A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_BypassShadowCmd:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_1:
        JREQ      L:??RTC_BypassShadowCmd_0
        BSET      L:0x5148, #0x4
        JRA       L:??RTC_BypassShadowCmd_1
??RTC_BypassShadowCmd_0:
        BRES      L:0x5148, #0x4
??RTC_BypassShadowCmd_1:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_SetTime:
        LD        S:?b0, A
        LDW       Y, X
        CLR       S:?b2
        CLR       S:?b3
        LD        A, L:0x5148
        CALLF     ?Subroutine3
??CrossCallReturnLabel_11:
        JRNE      L:??RTC_SetTime_0
        MOV       L:0x5159, #0xff
        JRA       L:??RTC_SetTime_1
??RTC_SetTime_0:
        BTJF      L:0x5148, #0x6, L:??RTC_SetTime_2
        LDW       X, Y
        ADDW      X, #0x3
        LD        A, (X)
        LD        S:?b3, A
??RTC_SetTime_2:
        LDW       X, Y
        INCW      X
        INCW      X
        LD        A, (X)
        LDW       X, Y
        INCW      X
        TNZ       S:?b0
        JREQ      L:??RTC_SetTime_3
        LD        L:0x5140, A
        LD        A, (X)
        LD        L:0x5141, A
        LD        A, (Y)
        JRA       ??RTC_SetTime_4
??RTC_SetTime_3:
        CALLF     ByteToBcd2
        LD        L:0x5140, A
        LD        A, (X)
        CALLF     ByteToBcd2
        LD        L:0x5141, A
        LD        A, (Y)
        CALLF     ByteToBcd2
??RTC_SetTime_4:
        OR        A, S:?b3
        LD        L:0x5142, A
        LD        A, L:0x5146
        BRES      L:0x514c, #0x7
        MOV       L:0x5159, #0xff
        BTJT      L:0x5148, #0x4, L:??RTC_SetTime_5
        CALLF     RTC_WaitForSynchro
        CP        A, #0x0
        JREQ      L:??RTC_SetTime_1
??RTC_SetTime_5:
        MOV       S:?b2, #0x1
??RTC_SetTime_1:
        LD        A, S:?b2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine3:
        CALLF     ?Subroutine10
??CrossCallReturnLabel_42:
        CALLF     RTC_EnterInitMode
        CP        A, #0x0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_TimeStructInit:
        CALLF     ?Subroutine5
??CrossCallReturnLabel_13:
        EXGW      X, Y
        INCW      X
        INCW      X
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine5:
        LDW       Y, X
        ADDW      X, #0x3
        CLR       (X)
        CLR       (Y)
        LDW       X, Y
        INCW      X
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetTime:
        LD        S:?b1, A
        LDW       Y, X
        INCW      X
        INCW      X
        LDW       S:?w1, X
        LD        A, L:0x5140
        LD        (X), A
        LDW       S:?w2, Y
        LDW       X, S:?w2
        INCW      X
        LDW       S:?w2, X
        LD        A, L:0x5141
        LD        (X), A
        MOV       S:?b0, L:0x5142
        LD        A, L:0x5146
        LD        A, S:?b0
        AND       A, #0xbf
        LD        (Y), A
        LD        A, S:?b0
        AND       A, #0x40
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
        TNZ       S:?b1
        JRNE      L:??CrossCallReturnLabel_23
        CALLF     ??Subroutine12_0
??CrossCallReturnLabel_27:
        CALLF     ?Subroutine11
??CrossCallReturnLabel_23:
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine7:
        CALLF     ?Subroutine11
??CrossCallReturnLabel_24:
        REQUIRE ??Subroutine12_0
        ;               // Fall through to label ??Subroutine12_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine12_0:
        LD        A, (Y)
        CALLF     Bcd2ToByte
        LD        (Y), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine11:
        LD        A, [S:?w2.w]
        CALLF     Bcd2ToByte
        LD        [S:?w2.w], A
        LD        A, [S:?w1.w]
        CALLF     Bcd2ToByte
        LD        [S:?w1.w], A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetSubSecond:
        MOV       S:?b0, L:0x5157
        MOV       S:?b1, L:0x5158
        LD        A, L:0x5146
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        OR        A, S:?b1
        RLWA      X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_SetDate:
        LD        S:?b0, A
        LDW       S:?w1, X
        CLR       S:?b4
        LDW       Y, S:?w1
        INCW      Y
        TNZ       S:?b0
        JRNE      L:??RTC_SetDate_0
        LD        A, (Y)
        LD        S:?b1, A
        BCP       A, #0x10
        JREQ      L:??RTC_SetDate_0
        LD        A, S:?b1
        AND       A, #0xef
        ADD       A, #0xa
        LD        (Y), A
??RTC_SetDate_0:
        CALLF     ?Subroutine3
??CrossCallReturnLabel_12:
        JRNE      L:??RTC_SetDate_1
        MOV       L:0x5159, #0xff
        JRA       L:??RTC_SetDate_2
??RTC_SetDate_1:
        LD        A, L:0x5140
        LDW       X, S:?w1
        INCW      X
        INCW      X
        LD        A, (X)
        LDW       X, S:?w1
        ADDW      X, #0x3
        TNZ       S:?b0
        JREQ      L:??RTC_SetDate_3
        LD        L:0x5144, A
        LD        A, [S:?w1.w]
        SWAP      A
        AND       A, #0xf0
        SLL       A
        OR        A, (Y)
        LD        L:0x5145, A
        LD        A, (X)
        JRA       ??RTC_SetDate_4
??RTC_SetDate_3:
        CALLF     ByteToBcd2
        LD        L:0x5144, A
        LD        A, (Y)
        CALLF     ByteToBcd2
        LD        S:?b0, A
        LD        A, [S:?w1.w]
        SWAP      A
        AND       A, #0xf0
        SLL       A
        OR        A, S:?b0
        LD        L:0x5145, A
        LD        A, (X)
        CALLF     ByteToBcd2
??RTC_SetDate_4:
        LD        L:0x5146, A
        BRES      L:0x514c, #0x7
        MOV       L:0x5159, #0xff
        BTJT      L:0x5148, #0x4, L:??RTC_SetDate_5
        CALLF     RTC_WaitForSynchro
        CP        A, #0x0
        JREQ      L:??RTC_SetDate_2
??RTC_SetDate_5:
        MOV       S:?b4, #0x1
??RTC_SetDate_2:
        LD        A, S:?b4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_DateStructInit:
        LDW       Y, X
        LD        A, #0x1
        LD        (X), A
        INCW      X
        INCW      X
        LD        (X), A
        LDW       X, Y
        INCW      X
        LD        (X), A
        LDW       X, Y
        ADDW      X, #0x3
        CLR       (X)
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetDate:
        LD        S:?b7, A
        LDW       S:?w0, X
        LD        A, L:0x5140
        EXGW      X, Y
        LDW       X, S:?w0
        INCW      X
        INCW      X
        LD        A, L:0x5144
        LD        (X), A
        EXGW      X, Y
        MOV       S:?b6, L:0x5145
        ADDW      X, #0x3
        LDW       S:?w2, X
        LD        A, L:0x5146
        LD        (X), A
        CALLF     L:?mov_w1_w0
        LDW       X, S:?w1
        INCW      X
        LDW       S:?w1, X
        LD        A, S:?b6
        AND       A, #0x1f
        LD        (X), A
        LD        A, S:?b6
        SWAP      A
        AND       A, #0xf
        SRL       A
        LD        [S:?w0.w], A
        TNZ       S:?b7
        JRNE      L:??CrossCallReturnLabel_25
        CALLF     ?Subroutine7
??CrossCallReturnLabel_25:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_SetAlarm:
        CALLF     L:?push_w4
        PUSH      S:?b10
        LD        S:?b0, A
        LDW       S:?w1, X
        LD        A, L:0x5148
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_32:
        INCW      X
        INCW      X
        LD        A, (X)
        LD        S:?b1, A
        LDW       X, S:?w1
        ADDW      X, #0x5
        LDW       S:?w2, X
        LDW       X, S:?w1
        ADDW      X, #0x6
        LDW       S:?w4, X
        LDW       X, S:?w1
        ADDW      X, #0x3
        LDW       Y, X
        CALLF     L:?mov_w3_w1
        LDW       X, S:?w3
        INCW      X
        LDW       S:?w3, X
        LDW       X, S:?w1
        ADDW      X, #0x4
        TNZ       S:?b0
        JREQ      L:??RTC_SetAlarm_0
        LD        A, (X)
        LD        S:?b0, A
        AND       A, #0x80
        OR        A, S:?b1
        LD        S:?b10, A
        LD        A, S:?b0
        SLL       A
        AND       A, #0x80
        OR        A, [S:?w3.w]
        LD        S:?b6, A
        LD        A, (Y)
        OR        A, [S:?w1.w]
        LD        S:?b1, A
        LD        A, S:?b0
        SLL       A
        SLL       A
        AND       A, #0x80
        OR        A, S:?b1
        LD        S:?b2, A
        LD        A, [S:?w2.w]
        OR        A, [S:?w4.w]
        LD        S:?b1, A
        LD        A, S:?b0
        SLL       A
        SLL       A
        SLL       A
        AND       A, #0x80
        JRA       ??RTC_SetAlarm_1
??RTC_SetAlarm_0:
        CALLF     ByteToBcd2
        LD        S:?b0, A
        LD        A, (X)
        AND       A, #0x80
        OR        A, S:?b0
        LD        S:?b10, A
        LD        A, [S:?w3.w]
        CALLF     ByteToBcd2
        LD        S:?b0, A
        LD        A, (X)
        SLL       A
        AND       A, #0x80
        OR        A, S:?b0
        LD        S:?b6, A
        LD        A, [S:?w1.w]
        CALLF     ByteToBcd2
        LD        S:?b1, A
        LD        A, (X)
        SLL       A
        SLL       A
        AND       A, #0x80
        PUSH      A
        LD        A, (Y)
        OR        A, S:?b1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        LD        S:?b2, A
        LD        A, [S:?w4.w]
        CALLF     ByteToBcd2
        LD        S:?b1, A
        LD        A, (X)
        SLL       A
        SLL       A
        SLL       A
        AND       A, #0x80
        PUSH      A
        LD        A, [S:?w2.w]
        OR        A, S:?b1
        LD        S:?b1, A
        POP       A
??RTC_SetAlarm_1:
        OR        A, S:?b1
        LD        S:?b0, A
        LD        A, S:?b10
        LD        L:0x515c, A
        LD        A, S:?b6
        LD        L:0x515d, A
        LD        A, S:?b2
        LD        L:0x515e, A
        LD        A, S:?b0
        LD        L:0x515f, A
        MOV       L:0x5159, #0xff
        POP       S:?b10
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_AlarmStructInit:
        CALLF     ?Subroutine5
??CrossCallReturnLabel_14:
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
        LDW       X, Y
        ADDW      X, #0x5
        CLR       (X)
        LD        A, #0x1
        LDW       X, Y
        ADDW      X, #0x6
        LD        (X), A
        LD        A, #0xf0
        LDW       X, Y
        ADDW      X, #0x4
        LD        (X), A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetAlarm:
        CALLF     L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        LDW       S:?w2, X
        MOV       S:?b9, L:0x515c
        MOV       S:?b8, L:0x515d
        MOV       S:?b1, L:0x515e
        MOV       S:?b0, L:0x515f
        EXGW      X, Y
        LDW       X, S:?w2
        INCW      X
        INCW      X
        LD        A, S:?b9
        AND       A, #0x7f
        LD        (X), A
        EXGW      X, Y
        INCW      X
        LDW       S:?w1, X
        LD        A, S:?b8
        AND       A, #0x7f
        LD        (X), A
        LD        A, S:?b1
        AND       A, #0x3f
        LD        [S:?w2.w], A
        LD        A, S:?b1
        AND       A, #0x40
        LDW       X, S:?w2
        ADDW      X, #0x3
        LD        (X), A
        LDW       X, S:?w2
        ADDW      X, #0x6
        LDW       S:?w3, X
        LD        A, S:?b0
        AND       A, #0x3f
        LD        (X), A
        LD        A, S:?b0
        AND       A, #0x40
        LDW       X, S:?w2
        ADDW      X, #0x5
        LD        (X), A
        LD        A, S:?b8
        SRL       A
        AND       A, #0x40
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x80
        LD        S:?b9, A
        POP       A
        OR        A, S:?b9
        LD        S:?b8, A
        LD        A, S:?b1
        SRL       A
        SRL       A
        AND       A, #0x20
        OR        A, S:?b8
        LD        S:?b1, A
        LD        A, S:?b0
        SRL       A
        SRL       A
        SRL       A
        AND       A, #0x10
        OR        A, S:?b1
        LDW       X, S:?w2
        ADDW      X, #0x4
        LD        (X), A
        TNZ       S:?b10
        JRNE      L:??RTC_GetAlarm_0
        CALLF     ?Subroutine7
??CrossCallReturnLabel_26:
        LD        A, [S:?w3.w]
        CALLF     Bcd2ToByte
        LD        [S:?w3.w], A
??RTC_GetAlarm_0:
        POP       S:?b10
        JPF       L:?epilogue_w4

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_AlarmCmd:
        SUB       SP, #0x2
        CLRW      X
        LDW       (0x1,SP), X
        CALLF     ?Subroutine0
??CrossCallReturnLabel_2:
        JREQ      L:??RTC_AlarmCmd_0
        BSET      L:0x5149, #0x0
        LD        A, #0x1
        JRA       L:??RTC_AlarmCmd_1
??RTC_AlarmCmd_0:
        BRES      L:0x5149, #0x0
        MOV       S:?b0, L:0x514c
        JRA       L:??RTC_AlarmCmd_2
??RTC_AlarmCmd_3:
        LDW       X, (0x1,SP)
        INCW      X
        LDW       (0x1,SP), X
??RTC_AlarmCmd_2:
        LDW       X, (0x1,SP)
        INCW      X
        JREQ      L:??RTC_AlarmCmd_4
        LD        A, S:?b0
        BCP       A, #0x1
        JREQ      L:??RTC_AlarmCmd_3
??RTC_AlarmCmd_4:
        LD        A, L:0x514c
        AND       A, #0x1
??RTC_AlarmCmd_1:
        MOV       L:0x5159, #0xff
        ADD       SP, #0x2
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_AlarmSubSecondConfig:
        LD        S:?b1, A
        CLR       A
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_33:
        BTJT      L:0x514c, #0x6, L:??RTC_AlarmSubSecondConfig_0
        MOV       S:?b0, L:0x5149
        BRES      L:0x5149, #0x0
        LD        A, XH
        LD        L:0x5164, A
        LD        A, XL
        LD        L:0x5165, A
        LD        A, S:?b1
        LD        L:0x5166, A
        LD        A, S:?b0
        OR        A, #0x1
        OR        A, L:0x5149
        LD        L:0x5149, A
        LD        A, #0x1
??RTC_AlarmSubSecondConfig_0:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_WakeUpClockConfig:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_28:
        BRES      L:0x5149, #0x2
        LD        A, L:0x5148
        AND       A, #0xf8
        LD        L:0x5148, A
        LD        A, L:0x5148
        OR        A, S:?b0
        LD        L:0x5148, A
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_SetWakeUpCounter:
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_34:
        LD        A, XH
        LD        L:0x5154, A
        LD        A, XL
        LD        L:0x5155, A
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetWakeUpCounter:
        LD        A, L:0x5154
        MOV       S:?b1, L:0x5155
        CLRW      X
        LD        XL, A
        CLR       A
        OR        A, S:?b1
        RLWA      X, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_WakeUpCmd:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_3:
        JREQ      L:??RTC_WakeUpCmd_0
        BSET      L:0x5149, #0x2
        JRA       ??RTC_WakeUpCmd_1
??RTC_WakeUpCmd_0:
        BRES      L:0x5149, #0x2
        CLRW      X
??RTC_WakeUpCmd_2:
        DECW      X
        BTJT      L:0x514c, #0x2, L:??RTC_WakeUpCmd_3
        JRNE      L:??RTC_WakeUpCmd_2
??RTC_WakeUpCmd_3:
        LD        A, L:0x514c
        BCP       A, #0x4
        JREQ      L:??RTC_WakeUpCmd_4
??RTC_WakeUpCmd_1:
        LD        A, #0x1
        JRA       L:??RTC_WakeUpCmd_5
??RTC_WakeUpCmd_4:
        CLR       A
??RTC_WakeUpCmd_5:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_DayLightSavingConfig:
        LD        S:?b1, A
        LD        A, S:?b0
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_35:
        BRES      L:0x514a, #0x2
        CALLF     ?Subroutine6
??CrossCallReturnLabel_15:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine6:
        OR        A, S:?b1
        OR        A, L:0x514a
        LD        L:0x514a, A
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetStoreOperation:
        LD        A, L:0x514a
        AND       A, #0x4
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_OutputConfig:
        LD        S:?b1, A
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_36:
        LD        A, L:0x514a
        AND       A, #0x8f
        LD        L:0x514a, A
        LD        A, S:?b0
        CALLF     ?Subroutine6
??CrossCallReturnLabel_16:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_SynchroShiftConfig:
        LD        S:?b0, A
        LDW       Y, X
        CLR       A
        CLRW      X
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_37:
        BTJT      L:0x514c, #0x3, L:??RTC_SynchroShiftConfig_0
        JRA       L:??RTC_SynchroShiftConfig_1
??RTC_SynchroShiftConfig_2:
        INCW      X
??RTC_SynchroShiftConfig_0:
        BTJF      L:0x514c, #0x3, L:??RTC_SynchroShiftConfig_1
        CPW       X, #0xffff
        JRNE      L:??RTC_SynchroShiftConfig_2
??RTC_SynchroShiftConfig_1:
        BTJT      L:0x514c, #0x3, L:??RTC_SynchroShiftConfig_3
        LD        A, YH
        OR        A, S:?b0
        LD        L:0x515a, A
        EXG       A, YL
        LD        L:0x515b, A
        LD        A, #0x1
??RTC_SynchroShiftConfig_3:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_SmoothCalibConfig:
        LD        S:?b1, A
        LD        A, S:?b0
        LDW       Y, X
        CLR       S:?b0
        CLRW      X
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_38:
        BTJT      L:0x514c, #0x1, L:??RTC_SmoothCalibConfig_0
        JRA       L:??RTC_SmoothCalibConfig_1
??RTC_SmoothCalibConfig_2:
        INCW      X
??RTC_SmoothCalibConfig_0:
        BTJF      L:0x514c, #0x1, L:??RTC_SmoothCalibConfig_1
        CPW       X, #0xffff
        JRNE      L:??RTC_SmoothCalibConfig_2
??RTC_SmoothCalibConfig_1:
        BTJT      L:0x514c, #0x1, L:??RTC_SmoothCalibConfig_3
        RLWA      Y, A
        LD        S:?b0, A
        RRWA      Y, A
        OR        A, S:?b1
        OR        A, S:?b0
        LD        L:0x516a, A
        EXG       A, YL
        LD        L:0x516b, A
        MOV       S:?b0, #0x1
??RTC_SmoothCalibConfig_3:
        MOV       L:0x5159, #0xff
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_CalibOutputConfig:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_4:
        JREQ      L:??RTC_CalibOutputConfig_0
        BSET      L:0x514a, #0x3
        JRA       L:??RTC_CalibOutputConfig_1
??RTC_CalibOutputConfig_0:
        BRES      L:0x514a, #0x3
??RTC_CalibOutputConfig_1:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_CalibOutputCmd:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_5:
        JREQ      L:??RTC_CalibOutputCmd_0
        BSET      L:0x514a, #0x7
        JRA       L:??RTC_CalibOutputCmd_1
??RTC_CalibOutputCmd_0:
        BRES      L:0x514a, #0x7
??RTC_CalibOutputCmd_1:
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_TamperLevelConfig:
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_39:
        SLL       A
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??RTC_TamperLevelConfig_0
        LD        A, L:0x516c
        OR        A, S:?b1
        JRA       ??RTC_TamperLevelConfig_1
??RTC_TamperLevelConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x516c
??RTC_TamperLevelConfig_1:
        CALLF     ?Subroutine9
??CrossCallReturnLabel_20:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine9:
        LD        L:0x516c, A
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_TamperFilterConfig:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_6:
        AND       A, #0xe7
        CALLF     ?Subroutine8
??CrossCallReturnLabel_17:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine8:
        LD        L:0x516d, A
        LD        A, L:0x516d
        OR        A, S:?b0
        LD        L:0x516d, A
        MOV       L:0x5159, #0xff
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        LD        S:?b0, A
        CALLF     ?Subroutine10
??CrossCallReturnLabel_45:
        LD        A, L:0x516d
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_TamperSamplingFreqConfig:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_7:
        AND       A, #0xf8
        CALLF     ?Subroutine8
??CrossCallReturnLabel_18:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_TamperPinsPrechargeDuration:
        CALLF     ?Subroutine1
??CrossCallReturnLabel_8:
        AND       A, #0x1f
        CALLF     ?Subroutine8
??CrossCallReturnLabel_19:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_TamperCmd:
        LD        S:?b1, A
        CALLF     ??Subroutine13_0
??CrossCallReturnLabel_40:
        TNZ       S:?b0
        JREQ      L:??RTC_TamperCmd_0
        LD        A, L:0x516c
        OR        A, S:?b1
        JRA       ??RTC_TamperCmd_1
??RTC_TamperCmd_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x516c
??RTC_TamperCmd_1:
        CALLF     ?Subroutine9
??CrossCallReturnLabel_21:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_ITConfig:
        CALLF     ?Subroutine4
??CrossCallReturnLabel_29:
        LD        A, XL
        AND       A, #0x1
        LD        S:?b2, A
        LD        A, XL
        AND       A, #0xf0
        LD        S:?b1, A
        TNZ       S:?b0
        JREQ      L:??RTC_ITConfig_0
        LD        A, L:0x5149
        OR        A, S:?b1
        LD        L:0x5149, A
        LD        A, L:0x516c
        OR        A, S:?b2
        JRA       ??RTC_ITConfig_1
??RTC_ITConfig_0:
        CPL       S:?b1
        LD        A, S:?b1
        AND       A, L:0x5149
        LD        L:0x5149, A
        CPL       S:?b2
        LD        A, S:?b2
        AND       A, L:0x516c
??RTC_ITConfig_1:
        CALLF     ?Subroutine9
??CrossCallReturnLabel_22:
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetFlagStatus:
        LDW       S:?w2, X
        CLR       S:?b1
        LD        A, L:0x514c
        MOV       S:?b0, L:0x514d
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        EXGW      X, Y
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LDW       S:?w1, Y
        RLWA      X, A
        OR        A, S:?b2
        RLWA      X, A
        AND       A, S:?b5
        RRWA      X, A
        AND       A, S:?b4
        RRWA      X, A
        JREQ      L:??RTC_GetFlagStatus_0
        MOV       S:?b1, #0x1
??RTC_GetFlagStatus_0:
        LD        A, S:?b1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_ClearFlag:
        LD        A, XL
        CPL       A
        LD        L:0x514d, A
        LD        A, XH
        CPL       A
        AND       A, #0x7f
        LD        L:0x514c, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_GetITStatus:
        LDW       Y, X
        CLR       S:?b0
        MOV       S:?b2, L:0x5149
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, L:0x514d
        LD        S:?b1, A
        EXG       A, YL
        BCP       A, S:?b2
        JREQ      L:??RTC_GetITStatus_0
        TNZ       S:?b1
        JREQ      L:??RTC_GetITStatus_0
        MOV       S:?b0, #0x1
??RTC_GetITStatus_0:
        LD        A, S:?b0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
RTC_ClearITPendingBit:
        SRLW      X
        SRLW      X
        SRLW      X
        SRLW      X
        LD        A, XL
        CPL       A
        LD        L:0x514d, A
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
ByteToBcd2:
        LD        S:?b1, A
        CLR       S:?b0
        JRA       L:??ByteToBcd2_0
??ByteToBcd2_1:
        INC       S:?b0
        ADD       A, #0xf6
        LD        S:?b1, A
??ByteToBcd2_0:
        LD        A, S:?b1
        CP        A, #0xa
        JRNC      L:??ByteToBcd2_1
        LD        A, S:?b0
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
Bcd2ToByte:
        LD        S:?b0, A
        SWAP      A
        AND       A, #0xf
        LDW       X, #0xa
        MUL       X, A
        EXG       A, XL
        LD        S:?b1, A
        LD        A, S:?b0
        AND       A, #0xf
        ADD       A, S:?b1
        RETF

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 2 104 bytes in section .far_func.text
// 
// 2 104 bytes of CODE memory
//
//Errors: none
//Warnings: none
