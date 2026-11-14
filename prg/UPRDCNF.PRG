SET PROC TO ADIHEAD
STORE 0 TO VADCD
DO WHILE .T.
   SET COLOR TO W+/G,R+/W
   @ 23,1 SAY SPACE(78)
   @ 23,10 SAY '1ST 5 CHARACTERS OF PRODUCT NAME ' GET CIPNAME PICT '!!!!!'
   READ
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   IF CIPNAME=SPACE(5)
      SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
      RETU
   ENDIF
   SELE B
   USE PRODMAST ORDER PN12
   SET FILT TO CIPNAME$NAME1
   GO TOP
   IF EOF()
      SET COLOR TO W+/G
      @ 22,2  SAY '......ITEM DOES NOT EXIST.....PRESS ANY KEY TO ENTER NEXT '
      SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
      LOOP
   ELSE
      EXIT
   ENDIF
ENDDO
SET COLOR TO R+/B,W+/G
DEFINE WINDOW TEMP FROM 15,1 TO 22,75
DEFINE POPUP S_LIST FROM 15,1 TO 22,75 PROMPT FIELDS LTRIM(NAME1)+" "+LTRIM(NAME2)+ "   " +LTRIM(COMPANY)+" "+LTRIM(CATEGORY)+" "+LTRIM(TYPE)   FOOTER "PRESS [ GO DOWN] [ GO UP]  [ENTER] KEY TO SELECT"   && IN WINDOW TEMP 
ACTIVATE WINDOW TEMP
@ 0,0 GET SNAME POPUP S_LIST
READ VALID LASTKEY() = 13 .OR. LASTKEY()=27
DEACTIVATE WINDOW TEMP
SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
IF LASTKEY()=27
   CLOSE ALL
   RELEASE ALL
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   RETU
ENDIF
IF B->PRGBMR #'Y' .AND. MP = 'M'
   CLEA
   SET COLOR TO W+/G
   @ 15,1 SAY 'BMR OF THIS PRODUCT IS NOT THRO FOXPRO PRG.U HAVE TO TRY FROM WS'
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   WAIT
   RETU
ENDIF
IF B->PRGBPR # 'Y' .AND. MP = 'P'
   CLEA
   SET COLOR TO W+/G
   @ 15,1 SAY 'BPR OF THIS PRODUCT IS NOT THRO FOXPRO PRG.U HAVE TO TRY FROM WS'
   WAIT
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   RETU
ENDIF
VADCD       = B->ADITICODE
VMMFNO      = B->MMFNO
VFORMU_CODE = B->FORMU_CODE
VBPRCODE    = B->BPRCODE
SNAME       = B->NAME1
SNAME1      = B->NAME2
VVERSION    = B->VERSION
VOLVIAL     = B->FILLVOLUME
VCONVRATE   = B->RATE
VCODE       = B->CODE
VSQTY1      = B->STDQTY1
VSQTY2      = B->STDQTY2
VSQTY3      = B->STDQTY3
VSEALHT     = B->SEALHT
VLOGO       = B->LOGO
VMFG        = B->MFG_LIC_NO
VEMFG       = B->EXPORT_LIC
VMRP        = B->MRP
PNAME       = TRIM(B->NAME1)+'  '+TRIM(B->NAME2)
GNAME       = B->GEN_NAME
VTYPE       = B->TYPE 
AT          = B->TYPE
VEXPIRY     = B->EXPIRY 
VOUTCART    = B->OUTCARTVAL
VSHIP       = B->SHIPPERVAL
YIELD       = B->YIELD
VBPRCODE    = B->BPRCODE
VINCARTVAL  = B->INCARTVAL
VNAME       = B->COMPANY
STORE B->PACK TO SPACK,VPACK,VUNITPACK
IF B->CATEGORY = 'P'
   VPS = 'Y'
ENDIF
IF B->TYPE # 'F' .AND. MP = 'M'
   DO PROC_2
ENDIF
IF MP = 'M'
   IF AS = 'A'
      DO BMR
      IF VCONSIZE = 'F'
         CLOSE ALL
         RETU
      ENDIF
      SELE B
      *USE PRODMAST INDE PN12
      USE PRODMAST ORDER PN12 
      SEEK SNAME+SNAME1
      VCAL = B->BMRCAL
      DO &VCAL
      DO WHILE .T.
         DO PRINTOPT
         IF OPT = 0
            CLOSE ALL
            RETU
         ENDIF
         IF OPT = 1
            CLEA
            @ 15,5 SAY '------  N O   S C R E E N  VIEW-----'
            WAIT
            LOOP
         ENDIF
         EXIT
      ENDDO
      PNO = 1
      DO WHILE PNO <= 25
         VBMRPA = SPACE(7)
         MNO = LTRIM(STR(PNO))
         VBMRPA = 'BMRPA'+MNO
         SELE B
         IF LEN(ALLTRIM(&VBMRPA)) > 0
            PPAGE = &VBMRPA
            DO &PPAGE
            PNO = PNO + 1
            IF PNO > 25
               EXIT
            ENDIF
         ELSE
            PNO = PNO + 1
            IF PNO > 25
               EXIT
            ENDIF
         ENDIF
      ENDDO
      EJECT
      SET PRINTER TO
      SET PRINT OFF
      SET DEVI TO SCREEN
      DO BMRAPPEND
   ENDIF && AS='A'
   IF AS = 'S'
      DO BATCHENT
      IF VBNO = SPACE(7)
         RETU
      ENDIF
      SELE B
      USE PRODMAST ORDER PN12 
      SEEK SNAME+SNAME1
      VCAL = B->BMRCAL
      DO &VCAL
      DO WHILE .T.
         DO STA_END.PRG
         DO WHILE .T.
            DO PRINTOPT
            IF OPT = 0
               CLOSE ALL
               RETU
            ENDIF
            IF OPT = 1
               CLEA
               @ 15,5 SAY '------  N O   S C R E E N  VIEW-----'
               WAIT
               LOOP
            ENDIF
            EXIT
         ENDDO
         PNO = SPAGE
         VBMRPA = SPACE(7)
         DO WHILE PNO <= EPAGE
            SELE B
            MNO = LTRIM(STR(PNO))
            VBMRPA = 'BMRPA'+MNO
            IF LEN(ALLTRIM(&VBMRPA)) > 0
               PPAGE = &VBMRPA
               DO &PPAGE
               PNO = PNO + 1
               IF PNO > EPAGE
                  EXIT
               ENDIF
            ELSE
               PNO = PNO + 1
               IF PNO > EPAGE
                  EXIT
               ENDIF
            ENDIF
         ENDDO
         EJECT
         SET PRINTER TO
         SET PRINT OFF
         SET DEVI TO SCREEN
         YN = SPACE(1)
         @ 0,0 CLEA TO 24,78
         SET COLOR TO W+/R
         @ 22,1 SAY 'ENTER [C] TO CONTINUE FOR SINGLE PAGE BMR' GET YN PICT '!'
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
         READ
         @ 22,1 SAY SPACE(70)
         IF YN = 'C'
            CLEA
            LOOP
         ENDIF
         EXIT
      ENDDO
   ENDIF
   CCHK=' '
   CLEA
   SELE B
   USE PRODMAST ORDER PN12
   SEEK SNAME+SNAME1
   @ 15,1 SAY 'CONFIRM [Y] FOR CHKLIST:=' GET CCHK PICT '!'
   READ
   IF CCHK = 'Y' 
      DO WHILE .T.
         DO PRINTOPT
         IF OPT = 0
            CLOSE ALL
            SET COLOR TO W+/B,W+/R
            RETU
         ENDIF
         IF OPT = 1 
            LOOP
         ENDIF
         EXIT
      ENDDO
      VVV = SPACE(8)
      VVV = LTRIM(B->BMRCHK)
      IF LEN(VVV) # 0
         DO &VVV
         EJECT
         SET PRINT OFF
         SET PRINTER TO
         SET DEVI TO SCREEN
      ENDIF
   ENDIF
   *-------------- ADDED NEW BY UVH
      SELE C
      USE BATCH_NO ORDER BNO
      SEEK VBNO
      GOOUT = " " 
      DO WHILE .T.
         IF RLOCK()
            REPL BPR        WITH 'Y'
            REPL COMPANY    WITH VNAME
            REPL ADITICODE  WITH  VADCD
            UNLOCK 
            EXIT
         ELSE
            STOR " " TO GOOUT
            DO ER_RLOC 
         ENDIF
      ENDDO
   *-------------- UPTO THIS LINE --- UVH
ENDIF
*-----------------------
IF MP = 'P' 
   DO TODATE
   CLEA
   IF VBPR = 'Q'
      CLOSE ALL
      RETU
   ENDIF
   CLEA
   IF AS = 'A'
      DO BPRCAL
      IF VBNO = SPACE(7)
         RETU
      ENDIF 
      S_W_FILM = " " 
      SET COLO TO W+/B
      @ 20,2 SAY SPACE(70)
      @ 20,2 SAY 'ENTER [Y] FOR SWFILM' GET S_W_FILM PICT'!'
      READ
      SET COLO TO W+/B,W+/R
      @ 15,2 SAY SPACE(70)
      VPCAL = B->BPRCAL
      DO &VPCAL
      DO WHILE .T.
         DO PRINTOPT
         IF OPT = 0
            CLOSE ALL
            RETU
         ENDIF
         IF OPT = 1
            CLEA
            @ 15,5 SAY '------  N O   S C R E E N  VIEW-----'
            WAIT
            LOOP
         ENDIF
         EXIT
      ENDDO
      PNO = 1
      VBPRPA = SPACE(7)
      DO WHILE PNO <= 10
         MNO = LTRIM(STR(PNO))
         VBPRPA = 'BPRPA'+MNO
         SELE B
         IF LEN(ALLTRIM(&VBPRPA)) > 0
            PPAGE = &VBPRPA
            DO &PPAGE
            PNO = PNO + 1
            IF PNO > 10
               EXIT
            ENDIF
         ELSE
            PNO = PNO + 1
            IF PNO > 10
               EXIT
            ENDIF
         ENDIF
      ENDDO
      SELE C
      USE BATCH_NO ORDER BNO
      SEEK VBNO
      GOOUT = " " 
      DO WHILE .T.
         IF RLOCK()
            REPL BPR        WITH 'Y'
            REPL COMPANY    WITH VNAME
            REPL ADITICODE  WITH  VADCD
            UNLOCK 
            EXIT
         ELSE
            STOR " " TO GOOUT
            DO ER_RLOC 
         ENDIF
      ENDDO
      EJECT
      SET PRINT OFF
      SET PRINTER TO
      SET DEVI TO SCREEN
   ENDIF
   IF AS = 'S'
      DO WHILE .T.
         IF AS = 'S'
            DO STA_END.PRG
         ENDIF
         DO BPRCAL
         IF VBNO = SPACE(7)
            RETU
         ENDIF
         S_W_FILM = " " 
         @ 15,2 SAY SPACE(70)
         @ 15,1 SAY 'ENTER [Y] FOR SWFILM' GET S_W_FILM PICT'!'
         READ
         @ 15,2 SAY SPACE(70)
         IF SPAGE = 1
            VPCAL = B->BPRCAL
            DO &VPCAL
         ENDIF
         IF SPAGE=2 .OR. SPAGE=3 .OR. SPAGE=4 .OR.  SPAGE=5 .OR. SPAGE=6
            @ 15,5 SAY '[S] FOR SALE/SAMPLE [E] FOR EXPORT [P] FOR P.S. ' GET SA_EX PICT '!'
            READ
            IF SA_EX = 'E'
               N = '1'
            ENDIF
            IF SA_EX = 'S'
               N = '5'
            ENDIF
            IF SA_EX = "P"
               N = '4'
            ENDIF
         ENDIF
         DO WHILE .T.
            DO PRINTOPT
            IF OPT = 0
               CLOSE ALL
               RETU
            ENDIF
            IF OPT = 1
               CLEA
               @ 15,5 SAY '------  N O   S C R E E N  VIEW-----'
               WAIT
               LOOP
            ENDIF
            EXIT
         ENDDO
         PNO = SPAGE
         BPRPA = SPACE(7)
         DO WHILE PNO <= EPAGE
            SELE B
            MNO = LTRIM(STR(PNO))
            VBPRPA = 'BPRPA'+MNO
            IF LEN(ALLTRIM(&VBPRPA)) > 0
               PPAGE = &VBPRPA
               DO &PPAGE
               PNO = PNO + 1
               IF PNO > EPAGE
                  EXIT
               ENDIF
            ELSE
               PNO = PNO + 1
               IF PNO > EPAGE
                  EXIT
               ENDIF
            ENDIF
         ENDDO
         EJECT
         SET PRINT OFF
         SET PRINTER TO
         SET DEVI TO SCREEN
         YN = SPACE(1)
         @ 0,0 CLEA TO 24,78
         SET COLOR TO W+/R,W+/G
         @ 22,1 SAY 'ENTER [C] TO CONTINUE FOR SINGLE PAGE BPR' GET YN PICT '!'
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
         READ
         @ 22,1 SAY SPACE(70)
         IF YN = 'C'
            CLEA
            LOOP
         ENDIF
         EXIT
      ENDDO
   ENDIF
   CCHK = ' '
   @ 2,1 CLEA TO 23,77
   SET COLO TO W+/G
   @ 15,1 SAY 'CONFIRM [Y] FOR CHKLIST:=' GET CCHK PICT '!'
   READ
   SET COLO TO W+/B, W+/R
   IF CCHK = 'Y' 
      DO PRINTOPT
      SELE B
      USE PRODMAST ORDER PN12
      SEEK SNAME+SNAME1
      IF OPT = 0 .OR. OPT = 1
         CLOSE ALL
         SET COLOR TO W+/B,W+/R
         RETU
      ENDIF
      VVV = SPACE(8)
      IF MP = 'P'
         IF LEN(LTRIM(B->BPRCHK)) # 0
            VVV = LTRIM(B->BPRCHK)
            DO &VVV
         ENDIF
         CLEA
         DO PACKCHK
      ENDIF
      SET PRINT OFF
      SET PRINTER TO
      SET DEVI TO SCREEN
   ENDIF
ENDIF