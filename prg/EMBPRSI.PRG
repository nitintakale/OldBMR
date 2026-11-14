IF SPAGE>1
      DO PRINTOPT
      VBPREM=SPACE(8)
      DO WHILE SPAGE<=EPAGE
            VBPREM='BPREM'+LTRIM(STR(SPAGE))
            DO &VBPREM
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
   ****** 
    PG1=RRM+1000 
    PG2=PG1/10
    PG3=PG2
    PG4=PG2
    PG5=PG2/10
    PG6=ROUND(PG1/1200,0)
    DO BPREM1
    N=VAL(N)
    N=N+1    
 ENDDO
ENDIF
IF VPS#'Y' && for sample only
    QT4=(RM)
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
    PG1=RRM+1000 
    PG2=PG1/10
    PG3=PG2
    PG4=PG2
    PG5=PG2/10
    PG6=ROUND(PG1/1200,0)
    DO BPREM1
ENDIF
ENDIF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
RETU