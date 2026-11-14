**** BPR ALL PAGES FOR EYE EAR DROPS FFS
PUBLIC N
IF VBNO=SPACE(6)
   RETU
ENDIF
***********
IF VPS='Y'&& for not different sample
    STORE 0 TO RRM
  DO WHILE .T.
    DO PRINTOPT
    IF OPT=0
       CLOSE ALL
       RETU
    ENDIF   
    IF OPT=1
       CLEA
       @15,5 SAY '------  N O   S C R E E N  VIEW-----'
       WAIT
       LOOP
    ENDIF  
  EXIT
  ENDDO
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
   ****** 
    PG1=1.009*(RRM+RRM/VOUTCART) 
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    ****
    PG2=1.07*RRM
    PG2=PG2+50
    PG2=ROUND(PG2,-2)
    ******
    PG3=PG2
   *****
    PG4=PG2
   ****
   IF S_W_FILM="Y"
      PG5=(1.00)*(RRM/VOUTCART)+0.5
   ELSE
*      PG5=(1.07)*(RRM/VOUTCART)+0.5
 *   FOLLOWING CHANGE IS DONE AS SAID BY CHAVDEKER ON 29.12.2003
       PG5=(0.97)*(RRM/VOUTCART)+0.5
   ENDIF
    PG5=ROUND(PG5,-1)
    *****
    IF VAL(N)>3
      PG6=1.04*(RRM/VSHIP)+0.5
    ENDIF
    IF VAL(N)<=3
      PG6=1.00*(RRM/VSHIP)+0.5
    ENDIF
    PG6=ROUND(PG6,0)
   *****
    PG9=15
    DO FPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO FPA2
    DO FPA3
    DO FPA4
    DO FPA5
    DO FPA6
    N=VAL(N)
   IF &VQT#0
      EXIT
   ENDIF  
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
   ****** 
    PG1=1.07*(RRM+RRM/VOUTCART) 
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    ****
    PG2=1.07*RRM
    PG2=PG2+50
    PG2=ROUND(PG2,-2)
    ******
    PG3=PG2
   *****
    PG4=PG2
   ****
    PG5=(1.07)*(RRM/VOUTCART)+0.5
    PG5=ROUND(PG5,-1)
    *****
    PG6=1.09*(RRM/VSHIP)+0.5
    PG6=ROUND(PG6,0)
    PG9=1
   *****
    DO FPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO FPA2
    DO FPA3
    DO FPA4
    DO FPA5
    DO FPA6
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
      SELE C
      GO TOP
      LOCATE FOR BATCHNO=VBNO     
      REPL BPR WITH 'Y'
	  !CD\DBASE\BMR
