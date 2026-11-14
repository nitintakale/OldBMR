*** TO ENTER PACKING ITEM IN SERIAL FOR SALE/EXPORT IN GROUP FILE BY PACKING DEPT FOR NEW(PRODUCT CODES)ONLY ONCE
SET COLOR TO W+/B,W+/R
CLOSE DATA
CLEA
STORE 0 TO RCHON3
STORE SPACE(1)  TO   VVCAN,OLD,AYN,NWADD
STORE SPACE(9)  TO   PMSR1,PMSR2,PMSR3,PMSR4,PMSR5,PMSR6,PMSR7,PMSR8,PMSR9,PMSR10,PMSR11,PMSR12,PMSR13,PMSR14,PMSR15
STORE SPACE(30) TO   PMDSR1,PMDSR2,PMDSR3,PMDSR4,PMDSR5,PMDSR6,PMDSR7,PMDSR8,PMDSR9,PMDSR10,PMDSR11,PMDSR12,PMDSR13,PMDSR14,PMDSR15
SET COLOR TO W+/B,W+/R 
@ 0,0 TO 24,78 DOUBLE           
@ 1,1 CLEA TO 23,77
SET COLOR TO W+/G 
@ 3,20 SAY 'PACKING MATERIAL ITEM ENTRY FOR ['  + ALLTRIM(PRODTYPE) +']'
SET COLOR TO W+/B,W+/R 
    GFILE=ALLTRIM(VPRTYPE)+ALLTRIM(SE)+".DBF"
    USE
    IF FILE("&GFILE")
        SELE A
        USE &GFILE
        GO TOP
        IF .NOT. EOF()
           OLD="Y"
        ENDIF   
    ELSE
        CREATE TABLE &GFILE (PM C(9) ,PKVAL C(4))
        CLOSE DATA    
    ENDIF
    SELE A
    USE
    LN=8
    COL=2
    CCOL=30       
   IF OLD="Y"
       @5,2 CLEA TO 23,76
       SET COLOR TO W+/BR
       @5,3 SAY '..............FOLLOWING ITEM ALREADY EXIST............'
       SET COLOR TO W+/B,W+/R
       @7,50 SAY 'STATUS'
       SELE C
       USE &GFILE ORDER SRORD
       OCNT=1
      DO WHILE .NOT. EOF()
         OCNTR = LTRIM(STR(OCNT))
         PMSR&OCNTR = C->PM
         IF LEN(ALLTRIM(PMSR&OCNTR)) = 0
            EXIT
         ELSE   
           @ LN,COL SAY 'SR:'+OCNTR
           SELE D
           USE ITEM_MST ORDER ITEMCD
           SEEK C->PM 
           PMDSR&OCNTR=D->NAME
           @ LN,COL+8 SAY PMDSR&OCNTR
           @ LN,COL+50 SAY C->STATUS
            LN=LN+1
            SELE C
            SKIP
            IF .NOT. EOF()
               OCNT=OCNT+1
               LOOP
            ELSE
               EXIT
            ENDIF        
         ENDIF && LEN
        ENDDO
         SELE D
         USE
         @22,2 SAY SPACE(77)
         SET COLOR TO W+/N
         @22,2 SAY ' DO U WANT TO ADD ? (Y/N) ' GET AYN PICT '!' VALID AYN$('YN')        
         READ
         SET COLOR TO W+/B,W+/R
         @22,2 SAY SPACE(77)
         IF AYN #"Y"
               NWADD="N"
               RETU
               *EXIT
         ELSE
              NWADD="Y"  
         ENDIF   
       ELSE
          NWADD="Y"
   ENDIF && OLD
        IF OLD="Y" .AND. NWADD="Y"     
               CNT=OCNT+1
         ENDIF
        IF OLD #"Y" .AND. NWADD="Y"     
                CNT=1
        ENDIF
            SET COLOR TO W+/N 
            @ 5,10 SAY 'SELECT ITEM CODE IN SERIAL OREDER AS REQUIRED IN B.P.R.'
            SET COLOR TO W+/B,W+/R 
             YN = " "
            DO WHILE .T.
                  DO WHILE CNT<=15
                    CNTR = LTRIM(STR(CNT))
                    PMSR&CNTR = CNTR
                   @ LN,COL SAY 'SR:'+CNTR
                   IF YN = "M" 
                      SET COLOR TO GR+*/N
                      @ LN,COL+6 SAY ""
                      SET COLOR TO W+/B,W+/R 
                   ELSE
                      SET COLOR TO GR+*/R
                      @ LN,COL+6 SAY ""
                      SET COLOR TO W+/B,W+/R 
                   ENDIF
                   DO TYPE WITH LN,CCOL,VVCAN,CNT,YN,CNTR
                   IF VVCAN = "Y"
                      EXIT
                   ENDIF
                   YN = " "
                   IF LEN(ALLTRIM(PMDSR&CNTR)) > 0
                     @ LN,COL+8 SAY PMDSR&CNTR
                   ENDIF
                  @ LN,COL+6 SAY " "
                  LN = LN+1
                  CNT = CNT+1
                 IF CNT > 15
                   EXIT
                 ENDIF
             ENDDO
             YN = " "
            @ LN,COL+6 SAY " "
            SET COLOR TO W+/B,W+/R
            @ 23,2 SAY SPACE(77) 
            @ 23,2 SAY '[C] TO CONFIRM [M] TO MODIFY ABOVE ENTRIES !!!' GET YN PICT '!' VALID YN$('CM ')
             READ
             SET COLOR TO W+/B,W+/R
           IF YN = "C"
               EXIT
           ENDIF
           IF YN = "M"
             VVCAN = " "
             LN = 8
             CNT = 1 
             LOOP
          ENDIF
          IF YN = " "
               CLOSE DATA
               RETU
          ENDIF
       ENDDO
*----UVH----*
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
      @ UL,UC SAY 'SR:'
      @ UL,UC+8 SAY PMDSR&UNTR
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
SET COLOR TO W+/RB
ACON=" "
@23,2 SAY '....PRESS [C] TO CONFIRM <ESC> TO CANCEL....' GET ACON PICT '!' VALID ACON$('C ')
READ
SET COLOR TO W+/B,W+/R
STORE LASTKEY() TO RDKEY
IF ACON="C"
        SELE C
        USE &GFILE
        CNT=1
        DO WHILE .T.
           CNTR = LTRIM(STR(CNT))
           PMSR = PMSR&CNTR
           IF VAL(ALLTRIM(PMSR))>0
               EXIT
           ENDIF    
            SELE D
            USE ITEM_MST ORDER ITEMCD
            SEEK PMSR
            SELE C
           LOCATE ALL FOR PM=PMSR
           IF .NOT. FOUND()
              APPE BLANK
           ENDIF
           GOOUT = " " 
          DO WHILE .T.
            IF RLOCK()
              REPL C->PM WITH PMSR    
              REPL C->PKVAL WITH D->PKVAL
              UNLOCK 
              EXIT
            ELSE
              STOR " " TO GOOUT
              DO ER_RLOC 
            ENDIF
         ENDDO  
            SELE D
            USE
            CNT=CNT+1
        ENDDO
        @23,2 CLEA TO 24,77
        SET COLOR TO W+*/GB
        @24,20 SAY '* * * DATA CONFIRMED & UPDATED * * *.PRESS ANY KEY'
    ELSE
        @24,2 SAY SPACE(77)
        SET COLOR TO W+*/GB
        @24,20 SAY '* * * DATA NOT CONFIRMED & CANCELLED * * *..PRESS ANY KEY'
     ENDIF   
     SET COLOR TO W+/B,W+/R
    =INKEY(0)
*-----UVH---*
*-----------
PROC TYPE
PARAM  VVLN,VVCOL,VCAN,CCNT,YYN,CNTR
SELE B
USE ITEM_MST ORDER ITEMCD
DO WHILE .T.
   STOR SPACE(25) TO AX
   SET COLOR TO W+/GR,W+/G
   DEFINE WINDOW TEMP FROM 4,VVCOL TO 20,VVCOL+40
   DEFINE POPUP S_LIST FROM 4,VVCOL TO 20,VVCOL+39 PROMPT FIELDS LTRIM(CODE)+" "+LTRIM(NAME)   FOOTER "PRESS [ GO DOWN] [ GO UP]  [ENTER] KEY TO SELECT"   && IN WINDOW TEMP 
   ACTIVATE WINDOW TEMP
   @ 0,0 GET AX POPUP S_LIST
   IF LEN(ALLTRIM(PMDSR&CNTR)) > 0
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
      PMSR&CNTR = B->CODE
      PMDSR&CNTR = B->NAME
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
      IF LEN(ALLTRIM(PMDSR&CNTR)) > 0
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
