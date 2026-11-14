****PASSWORD FOR BMR SHEET SINGLE PAGES
CLEA
SELE A
USE PASS_WORD
DO WHILE .T.
   STORE SPACE(8) TO VPASS1,VPASS2
   STORE SPACE(30) TO BNAME1,BNAME2
	STORE SPACE(12) TO VDEP1,VDEP2
   STORE 0 TO BLEVEL1,VLEVEL2    
   STORE SPACE(1) TO MATCH1,MATCH2,VKEY1,VKEY2
   CLEA
DO WHILE .T.   
   SET COLOR TO
*	CLEA
   @3,5 SAY  'ENTER PASSWORD1 : ' 
   @3,33 SAY ' '
   set console off
   ACCEPT '         ' TO VPASS1
   IF VPASS1=SPACE(8)
       CLOSE DATABASES
       MATCH1='N'
       RETU
   ENDIF  
   SET CONSOLE ON
   SELE A
   GO TOP
   LOCATE FOR PASSWORD=VPASS1 
      IF .NOT. FOUND()
		    @23,1 SAY SPACE(72)
			 SET COLOR TO W+*
			  @23,1 SAY 'W R O N G    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
           LOOP
       ENDIF			  
       IF FOUND()
          VLEVEL1=A->LEVEL
			 VDEP1=A->DEPARTMENT
          VKEY1=A->KEY
          IF VKEY1='P' .OR. VKEY1='Q'
             IF VLEVEL1#1
                 @22,1 SAY 'YOU ARE NOT AUTHORISED'
	    		     LOOP
             ENDIF
           MATCH1='Y'
          ELSE
            @22,1 SAY 'YOU ARE NOT AUTHORISED'
			   LOOP
         ENDIF
           EXIT
   ENDDO
*************************************************************

DO WHILE .T.   
   @22,1 SAY SPACE(78)
   @23,1 SAY SPACE(72)
   SET COLOR TO
   @5,5 SAY  'ENTER PASSWORD2 : ' 
   @5,33 SAY ' '
   set console off
   ACCEPT '         ' TO VPASS2
   IF VPASS2=SPACE(8)
       CLOSE DATABASES
       MATCH2='N'
       RETU
   ENDIF  
   SET CONSOLE ON
   SELE A
   GO TOP
   LOCATE FOR PASSWORD=VPASS2 
      IF .NOT. FOUND()
		    @23,1 SAY SPACE(72)
			 SET COLOR TO W+*
			  @22,1 SAY 'W R O N G    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
           WAIT
           LOOP
       ENDIF			    
       IF FOUND()
          VLEVEL2=A->LEVEL
			 VDEP2=A->DEPARTMENT
          VKEY2=A->KEY
          IF VLEVEL2#1
             @22,1 SAY 'YOU ARE NOT AUTHORISED'
             WAIT
			    LOOP
          ENDIF				 
           IF VKEY1=VKEY2
              @22,1 SAY SPACE(78)
		    	  @22,1 SAY 'BOTH PASSWORDS  ARE FROM SAME DEPARTMENT ..WHICH IS NOT ALLOWED'
              WAIT
              LOOP
        ENDIF			  			  			   		                     
          IF VKEY2='P' .OR. VKEY2='Q'
             MATCH2='Y'
          ELSE
            @22,1 SAY 'YOU ARE NOT AUTHORISED'
			   LOOP
         ENDIF
           EXIT
   ENDDO
      IF MATCH1='Y' .AND. MATCH2='Y'
		   EXIT
      ENDIF
ENDDO 			