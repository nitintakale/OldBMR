** SINGLE PAGE BPR FOR EYE/EAR DROPS
IF SPAGE>1
      DO PRINTOPT
      Vbprrepa=SPACE(8)
      DO WHILE SPAGE<=EPAGE
            Vbprrepa='bprrepa'+LTRIM(STR(SPAGE))
            DO &Vbprrepa
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
    PG1=RRM 
    PG2=ROUND(RRM/100,-1)
    PG3=ROUND(RRM/VSHIP,0)
    DO bprrepa1
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
    PG1=RRM 
    PG2=ROUND(RRM/100,-1)
    PG3=ROUND(RRM/VSHIP,0)
    DO bprrePA1
ENDIF
ENDIF
EJECT
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
RETU