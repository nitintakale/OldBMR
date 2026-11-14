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
    PG1=RRM+3000 
    PG2=PG1/10
    PG3=PG2
    PG4=PG2
    PG5=PG2/10
    PG6=ROUND(PG1/1200,0)