****CHK LIST FOR BMR/BPR
 IF MP='P'
    CCON=' '
    CLEA
    @15,5 SAY 'ENTER [C] FOR  BPR CHECKLIST' GET CCON PICT '!'
    READ
    IF CCON='C'
       VVNO=0
       CLEA
       ffs=' '
       @6,1 say '[F] FFS [E] EYE/EAR DROPS,BUDANASE,BECLATE [R] RESPULES'
       @8,1 SAY '[S] RESP.SOLN [B] BUDECORT [G] GENERIC PRODUCT   ' GET FFS PICT '!'
       READ
       @15,1 SAY 'ENTER NO OF CHKLIST COPIES:' GET VVNO PICT '9'
       READ
       N=1
       DO PRINTOPT
       DO WHILE N<=VVNO
         IF FFS='F'
            DO FCHKBPR
         ENDIF
         IF FFS='E'
            DO ECHKBPR
         ENDIF
         IF FFS='S'
            DO SCHKBPR
         ENDIF
        IF FFS='R'
            DO RCHKBPR
         ENDIF
        IF FFS='B'
            DO BCHKBPR
         ENDIF
        IF FFS='G'
            DO GCHKBPR
         ENDIF
            N=N+1
         ENDDO
    EJECT
    SET PRINT OFF
    SET PRINTER TO
    SET DEVI TO SCREEN
   ENDIF
ENDIF       
IF MP='M' 
    CHAT=' '
    CLEA
    @15,5 SAY 'ENTER [T] FOR  TERMINAL PRODUCT CHECKLIST' GET CHAT PICT '!'
    @17,5  SAY 'ENTER [A] FOR  ASEPTIC PRODUCT CHECKLIST'
    READ
    VVNO=0
    IF CHAT='T'
       CLEA
       @15,1 SAY 'ENTER NO OF CHKLIST COPIES:' GET VVNO PICT '9'
       READ
       N=1
       DO PRINTOPT
       DO WHILE N<=VVNO
                  DO TBMRCHECK
          EJECT
          N=N+1
       ENDDO
 *      EJECT
       SET PRINT OFF
       SET PRINTER TO
       SET DEVI TO SCREEN
    ENDIF
    IF CHAT='A'
       CLEA
       @15,1 SAY 'ENTER NO OF CHKLIST COPIES:' GET VVNO PICT '9'
       READ
       N=1
       DO PRINTOPT
       DO WHILE N<=VVNO
          DO BMRCHECK
          EJECT
          N=N+1
       ENDDO
*      EJECT
     SET PRINT OFF
     SET PRINTER TO
     SET DEVI TO SCREEN
  ENDIF
ENDIF
