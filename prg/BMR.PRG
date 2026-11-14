********** COMMON ENTRY FOR ALL
CLOSE DATA
set proc to adihead
STOR SPACE(1) TO BCH,BYE
COMPCHAR=SPACE(3)
@0,0 CLEA TO 24,79
SET COLOR TO R+/BR
@0,0 to 24,79 double
@1,30 say 'B .M. R. entry'
SET COLOR TO W+/B,W+/R
ln=4
DO WHILE .T.
   conbat=' '
	@ln,1 say 'Batch Size (in Lits):' get bsize pict '9999.99' VALID BSIZE > 0
	read
	IF BSIZE=vsqty1 .OR. BSIZE=vsqty2 .OR. BSIZE=vsqty3
		 conbat='Y'
         EXIT
	ELSE
	   BATPASS=SPACE(5)
       SET COLOR TO W+/G
	   @22,2  SAY 'ENTERED BATCHSIZE IS NOT STD BATCHSIZE..ENTER PASSWORD TO CONFIRM' 
       @22,67 SAY ' '
       SET COLOR TO W+/B,R+/B
       set console off
       ACCEPT '         ' TO BATPASS
       SET CONSOLE ON
      IF LASTKEY()=27 .OR. BATPASS=SPACE(5) .OR. LEN(BATPASS)=0
    	  CLOSE DATABASES
          VCONSIZE='F'
          RETU           	      
      ENDIF  
*-------GET PASSWORD FROM PASS FILE
     IF BATPASS='BMRAD'
       @22,2 SAY SPACE(77)
       @23,2 SAY SPACE(77)
       SET COLOR TO W+/GR,W+/G
       NEWBAT=' '
	   @23,2  SAY 'NEW BATCHSIZE WILL BE REPLACED AT 3 RD POSITION IN PRODMAST.. CONFIRM[C] ' GET NEWBAT PICT '!' VALID NEWBAT $('C ')
       READ
       IF NEWBAT='C'
       		   sele B
              * USE PRODMAST INDE PN12
              USE PRODMAST ORDER PN12 
               SEEK SNAME+SNAME1       
               REPL STDQTY3 WITH  BSIZE
               SELE B
               USE
        ENDIF       
       EXIT
     ELSE
          BSIZE=0
    	  LOOP
	   ENDIF
	ENDIF
ENDDO         
   @22,2 SAY SPACE(77)
   @23,2 SAY SPACE(77)
   ln=ln+2
DO WHILE .T.
   SET COLOR TO W+/B,W+/R
   @ln,1 say 'BATCH NO            :' GET VBNO PICT '!!!9999'
   READ
  iF VBNO=SPACE(7)
    close databases
    RETU
  ENDIF 
 
  SELE A
  USE BATCH_NO ORDER BNO
   SEEK ALLTRIM(VBNO)
  IF FOUND()
    SET COLOR TO W+/G
    @21,2 SAY SPACE(70)
    @21,2 SAY '... BATCH NO ALREADY  ENTERED....ENTER BATCHNO AGAIN..PREE ANY KEY..'
    UX=INKEY(0)
    @21,2 SAY SPACE(70)
    SET COLOR TO W+/B,W+/R
    LOOP
 ENDIF
 
 ALB=ISALPHA(SUBSTR(ALLTRIM(VBNO),3,1))
 USE MAINCODE ORDER MCOMP
 SEEK ALLTRIM(UPPER(VNAME))
 stor ALLTRIM(maincode->batch_char) TO BH
 stor ALLTRIM(maincode->batchchAR1) TO BH1
 LBH=LEN(BH)
 LBH1=LEN(BH1)
 IF ALB = .T.
    COMPCHAR= ALLTRIM(SUBSTR(VBNO,1,3))
 ELSE
    COMPCHAR= ALLTRIM(SUBSTR(VBNO,1,2))
 ENDIF  

 IF LBH>0 .AND. LBH1>0
	 IF COMPCHAR=BH .OR. COMPCHAR=BH1
          BCH='T'
	 ELSE
        BCH='F'
	 ENDIF   
 ENDIF
 IF LBH>0 .AND. LBH1=0
	 IF COMPCHAR=BH 
          BCH='T'
	 ELSE
        BCH='F'
	 ENDIF   
 ENDIF
 IF LBH=0 .AND. LBH1>0
 IF COMPCHAR=BH1
          BCH='T'
 ELSE
        BCH='F'
 ENDIF   
 ENDIF
 IF BCH # 'T'
       SET COLOR TO W+/G
       @22,2 SAY SPACE(70)
       @22,2 SAY 'CONFIRM BATCHNO...[C] TO CONFIRM..' GET BYE PICT '!' VALID BYE $('C# ')
       SET COLOR TO W+/B,W+/R
       READ

       @22,2 SAY SPACE(70)
      IF BYE=' '
         vbno=space(7)
         LOOP
     ENDIF
   ENDIF      
*  DO PROC_3

   EXIT
ENDDO
ln=ln+4
***************
do while .t.
 
   DO MFGDATE
   DO EXPDATE
   set color to w+/b,w+/r
   @22,1 clea to 23,78
   set color to w+/g
   @22,2 SAY "FOR ANY CHANGE MFG DATE OR  EXP DATE     PRESS <ESC> to try again..."
   @23,2 SAY "......else.....                 PRESS ANY KEY TO CONTI...."
   SET COLOR TO W+/B,W+/R
   ux=INKEY(0)
   @22,1 clea to 23,78
   if lastkey()=27
      ln=ln-1
      loop
   endif
   exit
enddo
return     