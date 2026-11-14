**** BPR ALL PAGES FOR EYE EAR DROPS
IF VBNO=SPACE(6)
   RETU
ENDIF
IF VPS='Y'&& for not different sample
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
    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG2=1.03*RRM
    PG3=(1.01*RRM)+50
    PG5=(1.01)*(RRM/VOUTCART)+0.5
    PG6=1.02*(RRM/VSHIP)+0.5
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    PG2=PG2+50
    PG2=ROUND(PG2,-2)
    PG3=ROUND(PG3,-2)
    PG4=PG3
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    DO PPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO PPA2
    DO PPA3
    DO PPA4
    DO PPA5
    DO PPA6
    N=VAL(N)
    N=N+1    
 ENDDO
ENDIF
IF VPS#'Y' && for sample only
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
    PG1=1.04*(RRM+RRM/20)
    PG2=1.03*RRM
    PG3=(1.01*RRM)+50
    PG5=(1.01)*(RRM/VOUTCART)+0.5
    PG6=(RRM/VSHIP)+2.5
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
	 PG1=PG1*500
    PG2=PG2+50
    PG2=ROUND(PG2,-2)
    PG3=ROUND(PG3,-2)
    PG4=PG3
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    DO PPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO PPA2
    DO PPA3
    DO PPA4
    DO PPA5
    DO PPA6
ENDIF
      eject
      SET PRINT OFF
      SET DEVI TO SCREEN
      SET PRINTER TO
      DO PROC_3
      !CD\DBASE\BMR\&VDIR
      SELE C
*      USE BATCH_NO
      GO TOP
      LOCATE FOR BATCHNO=VBNO     
      REPL COMPANY WITH VNAME
      REPL BPR WITH 'Y'
	  !CD..

