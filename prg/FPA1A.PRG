***BPR PAGE1 FFS
NUM=1
DO WHILE NUM<=3
SET PROC TO ADIHEAD
do adistart
SELE A
USE PRODMAST
LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1
SELE B
USE PKG_MST
STORE 0 TO UNITPACK1,UNITPACK2
UNITPACK1=A->OUTCARTVAL
UNITPACK2=A->SHIPPERVAL/A->OUTCARTVAL
VUNITPACK=LTRIM(STR(UNITPACK2))+' X '+LTRIM(STR(UNITPACK1))+' VIALS'
@0,0 say chr(27)+'E'
@0,1 say bsize pict '9999'
@0,6 say 'litres'
LN=1
IF NUM=1
@LN,60 SAY 'PAGE : 1 OF 6'
ENDIF
IF NUM=2 .OR. NUM=3
@LN,50 SAY 'PAGE : 1A OF 6 (STORE COPY)'
ENDIF
ln=ln+1
@LN,1 SAY 'CIPLA LTD.'
@LN,45 SAY 'C/O ADITI PHARMACEUTICALS PVT.LTD.'
LN=LN+1
@LN,1 SAY 'MUMBAI CENTRAL-400008'
@LN,55 SAY 'SOLAPUR- 413006'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
@LN,1 SAY 'PRODUCT      :'
@ln,15 say pname
@LN,50 SAY 'FORMULATION CODE :' 
@LN,70 SAY A->FORMU_CODE PICT '!!!!!!!!!!' 
ln=ln+1
@ln,5 say gname
@LN,50 SAY 'VERSION          :' 
@LN,70 SAY A->VERSION PICT '!!!!!!!!!!' 
@LN,0 SAY CHR(27)+'F'
LN=LN+1
@LN,1 SAY 'BATCH NO.    :'
@ln,15 say vbno
@LN,50 SAY 'UNIT PACK    :'
@LN,65 SAY VUNITPACK
LN=LN+1
@LN,1 SAY 'MFG. DATE    :'
IF VAL(SUBSTR(VMFGDATE,5,4))<=2000
	@LN,15 SAY VMFGDATE
    @LN,50 SAY 'EXP. DATE    :'
    @LN,65 SAY VEXPDATE
ENDIF
IF VAL(SUBSTR(VMFGDATE,5,4))>2000
   @LN,15 SAY SUBSTR(VMFGDATE,1,4)+SUBSTR(VMFGDATE,7,2)
   @LN,50 SAY 'EXP. DATE    :'
   @LN,65 SAY SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
ENDIF
LN=LN+1
@LN,1 SAY 'BATCH SIZE   :'
@ln,15 say bsize pict '9999'
@ln,20 say 'LTRS /'
@ln,27 say rm pict '99,999'
@LN,35 SAY 'NOS.'
@LN,50 SAY 'AUTHORISED BY:'
LN=LN+1
@LN,50 SAY 'DATE         :'
*@LN,65 SAY DATE()
ln=ln+1
@ln,0 say chr(27)+'E'
@LN,1 SAY EE1
ln=ln+1
@LN,1 SAY ' SECTION I : PACKAGING WORKS ORDER-DISPENSING OF PACKING MATERIALS'
LN=LN+1
@LN,1 SAY EE1
@ln,0 say chr(27)+'F'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,69 say '|'
@ln,80 say '|'
@LN,34 SAY 'STD.'
@LN,44 SAY 'AR'
@LN,51 SAY 'ISSUED'
@LN,58 SAY 'EXTRA'
@LN,65 SAY 'EXCESS'
@LN,73 SAY 'NET'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@LN,2 SAY 'CODE'
@LN,8 SAY 'PACKGING MATERIALS'
@LN,34 SAY 'QTY.IN'
@LN,42 SAY 'NUMBER'
@LN,51 SAY 'QTY'
@LN,58 SAY 'ISSUES'
@LN,65 SAY 'RETURNS'
@LN,73 SAY 'ISSUED'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@LN,2 SAY 'NO'
@LN,34 SAY 'NUMBERS'
@LN,58 SAY 'QTY'
@LN,65 SAY 'QTY'
@LN,73 SAY 'QTY'
LN=LN+1
@LN,1 SAY EE1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
if val(n)=4
   SELE B
   GO TOP
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='LABEL' .AND. CATEGORY='P'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
       @ln,1 say B->CODE
       @LN,26 SAY 'P.S.'
   ENDIF
endif
if val(n)=5
   SELE B
   GO TOP
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='LABEL' .AND. CATEGORY='S'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
       @ln,1 say B->CODE
   ENDIF
endif
@ln,8 say 'Printed labels'
@ln,32 say pg1 pict '9,99,999'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
if val(n)=4
    sele b
    go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='INNERCART' .AND. CATEGORY='P'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
    @ln,1 say B->CODE
    @LN,29 SAY ' P.S.'
  ENDIF
endif
if val(n)=5
    sele b
    go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='INNERCART' .AND. CATEGORY='S'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
    @ln,1 say B->CODE
   ENDIF
endif
@ln,8 say 'Inner printed cartons'
@ln,32 say pg2 pict '9,99,999'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
if  val(n)=4 .OR. VAL(N)=5
   sele b
   go top
   LOCATE FOR  NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='POLYBAG' 
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
       @ln,1 say B->CODE
   ENDIF
endif
@ln,8 say 'Plastic caps sterilised-'
@ln,32 say pg3 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,8 say '  '
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
LN=LN+1
IF ENC='Y'
if val(n)=4.or. val(n)=5
   sele b
   go top
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='ENCLOSURE'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
       @ln,1 say B->CODE
   ENDIF
	@ln,8 say 'Enclosures'
	@ln,33 say pg4 pict '9,99,999'
	@ln,7 say '|'
	@ln,33 say '|'
	@ln,41 say '|'
	@ln,50 say '|'
	@ln,57 say '|'
	@ln,64 say '|'
	@ln,72 say '|'
	@ln,80 say '|'
	ln=ln+1
	@ln,1 say ee1
	@ln,7 say '|'
	@ln,33 say '|'
	@ln,41 say '|'
	@ln,50 say '|'
	@ln,57 say '|'
	@ln,64 say '|'
	@ln,72 say '|'
	@ln,80 say '|'
	ln=ln+1
endif
ENDIF
IF VAL(N)=1 .OR. VAL(N)=2 .OR. VAL(N)=3
	@ln,8 say 'Enclosures'
	@ln,33 say pg4 pict '9,99,999'
	@ln,7 say '|'
	@ln,33 say '|'
	@ln,41 say '|'
	@ln,50 say '|'
	@ln,57 say '|'
	@ln,64 say '|'
	@ln,72 say '|'
	@ln,80 say '|'
	ln=ln+1
	@ln,1 say ee1
	@ln,7 say '|'
	@ln,33 say '|'
	@ln,41 say '|'
	@ln,50 say '|'
	@ln,57 say '|'
	@ln,64 say '|'
	@ln,72 say '|'
	@ln,80 say '|'
	ln=ln+1
ENDIF
if val(n)=4 .or. val(n)=5
   sele b
   go top
   LOCATE FOR  NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='OUTERCART'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
       @ln,1 say B->CODE
   ENDIF
endif
@ln,8 say 'Outer cartons'
@ln,32 say pg5 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
if val(n)=4.or. val(n)=5
     sele b
     go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='CORRUSHIP'
   IF DATE()>=b->FR_DATE .AND. DATE()<=b->to_DATE
    @ln,1 say B->CODE
   ENDIF
   @ln,8 say '5 Ply corru. shippers'
endif 
if val(n)=1.or. val(n)=2.or. val(n)=3
   @ln,8 say '7 Ply corru. shippers'
endif 
@ln,32 say pg6 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED & CHECKED BY____________'
LN=LN+1
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE1
LN=LN+1
IF NUM=1
   DO BPR_I
ENDIF	
NUM=NUM+1
IF NUM>3
   EXIT
ENDIF	
ENDDO
