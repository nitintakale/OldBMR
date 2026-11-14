***** BPR PAGE 1 COMMON MATTER
   @0,1 say bsize pict '9999.99'
   @0,9 say 'L'
   @0,20 SAY 'SRNO :'
   @0,32 SAY VBPRSR PICT '!!!!!!!'
   LN=0
IF SA_EX="E"
   LN=LN+1
   SELE 22
   USE CBBPR
   SET FILT TO BPRSRNO=VBPRSR
   GO TOP
   @LN,2 SAY 'ORDER NO: '
   COL=11
   DO WHILE .NOT. EOF()
      @LN,COL SAY SUBSTR(CBBPR->CIPORDNO,1,15)
      COL=COL+18
      SKIP
   IF EOF()
      EXIT
   ELSE   
   IF COL>67
      LN=LN+1
      COL=11
      LOOP
  ENDIF   
  ENDIF
ENDDO
ENDIF
   ln=ln+1
   @LN,0 SAY CHR(27)+"E"
   SELE I
   USE MAINCODE ORDER MAINCODE
   SEEK VNAME
   IF VNAME #'ADITI'
   	@LN,1 SAY I->NAME
	@LN,40 SAY 'C/O ADITI PHARMACEUTICALS PVT.LTD.'
	LN=LN+1
	@LN,1 SAY ALLTRIM(I->CITY)+' '+LTRIM(STR(I->PIN))
	@LN,45 SAY 'SOLAPUR- 413006'
  ENDIF
  IF VNAME='ADITI'
	@LN,40 SAY 'ADITI PHARMACEUTICALS PVT.LTD.'
	LN=LN+1
	@LN,45 SAY 'SOLAPUR- 413006'
ENDIF
SELE I
USE
	LN=LN+1
	@LN,1 SAY EE
    LN=LN+1
@LN,1 SAY 'PRODUCT   :'
IF LEN(ALLTRIM(PNAME))>34
   @ln,13 say CHR(15)+LTRIM(pname)+CHR(18)
ELSE
   @ln,13 say LTRIM(pname)
ENDIF
@LN,50 SAY 'AUTHORISED BY    :'
ln=ln+1
@ln,2 say CHR(15)+'('+ TRIM(VBPRGENNM) +')'+CHR(18)
*@ln,2 say CHR(15)+'('+ TRIM(GNAME) +')'+CHR(18)
@LN,2 SAY ' '
@LN,50 SAY 'DATE             :'
LN=LN+1
@LN,1 SAY 'PACKCODE  :'
@ln,13 say LTRIM(VBPRCODE)
@LN,50 SAY 'FORMULATION CODE :' 
@LN,68 SAY VFORMU_CODE PICT '!!!!!!!!!!!!' 
LN=LN+1
@LN,1 SAY 'BATCH NO. :'
@ln,32 say '['+EPS+']'
@LN,50 SAY 'VERSION          :' 
@LN,70 SAY VVERSION PICT '!!!!!!!!!!' 
@ln,14 say CHR(14)+vbno+CHR(18)
LN=LN+1
@LN,1 SAY  'MFG. DATE :'
@LN,50 SAY 'EXP. DATE        :'
@LN,14 SAY CHR(14)+VMFGDATE1
@LN,41 SAY VEXPDATE1
@LN,1 SAY CHR(18)
LN=LN+1
@LN,1 SAY 'BATCH SIZE :'
@ln,13 say bsize pict '9999.99'
@ln,21 say 'LTRS /'
@ln,28 say VBAT_QTY PICT '9999999'
@LN,38 SAY vpack
rrm=vqty
@LN,50 SAY 'UNIT PACK:'
@LN,60 SAY CHR(15)+VUNITPACK+CHR(18)
LN=LN+1
@ln,0 say chr(27)+'E'
@LN,1 SAY EE1
ln=ln+1
@LN,1 SAY ' SECTION I : PACKAGING WORKS ORDER-DISPENSING OF PACKING MATERIALS'
LN=LN+1
@LN,1 SAY EE1
@ln,0 say chr(27)+'F'
LN=LN+1
@ln,7 say '³'
@ln,33 say '³'
@ln,41 say '³'
@ln,50 say '³'
@ln,57 say '³'
@ln,64 say '³'
@ln,72 say '³'
@LN,34 SAY 'STD.'
@LN,44 SAY 'AR'
@LN,51 SAY 'ISSUED'
@LN,58 SAY 'EXTRA'
@LN,65 SAY 'EXCESS'
@LN,73 SAY 'NET'
LN=LN+1
@ln,7 say '³'
@ln,33 say '³'
@ln,41 say '³'
@ln,50 say '³'
@ln,57 say '³'
@ln,64 say '³'
@ln,72 say '³'
@LN,2 SAY 'CODE'
@LN,8 SAY 'PACKGING MATERIALS'
@LN,34 SAY 'QTY.'
@LN,42 SAY 'NUMBER'
@LN,51 SAY 'QTY'
@LN,58 SAY 'ISSUES'
@LN,65 SAY 'RETURNS'
@LN,73 SAY 'ISSUED'
LN=LN+1
@ln,7 say '³'
@ln,33 say '³'
@ln,41 say '³'
@ln,50 say '³'
@ln,57 say '³'
@ln,64 say '³'
@ln,72 say '³'
@LN,2 SAY 'NO'
@LN,58 SAY 'QTY'
@LN,65 SAY 'QTY'
@LN,73 SAY 'QTY'
LN=LN+1
@LN,1 SAY EE1
@ln,7 say '³'
@ln,33 say '³'
@ln,41 say '³'
@ln,50 say '³'
@ln,57 say '³'
@ln,64 say '³'
@ln,72 say '³'

LN=LN+1
@ln,7 say '³'
@ln,33 say '³'
@ln,41 say '³'
@ln,50 say '³'
@ln,57 say '³'
@ln,64 say '³'
@ln,72 say '³'