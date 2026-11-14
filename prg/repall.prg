**** BPR ALL PAGES FOR aditi generic
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

    PG1=RRM 
    PG2=ROUND(RRM/100,-1)
    PG3=ROUND(RRM/VSHIP,0)
    DO bprrePA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO bprrePA2
    DO bprrePA3
    DO bprrePA4
    DO bprrePA5
    DO bprrePA6
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
    PG1=RRM 
    PG2=ROUND(RRM/100,-1)
    PG3=ROUND(RRM/VSHIP,0)
    DO bprre1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO bprrePA2
    DO bprrePA3
    DO bprrePA4
    DO bprrePA5
    DO bprrePA6
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