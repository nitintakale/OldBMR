**PRG TO CANCELL BMR
   CLEA
   DO WHILE .T.
       CLEA
       @5,5 SAY 'ENTER BATCH NO:' GET VBNO  PICT 'AA!9999'
       READ
       IF VBNO=SPACE(7)
          RETU
       ENDIF	 
       SELE A
*       USE BATCH_NO INDE BNO
       USE BATCH_NO ORDER BNO
        SEEK VBNO
       IF .NOT. FOUND()
           SET COLO TO W+/G
           @23,5 SAY '.........THIS BATCH NO IS NOT FOUND....ENTER AGAIN....'
           SET COLO TO W+/B,W+/R
           UX=INKEY(0) 
   	       LOOP
      ENDIF
   IF FOUND()
      SET COLO TO W+/RB
	  @7,5 SAY A->NAME1+'  '+A->NAME2+'  '+A->MFGDATE +'  '+A->EXPDATE +'  '+LTRIM(STR(A->BAT_SIZE))
      SET COLO TO W+/B,W+/R
      CN=' '
      SET COLO TO W+/R
	  @23,2 SAY 'CONFIRM [C] FOR CANCELLATION OF ABOVR BMR' GET CN PICT '!A'
      SET COLO TO W+/B,W+/R
	  READ
	  IF CN='C'
             SELE A
			 DELE
	       ENDIF			           			 
 ENDIF
      EXIT
ENDDO

    CLOSE DATABASES
*       USE BATCH_NO INDE BNO EXCLUSIVE
      USE BATCH_NO ORDER BNO EXCLUSIVE
       PACK
       CLOSE DATA