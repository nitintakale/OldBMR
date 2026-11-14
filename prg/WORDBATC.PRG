*** TO ENTER IN BATCH_NO FILE FOR BMR FROM WORD STAR
SET PROC TO ADIHEAD
CLOSE DATA
DO ADISTART
set printer to
STORE CTOD('  /  /    ') TO VVDATE
STOR SPACE(1) TO BCH,BYE
COMPCHAR=SPACE(3)
  STORE SPACE(7) TO VBATCH
  SELE B
  USE PRODMAST ORDER PN12
  STORE SPACE(12) TO SNAME
  STORE SPACE(35) TO SNAME1
  STORE 0 TO VCONVRATE,VBAT_SIZE,VBAT_QTY,VADITICODE,VMFGYEAR
  STORE SPACE(10) TO VCODE
  STORE SPACE(7) TO VCOMPANY
  STORE SPACE(1) TO VDIGIT
  STORE SPACE(3) TO VMFGMON
  STORE SPACE(8) TO VMFGDATE,VEXPDATE
  STORE SPACE(60) TO MGEN_NAME
   SET COLOR TO W+/B,W+/R
   SET COLOR TO G+/B
        define window TEMP1 from 1,1 to 16,60
        activate window temp1
        SELE B
        GO TOP
        define popup s_list from 1,2 to 16,59 prompt fields Ltrim(NAME1)+' '+TRIM(NAME2)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 1
        @0,0 get SNAME popup s_list
        read valid lastkey() = 13 .OR. LASTKEY()=27
        SET COLOR TO W+/B,W+/R
        IF LASTKEY()=27
            retu
        ELSE  
         VCOMPANY  =b.COMPANY        
         VADITICODE=b.ADITICODE
         SNAME     =b.NAME1
         SNAME1    =b.NAME2
         VCONVRATE =b.RATE
         VCODE     =B.CODE
         VVOLVIAL  = b->fillvoLume
  		 MGEN_NAME =LTRIM(B->GEN_NAME)
  		 deactivate window TEMP1         
         IF VCODE=SPACE(10)
            @22,1 SAY SPACE(70)
            SET COLOR TO W+/N
            @22,1 SAY 'CIPLA CODE IN FILE PRODMAST IS BLANK...ENTRY IS CANCELLED'
            SET COLOR TO W+/B,W+/R
            WAIT
            RETU
         ENDIF   
       IF VADITICODE=0
            @22,1 SAY SPACE(70)
            SET COLOR TO GR+/N
            @22,1 SAY 'ADITI CODE IN FILE PRODMAST IS 0...ENTRY IS CANCELLED'
            SET COLOR TO W+/B,W+/R
            WAIT
            RETU
         ENDIF  
           @23,3 say space(78)
           CLEA
          @ 0,0,24,78 BOX '|'
          SET COLOR TO W+/B,W+/R
      do while .t.
        @7,10 SAY 'BATCH NO       :' GET VBATCH PICT 'AA!9999'
		READ
        iF vbatch=SPACE(7)
		    close databases
		    RETU
		  ENDIF 
		  SELE A
		  USE BATCH_NO ORDER BNO
		   SEEK ALLTRIM(Vbatch)
		  IF FOUND()
		    SET COLOR TO W+/G
		    @21,3 SAY SPACE(70)
		    @21,3 SAY '... BATCH NO ALREADY  ENTERED....ENTER BATCHNO AGAIN..PREE ANY KEY..'
		    UX=INKEY(0)
		    @21,2 SAY SPACE(70)
		    SET COLOR TO W+/B,W+/R
		    LOOP
		 ENDIF
		 ALB=ISALPHA(SUBSTR(ALLTRIM(vbatch),3,1))
		USE MAINCODE ORDER MCOMP
		 SEEK ALLTRIM(UPPER(VNAME))
		 stor ALLTRIM(maincode->batch_char) TO BH
		 stor ALLTRIM(maincode->batchchAR1) TO BH1
		 LBH=LEN(BH)
		 LBH1=LEN(BH1)
		 IF ALB = .T.
		    COMPCHAR= ALLTRIM(SUBSTR(vbatch,1,3))
		 ELSE
		    COMPCHAR= ALLTRIM(SUBSTR(vbatch,1,2))
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
	       SET COLOR TO W+/G,W+/N
	       @22,3 SAY SPACE(70)
	       @22,3 SAY 'CONFIRM BATCHNO...[C] TO CONFIRM..' GET BYE PICT '!' VALID BYE $('C# ')
	       SET COLOR TO W+/B,W+/R
	       READ
	       @22,3 SAY SPACE(70)
	      IF BYE=' '
	         vbatch=space(7)
	         LOOP
	     ENDIF
	   ENDIF      
   EXIT
ENDDO
       SET COLOR TO W+/B,W+/R
    SELE B
    USE PRODMAST ORDER PN12
    SEEK SNAME+SNAME1
     do while .t.
        @9,10 SAY 'BATCH SIZE     :' GET VBAT_SIZE PICT '9999.99'
		READ
     	IF VBAT_SIZE=B->STDQTY1 .OR. VBAT_SIZE=B->STDQTY2 .OR. VBAT_SIZE=B->STDQTY3
	    	 conbat='Y'
             EXIT
    	ELSE
	        BATPASS=SPACE(5)
            SET COLOR TO W+/G,W+/R
      	    @22,3 SAY SPACE(70)
      	    @22,3  SAY ' ENTERED BATCHSIZE IS NOT STD SIZE ..ENTER PASSWORD ' 
            @22,70 SAY ' '
            set console off
            SET COLOR TO W+/B,W+/GR
            ACCEPT '         ' TO BATPASS
            SET CONSOLE ON
            IF LASTKEY()=27 .OR. BATPASS=SPACE(5) .OR. LEN(BATPASS)=0
         	  CLOSE DATABASES
              VCONSIZE='F'
              RETU           	      
           ENDIF  
*-------GET PASSWORD FROM PASS FILE
          IF BATPASS='BMRAD'
             @22,3 SAY SPACE(70)
             @23,3 SAY SPACE(70)
             SET COLOR TO W+/GR,G+/W
             NEWBAT=' '
	         @23,3  SAY 'NEW BATCHSIZE WILL BE REPLACED AT 3 RD POSI.IN PRODMAST.. CONFIRM [C] ' GET NEWBAT PICT '!' VALID NEWBAT $('C ')
             SET COLOR TO W+/B,W+/R
             READ
             IF NEWBAT='C'
                SELE B
                  GOOUT = " " 
                  DO WHILE .T.
                  IF RLOCK()
                     REPL STDQTY3 WITH  VBAT_SIZE
                        UNLOCK 
                        flush
                        EXIT
                    ELSE
                       STOR " " TO GOOUT
                       DO ER_RLOC 
                    ENDIF    
                ENDDO
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
       RM=vbat_size*1000/VVOLVIAL
       RM=RM-50
       RM=ROUND(RM,-2)
	   vbat_qty=rm
        @11,10 SAY 'BATCH QUANTITY:' GET VBAT_QTY PICT '9999999'
		READ
        @1,1 CLEA TO 22,77
        DO MFGDATE
        DO EXPDATE
   	    VCON=' '
        @23,1 SAY SPACE(70)
        @23,5 SAY '......[C] TO CONFIRM ENTRY......... ' GET VCON PICT '!'VALID VCON $('C ')
    	READ
        IF VCON='C'
			  USE BATCH_NO
			  APPE BLANK
              GOOUT = " " 
          DO WHILE .T.
            IF RLOCK()
              REPL USERNM   WITH USERNAME
			  REPL ADITICODE WITH VADITICODE
			  REPL CODE WITH LTRIM(VCODE)
			  REPL COMPANY WITH LTRIM(VCOMPANY)
			  REPL NAME1 WITH SNAME
			  REPL NAME2 WITH SNAME1
			  REPL CONVRATE WITH VCONVRATE
			  REPL BAT_SIZE WITH VBAT_SIZE
			  REPL BAT_QTY WITH VBAT_QTY
			  REPL WORDBMR WITH 'Y'
			  REPL BATCHNO WITH VBATCH
			  REPL MFGDATE WITH VMFGDATE
			  REPL EXPDATE WITH VEXPDATE
              REPL GEN_NAME WITH MGEN_NAME
              UNLOCK 
              flush
              EXIT
          ELSE
              STOR " " TO GOOUT
              DO ER_RLOC 
         ENDIF    
      ENDDO
	ENDIF
	ENDIF
   CLOSE DATA
   RETU
