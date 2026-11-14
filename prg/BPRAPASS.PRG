****PASSWORD FOR BPR SHEET ALL PAGES
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
   SET COLOR TO RB+/B
   @2,0 TO 5,70 DOUBLE
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   SET COLOR TO G+/B
   @3,5 SAY  'ENTER PASSWORD : ' 
   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
   @3,25 SAY ' '
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
   		     SET COLOR TO RG+/B
 		     @23,1 SAY 'I N V A L I D       P A S S W O R D... ENTER AGAIN .KEEP BLANK TO EXIT'
             UX=INKEY(0)
             SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
             LOOP
       ENDIF			  
       IF FOUND()
          VLEVEL1=A->LEVEL
	  	  VDEP1=A->DEPARTMENT
          VKEY1=A->KEY
          IF VKEY1='K' 
             IF VLEVEL1>2
                  SET COLOR TO RB+/W,
                 @22,1 SAY '*.........YOU ARE NOT AUTHORISED.........*'
                 SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	    		 UX=INKEY(0)
     		     LOOP
             ENDIF
             MATCH1='Y'
          ELSE
                 SET COLOR TO RB+/B
                @22,1 SAY '*..........YOU ARE NOT AUTHORISED........*'
                SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
			   LOOP
           ENDIF
         CLEA 
         @13,0 TO 17,74
         SET COLOR TO GR+/B
         @15,1 SAY TRIM(A->NAME)+'.U R AUTHORISED FOR BPR .PRESS ANY KEY TO PROCEED AHEAD'
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
         READ
         CLEA
          endif        
           EXIT
   ENDDO
      MATCH2='Y'
      IF MATCH1='Y' .AND. MATCH2='Y'
		   EXIT
      ENDIF
ENDDO 			