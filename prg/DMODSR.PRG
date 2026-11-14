*PROC MODSR
COUNCH=0
CLOSE DATA
VVCAN=" "
SET COLOR TO W+/B,W+/R 
@ 1,2 CLEA TO 23,77
SET COLOR TO W+/BR 
*@ 1,20 SAY 'PACKING MATERIAL MODIFICATION ITEM NAME FOR   '+ALLTRIM(PRODTYPE)
SET COLOR TO W+/B,W+/R 
SET COLOR TO W+/N 
@ 3,5 SAY 'FOLLOWING IS LIST OF P.M. CODE IN SERIAL OREDER AS REQUIRED IN B.P.R.'
SET COLOR TO W+/B,W+/R 
@ 5,1 TO 22,77 DOUBLE
@6,1 SAY 'SRNO     NAME                              UNITQTY    EXCESSQTY       STATUS'
 LN=8
 COL=2
 CCOL=30
 CNT=1
 YN = " "
 GFILE="AASALE.DBF"
* GFILE='A'+ALLTRIM(VPRTYPE)+ALLTRIM(SE)+".DBF"
 IF FILE("&GFILE")
    SELE C
    USE &GFILE ORDER SRORD
    COUNT TO MCOUNT
  ELSE
     SET COLOR TO W+/G 
     @23,3 SAY '.......FILE DOES NOT EXIST.......'
     SET COLOR TO W+/B,W+/R 
     CLOSE DATA
     RETU
  ENDIF
  SELE C
  GO TOP
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
      @ LN,COL+71 SAY C->STATUS
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
IF COUNCH=0
   DO WHILE .T.
      MSR=0
      @23,2 SAY SPACE(77)
      SET COLOR TO W+/NB

      @23,2 SAY '.....ENTER SRNO TO MODIFY [0] TO EXIT.....' GET MSR PICT '99'  VALID MSR<=MCOUNT
      READ VALID LASTKEY()=13 .or. lastkey()=27
      SET COLOR TO W+/B,W+/R 
      @23,2 SAY SPACE(77)
*SET TALK ON
*SET STEP ON
*SET ECHO ON
      if lastkey()=27 .or. msr=0
          msr=0
          EXIT
      endif    
      COUNCH=1
      CNT=MSR
      CNTR = LTRIM(STR(CNT))
      LN=MSR+7      
      SET COLOR TO GR+*/R
      @ LN,COL+6 SAY ""
      SET COLOR TO W+/B,W+/R 
      DO TYPE WITH LN,CCOL,VVCAN,CNT,YN,CNTR
      IF VVCAN = "Y"
          EXIT
       ENDIF
       YN = " "
       IF LEN(ALLTRIM(PMDSR&CNTR)) > 0
           @ LN,COL+8 SAY PMDSR&CNTR
           @ LN,COL+60 SAY "Y"
        ENDIF
        IF LEN(ALLTRIM(PMDSR&CNTR)) = 0
             VVCAN="Y"
             EXIT
         ENDIF   
         @ LN,COL+6 SAY " "
         LN = LN+1
         YN = " "
         @ LN,COL+6 SAY " "
   ENDDO
ELSE
   VVCAN="Y"
ENDIF
       IF VVCAN="Y"
           EXIT
       ENDIF    

         @23,2 SAY SPACE(77)
          SET COLOR TO W+/GR 
         @ 23,2 SAY '[C] TO CONFIRM ABOVE MODIFIED DATA....' GET YN PICT '!' VALID YN$('C ')
         SET COLOR TO W+/B,W+/R 
         READ
         @23,2 SAY SPACE(77)
         IF YN = "C"
           EXIT
         ENDIF
        IF YN = " "
          CLOSE DATA
          RETU
        ENDIF
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
   ELSE
      EXIT
   ENDIF
   UL = UL+1
   UNT = UNT+1
   IF UNT > 15
      EXIT
   ENDIF
ENDDO
@23,2 SAY SPACE(78)
SET COLOR TO W+/GB 
MCON=" "
@23,2 SAY '.......PRESS [C] TO CONFIRM <ESC> TO CANCEL....' GET MCON PICT '!' VALID MCON$('C ')
READ
SET COLOR TO W+/B,W+/R 
IF MCON="C"
        SELE C
        USE &GFILE
        CNT=1
        DO WHILE .NOT. EOF()
           CNTR = LTRIM(STR(CNT))
           PMSR = PMSR&CNTR
            SELE D
            USE ITEM_MST ORDER ITEMCD
            SEEK PMSR
            SELE C
            GOOUT = " " 
          DO WHILE .T.
            IF RLOCK()
               REPL C->PM WITH PMSR   
               REPL C->PKVAL WITH D->PKVAL
               REPL C->STATUS WITH "Y"
               UNLOCK 
               EXIT
            ELSE
               STOR " " TO GOOUT
               DO ER_RLOC 
            ENDIF
         ENDDO  
            SKIP
           IF EOF()
              EXIT
           ELSE   
             CNT=CNT+1
          ENDIF
        ENDDO
         @24,2 SAY SPACE(77)
         SET COLOR TO W+*/GN
       @24,20 SAY '* * * DATA CONFIRMED & UPDATED * * *.PRESS ANY KEY'
   ELSE
        SET COLOR TO W+*/GN
       @24,2 SAY SPACE(77)
       @24,20 SAY '* * * DATA NOT CONFIRMED & CANCELLED * * *..PRESS ANY KEY'
   ENDIF   
   SET COLOR TO W+/B,W+/R 
=INKEY(0)
*----------
PROC TYPE
PARAM  VVLN,VVCOL,VCAN,CCNT,YYN,CCNTR
SELE B
USE ITEM_MST ORDER ITEMCD
DO WHILE .T.
   STOR SPACE(25) TO AX
   SET COLOR TO W+/GR,W+/G
   DEFINE WINDOW TEMP FROM 4,VVCOL+4 TO 20,VVCOL+60
   DEFINE POPUP S_LIST FROM 4,VVCOL+4 TO 20,VVCOL+49 PROMPT FIELDS LTRIM(CODE)+" "+LTRIM(NAME)   FOOTER "PRESS [ GO DOWN] [ GO UP]  [ENTER] KEY TO SELECT"   && IN WINDOW TEMP 
   ACTIVATE WINDOW TEMP
   @ 0,0 GET AX POPUP S_LIST
   IF LEN(ALLTRIM(PMDSR&CCNTR)) > 0
      READ VALID LASTKEY() = 13 .OR. LASTKEY() = 27 .OR. LASTKEY() = 9
   ELSE
      READ VALID LASTKEY() = 13 .OR. LASTKEY() = 27
   ENDIF   
   DEACTIVATE WINDOW TEMP
   SET COLOR TO W+/B,W+/R 
   STOR LASTKEY() TO RDKEY
   IF RDKEY = 27
      CLOSE DATA
      VCAN = "Y"
      EXIT
   ENDIF
   IF RDKEY = 13
      PMDSR = B->NAME
      PMSR&CCNTR = B->CODE
      PMDSR&CCNTR = B->NAME
      EXIT
   ENDIF
   IF RDKEY = 9 
      SET COLOR TO GR+*/N
      @ VVLN,8 SAY ""
      SET COLOR TO W+/B,W+/R
      CCNT = CCNT+1
      IF CCNT > 15
         EXIT
      ENDIF
      VVLN = VVLN+1
      VVCOL = 30
      CNTR = LTRIM(STR(CCNT))
      IF LEN(ALLTRIM(PMDSR&CCNTR)) > 0
         SET COLOR TO GR+*/N
         @ VVLN,8 SAY ""
         SET COLOR TO W+/B,W+/R 
      ELSE
         @ VVLN-1,8 SAY " "
         CCNT = CCNT-1
         VVLN = VVLN-1
         EXIT
         *RETU
      ENDIF
      @ VVLN-1,8 SAY " "
      LOOP
   ENDIF
ENDDO
SELE B
USE
RETU
