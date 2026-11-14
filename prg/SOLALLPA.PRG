**** BPR ALL PAGES FOR RESP.SOLN
IF VBNO=SPACE(6)
   RETU
ENDIF
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
     @15,1 SAY 'NO PRG FOR SCREEN'
     WAIT
     RETU
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
********
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    PG1=1.119*(RRM+RRM/VOUTCART) 
IF SA_EX="E"
    PG1=(PG1/600)+0.5
ELSE
    PG1=(PG1/650)+0.5
ENDIF
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    PG2=RRM+1000
    PG3=(1.06*RRM)+50
    PG3=ROUND(PG3,-2)
    PG4=PG3
    PG5=ROUND((PG1/31),-1)
    IF SA_EX="E"
       PG6=(PG1/VSHIP)
     ELSE
         PG6=(PG2/VSHIP)
     ENDIF
     
*    PG6=ROUND(PG6,-1)
    DO SPA1
    DO SPA2
    DO SPA3
    DO SPA4
    DO SPA5
    DO SPA6
    N=VAL(N)
   IF &VQT#0
      EXIT
   ENDIF  
    N=N+1    
 ENDDO
ENDIF
IF VPS#'Y' && for sample only
    STORE 0 TO RRM
    DO PRINTOPT
    N=4
    N=LTRIM(STR(N))
    VQT=SPACE(3)
    VQT='QT'+N
    RRM=&VQT 
   PG1=1.119*(RRM+RRM/VOUTCART) 
IF SA_EX="E"
    PG1=(PG1/600)+0.5
ELSE
    PG1=(PG1/650)+0.5
ENDIF
    PG1=ROUND(PG1,0)
    PG1=PG1*500
    PG2=RRM+1000
    PG3=(1.06*RRM)+50
    PG3=ROUND(PG3,-2)
    PG4=PG3
    PG5=ROUND((PG1/31),-1)
    PG6=(PG2/VSHIP)
    DO SPA1
    IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
    DO SPA2
    DO SPA3
    DO SPA4
    DO SPA5
    DO SPA6
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
*      USE BATCH_NO
      GO TOP
      LOCATE FOR BATCHNO=VBNO     
      REPL BPR WITH 'Y'
   	  !CD\DBASE\BMR