***PRG TO ENTER MIXING DATE FOR WHICH BSR_QTY IS NOT ENTERED
CLEA
DO WHILE .T.
          CORR=' '
          @15,1 SAY '[C] FOR CORRECTION' GET CORR PICT '!'
          READ
          STORE SPACE(2) TO  VYEAR
          CLEA
              
          SELE B
          USE PASS_WORD
          VDATE=CTOD('  /  /    ')
          VBATCH=SPACE(6)
         
          sele a
          use batch_no
          go top
 IF CORR#'C'
  do while .t.
    SELE A
    USE BATCH_NO
    GO TOP
    SET FILT TO  MIX_DATE={} .AND. (SUBSTR(BATCHNO,1,2)#'BM')
    GO TOP
    IF EOF()
      @15,15 SAY '*..............NO PENDING............* '
      @23,1 SAY' '
      read
      exit
    endif          
        @1,1 SAY 'FOR FOLLOWING BATCHES MFGDATE IS TO BE ENTERED'
        DEFINE WINDOW TEMP FROM 5,10 TO 22,75
        define popup s_list from 5,10 to 22,75 prompt fields LTRIM(NAME1)+' '+LTRIM(BATCHNO) +' '+ LTRIM(DTOC(MIX_DATE))  footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
        activate window temp
        @0,0 get vBATCH  popup s_list
        read valid lastkey() = 13  .OR. LASTKEY()=27
        deactivate window temp
        IF LASTKEY()=27
           RETU
         ENDIF
         VBATCH=A.BATCHNO
         @23,1 SAY SPACE(78)
         CLEA
         @3,1 SAY A->NAME1
         @3,20 SAY A->BATCHNO
          do while .t.
              @7,1 SAY 'Mfg .date :' get vdate pict 'D'
              read
              IF VDATE>DATE()
      	         @23,1 SAY SPACE(78)
    	         @23,1 SAY 'MFG.DATE CAN NOT BE > THAN TODAYS DATE'
	             LOOP
              ELSE
         	     EXIT
         	  ENDIF
      ENDDO	  		  
     SELE A
     repl mix_date with vdate
     @23,1 SAY SPACE(78)
     cn=' '
     @23,1 SAY '[C] TO CONTI NEW ENTRIES..' GET CN PICT '!'
     READ
     CLOSE DATABASES 
     IF CN='C'
        LOOP
     ELSE
        EXIT
    ENDIF		
ENDDO
ENDIF && NOT FOR CORRECTION
IF CORR='C'
         VBNO=SPACE(7)
        do while .t.
              CLEA
              @1,1 SAY 'Enter batchno: ' get vbno pict '!!!!!!!'
              read
             IF VBNO=SPACE(7)
                 CLOSE DATABASES
                 RETU
             ENDIF	
     	     SELE A
     	     GO TOP
     	     LOCATE FOR BATCHNO=VBNO
             if .not. found()
                loop
     	     else
         	     VDATE=A->MIX_DATE
                 @3,1 SAY A->NAME1
                 @3,15 SAY A->NAME2
                 @3,60 SAY A->BAT_SIZE
              DO WHILE .T.
                 @7,1 SAY 'Mfg .date :' get vdate pict 'D'
                 read
                 IF VDATE>DATE()
           	         @23,1 SAY SPACE(78)
          	         @23,1 SAY 'MFG.DATE CAN NOT BE > THAN TODAYS DATE'
	                 LOOP
                 ELSE
                    EXIT
                 ENDIF
              ENDDO                      
                 cOn=' '
                 @23,1 SAY '[C] TO CONFIRM..' GET CON PICT '!'
                 READ     
                 IF CON='C'
                    SELE A
                    repl mix_date with vdate
                 ENDIF
                 endif
                 cOn=' '
                 @23,1 SAY '[C] TO CONTI..' GET CON PICT '!'
                 READ     
                 IF CON='C'
                    LOOP
                 ELSE
                   EXIT
                 ENDIF			    
                ENDDO
             ENDIF
                 cOn=' '
                 @23,1 SAY '[C] TO CONTI MORE ENTRIES..' GET CON PICT '!'
                 READ     
                 IF CON='C'
                    LOOP
                 ELSE
                   EXIT
                 ENDIF			    
           ENDDO
   
RETU