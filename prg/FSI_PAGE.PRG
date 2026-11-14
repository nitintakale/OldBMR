** SINGLE PAGE BPR FOR EYE/EAR DROPS

IF SPAGE>1
*      N=VAL(N)
      DO PRINTOPT
      VFPA=SPACE(6)
      DO WHILE SPAGE<=EPAGE
            VFPA='FPA'+LTRIM(STR(SPAGE))
            DO &VFPA
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
   *****
    DO FPA1
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
ENDIF
ENDIF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
RETU