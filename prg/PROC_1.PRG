*****to display on all page at top from page 2 to 13 for bmr/BPR
@0,1 say bsize pict '9999.99'
@0,10 say 'L'
IF MP="P"
   @0,20 SAY 'BPR SRNO :'
   @0,32 SAY VBPRSR PICT '!!!!!!!'
ENDIF
LN=1
ln=ln+1
@LN,1 SAY CHR(27)+'E'
SELE I
USE MAINCODE order MAINCODE
SEEK VNAME
IF VNAME #'ADITI'
	@LN,1 SAY I->NAME
	@LN,40 SAY 'C/O ADITI PHARMACEUTICALS PVT.LTD.'
	LN=LN+1
	@LN,1 SAY I->CITY+' '+LTRIM(STR(I->PIN))
	@LN,50 SAY 'SOLAPUR- 413006'
ENDIF
IF VNAME='ADITI'
	@LN,40 SAY 'ADITI PHARMACEUTICALS PVT.LTD.'
	LN=LN+1
	@LN,50 SAY 'SOLAPUR- 413006'
ENDIF
SELE I
USE
ln=ln+1
@LN,1 SAY 'PRODUCT :'
IF LEN(ALLTRIM(PNAME))>34
   @ln,12 say CHR(15)+LTRIM(pname)+CHR(18)
ELSE
   @ln,12 say LTRIM(pname)
ENDIF
@LN,50 SAY 'BATCH NO.:'
@ln,63 SAY vbno PICT '!!!!!!'
IF MP='P' 
if SA_EX="E" 
   @ln,70 say '[Export]'
ENDIF
if SA_EX="P" 
   @ln,70 say '[P.S.]'
ENDIF
if SA_EX="S" 
   @ln,70 say '[SALE]'
   ENDIF
ENDIF
LN=LN+1
@LN,1 SAY EE
@LN,1 SAY CHR(27)+'F'
