***READ DOCUT
* PROGRAM FOR ADDITION OF CODE IN MAINCODE.DBF
* A NEW FIELD IS CREATED IN MAINCODE.DBF FILE AS BATCH_CHAR - C - 2
* THIS FILE IN INDEXED ON MAINNAME TAG MAINCOMP
* ALONG WITH FIRST TWO CHARACTERS OF BATCH NUMBER FOR EACH MAIN-CODE
* AND BATCHAR.MEM CREATION WITH NEW BATCH STARTING CHARACTERS.
* THE PROGRAM ALSO ADDS THE REQUIRED FIELDS TO INVNO.DBF,
* CENMOD.DBF, CENPLA.DBF AND CAPMOD.DBF
CLEA
SET PROC TO ADIHEAD
DO ADISTART
SET DELI TO '[]'
SET DELI ON
DO WHILE .T.
   CLOS DATA
    USE MAINCODE
   INDE ON MAINNAME To MAINCOMP
   CLOSE DATA
*********************
   SELE A
   USE MAINCODE INDE MAINCOMP
   GO TOP
   RELEASE  ALL LIKE Z_*
   STORE '' TO Z_ALLOWED
   DO WHILE .NOT. EOF()

     CH1=A->BATCH_CHAR
     CH2=A->BATCHCHAR1

     IF CH1 # " "
      STOR Z_ALLOWED+CH1 TO Z_ALLOWED
    ENDIF
    IF CH2 # " "
       STOR Z_ALLOWED+CH2 TO Z_ALLOWED
    ENDIF
    SELE A
    SKIP
  ENDDO  
     SAVE TO BATCHAR ALL LIKE Z_*
     RESTORE FROM BATCHAR ADDI
     SET COLOR TO
   CLEAR 
   @ 0,0 TO 24,79 DOUBLE
   @ 2,1 TO 2,78 
   SET COLOR TO GR+/GR
   @ 1,2 SAY "UPDATION OF COMPANY NAME IN MAINCODE.DBF"
   SET COLOR TO GR+/BG
   @ 1,48 SAY "ADITI PHARMACEUTICALS PVT. LTD."
   SET COLOR TO W+/B,W+/R
   STORE SPACE(1) TO ANY
   SET COLOR TO
   @ 3,1 CLEA TO 23,78
   SET COLOR TO G+/R
   @ 3,1 SAY " COMPANY                              SHORT     BATCH-START    CITY      PIN"
   @ 4,1 SAY "  CODE          COMPANY NAME          NAME       CHARACTER                  "
   @ 5,1 SAY "-----------------------------------------------------------------------------"
   @ 20,1 SAY "-----------------------------------------------------------------------------"
   @ 21,23 SAY "LIST OF AVAILABLE CODES...AS ABOVE..."
   SET COLOR TO W+/B,W+/R
   LN = 6
   SELE A
*   USE MAINCODE ORDER MAINCOMP
   USE MAINCODE inde MAINCOMP
   GO TOP
   DO WHILE .NOT. EOF()
      @ LN,1 SAY A->MAINNAME
      @ LN,12 SAY SUBSTR(A->NAME,1,25)
      @ LN,39 SAY A->COMPANY
      @ LN,53 SAY  '1['+A->BATCH_CHAR+']'
      @ LN,59 SAY A->CITY PICT '@S!'
      @ LN,72 SAY A->PIN PICT '@S!'
      LN=LN+1
      @ LN,53 SAY '2['+A->BATCHCHAR1+']'
      SKIP
      IF EOF()
         EXIT
      ENDIF
      LN = LN + 1
      IF LN > 19
         SET COLOR TO GR+/GR
         @ 23,1 SAY SPACE(77)
         @ 23,5 SAY "PRESS ANY KEY FOR NEXT SCREEN ..OR.. 'ESC' TO QUIT " GET ANY PICT "!"
         SET COLOR TO W+/B,W+/R
         READ
         @ 23,1 SAY SPACE(77)
         SET COLOR TO
         IF READKEY() = 12
            @ 6,1 CLEA TO 20,78
            RETURN
         ENDIF
         @ 6,1 CLEA TO 20,78
         LN = 6
      ENDIF
   ENDDO
   SET COLOR TO GR+/GR
   @ 23,1 SAY SPACE(77)
   @ 23,5 SAY "PRESS ANY KEY TO CONTINUE ..OR.. 'ESC' TO QUIT " GET ANY PICT "!"
   SET COLOR TO W+/B,W+/R
   READ
   @ 23,1 SAY SPACE(77)
   SET COLOR TO
   IF READKEY() = 12
      @ 3,1 CLEA TO 23,78
      RETURN
   ENDIF
   @ 3,1 CLEA TO 23,78
   SET COLOR TO W+/B,W+/R
   @  4,19 SAY "COMPANY CODE : "
   @  6,19 SAY "COMPANY NAME : "
   @  8,13 SAY "SHORT COMPANY NAME : "
   @ 10, 5 SAY "FIRST 3 CHARACTER OF BATCH : "
   @ 10,40 SAY ALLTRIM(Z_ALLOWED)
   @ 12,19 SAY "CITY :"
   @ 12,55 SAY  "PIN CODE:"
   SET COLOR TO G+/R
   @ 16,12 SAY "COMPANY CODE IS OF 7 CHARACTERS ENDING WITH 'MN'"
   @ 17,12 SAY "FOR EXAMPLE : CIPLAMN                           "
   @ 18,12 SAY "YOU ARE ALLOWED TO ENTER FIRST 5 CHARACTER ONLY..."
   @ 19,12 SAY "              PRESS 'ESC' TO QUIT                 "
   SET COLOR TO W+/B,W+/R
   STOR "N" TO BUSED
   STOR SPACE(5) TO UVCCD
   STOR SPACE(30) TO UVCNA
   STOR SPACE(10) TO UVSHCD
   STOR SPACE(3)  TO UVFCHAR
   STOR SPACE(20) TO UVCITY
   STOR SPACE(3) TO UVFCHAR1
   STORE 0 TO UVPIN
   @ 4,34 GET UVCCD PICT "!XXXX"
   READ
   IF UVCCD = " "
      CLOS DATA
      EXIT
   ENDIF
   IF READKEY() = 12
      CLOS DATA
      EXIT
   ENDIF
   @ 16,1 CLEA TO 23,78
   STOR PROPER(UVCCD+'MN') TO UVCCD
   @  4,34 SAY '['+UVCCD+']'
   SELE A
   SEEK UVCCD
   STOR " " TO AMD
   IF FOUND()
      SET COLOR TO GR+/GR
      @ 23,1 SAY SPACE(77)
      @ 23,10 SAY "CODE FOUND..PRESS M->MODIFY / D->DELETE / Q->QUIT : " GET AMD PICT "!" VALID AMD $ "MDQ"
      SET COLOR TO W+/B,W+/R
      READ
      @ 23,1 SAY SPACE(77)
   ELSE
      SET COLOR TO GR+/GR
      @ 23,1 SAY SPACE(77)
      @ 23,10 SAY "CODE NOT FOUND..PRESS A->ADD / Q->QUIT : " GET AMD PICT "!" VALID AMD $ "AQ"
      SET COLOR TO W+/B,W+/R
      READ
      @ 23,1 SAY SPACE(77)
   ENDIF
   IF AMD = "Q"
     LOOP
   ENDIF   
   IF AMD $ "MD"
      STOR A->NAME        TO UVCNA      
      STOR A->COMPANY     TO UVSHCD
      STOR A->BATCH_CHAR  TO UVFCHAR,OLDFCH
      STOR A->CITY        TO UVCITY      
      STOR A->PIN         TO UVPIN            
      STOR A->BATCHCHAR1  TO UVFCHAR1,OLDFCH1
      @  6,34 SAY '['+UVCNA+']'
      @  8,34 SAY '['+UVSHCD+']'
      @ 10,34 SAY '['+UVFCHAR+']'
      @ 11,34 SAY '['+UVFCHAR1+']'
      @ 12,34 SAY '['+UVCITY+']' 
      @ 12,63 SAY '['+LTRIM(STR(UVPIN))+']'
   ENDIF
   IF AMD = "D"
      SET COLOR TO G+/R
      STOR " " TO SURE
      @ 23,1 SAY SPACE(77)
      @ 23,12 SAY "DELETE THIS CODE ? R U SURE ?  Y/N : " GET SURE PICT "!" VALID SURE $ "YN"
      READ
      SET COLOR TO W+/B,W+/R
      @ 23,1 SAY SPACE(77)
      SELE A
      SEEK UVCCD
      * DELE
      * PACK
      * DO UBATMOD WITH "D" 
      LOOP
   ENDIF   
   STORE SPACE(1) TO VBFOUND1,VBFOUND2,VBFOUND3,VBFOUND4
   STORE SPACE(7) TO MN1,MN2,MN3,MN4
   DO WHILE .T.
      SET COLOR TO G+/R
      @ 16,12 SAY "ENTER COMPANY NAME, SHORT NAME ...."
      @ 17,12 SAY "AND STARTING 3 CHAR. OF BATCH LIKE 'ZD', 'ZS' ..."
      SET COLOR TO W+/B,W+/R
      @  6,34 GET UVCNA PICT "@!"
      @  8,34 GET UVSHCD PICT "@!"
      @ 10,34 GET UVFCHAR PICT "@!"
      @ 11,34 GET UVFCHAR1 PICT "!!!"
      READ
      @ 23,1 SAY SPACE(77)
      @ 22,1 SAY SPACE(77)
      IF UVFCHAR=" "  .AND.  UVFCHAR1 = " "
         @ 22,12 SAY "BOTH BATCH STARTING CHAR. CAN NOT BE SPACE..."
         @ 23,12 SAY "NOT ALLOWED.U WILL EXIT FROM THIS PRG..PRESS ANY KEY..."
         UX=INKEY(0)
         SET COLOR TO W+/B,W+/R
         @ 22,1 CLEA TO 23,78
         CLOSE DATA
         RETURN
      ENDIF 
      IF UVFCHAR # " "
	      SELE A
          GO TOP
	      LOCATE FOR BATCH_CHAR = UVFCHAR
	      IF FOUND()
	         VBFOUND1='Y'       
	          MN1=A->MAINNAME
	      ENDIF
	      SELE A
          GO TOP
	      LOCATE FOR BATCHCHAR1 = UVFCHAR
	      IF FOUND()
	          VBFOUND2='Y'       
	          MN2=A->MAINNAME
	      ENDIF
      ENDIF
      IF UVFCHAR1 # " "
         SELE A
          GO TOP
         LOCATE FOR BATCH_CHAR = UVFCHAR1
         IF FOUND()
            VBFOUND3='Y'       
            MN3=A->MAINNAME
         ENDIF                   
         SELE A
         GO TOP
         LOCATE FOR BATCHCHAR1 = UVFCHAR1
         IF FOUND()
            VBFOUND4='Y'       
            MN4=A->MAINNAME
         ENDIF 
     ENDIF

     IF AMD="A"
     IF UVCCD $(MN1+MN2+MN3+MN4)  

            SET COLOR TO G+/R
            @ 23,1 SAY SPACE(77)
            @ 22,1 SAY SPACE(77)
            IF VBFOUND1="Y" .OR. VBFOUND2="Y" .OR. VBFOUND3="Y" .OR. VBFOUND4="Y"
              @ 22,2 SAY "SAME BATCH CHAR. USED FOR "+MN1+' '+MN2 +' '+MN3 +' '+MN4     
            ENDIF
            @ 23,12 SAY "NOT ALLOWED...PRESS ANY KEY..."
            UX=INKEY(0)
            SET COLOR TO W+/B,W+/R
            @ 22,1 CLEA TO 23,78
            LOOP
            STOR "Y" TO BUSED
       ENDIF
   ENDIF
     IF AMD="M"
     IF .NOT. UVCCD $(MN1+MN2+MN3+MN4)  

            SET COLOR TO G+/R
            @ 23,1 SAY SPACE(77)
            @ 22,1 SAY SPACE(77)
            IF VBFOUND1="Y" .OR. VBFOUND2="Y" .OR. VBFOUND3="Y" .OR. VBFOUND4="Y"
              @ 22,2 SAY "SAME BATCH CHAR. USED FOR "+MN1+' '+MN2 +' '+MN3 +' '+MN4     
            ENDIF
            @ 23,12 SAY "NOT ALLOWED...PRESS ANY KEY..."
            UX=INKEY(0)
            SET COLOR TO W+/B,W+/R
            @ 22,1 CLEA TO 23,78
            LOOP
            STOR "Y" TO BUSED
       ENDIF
   ENDIF
      @ 12,34 GET UVCITY  PICT "@S!"
      @ 12,60 GET UVPIN PICT "@!"
      READ
      STOR " " TO ANY
      SET COLOR TO GR+/GR
      @ 23,1 SAY SPACE(77)
      @ 23,23 SAY "CONFIRM THIS ENTRY ? Y/N : " GET ANY PICT "!" VALID ANY $ "YN"
      READ
      SET COLOR TO W+/B,W+/R
      @ 23,1 SAY SPACE(77)
      IF ANY = "N"
         EXIT
      ELSE
         SELE A
         SEEK UVCCD
         IF .NOT. FOUND()
            APPE BLANK
         ENDIF
         REPL A->MAINNAME   WITH UVCCD
         REPL A->NAME       WITH UVCNA
         REPL A->COMPANY    WITH UVSHCD
         REPL A->BATCH_CHAR WITH UVFCHAR
         REPL A->BATCHCHAR1 WITH UVFCHAR1
         REPL A->CITY       WITH UVCITY
         REPL A->PIN        WITH UVPIN
         IF AMD = "A"
            DO UBATADD
         ENDIF  
         IF AMD = "M"
            DO UBATMOD WITH "M"
         ENDIF 
         EXIT
      ENDIF         
   ENDDO
ENDDO
CLOS DATA
RETURN
*--------------*
PROCEDURE UBATADD
IF UVFCHAR # " "
   STOR Z_ALLOWED+UVFCHAR TO Z_ALLOWED
ENDIF
IF UVFCHAR1 # " "
   STOR Z_ALLOWED+UVFCHAR1 TO Z_ALLOWED
ENDIF
SAVE TO BATCHAR ALL LIKE Z_*
CLOSE DATA
RETURN
*----------------*
PROCEDURE UBATMOD
PARAM MD
IF MD = "M"
   IF UVFCHAR # " "
      IF OLDFCH # ' '
           Z_ALLOWED = STRTRAN(Z_ALLOWED, OLDFCH, UVFCHAR)
      ELSE
           Z_ALLOWED = Z_ALLOWED+UVFCHAR
      ENDIF
   ENDIF
   IF UVFCHAR1 # " "
      IF OLDFCH1 # ' '
         Z_ALLOWED = STRTRAN(Z_ALLOWED, OLDFCH1, UVFCHAR1)
      ELSE
         Z_ALLOWED = Z_ALLOWED+UVFCHAR1
      ENDIF
   ENDIF
ELSE

ENDIF
SAVE TO BATCHAR ALL LIKE Z_*
RETURN
