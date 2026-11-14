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
   IF VAL(N)<=3
       SA_EX='E'
    ENDIF
    IF VAL(N)=4 .OR. VAL(N)=5
       SA_EX='S'
    ENDIF
IF SA_EX="E"
    PG1=RRM+1000
ELSE
    PG1=1.119*(RRM+RRM/VOUTCART) 
    PG1=(PG1/650)+0.5
    PG1=ROUND(PG1,0)
    PG1=PG1*500
ENDIF
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
     