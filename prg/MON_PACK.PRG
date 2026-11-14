**** NO OF BATCHES PACKED IN AMONTH
SET PROC TO ADIHEAD
MMDIR=SPACE(4)
mdir=space(2)
close data
clea
@13,1 say 'enter last two digit of REQUIRED BMR DIRECTORY year:' get mdir pict '!!'
read
@15,1 say 'enter last FOUR digit of YEAR  FOR  WHICH PACKED QTY IS TO BE COUNTED :' get MMdir pict '!!!!'
READ
SET PATH TO C:\DBASE\BMR\&MDIR
vmon=space(3)
vno=SPACE(2)
CLEA
@15,1 say 'Enter 1 ST three letters of  month:' get vmon pict '!!!' VALID VMON $('JAN#FEB#MAR#APR#MAY#JUN#JUL#AUG#SEP#OCT#NOV#DEC')
read
SELE A
USE BATCH_NO
INDE ON NAME1 TO B_NO
SELE A
USE 
SELE A
USE BATCH_NO INDE B_NO
sele a
GO TOP
set filt to SUBSTR(UPPER(CMON(PACK_DATE)),1,3)=VMON .AND. SUBSTR(BATCHNO,1,2)='ZD' .AND. SUBSTR(DTOC(PACK_DATE),7,4)=MMDIR
GO TOP
COPY TO AAA.DBF
CLOSE DATA
SELE A
USE AAA
SELE A
SET FILT TO PACK_QTY>BSR_QTY
GO TOP
IF .NOT. EOF()
   CLEA
   @1,1 SAY 'FOR FOLLOWING PRODUCTS PACK_QTY > BSR_QTY'
   LN=3
   DO WHILE .NOT. EOF()
     @LN,5 SAY A->BATCHNO
     SKIP
     LN=LN+2
   ENDDO
WAIT''
SELE A
SET FILT TO
ENDIF
SELE A
set filt to SUBSTR(UPPER(CMON(PACK_DATE)),1,3)=VMON .AND. SUBSTR(BATCHNO,1,2)='ZD' .AND. SUBSTR(DTOC(PACK_DATE),7,4)=MMDIR
GO TOP
DO PRINTOPT
LN=1
SR=1
@LN,1 SAY 'BATCHES PACKED IN MONTH OF '+'  '+LTRIM(VMON)+' - '+LTRIM(MMDIR)
LN=LN+1
EE=REPL('-',130)
@LN,1 SAY CHR(15)
@LN,1 SAY EE
LN=LN+1
@LN,1 SAY 'SR NO.'
@LN,9 SAY 'PRODUCT'
@LN,49 SAY 'BATCH NO'
@LN,59 SAY 'BATCH SIZE'
@LN,72 SAY 'MFG.DT'
@LN,85 SAY 'QUANTITY'
@LN,100 SAY 'STATUS'
ln=ln+1
@ln,1 say ee
ln=ln+1
DO WHILE .NOT. EOF()
   @LN,1 SAY SR PICT '99'
   @LN,7 SAY NAME1
   @LN,18 SAY NAME2
   @LN,51 SAY BATCHNO
   @LN,59 SAY LTRIM(STR(BAT_SIZE))+' '+'LTS'
   @LN,72 SAY MFGDATE
   if pack_qty#0
       @LN,85  SAY PACK_QTY
    endif
    if pack_qty=0
       @ln,85 say bsr_qty
    endif    
   SKIP
   IF EOF()
      EXIT
   ENDIF
   SR=SR+1
   LN=LN+2
   IF LN>64
      EJECT   
      LN=3
      @LN,1 SAY EE
      LN=LN+1
      @LN,1 SAY 'SR NO.'
      @LN,9 SAY 'PRODUCT'
      @LN,49 SAY 'BATCH NO'
      @LN,59 SAY 'BATCH SIZE'
      @LN,72 SAY 'MFG.DT'
      @LN,85 SAY 'QUANTITY'
      @LN,100 SAY 'STATUS'
      LN=LN+1
      @LN,1 SAY EE
      LN=LN+1
   ENDIF
   ENDDO      
   @LN,1 SAY CHR(18)
   EJECT
   SET PRINT OFF
   SET DEVI TO SCREEN
   SET PRINTER TO
   !DEL B_NO.*
   !DEL AAA.DBF