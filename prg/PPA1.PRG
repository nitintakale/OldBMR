***BPR PAGE1 GLASS VIALS
NUM=1
DO WHILE NUM<=1
	SET PROC TO ADIHEAD
	do adistart
	SELE B
	USE PRODMAST
	LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1
	SELE A
	USE PKG_MST
	@0,0 say chr(27)+'E'
	LN=0
	IF NUM=1
		@LN,60 SAY 'PAGE : 1 OF 6'
	ENDIF
	IF NUM=2 .OR. NUM=3
		@LN,50 SAY 'PAGE : 1A OF 6 (STORE COPY)'
	ENDIF
	DO PHEADP1
*   @ln,40 say 'VIALS'
   ln=11
@ln,0 say chr(27)+'E'
@LN,1 SAY EE1
ln=ln+1
@LN,1 SAY ' SECTION I : PACKAGING WORK ORDER-DISPENSING OF PACKING MATERIALS'
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
*@LN,80 say '|'
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
*@LN,80 say '|'
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
*@LN,80 say '|'
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
*@LN,80 say '|'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
if val(n)=4
   SELE A
   GO TOP
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='LABEL' .AND. CATEGORY='P'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
       @ln,1 say A->CODE
       @LN,26 SAY 'P.S.'
   ENDIF
endif
if val(n)=5
   SELE A
   GO TOP
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='LABEL' .AND. CATEGORY='S'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
       @ln,1 say A->CODE
   ENDIF
endif
@ln,8 say 'Printed labels'
@ln,33 say pg1 pict '9,99,999'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
if val(n)=4
    SELE A
    go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='INNERCART' .AND. CATEGORY='P'
  IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
    @ln,1 say A->CODE
    @LN,29 SAY ' P.S.'
  ENDIF
endif
if val(n)=5
    SELE A
    go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='INNERCART' .AND. CATEGORY='S'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
    @ln,1 say A->CODE
   ENDIF
endif
@ln,8 say 'Inner printed cartons'
@ln,33 say pg2 pict '9,99,999'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
IF ENC='Y'
if val(n)=4.or. val(n)=5
   SELE A
   go top
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='ENCLOSURE'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
       @ln,1 say A->CODE
   ENDIF
endif
@ln,8 say 'Enclosures'
@ln,33 say pg3 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
ENDIF
*****
if  val(n)=4 .OR. VAL(N)=5
   SELE A
   go top
   LOCATE FOR  STATUS='Y' .AND. ITEM='PLASDROP' 
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
       @ln,1 say A->CODE
   ENDIF
endif
@ln,8 say 'Plastic Dropper sterilised'
@ln,33 say pg4 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
LN=LN+1

******
if val(n)=4.or. val(n)=5
   SELE A
   go top
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='OUTERCART'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
       @ln,1 say A->CODE
   ENDIF
endif
@ln,8 say 'Outer cartons'
@ln,33 say pg5 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1
if val(n)=4.or. val(n)=5
     SELE A
     go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='CORRUSHIP'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
    @ln,1 say A->CODE
   ENDIF
  @ln,8 say '5 Ply Corru.shippers '
endif 
IF VAL(N)<=3
   @ln,8 say '7 Ply Corru.shippers '
ENDIF
@ln,33 say pg6 pict '9,99,999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
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