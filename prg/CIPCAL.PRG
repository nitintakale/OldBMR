     N=1
DO WHILE N<=5
    N=LTRIM(STR(N))
    VQT=SPACE(3)
    VQT='QT'+N
    IF &VQT#0
       RRM=&VQT 
       EXIT
    ENDIF	
    IF &VQT=0
	    N=VAL(N)
	    N=N+1
       LOOP
    ENDIF      				 
ENDDO
     PG1=1.009*(RRM+RRM/VOUTCART) 
*    PG1=(PG1/500)-5
*    PG1=ROUND(PG1,-1)
     PG1=(PG1/500)+0.5
     PG1=ROUND(PG1,0)
     PG1=PG1*500
     PG2=PG1
     PG3=PG1
     PG4=PG1
   IF S_W_FILM="Y"
      PG5=(1.00)*(RRM/VOUTCART)+0.5
   ELSE
*      PG5=(1.07)*(RRM/VOUTCART)+0.5
 *   FOLLOWING CHANGE IS DONE AS SAID BY CHAVDEKER ON 29.12.2003
       PG5=(0.97)*(RRM/VOUTCART)+0.5
   ENDIF
    PG5=ROUND(PG5,-1)
    PG6=PG1/VSHIP
    PG6=ROUND(PG6,0)
    PG9=50


