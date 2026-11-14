***MONTHLY EXTRACT OF BMR
CLEA
VMONTH=SPACE(3)
vyear=0
todate=ctod('  /  /    ')
clea
STORE SPACE(4) TO MMDIR,SEARCHYEAR
VMON=SPACE(3)
close data
clea
@13,5 say 'enter last date:' get todate pict 'D' valid todate # ctod('  /  /    ')
read
@17,1 say 'enter last FOUR digit of SEARCHING YEAR :' get SEARCHYEAR pict '!!!!'
read
@19,1 SAY 'ENTER FIRST 3 LETTERS OF MONTH FOR QTY PACKED' GET VMON VALID VMON $('JAN#FEB#MAR#APR#MAY#JUN#JUL#AUG#SEP#OCT#NOV#DEC')
READ
today=day(todate)
vmonth=cmonth(todate)
VMONTH=UPPER(VMONTH)
VMONTH=SUBSTR(VMONTH,1,3)
vyear=year(todate)
vmonno=MONTH(todate) 
DO WHILE .T.
      CLEA
        YB=' '
		@15,1 SAY 'ENTER [Y] FOR YIELD STATMENT [B] FOR BATCHES MANUFACTURED' GET YB PICT '!'
		READ
        IF YB=' '
           RETU
         ENDIF  
         CLEA
         VYEAR=LTRIM(STR(VYEAR))
         SYEAR=SUBSTR(VYEAR,3,2)
         SSEARCHYEAR=LTRIM(SEARCHYEAR)
         SHSYEAR=SUBSTR(SSEARCHYEAR,3,2)
         SET PATH TO &SHSYEAR
         MMONTH=SPACE(8)
         MMONTH=VMONTH+'-'+VYEAR
         SELE A
         USE BATCH_NO
         INDE ON (NAME1+NAME2)+DTOC(MIX_DATE) TO BATCH_NO
         SELE A
   	     USE BATCH_NO INDE BATCH_NO
         GO TOP
         SELE B
      	 USE PRODMAST
         SELE C
         USE PACKQTY
         CLEA

    IF YB='Y'
         CLEA
         pall=' '
         @15,1 SAY '[A] FOR ALL PRODUCT YIELD STATMENT [I] FOR INDIVIDUAL PRODUCT' GET PALL PICT '!'
         READ
         IF PALL='I'
             PCODE=SPACE(5)
             CLEA
            DO WHILE .T.
             @15,5 SAY 'ENTER PRODUCT CODE:' GET PCODE PICT '!!!!!'
             READ
             SELE A
             LOCATE FOR CODE=PCODE
             IF .NOT. FOUND()
                @23,1 SAY 'WRONG CODE'
                LOOP
             ENDIF
             EXIT
             ENDDO   
          ENDIF    
           SELE C
      IF PALL='A'
          SET FILT TO SUBSTR(UPPER(CMON(PACK_DATE)),1,3)=VMON .and. day(a->pack_date)<=today  .AND. (SUBSTR(BATCHNO,1,2)='ZD' .OR. SUBSTR(BATCHNO,1,2)='ZS' .OR. SUBSTR(BATCHNO,1,2)='ZU') .AND. BSR_QTY#0 .AND. SUBSTR(DTOC(PACK_DATE),7,4)=VYEAR  .AND. COMPANY=VNAME      
      ENDIF 
      IF PALL='I'
         SET FILT TO SUBSTR(UPPER(CMON(PACK_DATE)),1,3)=VMON .and. day(a->pack_date)<=today  .AND. (SUBSTR(BATCHNO,1,2)='ZD' .OR. SUBSTR(BATCHNO,1,2)='ZS' .OR. SUBSTR(BATCHNO,1,2)='ZU').AND. SUBSTR(DTOC(PACK_DATE),7,4)=VYEAR .AND. CODE=PCODE       
      ENDIF 
         REPL ALL PACK_QTY WITH BSR_QTY
         GO TOP
         @17,1 SAY 'FOR PRINTER SELECT LETTERS 12 CPI'
         WAIT
         DO PRINTOPT
         LN=1
         PAGE=1
         @LN,25 SAY 'Y I E L D    S T A T M E N T '
         LN=LN+2
         @LN,1 SAY ' L O C A T I O N :    ADITI PHARMA.   :       SOLAPUR'
         @LN,70 SAY 'PAGE'+'  '+LTRIM(STR(PAGE))
         LN=LN+1
         @LN,1 SAY 'BATCHES PACKED IN MONTH OF ' +'  '+VMON+'   '+VYEAR
         LN=LN+2
         EE=REPLI('-',180)
         @ln,0 say chr(15)
         @LN,1 SAY EE
         LN=LN+1
         @LN,1 SAY 'NAME'
         @LN,45 SAY 'PACK-SIZE'
         @LN,60 SAY 'BATCH '
         @LN,75 SAY 'INPUT QTY'
         @ln,85 say 'OUTPUT QTY.'
         @LN,99 SAY 'VARIANCE'
         @LN,111 SAy 'ACTUAL'
         @LN,122 SAY 'STANDARD'
         @LN,135 SAY 'RECOVERIES'
         @LN,150 SAY 'REASONS FOR LOW YIELDS'
         LN=LN+1
         @LN,45 SAY ' In ml'
         @LN,60 SAY 'NO.'
         @LN,75 SAY '(B.SIZE)'
         @LN,111 SAY 'LOSS %'
         @LN,122 SAY 'LOSS %'
         @LN,135 SAY '(IF ANY)'
         LN=LN+1
         @LN,1 SAY EE
         LN=LN+2
         SELE A
         GO TOP
      DO  WHILE .NOT. EOF()
        SELE B
    	LOCATE FOR (B->NAME1 = A->NAME1) .AND. (B->NAME2=A->NAME2)
        @LN,1 SAY a->NAME1
       	@LN,14 SAY a->NAME2
        @LN,45 SAY B->VOLUME
      	@LN,60 SAY a->BATCHNO
      	@LN,75 SAY a->BAT_QTY
        @LN,85 SAY a->BSR_QTY
 *       IF UP='P'
             VAR=(a->BAT_QTY-a->BSR_QTY)
             @LN,99 SAY -(VAR)  PICT '99999999'
           	 vYIELD=100-(a->BSR_QTY/a->BAT_QTY*100)
           	 @LN,111 SAY vYIELD PICT '99.99'
            IF B->NAME2='EYE/EAR DROPS[LDPE]'
   			   @LN,122 SAY '12.00' PICT '99.99'
            ENDIF
            IF B->NAME2='EYE/EAR DROPS[RUBBER PLUGS]' .OR. B->NAME1='BECLATE' .OR. B->NAME1='BUDANASE' .OR. B->NAME2='EYE/EAR DROPS'
   			   @LN,122 SAY '5.00' 
            ENDIF
            IF 'RESPULES' $ B->NAME2
   			   @LN,122 SAY '10.00'
            ENDIF  
            IF B->NAME2='RESP. SOLUTION'
   			   @LN,122 SAY '8.00' 
            ENDIF  
  *      ENDIF
         @ln,135 say 'N.A' 
         sele a
      	SKIP
         IF EOF()
        	  EXIT
         ENDIF	  
         LN=LN+2
      	IF LN>64
       	   EJECT
            LN=1
            PAGE=PAGE+1
            @LN,150 SAY 'CONTI..'+'PAGE'+'  '+LTRIM(STR(PAGE))
            LN=LN+2
            @LN,1 SAY 'NAME'
            @LN,45 SAY 'PACK-SIZE'
            @LN,60 SAY 'BATCH '
            @LN,75 SAY 'INPUT QTY'
            @ln,85 say 'OUTPUT QTY.'
            @LN,99 SAY 'VARIANCE'
            @LN,111 SAy 'ACTUAL'
            @LN,122 SAY 'STANDARD'
            @LN,135 SAY 'RECOVERIES'
            @LN,150 SAY 'REASONS FOR LOW YIELDS'
            LN=LN+1
            @ln,45 say 'In ml'
            @LN,60 SAY 'NO.'
            @LN,75 SAY '(B.SIZE)'
            @LN,111 SAY 'LOSS %'
            @LN,122 SAY 'LOSS %'
            @LN,135 SAY '(IF ANY)'
            LN=LN+1
            @LN,1 SAY EE
            LN=LN+2
        ENDIF
    ENDDO	
     @LN,1 SAY CHR(18)
ENDIF
IF YB='B'
      DO PRINTOPT
      LN=1
      PAGE=1
      @LN,1 SAY ' L O C A T I O N :    ADITI PHARMA.   :       SOLAPUR'
      LN=LN+2
      @LN,1 SAY 'BATCHES MANUFACTURED IN MONTH OF ' +'  '+MMONTH
      LN=LN+2
      EE=REPLI('-',80)
      @ln,0 say chr(18)
      @LN,1 SAY EE
      LN=LN+1
      @LN,1 SAY 'NAME'
      @LN,45 SAY 'MFG_DATE'
      @LN,60 SAY 'BATCH '
      @LN,75 SAY 'INPUT QTY'
      LN=LN+1
      @LN,60 SAY 'NO.'
      @LN,75 SAY '(B.SIZE)'
      LN=LN+1
      @LN,1 SAY EE
      LN=LN+2
      SELE A
      GO TOP
      SET FILT TO MFGDATE=MMONTH  .AND. (SUBSTR(BATCHNO,1,2)='ZD'  .OR. SUBSTR(BATCHNO,1,2)='ZS'.OR. SUBSTR(BATCHNO,1,2)='ZU') .AND. A->MIX_DATE#CTOD('  /  /    ')
            GO TOP 
      DO  WHILE .NOT. EOF()
        SELE B
        LOCATE FOR ((B->NAME1 = A->NAME1) .AND. (B->NAME2=A->NAME2)) .AND. COMPANY=VNAME
        @LN,1 SAY a->NAME1
       	@LN,14 SAY a->NAME2
        @LN,45 SAY A->MIX_DATE
      	@LN,60 SAY a->BATCHNO
      	@LN,75 SAY a->BAT_QTY
        sele a
      	SKIP
         IF EOF()
        	  EXIT
         ENDIF	  
         LN=LN+2
      	IF LN>64
       	   EJECT
            PAGE=PAGE+1
            LN=1
            @LN,150 SAY 'CONTI..'+'PAGE   '+LTRIM(STR(PAGE))
            LN=LN+2
            @LN,1 SAY 'NAME'
            @LN,45 SAY 'MFG_DATE'
            @LN,60 SAY 'BATCH '
            @LN,75 SAY 'INPUT QTY'
            LN=LN+1
            @LN,60 SAY 'NO.'
            @LN,75 SAY '(B.SIZE)'
            LN=LN+1
            @LN,1 SAY EE
            LN=LN+2
        ENDIF
    ENDDO	
ENDIF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
IF YB='Y'
  CLEA
  @15,5 SAY 'MAKE PRINTER TYPE 10 CPI'
  READ
ENDIF
VYEAR=VAL(VYEAR)
ENDDO
!DEL BATCH_NO.IDX
!DEL BATCH_NO.CDX