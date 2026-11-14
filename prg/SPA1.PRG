***BPR PAGE1 FOR RESP SOLN
SET PROC TO ADIHEAD
Do adistart
NUM=1
DO WHILE NUM<=1
	SELE B
    USE PRODMAST
    GO TOP
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1
	SELE A
	USE PKG_MST
	IF NUM=2 .or. num=3
		@0,50 SAY 'PAGE : 1A OF 6 (STORE COPY)'
	ENDIF
	IF NUM=1
		@0,50 SAY 'PAGE : 1 OF 6 '
	ENDIF
	DO PHEADP1
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
       @LN,26 SAY '(P.S.)'
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
@ln,34 say pg1 pict '99,999'
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
    @LN,29 SAY '(P.S)'
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
@ln,34 say pg2 pict '99,999'
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
if val(n)=4.or. val(n)=5
   SELE A
   go top
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='ENCLOSURE'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
       @ln,1 say A->CODE
   ENDIF
endif
@ln,8 say 'Enclosures'
@ln,34 say pg4 pict '99,999'
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
*ENDIF
if (val(n)=4 .or. val(n)=5) .or. ((val(n)>=1 .and. val(n)<=3) .and. unitpack1>1)
   SELE A
   go top
   LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='INNERCORU' 
   IF (DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE) .AND. VAL(N)>3
       @ln,1 say A->CODE
   ENDIF
@ln,8 say 'Inner corrugated boxes'
@ln,36 say pg5 pict '9999'
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
endif
ln=ln+1
if val(n)=4.or. val(n)=5
     SELE A
     go top
    LOCATE FOR NAME1=SNAME .AND. NAME2=SNAME1 .AND. STATUS='Y' .AND. ITEM='OUTERCORU'
   IF DATE()>=A->FR_DATE .AND. DATE()<=A->to_DATE
    @ln,1 say A->CODE
   ENDIF
   @ln,8 say '5 Ply corru. shippers'
endif 
if val(n)=1.or. val(n)=2.or. val(n)=3
   @ln,8 say '7 Ply corru. shippers'
endif 
@ln,37 say pg6 pict '999'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
*@LN,80 say '|'
ln=ln+1

ln=ln+1
@LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED & CHECKED BY____________'
LN=LN+1
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE1
ln=ln+1
IF NUM=1
   DO BPR_I
ENDIF	
NUM=NUM+1
IF NUM>3
   EXIT
ENDIF	
ENDDO
EJECT