****PASS WORD PRG
SET PROC TO ADIHEAD
DO ADISTART
CLEA
SELE A
USE PASS_WORD
   STORE SPACE(1) TO VPASSI
   CLEA
   @3,5 SAY  'ENTER PRODUCTION PASSWORD : ' 
   @3,33 SAY ' '
   set console off
   ACCEPT '         ' TO PASSI
   IF PASSI=SPACE(8)
       CLOSE DATABASES
       RETU
   ENDIF  
   SET CONSOLE ON
   SELE A
   GO TOP
   LOCATE FOR PASSWORD=PASSI .AND. KEY='P'
   IF .NOT. FOUND()
       vpassi='N'
   ELSE
      VPASSI='Y'
   ENDIF
    IF VPASSI='N'
	    @22,1 SAY 'WRONG PASSWORD'
		 RETU
    ENDIF		 
    STORE SPACE(1) TO VPASSII
    @5,5 SAY 'ENTER Q.C.PASSWORD       : ' 
    @5,33 SAY ' '
    set console off
    ACCEPT '         ' TO PASSII
    IF PASSII=SPACE(8)
        CLOSE DATABASES
        RETU
    ENDIF  
    SET CONSOLE  ON
    SELE A
    GO TOP
    LOCATE FOR PASSWORD=PASSII .AND. KEY='Q'
    IF .NOT. FOUND()
        VPASSII='N'
    ELSE
        VPASSII='Y'
	 ENDIF
    IF VPASSII='N'
	    @22,1 SAY 'WRONG PASSWORD'
		 RETU
    ENDIF		 
