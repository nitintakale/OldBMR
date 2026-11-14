**PRG FOR LOCATE BATCHNO FOR SINGLE PAGE
IF SPAGE>1
    DO PRINTOPT
    VsPA=SPACE(5)
DO WHILE SPAGE<=EPAGE
    VsPA='SPA'+LTRIM(STR(SPAGE))
    DO &VSPA
    SPAGE=SPAGE+1
    IF SPAGE>EPAGE
       EXIT
    ENDIF
ENDDO	
ENDIF
IF SPAGE=1
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
    N=VAL(N)
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
    DO SPA1
ENDIF
ENDIF
EJECT
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
RETU