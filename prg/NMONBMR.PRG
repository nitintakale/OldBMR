***MONTHLY EXTRACT OF BMR
CLEA
vyear=0
todate=ctod('  /  /    ')
clea
STORE SPACE(3) TO VMON,VMONTH
CLOSE DATA
SET PROC TO ADIHEAD
clea
SET COLOR TO W+/B,W+/R
@11,1 TO 22,78 DOUBLE
@13,5 say 'ENTER LAST DATE(UPTO DATE)                   :' get todate pict 'D' valid todate # ctod('  /  /    ')
@15,5 SAY 'ENTER FIRST 3 LETTERS OF MONTH FOR QTY PACKED:' GET VMON VALID VMON $('JAN#FEB#MAR#APR#MAY#JUN#JUL#AUG#SEP#OCT#NOV#DEC')
READ
today=day(todate)
vmonth=cmonth(todate)
VMONTH=UPPER(VMONTH)
VMONTH=SUBSTR(VMONTH,1,3)
vyear=year(todate)
vmonno=MONTH(todate) 
MMONTH=SPACE(8)
NMMMONTH=SPACE(8)
MMONTH=VMONTH+'-'+LTRIM(STR(VYEAR))
IF LTRIM(VMON)#'MAY'
     NMMONTH=VMONTH+'.'+LTRIM(STR(VYEAR))
ELSE
     NMMONTH=VMONTH+' '+LTRIM(STR(VYEAR))
ENDIF   
	SELE A
	USE BATCH_NO ORDER BN12
	GO TOP
	SELE B
	USE PRODMAST ORDER PN12
	SELE D
	USE YIELDFILE EXCLUSIVE
	ZAP
	SELE E
	USE PACKQTY
	CLEA
DO WHILE .T.
DO PRINTOPT
      IF OPT=0
         CLOSE DATA
         RETU
      ENDIF 
      IF OPT=1
         @15,5 SAY '*.........NO SCREEN VIEW........*'
         LOOP 
      ENDIF 
  EXIT
  ENDDO
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
      SET FILT TO (MFGDATE=MMONTH  .OR. MFGDATE=NMMONTH) .AND. (SUBSTR(ALLTRIM(BATCHNO),1,3)='ZD' .OR. SUBSTR(BATCHNO,1,2) # 'BM') .AND. A->MIX_DATE#CTOD('  /  /    ') 
      GO TOP 
      DO  WHILE .NOT. EOF()
        SELE B
        GO TOP
        SEEK A->NAME1+A->NAME2
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
      	IF LN>60
       	   EJECT
            PAGE=PAGE+1
            LN=1
            @LN,60 SAY 'CONTI..'+'PAGE   '+LTRIM(STR(PAGE))
            LN=LN+2
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
        ENDIF
    ENDDO	
EJECT
   SET PRINT OFF
   SET DEVI TO SCREEN
   SET PRINTER TO
CLOSE DATA
