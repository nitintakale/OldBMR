****TOTAL MANUFACTURED IN MONTH
close data
clea
set proc to adihead
vmon=space(3)
vyear=0
SET COLOR TO W+/B,W+/R
@15,1 say 'enter 1 ST 3 CHAR OF MONTH:' get vmon pict '!!!' VALID VMON $('JAN#FEB#MAR#APR#MAY#JUN#JUL#AUG#SEP#OCT#NOV#DEC')
@17,1 say 'enter 4 digits of YEAR    :' get vYEAR pict '9999' VALID VYEAR>0
Read
sele a
use batch_no order bN12
set filt to SUBSTR(MFGDATE,1,3)=vmon .AND. SUBSTR(LTRIM(MFGDATE),5,4)=ALLTRIM(STR(VYEAR)) .AND. SUBSTR(BATCHNO,1,2)#'BM'
go top
Vname1=space(12)
vname2=space(30)
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
EE=REPL('-',80)
ln=1
@ln,1 say 'Total Quantity manufactured in month of'+'  '+ltrim(vmon)+' '+LTRIM(STR(VYEAR))
ln=ln+1
@LN,1 SAY EE
LN=LN+1
@ln,5 say 'NAME'
@LN,70 SAY 'TOTAL QTY.MFGD.'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
SELE A
*SET ORDER TO BN12
do while .not. eof()
   vname1=a->name1
   vname2=a->name2
   vqty=0
   do while a->name1=vname1 .and. a->name2=vname2
      vqty=vqty+bat_qty
      skip
      if eof()
         exit
      endif
      if a->name1=vname1 .and. a->name2=vname2
        loop
      else
         exit
      endif
    enddo
  @ln,1 say vname1
  @ln,16 say vname2
  @LN,70 SAY VQTY PICT '9,99,99,999'
  SELE A
  IF EOF()
      EXIT
  ENDIF
  LN=LN+2
  IF LN>62 
    EJECT
    LN=1
    @ln,1 say 'Total Quantity manufactured in month of'+'  '+ltrim(vmon)+' '+LTRIM(STR(VYEAR))
    ln=ln+1
    @LN,1 SAY EE
    LN=LN+1
    @ln,5 say 'NAME'
    @LN,50 SAY 'TOTAL QUANTITY'
    LN=LN+1
    @LN,1 SAY EE
    LN=LN+1
  ENDIF
     VNAME1=A->NAME1
     VNAME2=A->NAME2
ENDDO                        
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
close data
