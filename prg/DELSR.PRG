*PROC DELSR
STORE SPACE(1)  TO  DSR1,DSR2,DSR3,DSR4,DSR5,DSR6,DSR7,DSR8,DSR9,DSR10,DSR11,DSR12,DSR13,DSR14,DSR15
SET COLOR TO W+/B,W+/R 
@ 1,2 CLEA TO 23,77
SET COLOR TO W+/BR 
@ 1,20 SAY 'EXISTING PACKING MATERIAL ITEM NAMES  FOR   '+ALLTRIM(PRODTYPE)
SET COLOR TO W+/B,W+/R 
SET COLOR TO W+/N 
@ 3,5 SAY 'FOLLOWING IS LIST OF P.M. CODE IN SERIAL OREDER AS REQUIRED IN B.P.R.'
SET COLOR TO W+/B,W+/R 
@ 7,1 TO 22,77 DOUBLE
 LN=8
 COL=2
 CCOL=30
 CNT=1
 YN = " "
 GFILE=ALLTRIM(VPRTYPE)+ALLTRIM(SE)+".DBF"
 IF FILE("&GFILE")
    SELE C
    USE &GFILE
  ELSE
     SET COLOR TO W+/G 
     @23,3 SAY '.......FILE DOES NOT EXIST.......'
     SET COLOR TO W+/B,W+/R 
     CLOSE DATA
     RETU
  ENDIF
  CNT=1
  DO WHILE .NOT. EOF()           
    DO WHILE .T.
      CNTR = LTRIM(STR(CNT))
      PMSR&CNTR = C->PM
      SELE D
      USE ITEM_MST ORDER ITEMCD
      SEEK C->PM 
      PMDSR&CNTR=D->NAME
      SELE D
      USE 
      @ LN,COL SAY 'SR:'+CNTR
      @ LN,COL+8 SAY PMDSR&CNTR
      SELE C
      SKIP
      IF EOF()
          EXIT
      ELSE
        CNT = CNT+1 
        LN  = LN+1
        LOOP
      ENDIF
    ENDDO
   DO WHILE .T.
      MSR=0
      @23,2 SAY SPACE(77)
      SET COLOR TO W+/NB
      @23,2 SAY '.....ENTER SRNO TO DELETE [0] TO EXIT.....' GET MSR PICT '9' 
      READ VALID LASTKEY()=13 .or. lastkey()=27
      SET COLOR TO W+/B,W+/R 
      @23,2 SAY SPACE(77)
      if lastkey()=27 .or. msr=0
          msr=0
          EXIT
      endif    
      MSRR=LTRIM(STR(MSR))
      PMSR=PMSR&MSRR
      SELE C
      LOCATE ALL FOR PM=PMSR
      DELE 
      DSR&MSRR="Y" 
      SET COLOR TO GR+*/N
*      LN=MSR+7      
      @ MSR+7,8 SAY "D"
      SET COLOR TO W+/B,W+/R
   ENDDO
*---DISPLAY ENTERED SERIAL ORDER CODE
SET COLOR TO W+/RB
@8,2 CLEA TO 21,76
SET COLOR TO W+/G
UNT=1
UL=8
UC=2
DO WHILE UNT<=15
   UNTR = LTRIM(STR(UNT))
   IF PMDSR&UNTR # " "
      @ UL,UC SAY 'SR: '+LTRIM(STR(UNT))
      @ UL,UC+15 SAY PMDSR&UNTR
      IF DSR&UNTR="Y"
        SET COLOR TO W+*/N 
        @ UL,UC+6 SAY 'DEL'
        SET COLOR TO W+/B,W+/R 
      ENDIF
   ELSE
      EXIT
   ENDIF
   UL = UL+1
   UNT = UNT+1
   IF UNT > 15
      EXIT
   ENDIF
ENDDO
SELE C
SET FILT TO
@23,2 SAY SPACE(78)
SET COLOR TO W+/GB 
        @23,2 SAY SPACE(77)
        SET COLOR TO W+/GR 
        DCON=" "
        @23,2 SAY '.......PRESS [C] TO CONFIRM DELETION FROM BPR <ESC> TO CANCEL....' GET DCON PICT '!' VALID DCON$('C ')
        READ
         @23,2 SAY SPACE(77)
         IF DCON = "C"
            SELE C
            USE
            SELE C
            USE &GFILE EXCLU
            PACK
            SELE C
            USE
            @24,2 SAY SPACE(77)
            SET COLOR TO W+*/GN
            @24,20 SAY '* * * DATA CONFIRMED & DELETED * * *.PRESS ANY KEY'
   ELSE
           SET COLOR TO W+*/GN
           @24,2 SAY SPACE(77)
           @24,20 SAY '* * * DATA NOT DELETED * * *..PRESS ANY KEY'
    ENDIF   
        SET COLOR TO W+/B,W+/R 
        =INKEY(0)
         EXIT
   ENDDO
CLOSE DATA
RETU
