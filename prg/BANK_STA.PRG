**** bank statment for NO OF BATCHES UNPACKED AS ON TODAY
SET PROC TO ADIHEAD
mdir=space(2)
close data
clea
@15,1 say 'enter last two digit of BMR year:' get mdir pict '!!'
read
SET PATH TO C:\DBASE\BMR\&MDIR
vno=SPACE(2)
CLEA
STORE CTOD('  /  /    ') TO ENDATE
@17,1 SAY 'Enter last date:'   get endate
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
COPY TO BTEMP FOR  (MIX_DATE<=ENDATE .AND. MIX_DATE#CTOD('  /  /    ')) .AND. SUBSTR(BATCHNO,1,2)='ZD' 
SELE A
USE
SELE A
USE BTEMP
SET FILT TO ((PACK_DATE=CTOD('  /  /    ') .OR. PACK_DATE>ENDATE) .AND.(BSR_QTY#0 .AND. PACK_QTY=0) .OR. BSR_QTY=0 .AND. PACK_QTY=0)
GO TOP
DO PRINTOPT
LN=1
SR=1
@LN,1 SAY 'BATCHES MANUFACTURED BUT NOT PACKED AS ON '+'  '+LTRIM(DTOC(ENDATE))
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
@LN,85 SAY 'QTY. TO BE PACKED'
@LN,110 SAY 'RATE'
@LN,120 SAY 'AMOUNT'
STORE 0 TO VAMOUNT
ln=ln+1
@ln,1 say ee
ln=ln+1
DO WHILE .NOT. EOF()
if (BSR_qty#0 .AND. (BSR_QTY#PACK_QTY)) .OR. BSR_QTY=0
   @LN,1 SAY SR PICT '99'
   @LN,7 SAY NAME1
   @LN,18 SAY NAME2
   @LN,51 SAY BATCHNO
   @LN,59 SAY LTRIM(STR(BAT_SIZE))+' '+'LTS'
   @LN,72 SAY MFGDATE
   if BSR_qty=0 
       @LN,85  SAY BAT_QTY
       AMOUNT=RATE*BAT_QTY
    endif
    if (BSR_qty#0 .AND. (BSR_QTY#PACK_QTY)) .OR. (BSR_QTY=PACK_QTY)
       @ln,85 say PACK_QTY
       AMOUNT=RATE*PACK_QTY
    endif    
   @LN,110 SAY RATE PICT '99.99'
   @LN,120 SAY AMOUNT PICT '999999.99'
   VAMOUNT=VAMOUNT+AMOUNT
   LN=LN+2
   SR=SR+1
  endif    
   SKIP
   IF EOF()
      EXIT
   ENDIF
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
      @LN,85 SAY 'QTY. TO BE PACKED'
      @LN,110 SAY 'RATE'
      @LN,120 SAY 'AMOUNT'
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