** SINGLE PAGE BPR FOR EYE/EAR DROPS
IF SPAGE>1
      DO PRINTOPT
      VCDPA=SPACE(7)
      DO WHILE SPAGE<=EPAGE
            VCDPA='CDPA'+LTRIM(STR(SPAGE))
            DO &VCDPA
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
   *****
    DO CDPA1
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
   *****

****OLD CAL.N
    DO CDPA1
ENDIF
ENDIF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
RETU