**** BPR ALL PAGES FOR PIROX
IF VBNO=SPACE(6)
   RETU
ENDIF
IF VpS='Y'&& for not different sample
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
    PG1=RRM+3000 
    PG2=PG1/10
    PG3=PG2
    PG4=PG2
    PG5=PG2/10
    PG6=ROUND(PG1/1200,0)
    DO bprPI1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO bprPI2
    DO bprPI3
    DO bprPI4
    DO bprPI5
    DO bprPI6
    N=VAL(N)
   IF &VQT#0
      EXIT
   ENDIF  
    N=N+1    
 ENDDO
ENDIF
IF VpS#'Y' && for sample only
    QT4=((YIELD/100)*RM)
    @LN,1 SAY 'QTY FOR SAMPLE  ' 
    @LN,15 get QT4 PICT '9999999'
    read
    STORE 0 TO RRM
    DO PRINTOPT
    N=4
    N=LTRIM(STR(N))
    VQT=SPACE(3)
    VQT='QT'+N
    RRM=&VQT 

    PG1=RRM+1000 
    PG2=PG1/10
    PG3=PG2
    PG4=PG2
    PG5=PG2/10
    PG6=ROUND(PG1/1200,0)
    DO bprPI1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO bprPI2
    DO bprPI3
    DO bprPI4
    DO bprPI5
    DO bprPI6
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
     * USE BATCH_NO
      GO TOP
      LOCATE FOR BATCHNO=VBNO     
      REPL BPR WITH 'Y'
	  !CD\DBASE\BMR

