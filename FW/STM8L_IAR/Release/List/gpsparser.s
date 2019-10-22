///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                23/Jan/2019  18:06:12
// Copyright 2010-2017 IAR Systems AB.
// PC-locked license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\Projects\Lab equipment\RFUART\FW\STM8L_IAR\src\gpsparser.c
//    Command line =  
//        -f C:\Users\Gemicle\AppData\Local\Temp\EW5843.tmp ("D:\Projects\Lab
//        equipment\RFUART\FW\STM8L_IAR\src\gpsparser.c" -e -Ohz --debug
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
//        equipment\RFUART\FW\STM8L_IAR\Release\List\gpsparser.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b8
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN GPSstring
        EXTERN RXbuffer
        EXTERN RxPointer
        EXTERN clearRXbuffer

        PUBLIC CommaPos
        PUBLIC GPSbuffer
        PUBLIC GPSflag
        PUBLIC GPShead1
        PUBLIC GPShead2
        PUBLIC GPSok
        PUBLIC GPSparse
        PUBLIC GPSstatus
        PUBLIC checkheader
        PUBLIC commacount
        PUBLIC readpointer
        PUBLIC resetGPSparser
        PUBLIC validity


        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
GPSflag:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
GPSbuffer:
        DS8 128

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
GPShead1:
        DC8 "$GPRMC,"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
GPShead2:
        DC8 "$GNRMC,"

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
validity:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
GPSstatus:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
CommaPos:
        DS8 20

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
commacount:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
GPSok:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
readpointer:
        DS8 1

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
GPSparse:
        PUSH      S:?b8
        SIM
        CLR       S:?b1
        JRA       L:??GPSparse_0
??GPSparse_1:
        CLRW      X
        LD        XL, A
        LD        A, (L:RXbuffer,X)
        LD        (L:GPSbuffer,X), A
        INC       S:?b1
??GPSparse_0:
        LD        A, S:?b1
        CP        A, L:RxPointer
        JRC       L:??GPSparse_1
        MOV       S:?b8, L:RxPointer
        CALLF     clearRXbuffer
        RIM
        CALLF     checkheader
        CP        A, #0x0
        JRNE      ??lb_0
        JP        L:??GPSparse_2
??lb_0:
        CLR       S:?b0
        CLR       L:commacount
        CLR       S:?b1
        JRA       L:??GPSparse_3
??GPSparse_4:
        CLRW      X
        LD        XL, A
        LD        A, #0x2c
        CP        A, (L:GPSbuffer,X)
        JRNE      L:??GPSparse_5
        INC       L:commacount
        LD        A, S:?b1
        LD        XL, A
        LD        A, S:?b0
        LD        (L:CommaPos,X), A
        INC       S:?b1
??GPSparse_5:
        INC       S:?b0
??GPSparse_3:
        LD        A, S:?b0
        CP        A, S:?b8
        JRC       L:??GPSparse_4
        CLR       S:?b1
??GPSparse_6:
        CLR       S:?b0
        LD        A, L:CommaPos
        CLRW      X
        LD        XL, A
        CALLF     ??Subroutine2_0
??CrossCallReturnLabel_2:
        LD        (L:GPSstring,X), A
        INC       S:?b1
        LD        A, S:?b1
        CP        A, #0xa
        JRC       L:??GPSparse_6
        MOV       L:GPSstring + 10, #0x2c
        LD        A, L:CommaPos + 1
        LD        XL, A
        LD        A, (L:GPSbuffer + 1,X)
        LD        L:validity, A
        LD        A, L:CommaPos + 2
        CLR       S:?b2
        LD        S:?b3, A
        LD        A, L:CommaPos + 3
        CALLF     ?Subroutine1
??CrossCallReturnLabel_0:
        JRSLT     L:??GPSparse_7
        CLR       S:?b1
??GPSparse_8:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_3:
        ADDW      X, #GPSstring + 11
        LD        (X), A
        INC       S:?b1
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        CPW       X, S:?w2
        JRSLT     L:??GPSparse_8
        ADDW      Y, #GPSbuffer + 1
        LD        A, (Y)
        LD        L:GPSstring + 21, A
??GPSparse_7:
        MOV       L:GPSstring + 20, #0x2c
        LD        A, L:CommaPos + 4
        LD        S:?b3, A
        LD        A, L:CommaPos + 5
        CALLF     ?Subroutine1
??CrossCallReturnLabel_1:
        JRSLT     L:??GPSparse_9
        CLR       S:?b1
??GPSparse_10:
        CALLF     ?Subroutine0
??CrossCallReturnLabel_4:
        ADDW      X, #GPSstring + 23
        LD        (X), A
        INC       S:?b1
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        CPW       X, S:?w2
        JRSLT     L:??GPSparse_10
        EXGW      X, Y
        ADDW      X, #GPSbuffer + 1
        LD        A, (X)
        LD        L:GPSstring + 34, A
??GPSparse_9:
        MOV       L:GPSstring + 33, #0x2c
        MOV       L:GPSok, #0x1
??GPSparse_2:
        CALLF     resetGPSparser
        POP       S:?b8
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        CLRW      Y
        EXG       A, YL
        LDW       X, Y
        SUBW      X, S:?w1
        LDW       S:?w2, X
        CPW       X, #0x2
        RETF

        SECTION `.far_func.text`:CODE:NOROOT(0)
?Subroutine0:
        LDW       X, S:?w1
        REQUIRE ??Subroutine2_0
        ;               // Fall through to label ??Subroutine2_0

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine2_0:
        ADDW      X, S:?w0
        ADDW      X, #GPSbuffer + 1
        LD        A, (X)
        LDW       X, S:?w0
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
checkheader:
        CLR       S:?b0
??checkheader_0:
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        LD        A, (L:GPSbuffer,X)
        CP        A, (L:GPShead1,X)
        JREQ      L:??checkheader_1
        CP        A, (L:GPShead2,X)
        JREQ      L:??checkheader_1
        CLR       A
        RETF
??checkheader_1:
        INC       S:?b0
        LD        A, S:?b0
        CP        A, #0x7
        JRC       L:??checkheader_0
        LD        A, #0x1
        RETF

        SECTION `.far_func.text`:CODE:REORDER:NOROOT(0)
        CODE
resetGPSparser:
        CLR       L:GPSstatus
        CLR       L:commacount
        CLR       L:readpointer
        JPF       clearRXbuffer

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 
// 307 bytes in section .far_func.text
// 154 bytes in section .near.bss
//  16 bytes in section .near.rodata
// 
// 307 bytes of CODE  memory
//  16 bytes of CONST memory
// 154 bytes of DATA  memory
//
//Errors: none
//Warnings: none
