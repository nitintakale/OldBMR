****PASSWORD FOR BMR SHEET ALL PAGES
CLEA
SELE A
USE PASS_WORD
DO WHILE .T.
   STORE SPACE(8) TO VPASS1
   STORE SPACE(8) TO VPASS2
   STORE SPACE(30) TO BNAME1,BNAME2
   STORE SPACE(12) TO VDEP1,VDEP2
   STORE 0 TO BLEVEL1,VLEVEL2    
   STORE SPACE(1) TO MATCH1,MATCH2,VKEY1,VKEY2
   CLEA
DO WHILE .T.   
   SET COLOR TO G+/B
   @2,0 TO 5,70 DOUBLE
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   SET COLOR TO R+/B
   @3,5 SAY  'ENTER PASSWORD : ' 
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   @3,25 SAY ' '
   set console off
   ACCEPT '         ' TO VPASS1
   IF VPASS1=SPACE(8)
       CLOSE DATABASES
       CLEA
       MATCH1='N'
       RETU
   ENDIF  
   SET CONSOLE ON
   SELE A
   GO TOP
   LOCATE FOR PASSWORD=VPASS1 
      IF .NOT. FOUND()
		    @23,1 SAY SPACE(72)
            SET COLOR TO GR+/RB
			@23,1 SAY 'I N V A L I D    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
            UX=INKEY(0)
            SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
            VPASS1=SPACE(8)
            LOOP
     ENDIF			  
     IF FOUND()
             VLEVEL1=A->LEVEL
			 VDEP1=A->DEPARTMENT
             VKEY1=A->KEY
        IF VKEY1='P' .OR. VKEY1='Q'
             IF VLEVEL1#1
                 SET COLOR TO GB+/RB
                 @22,10 SAY '*.............YOU ARE NOT AUTHORISED...........*'
                  UX=INKEY(0)
                  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	    		  LOOP
             ENDIF
                 MATCH1='Y'
          ELSE
             SET COLOR TO RB+/G
            @22,1 SAY '*.........YOU ARE NOT AUTHORISED..........*'
            UX=INKEY(0)
            SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
     	   LOOP
         ENDIF
         CLEA 
         @13,0 TO 17,74
         SET COLOR TO GR+/B
         @15,0 SAY TRIM(A->NAME)+'.U R AUTHORISED FOR BMR .PRESS ANY KEY TO CONTI...'
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
         READ
        CLEA
       ENDIF  
       EXIT
   ENDDO
*************************************************************

*DO WHILE .T.   
*   @22,1 SAY SPACE(78)
*   @23,1 SAY SPACE(72)
*   SET COLOR TO
*   @5,5 SAY  'ENTER PASSWORD2 : ' 
*   @5,33 SAY ' '
*   set console off
*   ACCEPT '         ' TO VPASS2
*   IF VPASS2=SPACE(8)
*       CLOSE DATABASES
*       MATCH2='N'
*       RETU
*   ENDIF  
*   SET CONSOLE ON
*   SELE A
*   GO TOP
*   LOCATE FOR PASSWORD=VPASS2 
*      IF .NOT. FOUND()
*		    @23,1 SAY SPACE(72)
*			 SET COLOR TO W+*
*			  @22,1 SAY 'W R O N G    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
*           WAIT
*           LOOP
*       ENDIF			    
*       *IF FOUND()
*          VLEVEL2=A->LEVEL
*			 VDEP2=A->DEPARTMENT
*          VKEY2=A->KEY
*          IF VLEVEL2#1
*             @22,1 SAY 'YOU ARE NOT AUTHORISED'
*             WAIT
*			    LOOP
*          ENDIF				 
*           IF VKEY1=VKEY2
*              @22,1 SAY SPACE(78)
*		    	  @22,1 SAY 'BOTH PASSWORDS  ARE FROM SAME DEPARTMENT ..WHICH IS NOT ALLOWED'
*              WAIT
*              LOOP
*        ENDIF			  			  			   		                     
*          IF VKEY2='P' .OR. VKEY2='Q'
             MATCH2='Y'
*          ELSE
*            @22,1 SAY SPACE(78)_  
*            @22,1 SAY 'YOU ARE NOT AUTHORISED'
*			   LOOP
*         ENDIF
*           EXIT
*   ENDDO
      IF MATCH1='Y' .AND. MATCH2='Y'
		   EXIT
      ENDIF
ENDDO 			