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
    PG1=RM
    PG2=PG1/10
    PG3=PG2
    PG4=PG2
    PG5=PG1/100
*   PG6=PG5+7
    PG6=PG1/VSHIP