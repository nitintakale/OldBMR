* PROGRAM FOR ADDING / MODIFYING USER RIGHTS..
CLOS DATA
*SET PROC TO ADIHEAD
*DO ADISTART
*------------------------*
DELE FILE USERPASS.IDX
DELE FILE MENUOPT.IDX
DELE FILE USERIGHT.IDX
USE USERPASS 
INDE ON USER TO USERPASS
USE MENUOPT
*INDE ON MAINOPT+SUBOPT TO MENUOPT
INDE ON OPT_KEY TO MENUOPT
USE USERIGHT
INDE ON USER+MAINOPT+SUBOPT TO USERIGHT
CLOS DATA
*------------------------*
SET COLOR TO W+/B,W+/R
@ 1,1 CLEA TO 23,78
SET COLOR TO W+/RB
@ 1,15 SAY "ENTER USER NAME AND PASSWORD TO MODIFY USER-RIGHTS.."
PERMIT = .F.
STOR USERNAME TO UN1
IF ! CHECKPS(PERMIT)
   SET COLOR TO W+/G
   @ 23,12 SAY "SORRY...UNAUTHORISED PERSON...PRESS ANY KEY.."
   SET COLOR TO W+/B,W+/R
   UX=INKEY(0)
   CLOSE ALL
   @ 13,0 CLEA
   RETURN
ENDIF
PERMIT = .F.
if lastkey() # 27
   IF ! CHEKAUTH(PERMIT,10,0)
      SET COLOR TO W+/G
      * @ 23,1 SAY '['+iif(PERMIT,"true","false")+']'
      @ 23,10 SAY "SORRY...U HAVE NO AUTHORITY TO USE THIS OPTION...PRESS ANY KEY.."
      SET COLOR TO W+/B,W+/R
      UX=INKEY(0)
      CLOSE DATA
      RETURN
   ENDIF
ENDIF
IF USERNAME # UN1
   CLOS DATA
   RETURN
ENDIF
@ 0,0 CLEA
DO WHILE .T.
   SELE 1
   USE USERPASS INDE USERPASS
   SELE 2
   USE MENUOPT INDE MENUOPT
   SELE 3
   USE USERIGHT INDE USERIGHT
   SET COLOR TO W+/B,W+/R
   CLEA
   SET COLOR TO W+/G
   @ 0,20 SAY "ADDING / MODIFYING USER OR USER-RIGHTS"
   SET COLOR TO GR+/GR,W+/R
   @ 5,11 SAY "SELECT FROM BELOW :.....   OR          PRESS 'ESC' TO QUIT"
   @ 7,22 TO 13,59 DOUB
   SET COLOR TO W+/B,W+/R
   @  8,25 PROMPT "1. ADD / CHANGE USER/PASSWORD "
   @ 10,25 PROMPT "2. ADD / CHANGE USER-RIGHTS   "
   @ 12,25 PROMPT "3. CHECK PASSWORD OF A USER   "
   STORE 0 TO USCHO
   MENU TO USCHO
   DO CASE
      CASE USCHO = 1
           DO AC_USER
      CASE USCHO = 2
           DO AC_USE_R
      CASE USCHO = 3
           DO CHK_USPW 
      OTHERWISE
           CLOS DATA
           RETURN
   ENDCASE
ENDDO
CLOS DATA
RETURN
*---------------------*
PROCEDURE AC_USER
DO WHILE .T.
   SET COLOR TO W+/B,W+/R
   CLEA
   @ 0,0 TO 24,79
   SET COLOR TO W+/G
   @ 0,27 SAY "ADDING / MODIFYING USER "
   SET COLOR TO W+/B,W+/R
   @  8,5 SAY "      USER NAME (MAX. 8 CHR.) : "
   @ 10,5 SAY "             USER'S FULL NAME : "
   @ 12,5 SAY "USER PASS WORD (MAX. 10 CHR.) : "
   @ 16,5 SAY "               SECURITY LEVEL : "
   STOR SPACE(8) TO USERNAME
   STOR SPACE(10) TO USERPW
   STOR SPACE(30) TO UFULNAM
   STOR SPACE(1) TO LEVL
   STOR 0 TO LEV1
   SET COLOR TO W+/RB
   @ 23,12 SAY "ENTER USER-NAME     OR     PRESS ESC TO QUIT...."
   SET COLOR TO W+/B,W+/R
   @ 8,37 GET USERNAME PICTURE "@!"
   READ
   @ 23,1 SAY SPACE(77)
   IF LASTKEY() = 27 .OR. LEN(ALLTRIM(USERNAME))=0
      EXIT
   ENDIF
   SELE 1
   LOCATE FOR USER= USERNAME
   IF FOUND()
      STOR A->PASSWORD TO USERPW
      STOR A->FULL_NAME TO UFULNAM
     * STOR VAL(A->LEVEL) TO LEV1
      STOR A->LEVEL TO LEV1
      SET COLOR TO W+/GR
      @ 23,12 SAY "MODIFY USER PASS WORD AND LEVEL..."
      SET COLOR TO W+/B,W+/R
      DO ACUSERA WITH "M"
   ELSE
      SET COLOR TO W+/GR
      @ 23,12 SAY "ENTER USER PASS WORD AND LEVEL..."
      SET COLOR TO W+/B,W+/R
      DO ACUSERA WITH "A"
   ENDIF   
ENDDO
CLOS DATA
RETURN
*---------------*
PROCEDURE ACUSERA
PARAMETER AM
@ 10,37 GET UFULNAM PICT "@!"
READ
STOR 1 TO MNT
DO WHILE MNT <= 2
   MNTR = ALLTRIM(STR(MNT))
   IF MNTR = "1"
      @ 12,37 SAY " "
   ELSE
      SET COLOR TO W+/G
      @ 14,2 SAY "RE-ENTER THE PASS WORD GIVEN ABOVE (10 CHR.) : " 
      SET COLOR TO W+/B,W+/R
      @ 14,49 SAY " "
   ENDIF   
   SET COLOR TO W+/B,W+/R
   NUM = 0
   SET CONSOLE OFF
   STOR "" TO P
   STOR " " TO TW1,TW2,TW3,TW4,TW5,TW6,TW7,TW8,TW9,TW10
   CNT =1
   ACCEPT TO P
   P=LOWER(P)
   SET CONSOL ON
   B=LEN(P)
   IF B=0
      P = "UPENSOFT"
      B = 8
   ENDIF
   IF B > 10
      P = SUBSTR(P,1,10)
      B=10
   ENDIF
   DO WHILE CNT <= B
      CNTR = ALLTRIM(STR(CNT,2,0))
      STOR SUBSTR(P,CNT,1) TO TW&CNTR
      CNT=CNT+1
   ENDDO
   SET CONSOLE ON
   A = 70
   B = 10
   STOR SPACE(10) TO SSAP&MNTR
   SSAP&MNTR = CHR(ASC(TW1)+A-1)+CHR(ASC(TW2)+B+1)+;
   CHR(ASC(TW3)+A-2)+CHR(ASC(TW4)+B+2)+CHR(ASC(TW5)+A-3)+;
   CHR(ASC(TW6)+B+3)+CHR(ASC(TW7)+A-4)+;
   CHR(ASC(TW8)+B+4)+CHR(ASC(TW9)+A-5)+CHR(ASC(TW10)+B+5)
   MNT=MNT+1
   IF MNT = 3
      IF SSAP1 # SSAP2
         SET COLOR TO W+/B,W+/R
         @ 23,1 SAY SPACE(77)
         SET COLOR TO W+/RB
         @ 23,9 SAY "ERROR IN THE PASS-WORD ENTRY...PRESS ANY KEY TO TRY AGAIN...."
         SET COLOR TO W+/B,W+/R
         UX=INKEY(0)
         @ 23,1 SAY SPACE(77)
         MNT = 1
         LOOP
      ENDIF
      EXIT
   ENDIF               
ENDDO 
STOR SSAP1 TO USERPW
SET COLOR TO GR+/GR
@ 23,10 SAY "ENTER LEVEL (1. FOR ALL RIGHTS / 2. FOR SELECTIVE RIGHTS) "
SET COLOR TO W+/B,W+/R
@ 16,50 GET LEV1 PICT "9" RANGE 1,2
READ
@ 23,1 SAY SPACE(77)
STOR " " TO SURE 
SET COLOR TO W+/RB,W+/R
@ 23,21 SAY "SAVE THIS ? ARE U SURE ? SAY Y / N : " GET SURE PICT "!" VALID SURE $ "YN"
READ
@ 23,1 SAY SPACE(77)
IF SURE = "Y"
   SELE USERPASS
   LOCATE FOR USER= USERNAME
   IF .NOT. FOUND()
      APPE BLANK
   ENDIF    
   GOOUT = " "
   DO WHILE .T.
      IF RLOCK()
         REPL USERPASS->USER      WITH USERNAME
         REPL USERPASS->FULL_NAME WITH UFULNAM
         REPL USERPASS->PASSWORD  WITH USERPW 
         REPL USERPASS->LEVEL     WITH LEV1
         FLUSH
         UNLOCK 
         EXIT
      ELSE
         STOR " " TO GOOUT
         DO ER_RLOC
      ENDIF
   ENDDO
ENDIF
RETURN
*-----------------------*
PROCEDURE AC_USE_R
DO WHILE .T.
   SET COLOR TO W+/B,W+/R
   CLEA
   @ 0,0 TO 4,79
   SET COLOR TO W+/G
   @ 0,24 SAY "ADDING / MODIFYING USER RIGHTS"
   SET COLOR TO W+/B,W+/R
   @ 1,5 SAY "USER NAME (MAX. 8 CHR.) : "
   @ 3,5 SAY "         SECURITY LEVEL : "
   STOR SPACE(8) TO USERNAME
   STOR 0 TO LEV1
   SET COLOR TO W+/RB
   @ 23,12 SAY "ENTER USER-NAME     OR     PRESS ESC TO QUIT...."
   SET COLOR TO W+/B,W+/R
   @ 1,38 GET USERNAME PICTURE "@!"
   READ
   @ 23,1 SAY SPACE(77)
   IF LASTKEY() = 27
      EXIT
   ENDIF
   SELE 1
   LOCATE FOR USER=USERNAME
   IF FOUND()
      STOR A->PASSWORD TO USERPW
      STOR A->FULL_NAME TO UFULNAM
      STOR (A->LEVEL) TO LEV1
      SET COLOR TO W+/RB
      @ 1,50 SAY SUBSTR(UFULNAM,1,27)
      @ 3,38 SAY LEV1
      SET COLOR TO W+/B,W+/R
      IF LEV1 = 1
         SET COLOR TO W+/B,W+/R
         @ 23,1 SAY SPACE(77)
         STOR " " TO YNSTAT
         SET COLOR TO W+/RB
         @ 23,5 SAY "THIS USER HAS ALL RIGHTS..DO U WISH TO CHANGE HIS STATUS ? SAY Y/N : " GET YNSTAT PICT "!" VALID YNSTAT $ "YN"
         SET COLOR TO W+/B,W+/R
         READ
         @ 23,1 SAY SPACE(77)
         IF YNSTAT = "N"
            LOOP
         ENDIF
         SELE USERPASS
         LOCATE FOR USER= USERNAME
         GOOUT = " "
         DO WHILE .T.
            IF RLOCK()
               REPL USERPASS->LEVEL WITH 2
               @ 3,38 SAY USERPASS->LEVEL
               FLUSH
               UNLOCK 
               EXIT
            ELSE
               STOR " " TO GOOUT
               DO ER_RLOC
            ENDIF
         ENDDO
      ENDIF
      SELE C
      LOCATE FOR C->USER = USERNAME
      IF FOUND()
         DO R_USERM
      ELSE    
         DO R_USERA
      ENDIF   
   ELSE
      SET COLOR TO W+/GR
      @ 23,12 SAY "THIS USER NOT REGISTERED...PRESS ANY KEY..."
      SET COLOR TO W+/B,W+/R
      UX=INKEY(0)
      @ 23,1 SAY SPACE(77)
      LOOP
   ENDIF   
ENDDO
CLOS DATA
RETURN
*----------------------------*
PROCEDURE R_USERA
SET COLOR TO W+/B,W+/R
@ 5,0 CLEA
@ 6,0 TO 22,79
@ 8,1 TO 8,78
SET COLOR TO GR+/GR
@ 5,15 SAY "ENTER AUTHORITY TO OPERATE OPTIONS FROM MENU"
SET COLOR TO W+/RB
@ 7,1 SAY "MAIN SUB       MENU OPTION"
@ 7,64 SAY "AUTHORISE Y/N "
SET COLOR TO W+/B,W+/R
STOR 9 TO RW
SELE B
GO TOP
DO WHILE .NOT. EOF()
   STOR SPACE(76) TO OPTHD
   STOR SPACE(2) TO MOPT,SOPT
   STOR " " TO AUTHOYN
   SELE 2
   STOR B->MAINOPT TO MOPT
   STOR B->SUBOPT  TO SOPT
   STOR B->OPT_HEAD TO OPTHD 
   SET COLOR TO W+/B,W+/R
   @ RW,3 SAY OPTHD PICT "@S65!"
   @ RW,70 GET AUTHOYN PICT "!" VALID AUTHOYN $ "YN"
   READ
   STOR " " TO SURE
   SET COLOR TO W+/RB,W+/R
   @ 23,10 SAY "SAVE THIS ? ARE U SURE ? SAY Y / N       / Q->QUIT : " GET SURE PICT "!" VALID SURE $ "YNQ"
   SET COLOR TO W+/B,W+/R
   READ
   @ 23,1 SAY SPACE(77)
   IF SURE = "Q"
      EXIT
   ENDIF      
   IF SURE = "Y" .AND. AUTHOYN = "Y"
      SELE C
      SEEK USERNAME+MOPT+SOPT
      IF .NOT. FOUND()
         APPE BLANK
      ENDIF
      GOOUT = " "
      DO WHILE .T.
         IF RLOCK()
            REPL C->USER WITH USERNAME
            REPL C->MAINOPT WITH MOPT
            REPL C->SUBOPT WITH SOPT
            FLUSH
            UNLOCK 
            EXIT
         ELSE
            STOR " " TO GOOUT
            DO ER_RLOC
         ENDIF
      ENDDO
      RW = RW + 1
      IF RW > 20
         SCROLL 9,1,20,77,1    && SCROLL AREA 9,1 TO 20,77 ONE ROW UP
         RW = 20
      ENDIF
      SELE B
      SKIP
      IF EOF()
         EXIT
      ENDIF
   ENDIF
   IF SURE = "Y" .AND. AUTHOYN = "N"
      RW = RW + 1
      IF RW > 20
         SCROLL 9,1,20,77,1    && SCROLL AREA 9,1 TO 20,77 ONE ROW UP
         RW = 20
      ENDIF
      SELE B
      SKIP
      IF EOF()
         EXIT
      ENDIF
   ELSE
      LOOP
   ENDIF
ENDDO
RETURN
*----------------------------*
PROCEDURE R_USERM
SET COLOR TO W+/B,W+/R
@ 5,0 CLEA
@ 6,0 TO 22,79
@ 8,1 TO 8,78
SET COLOR TO GR+/GR
@ 5,15 SAY "ENTER AUTHORITY TO OPERATE OPTIONS FROM MENU"
SET COLOR TO W+/RB
@ 7,1 SAY "MAIN SUB       MENU OPTION"
@ 7,64 SAY "AUTHORISE Y/N "
SET COLOR TO W+/B,W+/R
STOR 9 TO RW
STOR 0 TO SNT
SELE B
GO TOP
STOR RECCOUNT() TO KNT
SELE C
SET FILTER TO C->USER = USERNAME
GO TOP
SELE B
DO WHILE .NOT. EOF()
   SET COLOR TO W+/B,W+/R,,GR+/B,G+/RB 
   IF RW < 9
      SCROLL 9,1,20,77,-1      && SCROLL AREA ONE ROW DOWN
      RW = 9
   ENDIF
   IF RW > 20
      SCROLL 9,1,20,77,1      && SCROLL AREA ONE ROW UP
      RW = 20
   ENDIF
   STOR SPACE(76) TO OPTHD
   STOR SPACE(2) TO MOPT,SOPT
   STOR " " TO AUTHOYN
   SELE 2
   STOR B->MAINOPT   TO MOPT  
   STOR B->SUBOPT    TO SOPT   
   STOR B->OPT_HEAD  TO OPTHD ,OH1
   SELE C
   SEEK USERNAME+MOPT+SOPT
   IF FOUND()
      STOR "Y" TO AUTHOYN
   ELSE
      STOR " " TO AUTHOYN
   ENDIF
   STOR AUTHOYN TO AU1
   SET COLOR TO GR+*/N
   @ RW,1 SAY CHR(16)
   @ RW, 78  SAY CHR(17)
   SET COLOR TO W+/R,W+/B
   @ RW,3 SAY OPTHD PICT "@S65!"
   @ RW,70 SAY AUTHOYN PICT "!"
   SET COLOR TO W+/B,W+/R 
   @ 23,1 SAY SPACE(77)
   SET COLOR TO W+/G
   @ 23,4 SAY "PRESS "+CHR(24)+" / "+CHR(25)+"  OR  Y->AUTHO-YES / N->AUTHO-NO / Q->QUIT "
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   SET ESCAPE OFF
   SKEY = 0
   DO WHILE sKEY = 0
      SKEY = INKEY()
   ENDDO
   @ 23,1 SAY SPACE(77)
   SET ESCAPE ON
   DO CASE 
      CASE SKEY = 89   && Y 121 Y
           AUTHOYN = "Y"
           @ RW,70 SAY AUTHOYN PICT "!" 
           DO SV_RIGHT
      CASE SKEY = 78   && N  110 N
           AUTHOYN = "N"
           @ RW,70 SAY AUTHOYN PICT "!" 
           DO SV_RIGHT
      CASE SKEY = 121  && Y
           AUTHOYN = "Y"
           @ RW,70 SAY AUTHOYN PICT "!" 
           DO SV_RIGHT
      CASE SKEY = 110  && N
           AUTHOYN = "N"
           @ RW,70 SAY AUTHOYN PICT "!" 
           DO SV_RIGHT
      CASE SKEY = 5  && UP ARROW
           SELE B
           IF .NOT. BOF()
              CELING1 = RECNO()
              SKIP -1
              CELING = RECNO()
              IF CELING1 = CELING
                 SET COLOR TO W+/G
                 @ 23,1 SAY "ALREADY AT TOP ...PRESS ANY KEY.."
                 SET COLOR TO W+/B,W+/R,,BG/N,W+/RB
                 UX=INKEY(0)
                 @ 23,1 SAY SPACE(77)
                 GO TOP
                 @ RW,1 SAY " "
                 @ RW,78 SAY " "
                 SET COLOR TO W+/B,W+/R  
                 @ RW,3 SAY OPTHD PICT "@S65!"
                 @ RW,70 SAY AUTHOYN PICT "!"
                 LOOP
              ENDIF
           ELSE
              SET COLOR TO W+/G
              @ 23,1 SAY "ALREADY AT TOP ...PRESS ANY KEY.."
              SET COLOR TO W+/B,W+/R,,BG/N,W+/RB
              UX=INKEY(0)
              @ 23,1 SAY SPACE(77)
              GO TOP
              SET COLOR TO W+/B,W+/R  
              @ RW,3 SAY OPTHD PICT "@S65!"
              @ RW,70 SAY AUTHOYN PICT "!"
              @ RW,1 SAY " "
              @ RW,78 SAY " "
              LOOP
           ENDIF
           SET COLOR TO W+/B,W+/R
           @ RW,1 SAY " "
           @ RW,78 SAY " "
           @ RW,3 SAY OPTHD PICT "@S65!"
           @ RW,70 SAY AUTHOYN PICT "!"
           RW = RW - 1
      CASE SKEY = 24    && DN ARROW
           STOR " " TO ASKBOT 
           SELE B
           SKIP
           IF EOF()
              SET COLOR TO W+/G
              @ 23,10 SAY "ALREADY AT BOTTOM..."
              SET COLOR TO W+/B,W+/R,,GR+/B,G+/RB
              UX=INKEY(0)
              @ 23,1 SAY SPACE(77)
              SKIP -1
              @ RW,1 SAY " "
              @ RW,78 SAY " "
              SET COLOR TO W+/B,W+/R
              @ RW,3 SAY OPTHD PICT "@S65!"
              @ RW,70 SAY AUTHOYN PICT "!"
              RW = 20
              LOOP
           ENDIF
           SET COLOR TO W+/B,W+/R
           @ RW,1 SAY " "
           @ RW,78 SAY " "
           @ RW,3 SAY OPTHD PICT "@S65!"
           @ RW,70 SAY AUTHOYN PICT "!"
           RW = RW+1
      CASE SKEY = 113  && Q
           EXIT
      CASE SKEY = 81   && Q
           EXIT
      CASE SKEY = 27  && ESC
           EXIT
      OTHERWISE
           LOOP
   ENDCASE
ENDDO
RETURN
*-------------------------*
PROCEDURE SV_RIGHT
SELE C
SEEK USERNAME+MOPT+SOPT
IF FOUND()
   IF AUTHOYN = "N"
      GOOUT = " "
      DO WHILE .T.
         IF RLOCK()
            DELE
            FLUSH
            UNLOCK 
            EXIT
         ELSE
            STOR " " TO GOOUT
            DO ER_RLOC
         ENDIF
      ENDDO
   ENDIF
ELSE
   IF AUTHOYN = "Y"
      APPE BLANK
      GOOUT = " "
      DO WHILE .T.
         IF RLOCK()
            REPL C->USER WITH USERNAME
            REPL C->MAINOPT WITH MOPT
            REPL C->SUBOPT WITH SOPT
            FLUSH
            UNLOCK 
            EXIT
         ELSE
            STOR " " TO GOOUT
            DO ER_RLOC
         ENDIF
      ENDDO
   ENDIF
ENDIF
SELE B
RETURN
*--------------------------*
PROCEDURE CHK_USPW
DO WHILE .T.
   SET COLOR TO W+/B,W+/R
   CLEA
   @ 0,0 TO 24,79
   SET COLOR TO W+/G
   @ 0,19 SAY "CHECK PASS-WORD STORED FOR THE GIVEN USER"
   SET COLOR TO W+/B,W+/R
   SET COLOR TO W+/B,W+/R
   @  8,5 SAY "      USER NAME (MAX. 8 CHR.) : "
   @ 10,5 SAY "             USER'S FULL NAME : "
   @ 12,5 SAY "               SECURITY LEVEL : "
   STOR SPACE(8) TO USERNAME
   STOR SPACE(10) TO USERPW
   STOR SPACE(30) TO UFULNAM
   STOR SPACE(1) TO LEVL
   STOR 0 TO LEV1
   SET COLOR TO W+/RB
   @ 23,12 SAY "ENTER USER-NAME     OR     PRESS ESC TO QUIT...."
   SET COLOR TO W+/B,W+/R
   @ 8,37 GET USERNAME PICTURE "@!"
   READ
   @ 23,1 SAY SPACE(77)
   IF LASTKEY() = 27
      EXIT
   ENDIF
   SELE 1
   SEEK USERNAME
   IF .NOT. FOUND()
      SET COLOR TO W+/B,W+/R
      @ 23,1 SAY SPACE(77)
      SET COLOR TO W+/RB
      @ 23,9 SAY "THIS IS NOT REGISTERED USER...."
      SET COLOR TO W+/B,W+/R
      UX=INKEY(0)
      @ 23,1 SAY SPACE(77)
      LOOP
   ENDIF
   STOR A->PASSWORD TO USERPW
   STOR A->FULL_NAME TO UFULNAM
*   STOR VAL(A->LEVEL) TO LEV1
   STOR A->LEVEL TO LEV1
   SET COLOR TO W+/RB
   @ 10,37 SAY UFULNAM
   @ 12,37 SAY STR(LEV1,1,0)+' - '+IIF(LEV1 = 1,'ALL RIGHTS','SELECTIVE RIGHTS')
   SET COLOR TO W+/B,W+/R
   STOR " " TO TW1,TW2,TW3,TW4,TW5,TW6,TW7,TW8,TW9,TW10
   CNT = 1
   B = LEN(USERPW)
   DO WHILE CNT <= B
      CNTR = ALLTRIM(STR(CNT,2,0))
      STOR SUBSTR(USERPW,CNT,1) TO TW&CNTR
      CNT = CNT + 1
   ENDDO
   SET COLOR TO W+/RB
   @ 14,14 SAY "STORED PASS-WORD : "+USERPW
   SET COLOR TO W+/B,W+/R
   A = 70
   B = 10
   WORD = CHR(ASC(TW1)-A+1)+CHR(ASC(TW2)-B-1)+CHR(ASC(TW3)-A+2)+;
          CHR(ASC(TW4)-B-2)+CHR(ASC(TW5)-A+3)+CHR(ASC(TW6)-B-3)+;
          CHR(ASC(TW7)-A+4)+CHR(ASC(TW8)-B-4)+CHR(ASC(TW9)-A+5)+;
          CHR(ASC(TW10)-B-5)
   SET COLOR TO R/BG
   @ 16,14 SAY "CONVERTED PASS-WORD : "+WORD
   SET COLOR TO W+/B,W+/R
   @ 23,23 SAY "PRESS ANY KEY..."
   UX = INKEY(0)
   @ 23,1 SAY SPACE(77)
ENDDO
CLOS DATA
RETURN
**********************************
