****PAGE 1 COMMON MATTER
*-NEW PRG TO SEARCH COMPANY FROM MAINCODE.DBF
@0,1 say bsize pict '9999.99'
@0,9 say 'L'
LN=0
ln=ln+1
@LN,0 SAY CHR(27)+"E"
SELE I
USE MAINCODE INDE MAINCODE
SEEK VNAME
IF VNAME #'ADITI'
	@LN,1 SAY I->NAME
	@LN,40 SAY 'C/O ADITI PHARMACEUTICALS PVT.LTD.'
	LN=LN+1
	@LN,1 SAY I->CITY+' '+LTRIM(STR(I->PIN))
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
@LN,1 SAY 'PRODUCT      :'
@ln,15 say pname
@LN,55 SAY 'FORMULATION CODE :' +LTRIM(VFORMU_CODE) 
ln=ln+1
@ln,1 say '('+trim(gname)+')'
LN=LN+1
@LN,1 SAY 'BATCH NO.    :'
@LN,55 SAY 'VERSION            :' +LTRIM(VVERSION) 
@ln,15 say CHR(14)+vbno
@LN,1 SAY CHR(18)
LN=LN+1
@LN,1 SAY  'MFG. DATE    :'
@LN,55 SAY 'EXP. DATE          :'
@LN,15 SAY CHR(14)+SUBSTR(VMFGDATE,1,4)+SUBSTR(VMFGDATE,7,2)
@LN,46 SAY SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
@LN,1 SAY CHR(18)
LN=LN+1
 @LN,1 SAY 'BATCH COMMENCED ON  :_________'
 @LN,55 SAY 'BATCH COMPLETED ON :________'
 LN=LN+1
 @LN,1 SAY 'A.R. NO      : _______'
 @LN,55 SAY 'MANUAL NO       :'+LTRIM(VMMFNO)
 LN=LN+1
 @LN,1  SAY 'SERIAL NO    : _______'
 @LN,55 SAY 'AUTHORISED BY      :'
ln=ln+1
@LN,1 SAY 'BATCH SIZE   :'
@ln,15 say bsize pict '9999'
@ln,20 say 'LTRS /'
@ln,27 say rm pict '9,99,999'
@LN,37 SAY SPACK
LN=LN+1
@LN,1 SAY EE
LN=LN+1
@LN,1 SAY ' STAGE A : MANUFACTURING WORK ORDER-DISPENSING OF RAW MATERIALS'
@LN,1 SAY CHR(27)+'F'
ln=ln+1
@ln,0 say ' '
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,52 say 'Actual quantity'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,52 say '--------------------'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@LN,1 SAY 'Code'
@LN,7 SAY 'Name of ingredients'
@ln,30 say 'UOM'
@ln,36 say 'Std.'
@ln,43 say 'AR number'
@ln,52 say 'Gross'
@ln,58 say 'Tare'
@ln,64 say 'Net'
@ln,72 say 'Wgd'
@ln,76 say 'Ckd'
ln=ln+1
@ln,1 say 'No.'
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,36 say 'Qty.'
@ln,42 say '|'
@ln,51 say '|'
@ln,53 say 'Wt.'
@ln,57 say '|'
@ln,59 say 'Wt.'
@ln,63 say '|'
@ln,65 say 'Wt.'
@ln,71 say '|'
@ln,72 say 'By'
@ln,74 say '|'
@ln,76 say 'By'
@ln,80 say '|'
ln=ln+1
@LN,1 SAY EE
LN=LN+1