    *****COMMON FOR ALL BPR 
	CLEA
	SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
    STORE 0 TO QQTY,MALL
    STORE SPACE(8) TO USERNM1
	STORE SPACE(3) TO VM1,VM2,VM3,VM4
    STORE SPACE(7) TO VBS
    STORE SPACE(1) TO CLUBBPR,DCLUBBPR
	VPS='Y'
    SET COLOR TO W+/G
    GFILE=ALLTRIM(BGR)+ALLTRIM(EPS)+".DBF"
    IF FILE("&GFILE")
            SELE E
            USE &GFILE EXCLU
            REPL ALL CATEGORYVL WITH 0
            INDE ON SR TAG SRORD 
            INDE ON PM TAG PMORD
            SELE E
            USE
      ELSE
           @22,2 SAY SPACE(77)
           @22,2 SAY 'BPR GROUP FILE NOT FOUND....BPR NOT ALLOWED..PRESS ANY KEY.'
           =INKEY(0)
            RETU
        ENDIF    
 IF SA_EX #"E"
	SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	SET COLOR TO RB+/B
	@0,0 TO 24,78 DOUBLE
	SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	DO WHILE .T.
		   @4,1 SAY 'ENTER BATCH NO [BLANK SPACE TO EXIT]:' GET VBNO PICT '!!!9999'
           READ VALID LASTKEY()=13
		   IF VBNO=SPACE(7)
		       RETU
		   ENDIF	 
           SELE C
		   USE BATCH_NO.DBF ORDER BNO
		   SEEK ALLTRIM(VBNO) 
	       YN=' '
           @23,2 SAY SPACE(68)
		   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
		   IF .NOT. FOUND()
		       SET COLOR TO W+/G
		       @23,2 SAY '*......THIS BATCH NO IS NOT FOUND.......PRESS ANY KEY ..*'
               UX=INKEY(0)
		       SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
		       LOOP
		   ENDIF
	       @23,2 SAY SPACE(68)
            IF (C->GEN_NAME#GNAME)  
		  * IF (C->NAME1#SNAME)  .OR. (C->NAME2#SNAME1)
		       SET COLOR TO W+/R 
               @22,2 CLEA TO 23,77
		       @22,2 SAY '*.....THIS BATCH NO AND PRODUCT DO NOT MATCH....PRESS ANY KEY.TO CONTI.[ESC] TO CANCEL.*'
		       UX=INKEY(0)
       
		       SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	           IF LASTKEY()=13
    	           LOOP
	           ELSE
	              RETU
	           ENDIF   
		   ENDIF
           SELE 18
           USE BPRDATA
           SET FILT TO ALLTRIM(BATCHNO)=ALLTRIM(VBNO) .AND. BPRSRNO=VBPRSR .AND. CANCELLED #"Y" 
           GO TOP
		   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
           IF .NOT. EOF()
             @18,2 CLEA TO 23,78
             SET COLOR TO RB+/GR
             @18,1 SAY 'FOR THIS BATCH NO BPR (ALLPAGE) IS ALREADY TAKEN OUT'
             @19,1 SAY 'U HAVT TO SELECT SINGLE PAGE FOR COPIES...PRESS ANY KEY'
             =INKEY(0)
             SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
             CLOS DATA
             do npmenu             
           ENDIF   
		   BSIZE   = C->BAT_SIZE
		   VEXPDATE= C->EXPDATE
		   VMFGDATE= C->MFGDATE
           RM      = C->BAT_QTY
           VBAT_QTY=C->BAT_QTY
    	   EXIT
		ENDDO
ENDIF		
    IF SA_EX="E"
               SAVE SCREEN TO AB
               CLEA
               DO BATCHENT
               REST SCREEN FROM AB            
               SELE 21
               USE &GFILE ORDER PMORD
               SELE A
               USE PKG_MST ORDER UOFF
               SET FILT TO  BATCH=VBNO  .AND. (NAME1=SNAME .AND. NAME2=SNAME1) .AND. CIPORDNO=VCIPORD .AND. CATEGORY = "E"
               GO TOP
               DO WHILE .NOT. EOF()
                  SELE 21
                  SEEK A->ITEM
                  IF FOUND()
                     REPL STATUS WITH A->STATUS
                     SELE A
                     SKIP
                  ENDIF
                ENDDO       
                 SELE 21
                 USE
                 SELE A
                 USE

                 SELE A
                 USE PKG_MST
                 SET FILT TO STATUS="C"
                 GO TOP
                IF .NOT. EOF()
                    REPL ALL STATUS WITH ' ' 
                ENDIF
                SELE A
            GO TOP
		    DELE ALL FOR LEN(ALLTRIM(ITEM))=0  
            SELE A
            SET ORDER TO ORDBAT

*            SET ORDER TO PKGBAT
            SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1))
            GO TOP
            COUNT TO MM
            IF MM>1
               SELE A
               USE PKG_MST
              SET ORDER TO N12BTQ
            ELSE   
     		    SELE A
             	SET ORDER TO N12BTQ
	    	    SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1))
	            GO TOP
     		    VBNO=ALLTRIM(A->BATCH)

	        ENDIF
            SELE A
            COUNT TO M FOR CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. ALLTRIM(BATCH)=VBNO
		    GO TOP
		  IF M>1 
        	@18,1 CLEA TO 23,77
	        @18,2 TO 23,77 DOUBLE
	        DCLUBBPR=" "
   DO WHILE .T.
        @19,3 SAY 'ENTER [Y] FOR CLUBBING ORDERS FOR BPR ELSE ENTER [N]:=' GET CLUBBPR PICT '!' VALID CLUBBPR$('YN')
         READ    
       IF CLUBBPR="Y"
          @19,3 SAY SPACE(70)
	      SET COLOR TO W+/R,RB+/GR
          @19,3 SAY 'U HAVE ENTERED [Y] FOR CLUBBING ORDERS CONFIRM [Y/N]:=' GET DCLUBBPR PICT '!' VALID DCLUBBPR$('YN')
          READ
		  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
          IF DCLUBBPR="N"
             CLUBBPR=" "
             LOOP
           ELSE
              EXIT
          ENDIF   
        ELSE
              EXIT
        ENDIF
   ENDDO
       IF CLUBBPR="Y"                     
           SELE A
	       SET ORDER TO N12BTQ
	       *SET ORDER TO UNIBQC
           SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO
           GO TOP

           DO CLUB WITH CLUBBPR,MALL
           IF CLUBBPR="Y"          
              SELE A
              SET ORDER TO N12BTQ
              SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. STATUS="C"
              GO TOP
              QQTY=MALL	
              VCIPORD=A->CIPORDNO
           ENDIF       
           QQTY=MALL         
       ENDIF
    ENDIF
    CLEA
    SET COLOR TO W+/B,W+/R

    IF M<=1 .OR. CLUBBPR # "Y"
         SELE A
         *SET FILT TO  CATEGORY = "E"
         *GO TOP
         IF EOF()
           @1,2 SAY '....NO BATCHES APPROVED BY CIPLA HEAD  FOR BPR....'
           =INKEY(0)
           RETU
         ELSE
        
  	     @1,2 SAY '....FOLLOWING BATCHES ARE READY (APPROVED BY CIPLA HEAD ) FOR BPR....'
	     SET COLOR TO R+/B,W+/G
	     define window temp from 5,1 to 22,75
	     define popup s_list from 5,1 to 22,75 prompt fields LTRIM(BATCH)+' '+SUBSTR(name1,1,15)+" "+SUBSTR(name2,1,25)+' '+SUBSTR(CIPORDNO,1,15)+" "+ltrim(STR(QUANTITY,6))   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
	     activate window temp
	     @0,0 get VBS popup s_list
         read valid lastkey() = 13 .OR. LASTKEY()=27
   	     deactivate window temp
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	     IF LASTKEY()=27
	          CLOSE ALL
	          RELEASE ALL
         	  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
              RETU
          ENDIF
           CLEA
           VBNO=A->BATCH	
           QQTY=A->QUANTITY	
           VCIPORD=A->CIPORDNO
       ENDIF
           RELEASE MALL,M,MMALL
           SELE A
           USE
           SELE C
		   USE BATCH_NO.DBF ORDER BNO
		   SEEK ALLTRIM(VBNO) 	
     	   BSIZE=C->BAT_SIZE
		   VEXPDATE=C->EXPDATE
		   VMFGDATE=C->MFGDATE
           VBAT_QTY=C->BAT_QTY
       ENDIF
      ENDIF         
            CLEA
         	@0,0 TO 24,78 DOUBLE
     		SET COLOR TO W+/GB
     		@2,2 SAY PNAME
            SET COLOR TO W+/G
            @3,10 SAY 'BATCH:'+VBNO
            SET COLOR TO W+/B,W+/R
            IF SA_EX="E" .AND. CLUBBPR # "Y"
                SELE C
                USE CBBPR EXCLU
                SET FILT TO BPRSRNO=VBPRSR .AND. BATCH=VBNO 
                GO TOP
                DELE ALL
                PACK
                SELE C
                USE
                SELE C
                USE CBBPR
                APPE BLANK
                GOOUT = " " 
             DO WHILE .T.
              IF RLOCK()
                REPL BPRSRNO WITH VBPRSR
                REPL QUANTITY WITH QQTY
                REPL BATCH WITH VBNO
                REPL ADITICODE WITH VADCD
	            REPL KEY WITH 'E'
                REPL CIPORDNO WITH  VCIPORD
                SELE C
                USE
                UNLOCK 
                EXIT
             ELSE
               STOR " " TO GOOUT
               DO ER_RLOC 
         ENDIF    
        ENDDO    
       ENDIF
            IF CLUBBPR="Y"
                  DCLUBBPR=" "
		          @19,3 SAY SPACE(70)
			      SET COLOR TO W+/R,RB+/GR
		          @19,3 SAY 'U HAVE ENTERED [Y] FOR CLUBBING ORDERS CONFIRM ONCE AGAIN[Y/N]:=' GET DCLUBBPR PICT '!' VALID DCLUBBPR$('YN')
		          READ
				  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
		          IF DCLUBBPR="N"
		             CLUBBPR=" "
		             SET COLOR TO W+/G,RB+/GR
		             WAIT "U HAVE CANCELLED CLUBBING OF ORDERS...PRESS ANY KEY"
                     SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                     DO DCLUB WITH VBNO,VBPRSR
                     CLOSE DATA
		             RETU
                  ENDIF
              ENDIF
        
          IF SA_EX="E"
            sele 25
            use \dbase\adisale\export\prcdetai order prcsrno
            SET FILT TO ALLTRIM(CIPORDNO)=ALLTRIM(VCIPORD)
            go top
            store prcdetai->sellife to prcdt
            sele 25
            use
         	@4,2 say 'MFGDATE:=' GET VMFGDATE
         	@5,2 say 'EXPDATE:=' GET VEXPDATE

			SET COLOR TO W+*/GR
            IF VAL(ALLTRIM(STR(PRCDT)))>0
               @5,22 SAY '..EXPIRY DATE REQUIRED .'+ALLTRIM(STR(PRCDT))+'  MONTHS..FOR EXPORT.'
	         ELSE
	           @5,22 SAY '..EXPIRY DATE . NOT MENTIONED IN ORDER..FOR EXPORT.'
	         ENDIF  
	        IF DCLUBBPR="Y"
	           @6,25 SAY ' CLUBBED BPR [ESC] TO CANCEL'
	        ENDIF
	        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
            READ VALID LASTKEY()=13 .OR. LASTKEY()=27
            IF LASTKEY()=27
               CLOSE DATA
               RETU
            ENDIF   
          ELSE
        	@5,2 say 'EXPDATE:=' + VEXPDATE
          ENDIF
          IF LASTKEY()=27
               DO DCLUB WITH VBNO,VBPRSR
               CLOSE ALL
               RETU
           ELSE
              RELEASE DCLUBBPR
	          @5,25 SAY SPACE(55)
   			  VM1=SUBSTR(VMFGDATE,1,3) 
			  VM2=SUBSTR(VEXPDATE,1,3) 
			  VMFGDATE1=SUBSTR(VMFGDATE,1,4)+SUBSTR(VMFGDATE,7,2)
			  VEXPDATE1=SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
			  SELE E
	          USE MONTH
			  GO TOP
			  LOCATE FOR CMONTH=VM1
			  VMFGDATE2=E->NOMON+'/'+SUBSTR(VMFGDATE,5,4)
			  VMFGDATE3=E->NOMON+'/'+SUBSTR(VMFGDATE,7,2)
			  SELE E
  			  GO TOP
			  LOCATE FOR CMONTH=VM2    
			  VEXPDATE2=E->NOMON+'/'+SUBSTR(VEXPDATE,5,4)
			  VEXPDATE3=E->NOMON+'/'+SUBSTR(VEXPDATE,7,2)
  			  LN=7
			  @ln,2 say 'LABEL DATETYPE  [1] XXX.99  [2] 99/9999 [3] 99/99 TYPE' GET lDTTYPE PICT '9' VALID lDTTYPE =1 .OR. lDTTYPE=2 .OR. lDTTYPE=3
			  READ VALID LASTKEY()=13
			  IF lDTTYPE=1
			    VLMFGDT=VMFGDATE1
			    VLEXPDT=VEXPDATE1
  			   ENDIF   
			   IF lDTTYPE=2
			     VLMFGDT=VMFGDATE2
 			     VLEXPDT=VEXPDATE2
   			   ENDIF   
    			IF lDTTYPE=3
	      		   VLMFGDT=VMFGDATE3
			       VLEXPDT=VEXPDATE3
    			ENDIF   
	    		ln=ln+2
		    	@ln,2 say 'CARTON DATETYPE [1] XXX.99  [2] 99/9999 [3] 99/99 TYPE' GET cDTTYPE PICT '9' VALID cDTTYPE =1 .OR. cDTTYPE=2 .OR. cDTTYPE=3
     		    READ VALID LASTKEY()=13
	
			IF CDTTYPE=1
			   VCMFGDT=VMFGDATE1
			   VCEXPDT=VEXPDATE1
			ENDIF   
			IF CDTTYPE=2
			   VCMFGDT=VMFGDATE2
			   VCEXPDT=VEXPDATE2
			ENDIF   
			IF CDTTYPE=3
			   VCMFGDT=VMFGDATE3
		       VCEXPDT=VEXPDATE3
			ENDIF   
	         SELE E
	         USE 
      		@7,1 CLEA TO 7,70
     IF AS='A' .OR. (AS='S' .AND. SPAGE=1)
       DO WHILE .T.
		   IF VPS='Y'
               IF SA_EX="E"           
 	    	       LN=LN+2
	               QT1=QQTY
		           @LN,1 SAY 'QTY FOR [EXPORT]' 
		           @LN,18  SAY QT1 PICT '999999'
	               VQTY=QT1
                   STORE 0 TO QT2,QT3,QT4,QT5
               ENDIF  
         
    	       IF SA_EX="P"
                    LN=LN+2
           	        QT4=((YIELD/100)*RM)-(QT1+QT2+QT3+QT5)
           	        @LN,1 SAY 'QTY FOR (P.S.) ' GET QT4 PICT '999999' VALID QT4>0
                    READ VALID LASTKEY()=13
                    VQTY=QT4
                    STORE 0 TO QT1,QT2,QT3,QT5
                ENDIF
                IF SA_EX="S"
         	         STORE 0 TO QT1,QT2,QT3,QT4
         	         QT5=((YIELD/100)*RM)-(QT1+QT2+QT3+QT4)
           	         LN=LN+2
                     @LN,1 SAY 'QTY FOR [SALE] ' GET QT5 PICT '999999' VALID QT5>0
                      READ VALID LASTKEY()=13
                      VQTY=QT5
		       ENDIF   
           ENDIF
	      SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	      STOR " " TO UVHYN
	      IF SA_EX#"E"
    	      SET COLOR TO W+/G,W+/R
              @ 23,12 SAY "ABOVE QUANTITY IS CORRECT ? ARE YOU SURE ? SAY Y/N : " GET UVHYN PICT "!" VALID UVHYN $ "YN"
              READ VALID LASTKEY()=13
              SET COLOR TO W+/B,W+/R
              @ 23,1 SAY SPACE(77)
              IF UVHYN = "N"
      	     	@7,1 CLEA TO 7,70
         		LN=9
                LOOP
                ELSE
                EXIT
             ENDIF
          ELSE
             EXIT
          ENDIF
         ENDDO 
      ENDIF
      CLEA
      SET COLOR TO W+/G
      @2,2  SAY 'STD. PACKING OF -- '+ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)      
      SET COLOR TO W+/B,W+/R
      IF SA_EX="E"
           SELE 21
           USE \DBASE\ADISALE\EXPORT\EXPORT1
*          SET FILT TO CIPORDNO=VCIPORD .AND. ADITICODE=VADCD .AND. CIP_VERIFY="Y" .AND. CANCELLED # "Y"
           SET FILT TO CIPORDNO=VCIPORD .AND. ADITICODE=VADCD .AND. CANCELLED # "Y"
           GO TOP
           VOUTCART  =OUTCARTVAL
           VUNITSOC  =UNITSINOC
           VINCARTVAL=INCARTVAL
           VBPRCODE=SPACE(6)
           VASRNO=SRNO
           USE
      ENDIF
   DO WHILE .T.
      SET COLOR TO R+/B
      @5,1 TO 22,76 DOUBLE
      SET COLOR TO N+/W
      @6,4 SAY   'BPR CODE                                               :' 
      @8,4 SAY   'NO OF UNITS/VIALS/AMPOULES IN ONE IN.CARTON/TRAY/R.BOX :' 
      @10,4 SAY  'TRAY IN OUTER CARTON/NO OF UNITS IN IN.CARTON/S.W POUCH:' 
      @12,4 SAY  'NO OF OUTER CARTONS IN ONE SHIPPER                     :' 
      @14,4 SAY  'TOTAL NO OF UNITS/VIALS/AMPOULES IN ONE SHIPPER        :' 
    IF UVHYN # "N"
      SET COLOR TO W+/G
      @6,60 SAY     VBPRCODE PICT '!!!!!!'
      @8,60 SAY     VINCARTVAL PICT '9999'
      @10,60 SAY    VUNITSOC PICT '9999'
      @12,60 SAY    VOUTCART PICT '9999'
      SET COLOR TO W+/B,W+/R
       IF VINCARTVAL=0
         VINCARTVAL=1
       ENDIF
     IF VUNITSOC=0
         VUNITSOC=1
       ENDIF
      IF VOUTCART=0
         VOUTCART=1
       ENDIF
      VSHIP=VUNITSOC*VOUTCART*VINCARTVAL
      SET COLOR TO W+*/G
      @14,57 SAY VSHIP PICT  '9999'
      SET COLOR TO W+/B,W+/R
   ENDIF
    IF UVHYN="N"
      @6,60  GET    VBPRCODE PICT '!!!!!!'
      @8,60  GET    VINCARTVAL PICT '9999'
      @10,60 GET    VUNITSOC PICT '9999'
      @12,60 GET    VOUTCART PICT '9999'
      READ VALID LASTKEY()=13
      IF VOUTCART=0
         VOUTCART=1
       ENDIF
      IF VINCARTVAL=0
         VINCARTVAL=1
       ENDIF
     IF VUNITSOC=0
         VUNITSOC=1
       ENDIF
      VSHIP=VUNITSOC*VOUTCART*VINCARTVAL
      SET COLOR TO W+*/R
      @14,57 SAY VSHIP PICT  '9999'
      SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
    ENDIF
      STOR " " TO UVHYN
      SET COLOR TO W+/BR
      @ 23,12 SAY "ABOVE VALUES ARE CORRECT ? ARE YOU SURE ? SAY Y/N : " GET UVHYN PICT "!" VALID UVHYN $ "YN"
      READ VALID LASTKEY()=13
      SET COLOR TO W+/B,W+/R
      @ 23,1 SAY SPACE(77)
      VVV=" "
      IF UVHYN = "N"
               SAVE SCREEN TO AAA
                DO WHILE .T.
                    IF (ALLTRIM(USERNAME)= "NAHID" .OR.  ALLTRIM(USERNAME)= "JEMINI")
                       UCON="N"
                       EXIT
                    ELSE
                       UCON="Y"
                    ENDIF  
                 IF UCON="Y"                     
                       DO XXX
                       IF ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)='JEMINI'
                             EXIT
                       ELSE  
                            @23,1 SAY 'NOT AUTHORISED ...DEPT HEAD IS NEEDED..[ESC] TO CANCEL ELSE PRESS ANY KEY ' GET VVV PICT '!'
                            READ
                          IF LASTKEY()=27
                               CLOSE DATA
                               RETU
                           ELSE                                
                              STOR "N" TO UVHYN    
                              LN=10
                              LOOP
                       ENDIF
                     ENDIF
                  ENDIF
               ENDDO     
                    STORE USERNM1 TO USERNAME
                    REST SCREEN FROM AAA
                   LOOP
               ENDIF
                SELE 21
                USE &GFILE
                REPL ALL CATEGORYVL WITH 0
               * REPL ALL CATEGORYVL WITH VUNITSOC FOR (CATEGORY="I".AND. STATUS="Y")
                REPL ALL CATEGORYVL WITH VINCARTVAL FOR (CATEGORY="I".AND. STATUS="Y")
                REPL ALL CATEGORYVL WITH VUNITSOC FOR (CATEGORY="M" .AND. STATUS="Y")
                REPL ALL CATEGORYVL WITH VSHIP FOR (CATEGORY="O" .AND. STATUS="Y")
                USE
               EXIT
   ENDDO 
    RELEASE USERNM1,VVV
     DO COPYPKG
     DO UNITPACK 
ENDIF
*******************
  PROC XXX
  STOR SPACE(8) TO USERNAME
  PERMIT = .F.
IF ! CHECKPS(PERMIT)
   SET COLOR TO W+/G
   @ 23,12 SAY "SORRY...UNAUTHORISED PERSON...PRESS ANY KEY.."
   SET COLOR TO W+/B,W+/R
   UX=INKEY(0)
   CLOSE DATA
   @ 13,0 CLEA
   RETURN
ENDIF   
@ 0,0 CLEA
RETU
**************

**************CLUBBING BPR FOR SAME BATCHNO
PROC CLUB
PARAM BPRCB,MMALL
	     SET COLOR TO W+/G
       	 @1,2 SAY '....FOLLOWING ORDERS  ARE ALLOCATED SAME BATCH '+VBNO
         @2,2 SAY '... SELECT ORDERS BY PRESSING ENTER KEY OR [ESC] ...'
	     SET COLOR TO W+/B,R+/B
         @3,1 CLEA TO 24,78
         SELE 22
         USE CBBPR  ORDER BCQ EXCLU
DO WHILE .T.
         SELE A
         GO TOP
         LN=8
	     SET COLOR TO R+/B,W+/G
	     define window temp from 15,1 to 22,75
	     define popup s_list from 15,1 to 22,75 prompt fields LTRIM(CIPORDNO)+' '+LTRIM(STR(QUANTITY,6))+" "+LTRIM(BATCH)   footer "Press [ESC] TO EXIT  [ENTER] key to Select"   && in window temp 
	     activate window temp
	     @0,0 get VBS popup s_list
         read valid lastkey() = 13 .OR. LASTKEY()=27
   	     deactivate window temp
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	     IF LASTKEY()=27
	        EXIT
	     ENDIF   
	     IF LASTKEY()=13
           VBNO=A->BATCH	
           QQTY=A->QUANTITY	
           VCIPORD=A->CIPORDNO
           SELE CBBPR
           DELE ALL FOR BATCH=VBNO .AND. CIPORDNO=VCIPORD .AND. QUANTITY=(QQTY)
           PACK
           APPE BLANK
*           REPL SRNO WITH VSRNO
           REPL BPRSRNO WITH VBPRSR
           REPL CIPORDNO WITH VCIPORD
           REPL QUANTITY WITH QQTY
           REPL BATCH WITH VBNO
           REPL ADITICODE WITH A->ADITICODE
           REPL KEY WITH 'E' 
           REPL A->STATUS WITH 'C'
           SELE A
           GO TOP
           SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO .AND. STATUS #'C'
           LOOP
       ENDIF
       ENDDO           

          SELE CBBPR
          GO TOP
          COUNT TO CBNO  FOR BPRSRNO=VBPRSR && TOTAL NO  OF CLUBBED ORDERS
        IF CBNO=1
             MMALL=CBBPR->QUANTITY
         ENDIF
      IF CBNO>1
          CLEA
          @1,5 SAY '.......U HAVE CLUBBED FOLLOWING ORDERS.........'
          LN=3

          SELE CBBPR
          GO TOP
          SET FILT TO   BATCH=VBNO  .AND. BPRSRNO=VBPRSR
           GO TOP
         DO WHILE .NOT. EOF()
            @LN,4 SAY CBBPR->CIPORDNO
            @LN,25 SAY CBBPR->QUANTITY
            MMALL=MMALL+CBBPR->QUANTITY
            LN=LN+1
            SELE CBBPR
            SKIP
          ENDDO
          @LN,4 SAY '============================='
          LN=LN+1
          @LN,5 SAY 'TOTAL QTY:='
  	      SET COLOR TO W+/B,R+/B
 	      SET COLOR TO W+/GB
          @LN,25 SAY MMALL PICT '999999'
	      SET COLOR TO W+/N
          @23,1 SAY 'CONFIRM [Y] FOR ABOVE CLUBBED ORDERS FOR BPR ELSE ENTER [N] :' GET BPRCB PICT '!' VALID BPRCB$('YN')
          READ
   	      SET COLOR TO W+/B,R+/B
         IF BPRCB="Y"
            SELE PKG_MST
            SET ORDER TO ITEMPKG
            SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO  
            GO TOP
            SELE CBBPR
            GO TOP
            DO WHILE .NOT. EOF()
                SELE PKG_MST
                GO TOP
                SET FILT TO  PKG_MST->CATEGORY = "E"  .AND. (ALLTRIM(PKG_MST->NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(PKG_MST->NAME2)=ALLTRIM(SNAME1)) .AND. PKG_MST->BATCH=VBNO  .AND. PKG_MST->CIPORDNO=CBBPR->CIPORDNO .AND. PKG_MST->QUANTITY=CBBPR->QUANTITY
                GO TOP
                DO WHILE .NOT. EOF()
                   REPL PKG_MST->STATUS WITH 'C'
                   SKIP
                   IF EOF()
                      EXIT
                   ENDIF
                   ENDDO   
                   SELE CBBPR   
                   SKIP
             ENDDO   
            SELE A
            USE PKG_MST EXCLU
            SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO  .AND. STATUS="C"
            GO TOP
            COUNT TO PKGMSTNO && TOTAL RECORDS OF CLUBBED ORDERS
            SELE A
            SET ORDER TO UNIPK
            COUNT TO UPKGNO && TOTAL  UNIQUE  RECORDS
             IF (PKGMSTNO/CBNO) # UPKGNO
                       SELE A
        	           SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO  .AND. STATUS="C" 
 	                   GO TOP
                       SET ORDER TO UOFF 
                       CLEA
          	           SET COLOR TO W+/R
                       @1,3 SAY 'AS  PER FOLLOWING LIST CODING IS DIFFERENT'
                       @3,3 SAY ' ..SO CLUBBED BPR NOT POSSIBLE....'
                       DCLUBBPR="N"
         	           SET COLOR TO W+/B,R+/B
                       LN=5
                       DO WHILE .NOT. EOF()
	                         @LN,3 SAY A->ITEM
	                	     SET COLOR TO W+/G
                             STORE A->CODE TO ACODE
                             @LN,20 SAY ACODE
	                 	     SET COLOR TO W+/B,R+/B
	                         @LN,40 SAY A->CIPORDNO
     	                     SKIP
        	                  IF EOF()
            	                @23,2 SAY  " ...............END.......PRESS ANY KEY........"
                                READ VALID LASTKEY()#27
                	            CLEA 
                    	        EXIT
                              ELSE
                                 LN=LN+1
                                 IF LN>20 
                                     @23,1 SAY 'PRESS ANY KEY  FOR NEXT SCREEN....'
                                     READ VALID LASTKEY()#27
                                     @5,2 CLEA TO 20,77
                                     LN=5
                                 ENDIF 
                             ENDIF               
                      ENDDO
                BPRCB="N"
                ENDIF
         ENDIF
            SELE PKG_MST
            SET ORDER TO N12BTQ
            SELE CBBPR
            USE
     ENDIF
          SELE A
          SET FILT TO  CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO  
          GO TOP
          SET ORDER TO N12BTQ
          CLEA            
          RELEASE CBNO,UPKGNO,PKGMSTNO            
          RETU      
	    
*******************
PROC DCLUB
PARAM VVBNO,VVSR
	     SET COLOR TO W+/G
       	 @1,2 SAY '....FOLLOWING ORDERS  ARE ALLOCATED SAME BATCH '+VBNO
         @2,2 SAY '... SELECT ORDERS BY PRESSING ENTER KEY OR [ESC] ...'
	     SET COLOR TO W+/B,R+/B
         @3,1 CLEA TO 24,78
         SELE 22
         USE CBBPR  ORDER BCQ EXCLU
         DELE ALL FOR BATCH=VBNO .AND. BPRSRNO=VBPRSR
         PACK
         USE
         SELE PKG_MST
         USE
         USE PKG_MST EXCLU
         SET ORDER TO ITEMPKG
         DELE ALL FOR (CATEGORY = "E"  .AND. (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. BATCH=VBNO)  
         RETU      
	    

   	     
   	     