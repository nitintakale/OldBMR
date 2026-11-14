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

    PG1=1.04*(RRM+RRM/VOUTCART) 
    PG1=(PG1/500)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*425
    PG2=pg1
    PG3=PG1
    PG4=PG1/4
    PG5=PG4
    PG6=PG5*3
    PG7=PG1/16
