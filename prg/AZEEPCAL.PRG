

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
    PG2=1.18*RRM
    PG4=(1.06*RRM)+50
    PG5=(1.08)*(RRM/VOUTCART)+0.5
    PG6=1.2*(RRM/VSHIP)+0.5
*    PG7=1.01*RRM
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