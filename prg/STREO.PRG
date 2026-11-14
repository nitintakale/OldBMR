**STREO 
    SET PROC TO ADIHEAD
    CLOSE DATABASES
    clea
    store space(8) to nopt,NOPT1
    STORE SPACE(8) TO VLEXP,VLMFG,VCEXP,VCMFG,VEXP,VMFG
    STORE SPACE(15) TO VCOMPANY
    STORE 0 TO NNOPT,NNOPT1
    STORE SPACE(2) TO NMMON,NEMON,VDIR
    STORE SPACE(3) TO MMON,EMON
    STORE SPACE(4) TO MYEAR,EYEAR,PMMON,PEMON
    STORE SPACE(12) TO VN1
    STORE SPACE(30) TO VN2
    @17,1 say 'enter last 2 digit of CURRENT YEAR :' get VDIR pict '!!'
     read
     CLEA
       SET PATH TO C:\DBASE\BMR\&vDIR
       SELE A
       USE PRODMAST
       SELE C
       USE EXP_DATE
       SELE B
       USE BATCH_NO
       LN=8
       STORE SPACE(6) TO VB1,VB2,VB3,VB4,VB5 
   DO WHILE .T.
       @LN,1 SAY 'ENTER BATCHNO:=' GET VB1
       READ
       IF VB1=SPACE(6)
          RETU
       ENDIF
      IF VB1#SPACE(6)
          SELE B
          SET FILT TO BATCHNO=VB1 
          GO TOP
          IF EOF()
             @22,1 SAY SPACE(70)
             @22,1 SAY 'BMR NOT FOUND'
             WAIT
             LOOP
          ENDIF     
          IF B->STREO='Y'
             @22,1 SAY SPACE(70)
            DO WHILE .T.
               @22,1 SAY 'ALREADY  SEND FOR STREO ..FOR DUPLICATE ENTER PASSWORD...' 
                @22,68 SAY ' '
                set console off
                ACCEPT '   ' TO STPASS
              IF STPASS#'ADITI'
                LOOP
             ELSE
                 EXIT
              ENDIF
          ENDDO       
        ENDIF
          VMFG=B->MFGDATE
          VEXP=B->EXPDATE
          VN1=B->NAME1
          VN2=B->NAME2
          REPL B->STREO WITH 'Y'
      ENDIF
       @2,1 SAY VN1+' '+VN2
          EXIT
     ENDDO
   SET CONSOLE ON
       N=2
       LN=LN+2
    DO WHILE N<=5
        N=LTRIM(STR(N))
 	   @LN,1 SAY '      BATCHNO:=' GET VB&N
       READ
       IF VB&N=SPACE(6)
         EXIT
       ENDIF
      IF VB&N#SPACE(6)
          SELE B
          SET FILT TO BATCHNO=VB&N 
          GO TOP
          IF B->STREO='Y'
             STPASS=SPACE(5)
             @22,1 SAY SPACE(70)
            DO WHILE .T.
            SET CONSOLE OFF

               @22,1 SAY 'ALREADY  SEND FOR STREO ..FOR DUPLICATE ENTER PASSWORD...' 
                @22,68 SAY ' '
                set console off
                ACCEPT '   ' TO STPASS
              IF STPASS#'ADITI'
                LOOP
             ELSE
                 EXIT
              ENDIF
          ENDDO       
        ENDIF
        SET CONSOLE ON
          IF B->MFGDATE # VMFG
             @22,1 SAY SPACE(70)
             @22,1 SAY 'MFG DATE DOES NOT TELLEY WITH 1ST MFG DATE'
             WAIT
             N=VAL(N)
             LOOP
          ENDIF
          IF B->NAME1#VN1 .AND. B->NAME2#VN2
             @22,1 SAY SPACE(70)
             @22,1 SAY 'ITEM NAME DIFFERS'
             WAIT
             N=VAL(N)
             LOOP
         ENDIF
        REPL B->STREO WITH 'Y'
      ENDIF
     N=VAL(N)
     N=N+1
     LN=LN+2
     IF N>5
         EXIT
      ENDIF   
    ENDDO
       CLEA
       @5,5 SAY 'PARTY NAME  :' GET VCOMPANY
       READ
       @7,5 SAY 'EXPIRY DATE :' GET VEXP
       READ
       MMON=SUBSTR(VMFG,1,3)
       EMON=SUBSTR(VEXP,1,3)
       PMMON=SUBSTR(VMFG,1,4)
       PEMON=SUBSTR(VEXP,1,4)
       MYEAR=SUBSTR(VMFG,5,4)
       EYEAR=SUBSTR(VEXP,5,4)
       SELE C
       GO TOP
       LOCATE FOR SUBSTR(C->CMONTH,1,3)=MMON
       NMMON=ST_MONTH
       SELE C
       GO TOP
       LOCATE FOR SUBSTR(CMONTH,1,3)=EMON
       NEMON=ST_MONTH
        SELE A
        GO TOP
        LOCATE FOR CODE=B->CODE
     	@0,38 say 'FOR LABEL'
  	   define window NAME from 1,35 to 9,48
		declare s1(5,1)
		s1(1,1) = "99/9999 "
		s1(2,1) = "99/99   "
		s1(3,1) = "Abc.9999"
		s1(4,1) = "Abc.99  "
		s1(5,1) = "QUIT    "
		activate window NAME
		@0,0 get NOPT from s1
        read valid lastkey() = 13
		deactivate window NAME
	    IF ltrim(NOPT)="QUIT"
          !cd\dbase\bmr
          retu
	    ENDIF
      IF ltrim(NOPT)="99/9999 "
          VLMFG=NMMON+'/'+MYEAR
          VLEXP=NEMON+'/'+EYEAR
          NNOPT=1
       ENDIF 
       IF ltrim(NOPT)="99/99   "
          VLMFG=NMMON+'/'+SUBSTR(MYEAR,3,2)
          VLEXP=NEMON+'/'+SUBSTR(EYEAR,3,2)
          NNOPT=2
       ENDIF 
       IF ltrim(NOPT)="Abc.9999"
          VLMFG=B->MFGDATE
          VLEXP=VEXP
          NNOPT=3
       ENDIF 
       IF ltrim(NOPT)="Abc.99  "
          VLMFG=PMMON+SUBSTR(MYEAR,3,2)
          VLEXP=PEMON+SUBSTR(EYEAR,3,2)
          NNOPT=4
       ENDIF 
        CLEA
    	@0,38 say 'FOR CARTON'
    	define window NAME1 from 1,35 to 9,48
		declare s2(5,1)
		s2(1,1) = "99/9999 "
		s2(2,1) = "99/99   "
		s2(3,1) = "Abc.9999"
		s2(4,1) = "Abc.99  "
		s2(5,1) = "QUIT    "
		activate window NAME1
		@0,0 get NOPT1 from s2
       
		read valid lastkey() = 13
		deactivate window NAME1
	    IF ltrim(NOPT1)="QUIT"
          !cd\dbase\bmr
          retu
	    ENDIF
       IF ltrim(NOPT1)="99/9999 "
          VCMFG=NMMON+'/'+MYEAR
          VCEXP=NEMON+'/'+EYEAR
          NNOPT1=1
       ENDIF 
       IF ltrim(NOPT1)="99/99   "
          VCMFG=NMMON+'/'+SUBSTR(MYEAR,3,2)
          VCEXP=NEMON+'/'+SUBSTR(EYEAR,3,2)
          NNOPT1=2
       ENDIF 
       IF ltrim(NOPT1)="Abc.9999"
          VCMFG=B->MFGDATE
          VCEXP=VEXP
          NNOPT1=3
       ENDIF 
       IF ltrim(NOPT1)="Abc.99  "
          VCMFG=PMMON+SUBSTR(MYEAR,3,2)
          VCEXP=PEMON+SUBSTR(EYEAR,3,2)
          NNOPT1=4
       ENDIF 
CLEA
DO PRINTOPT
LN=1	
@LN,10 SAY  'R E Q U I S I T I O N    F O R    S T E R E O S'          
LN=LN+3
@LN,30 SAY 'DATE' +' : '+DTOC(DATE())
LN=LN+1
@LN,30 SAY 'LOCATION : ADITI PHARMACEUTICALS (P) LTD.'
LN=LN+1
@LN,30 SAY '           SOLAPUR'
LN=LN+2
@LN,5 SAY 'TO :'+ LTRIM(VCOMPANY)
LN=LN+2
@LN,5 SAY 'PRODUCT      :'+ TRIM(VN1)+'  '+TRIM(VN2)
LN=LN+2
@LN,5 SAY 'BATCH NOS    :'+(VB1)+'   '+LTRIM(VB2)+'   '+LTRIM(VB3)+'   '+LTRIM(VB4)+'   '+LTRIM(VB5)
LN=LN+5
@LN,5 SAY 'OVER PRINTING DETAILS   :      LABEL               CARTON' 
LN=LN+2
@LN,5 SAY 'M.L.NO./ CODE NO.       :'
LN=LN+2
@LN,5 SAY 'MFG. DATE               :     ' +    LTRIM(VLMFG)+'             '+LTRIM(VCMFG)
LN=LN+2
@LN,5 SAY 'EXP. DATE               :     ' +    LTRIM(VLEXP)+'             '+LTRIM(VCEXP)
LN=LN+2
@LN,5 SAY 'PRICE                   :     ' +LTRIM(STR(A->MRP,6,2))+'              '+LTRIM(STR(A->MRP,6,2))              
LN=LN+3
@LN,5 SAY 'INITIATED BY: __________________ CHECKED BY:__________________'
LN=LN+2
@LN,5 SAY '             L.L. CHEMIST                   CIPLA Representative'
ln=ln+3
@ln,5 say 'PROOF CHECKED BY :______________________ DATE :______________'
LN=LN+3
@LN,5 SAY 'COUNTER CHECKED BY:_________________ DATE :_________________'
LN=LN+8
@LN,5 SAY 'LABEL CODE NO:_____________'
LN=LN+2
@LN,5 SAY 'CARTON CODE NO :____________'
LN=LN+3
@LN,5 SAY 'LABEL AND CARTON SPECIMAN'
LN=LN+2
@LN,5 SAY 'ATTACHED FOR SPACING'
	SET PRINT OFF
	SET PRINTER TO
	SET DEVI TO SCREEN