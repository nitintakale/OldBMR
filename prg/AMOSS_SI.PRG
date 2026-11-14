** SINGLE PAGE BPR FOR AZEE
IF SPAGE>1
      DO PRINTOPT
      VAMOPA=SPACE(5)
      DO WHILE SPAGE<=EPAGE
            VAMOPA='AMOPA'+LTRIM(STR(SPAGE))
            DO &VAMOPA
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
    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG2=1.18*RRM
    PG4=(1.06*RRM)+50
    PG5=(1.08)*(RRM/VOUTCART)+0.5
    PG6=1.2*(RRM/VSHIP)+0.5
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*425
    PG2=PG2+50
    PG2=ROUND(PG2,-2)
    PG3=PG2
    PG4=ROUND(PG4,-2)
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    PG7=PG2-100
    DO AMOPA1
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
    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG2=1.18*RRM
    PG4=(1.06*RRM)+50
    PG5=(1.08)*(RRM/VOUTCART)+0.5
    PG6=1.2*(RRM/VSHIP)+0.5
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*425
    PG2=PG2+50
    PG2=ROUND(PG2,-2)
    PG3=PG2
    PG4=ROUND(PG4,-2)
    PG5=ROUND(PG5,-1)
    PG6=ROUND(PG6,0)
    PG7=PG2-100
    DO AMOPA1
ENDIF
ENDIF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
RETU