**** NO OF BATCHES UNPACKED AS ON entered date
SET PROC TO ADIHEAD
set printer to
mdir=space(2)
close data
clea
@13,1 say 'enter last two digit of BMR year:' get mdir pict '!!'
read
SET PATH TO \&MDIR
vno=SPACE(2)
CLEA
STORE CTOD('  /  /    ') TO ENDATE
@17,1 SAY 'Enter last date:' get endate pict 'd'
read
IF ENDATE=CTOD('  /  /    ') 
  RETU
ENDIF  
SELE A
USE BATCH_NO
INDE ON NAME1 TO B_NO
SELE A
USE 
SELE A
USE BATCH_NO INDE B_NO
sele a
GO TOP
COPY TO BTEMP FOR  (((MIX_DATE<=ENDATE .AND. MIX_DATE#CTOD('  /  /    ')) .AND. SUBSTR(BATCHNO,1,2)='ZD'.OR. SUBSTR(BATCHNO,1,2)='ZS') .AND. ((PACK_DATE=CTOD('  /  /    ') .OR. PACK_DATE>ENDATE))) .AND. COMPANY=VNAME 
SELE A
USE
SELE A
USE BTEMP
*SET FILT TO ((PACK_DATE=CTOD('  /  /    ') .OR. PACK_DATE>ENDATE))
GO TOP
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
*SET FILT TO (((MIX_DATE<=ENDATE .AND. MIX_DATE#CTOD('  /  /    ')) .AND. (SUBSTR(BATCHNO,1,2)='ZD'.or. SUBSTR(BATCHNO,1,2)='ZS') .AND. ((PACK_DATE=CTOD('  /  /    ') .OR. PACK_DATE>ENDATE)))) 
SET FILT TO (((MIX_DATE<=ENDATE .AND. MIX_DATE#CTOD('  /  /    ')) .AND. (COMPLETE=' ').AND.(SUBSTR(BATCHNO,1,2)='ZD'.or. SUBSTR(BATCHNO,1,2)='ZS') 
go top
SELE B
USE PACKQTY
DO PRINTOPT
LN=1
SR=1
@LN,1 SAY 'BATCHES MANUFACTURED BUT NOT PACKED AS ON '+'  '+LTRIM(DTOC(ENDATE))
LN=LN+1
EE=REPL('-',150)
@LN,1 SAY CHR(15)
@LN,1 SAY EE
LN=LN+1
@LN,1 SAY 'SR NO.'
@LN,9 SAY 'PRODUCT'
@LN,49 SAY 'BATCH NO'
@LN,59 SAY 'BATCH SIZE'
@LN,72 SAY 'MFG.DT'
@LN,85 SAY 'QTY. TO BE PACKED'
@LN,110 SAY 'REMARKS'
ln=ln+1
@ln,1 say ee
ln=ln+1
SELE A
DO WHILE .NOT. EOF()
SELE B
SET FILT TO BATCHNO=A->BATCHNO
GO TOP
VQTY=0
DO WHILE .NOT. EOF()
 VQTY=VQTY+B->PACKQTY
 SKIP
ENNDO
if (BSR_qty#0 .AND. (BSR_QTY#PACK_QTY)) .OR. BSR_QTY=0
   @LN,1 SAY SR PICT '99'
   @LN,7 SAY NAME1
   @LN,18 SAY NAME2
   @LN,51 SAY BATCHNO
   @LN,59 SAY LTRIM(STR(BAT_SIZE))+' '+'LTS'
   @LN,72 SAY MFGDATE
   if (BSR_qty=0 ) .OR. (BSR_qty#0  .AND. (PACK_DATE>ENDATE))
       @LN,85  SAY BSR_QTY
    endif
    if ((BSR_qty#0 .AND. (BSR_QTY#PACK_QTY)) .OR. (BSR_QTY=PACK_QTY)) .AND. PACK_DATE<=ENDATE
       @ln,85 say PACK_QTY
    endif    
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
      @LN,110 SAY 'REMARKS'
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
   **** bank statment for NO OF BATCHES UNPACKED AS ON TODAY
SELE A
GO TOP
BANK=' '
CLEA
@15,5 SAY '[B] FOR BANK STATMENT:-' GET BANK PICT '!'
READ
IF BANK='B'
    DO PRINTOPT
    LN=1
    SR=1
    @LN,1 SAY 'BATCHES MANUFACTURED BUT NOT PACKED AS ON '+'  '+LTRIM(DTOC(ENDATE))
    LN=LN+1
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
    SELE A
DO WHILE .NOT. EOF()
     if (BSR_qty#0 .AND. (BSR_QTY#PACK_QTY)) .OR. BSR_QTY=0
       @LN,1 SAY SR PICT '99'
       @LN,7 SAY NAME1
       @LN,18 SAY NAME2
       @LN,51 SAY BATCHNO
       @LN,59 SAY LTRIM(STR(BAT_SIZE))+' '+'LTS'
       @LN,72 SAY MFGDATE
        SELE A
        @LN,85  SAY A->BAT_QTY
        AMOUNT=A->CONVRATE*A->BAT_QTY
        @LN,110 SAY A->CONVRATE PICT '99.99'
        @LN,120 SAY AMOUNT PICT '9999999.99'
        VAMOUNT=VAMOUNT+AMOUNT
        LN=LN+2
        SR=SR+1
  endif    
   SELE A
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
   LN=LN+1
   @LN,1 SAY EE
   LN=LN+1
   @LN,120 SAY VAMOUNT PICT '99999999.99'
   @LN,1 SAY CHR(18)
   EJECT
   SET PRINT OFF
   SET DEVI TO SCREEN
   SET PRINTER TO
ENDIF
   !DEL B_NO.*