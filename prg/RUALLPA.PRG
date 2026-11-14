**** BPR ALL PAGES FOR RESPULES
IF VBNO=SPACE(6)
  RETU
ENDIF
IF VPS='Y'&& for not different sample
    QT5=((YIELD/100)*RM)-(QT1+QT2+QT3+QT4)
    @LN,1 SAY 'QTY FOR SALE  ' 
    @LN,15 get QT5 PICT '9999999'
    READ
    STORE 0 TO RRM
    DO PRINTOPT
    N=1
DO WHILE N<=5
    N=LTRIM(STR(N))
    VQT=SPACE(3)
    VQT='QT'+N
    IF &VQT=0
	    N=VAL(N)
		 N=N+1
       LOOP
    ENDIF      				 
    IF &VQT#0
       RRM=&VQT 
    ENDIF	
 IF VAL(N)=1 .OR. VAL(N)=2 .OR. VAL(N)=3 .OR. VAL(N)=5
    VOUTCART=A->OUTCARTVAL
    VSHIP=A->SHIPPERVAL
    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG2=1.03*RRM
    PG3=0
    PG4=(1.01*RRM)+50
    PG5=(1.01)*(RRM/VOUTCART)+0.5
    PG6=1.02*(RRM/VSHIP)+0.5
    PG7=1.01*RRM
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    PG2=PG2+50
    PG2=ROUND(PG2,-2)/10
    PG4=ROUND(PG4,-2)/10
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    PG7=ROUND(PG7,-2)/10
ENDIF
 IF VAL(N)=4 
*    VOUTCART=50
*    VSHIP=1800
    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG2=1.03*RRM
    PG3=0
    PG4=(1.01*RRM)+50
    PG5=(1.01)*(RRM/VOUTCART)+0.5
    PG6=1.02*(RRM/VSHIP)+0.5
    PG7=1.01*RRM
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    PG2=PG2+50
    PG2=ROUND(PG2,-2)/5
    PG4=ROUND(PG4,-2)/5
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    PG7=ROUND(PG7,-2)/5
ENDIF
    DO RUPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO RUPA2
    DO RUPA3
    DO RUPA4
    DO RUPA5
    DO RUPA6
    N=VAL(N)
   IF &VQT#0
      EXIT
   ENDIF  
	N=N+1    
 ENDDO
ENDIF
IF VSAMP='Y' && for sample only
    QT4=((YIELD/100)*RM)
    @LN,1 SAY 'QTY FOR SAMPLE  ' 
    @LN,15 GET QT4 PICT '9999999'
    READ
    STORE 0 TO RRM
    DO PRINTOPT
    N=4
    N=LTRIM(STR(N))
    VQT=SPACE(3)
    VQT='QT'+N
    RRM=&VQT 
    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG2=1.03*RRM
    PG3=0
    PG4=(1.01*RRM)+50
    PG5=(1.01)*(RRM/VOUTCART)+0.5
    PG6=1.02*(RRM/VSHIP)+0.5
    PG7=1.01*RRM
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    PG2=PG2+50
    PG2=ROUND(PG2,-2)/10
    PG4=ROUND(PG4,-2)/10
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    PG7=ROUND(PG7,-2)/10
    DO RUPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO RUPA2
    DO RUPA3
    DO RUPA4
    DO RUPA5
    DO RUPA6
    DO RUPA7
ENDIF
      IF N>5
      N=5
      ENDIF
    eject
	SET PRINT OFF
    SET DEVI TO SCREEN
    SET PRINTER TO
      DO PROC_3
      !CD\DBASE\BMR\&VDIR
      SELE A
      USE BATCH_NO
      GO TOP
      LOCATE FOR BATCHNO=VBNO     
      REPL BPR WITH 'Y'
		!CD..