****TOTAL PACKED IN MONTH
vmon=space(3)
MMON=SPACE(2)
vname1=space(12)
vname2=space(30)
store SPACE(10) to vcode
EE=REPL('-',80)
mmdir=0
**************
close data
set proc to adihead
do adistart
clea
@15,1 say 'ENTER LAST FOUR DIGITS of YEAR  FOR  WHICH PACKED QTY IS TO BE COUNTED :' get MMdir pict '9999'
READ
@17,1 say 'ENTER 1 ST 3 LETTERS OF MONTH     :' get vmon pict '!!!'
read
IF VMON='JAN'
   MMON ='01'
ENDIF   
IF VMON='FEB'
   MMON ='02'
ENDIF   
IF VMON='MAR'
   MMON ='03'
ENDIF   
IF VMON='APR'
   MMON ='04'
ENDIF   
IF VMON='MAY'
   MMON ='05'
ENDIF   
IF VMON='JUN'
   MMON ='06'
ENDIF   
IF VMON='JUL'
   MMON ='07'
ENDIF   
IF VMON='AUG'
   MMON ='08'
ENDIF   
IF VMON='SEP'
   MMON ='09'
ENDIF   
IF VMON='OCT'
   MMON ='10'
ENDIF   
IF VMON='NOV'
   MMON ='11'
ENDIF   
IF VMON='DEC'
   MMON ='12'
ENDIF   
sele b
*use packqty ORDER PACK_QTY
use packqty ORDER PACKCD
COPY TO PACKTEMP FOR  SUBSTR(UPPER(CMON(PACK_DATE)),1,3)=VMON .AND. (SUBSTR(BATCHNO,1,2)#'BM') .AND. YEAR(PACK_DATE)=MMDIR 
SELE B
USE PACKTEMP
INDE ON ADITICODE TO PT
SELE B
SET INDE TO PT
TOTAL ON ADITICODE TO UTOT FIELDS PACK_QTY
USE
*******************
   USE UTOT EXCLU
   COPY TO UV1 STRU EXTE
   USE UV1 EXCLUSIVE
   APPE BLANK
   REPL FIELD_NAME WITH "DISC"
   REPL FIELD_TYPE WITH "C"
   REPL FIELD_LEN  WITH 60
   USE
   USE UTOT
   
   COPY TO UTEMP
   USE
   DELE FILE UTOT.DBF
   CREATE UTOT FROM UV1
   USE UTOT
   APPE FROM UTEMP
   USE
   DELE FILE UTEMP.DBF
   CLOSE DATA
****************
  SELE A
  USE PRODMAST ORDER ADIPROD
  SELE B
  USE UTOT 
  DO WHILE .NOT. EOF()
     SELE A
     SET FILT TO A->ADITICODE= B->ADITICODE
     GO TOP
     SELE B
     REPL B->DISC WITH  ALLTRIM(A->NAME1)+' '+ALLTRIM(A->NAME2)
     SELE B
     SKIP
  ENDDO
  CLOSE DATA
  USE UTOT
  INDE ON DISC TO PUTOT
  USE
  
   
********************
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
ln=1
@ln,1 say 'Total Quantity PACKED in month of'+'  '+ltrim(vmon)+' -  '+ltrim(STR(Mmdir))
ln=ln+1
@LN,1 SAY EE
LN=LN+1
@ln,5 say 'NAME'
@LN,70 SAY 'TOTAL QTY.PACKED.'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
SELE B
USE UTOT INDE PUTOT
GO TOP
DO WHILE .NOT. EOF()
   @LN,1 SAY B->DISC
   @LN,70 SAY PACK_QTY PICT '9,99,99,999'
   SKIP
   IF EOF()
       EXIT
   ENDIF
       LN=LN+2
       IF LN>62 
           EJECT
	       LN=1
           @ln,1 say 'Total Quantity PACKED in month of'+'  '+ltrim(vmon)+' -  '+ltrim(STR(Mmdir))
		   ln=ln+1
		   @LN,1 SAY EE
		   LN=LN+1
		   @ln,5 say 'NAME'
		   @LN,70 SAY 'TOTAL QTY.PACKED.'
		    LN=LN+1
		   @LN,1 SAY EE
		    LN=LN+1
		  ENDIF
       	 loop
  ENDDO
CLOSE DATA
DELE FILE PACKTEMP.DBF
DELE FILE PT.IDX
DELE FILE PUTOT.IDX
DELE FILE UTOT.DBF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO