*****VIEW
       SNAME=SPACE(20)
       SEP=SPACE(6)
       SELE A
       USE \DBASE\BMR\PRODMAST
       CIPNAME=SPACE(5)
       CLEA
****PRODUCT  VIEW

   CLEA
   @ 1,1 TO 23,78 DOUB
   SET COLOR TO W+/R
   @ 4,10 SAY " SELECT OPTION FROM  FOLLOWING"
   SET COLOR TO B/BG
   @ 3,60 SAY "PRESS 'ESC' TO QUIT"
   SET COLOR TO W+/B,W+/R
   @ 24,1 SAY SPACE(77)
   @ 7,20 TO 18,45 DOUB
   STORE 0 TO OPT1
   @  8,25 PROMPT "1. EXPORT"
   @ 10,25 PROMPT "2. SALE  "
   @ 12,25 PROMPT "3. P.S.  "
   MENU TO OPT1
   DO CASE
      CASE OPT1 = 1
           SA_EX="E"
           SEP="EXPORT"
           @21,10 SAY "ENTER BATCH NO " GET VBNO PICT '@!'
           READ
           IF LEN(ALLTRIM(VBNO))=0
              CLOSE DATA
              RETU
           ENDIF   

           SELE 20
           USE PKG_MST ORDER UOFF   
           SET FILT TO BATCH=VBNO
           GO TOP
           IF EOF()
             CLEA
             @15,2 SAY SPACE(75)
   		     SET COLOR TO GR+*/GB
             @15,2 SAY 'BATCHNO NOT FOUND IN PKG_MST...i.e. IS NOT APPROVED FOR BPR..PRESS ANY KEY.'
             SET COLOR TO W+/B,W+/R
             READ
             RETU
           ENDIF              
           VCIPORD=  PKG_MST->CIPORDNO
           VADCD  =  PKG_MST->ADITICODE           	
           CIPNAME=  SUBSTR(PKG_MST->NAME1,1,5)
           SELE 22
           USE \DBASE\ADISALE\EXPORT\EXPORT1
           SET ORDER TO EXCIP
           SET FILT TO CIPORDNO=VCIPORD .AND. ADITICODE=VADCD
           GO TOP
           VOUTCART    = EXPORT1->OUTCARTVAL
           VUNITSOC    = EXPORT1->UNITSINOC
          * VSHIP      = EXPORT1->SHIPPERVAL
           VINCARTVAL  = EXPORT1->INCARTVAL

           SELE 22
           USE
           SELE 20
           USE
      CASE OPT1 = 2
           SA_EX="S"
           SEP="SALE"
      CASE OPT1 = 3
           SA_EX="P"
           SEP="P.S."
      OTHERWISE
            RETURN
      ENDCASE
      CLEA

             IF SA_EX #"E"      
                   DO WHILE .T.

				    @10,10 say 'ENTER 1 ST 5 CHARACTERS OF PRODUCT NAME ' get CIPNAME pict '!!!!!'
				    READ
				    if cipname=space(5)
				       retu
				    endif    
		     		sele A
				   	go top
				    set filt to CIPNAME$NAME1
				    go top
				    IF EOF()
               		     SET COLOR TO GR+/GR,W+/R
	    		         @22,1 SAY SPACE(77)
	    		         @22,1  SAY '.....ITEM DOES NOT EXIST........'
         	             SET COLOR TO W+/B,W+/R
				         LOOP
			         ELSE
			             EXIT
				     ENDIF  
	    		  ENDDO
             ENDIF
			     SELE A
			     GO TOP
			     SET FILT TO CIPNAME$NAME1 
			     GO TOP
                 SET COLOR TO W+/G
                 @13,2 SAY '..................SELECT PRODUCT NAME..........................'
                 SET COLOR TO W+/B,W+/R
			     define window temp from 15,1 to 22,75
			     define popup s_list from 15,1 to 22,75 prompt fields LTRIM(name1)+" "+LTRIM(name2)+ "   " +Ltrim(company)+" "+ltrim(category)+" "+LTRIM(TYPE)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
			     activate window temp
			     @0,0 get sname popup s_list
		    	 read valid lastkey() = 13 .OR. LASTKEY()=27
			     deactivate window temp
			     IF LASTKEY()=27
			          CLOSE ALL
			          RELEASE ALL
		    	      RETU
		         ENDIF
		          MNAME1      = A->NAME1
		          MNAME2      = A->NAME2
		          MCOMPANY    = A->COMPANY
		          MCODE       = A->CODE
        		  MPACK       = A->PACK
		          MCATEGORY   = A->CATEGORY
		          MTYPE       = A->TYPE
                  MADCD       = A->ADITICODE                  
                  YIELD       = A->YIELD
                  VBPRCODE    = A->BPRCODE
                  MGEN_NAME   = A->GEN_NAME
		          MEXPIRY     = A->EXPIRY
		          MYIELD      = A->YIELD
		          MMRP        = A->MRP
                  MBPRGROUP   = A->BPRGROUP
                  IF SA_EX#"E"
                     VOUTCART    = A->OUTCARTVAL
                     VUNITSOC    = A->UNITSINOC
                     VSHIP       = A->SHIPPERVAL
                     VINCARTVAL  = A->INCARTVAL
                 ENDIF
                  SELE A
                  USE
 
*************************

 
             CLEA
  		     SET COLOR TO W+/G
             @ 1,15 say "PRODUCT DETAIL FILLED IN PRODMAST  FOR " 
             SET COLOR TO W+/B,W+/R
             SET COLOR TO W+*/G
             @ 1,63 SAY '['+ SEP +']'
             SET COLOR TO W+/B,W+/R
             @ 2,22 say "----------------------------------"
	         @ 3,1 CLEA TO 22,78
   		     SET COLOR TO W+/B,W+/R
   		     SET COLOR TO N+/W
            @3,20 SAY 'ADITICODE='
            SET COLOR TO W+/B,W+/R
            SET COLOR TO W+*/GR
            @3,32 SAY MADCD
		    SET COLOR TO W+/B,W+/R
		     SET COLOR TO W+/BR
		    @4,1 SAY 'MAIN COMPANYNAME :' + MCOMPANY +'   PRODUCT CODE   :' +  MCODE 
    	    @6,1 say "NAME             :" + ALLTRIM(MNAME1)+'  '+ALLTRIM(MNAME2)
           	@8,1 say "GENERIC NAME     :"+ ALLTRIM(MGEN_NAME)
		    @10,1 say "PACK            :" + ALLTRIM(MPACK)
		    *@12,1 say "CATAGORY        :"+ AACAT +"   TYPE(A/T/F)   :"+ MTYPE 
       		@12,1 say "EXPIRY IN MONTHS:  "+ LTRIM(STR(MEXPIRY))+'  YIELD IN %  :'+ LTRIM(STR(MYIELD))
   		    @14,1 SAY 'COVERSION RATE  :  '+LTRIM(STR(MMRP,7,2))
  		    SET COLOR TO W+/B,W+/R
            @15,1 TO 15,77 DOUBLE
            SET COLOR TO W+/GR
     	    @16,1 SAY 'BPRGROUP                                              :  '+LTRIM(MBPRGROUP)
     	    @17,1 SAY 'UNITS IN INCARTON/TRAY/RONDOBOX                       : '+LTRIM(STR(VINCARTVAL))
       	    @18,1 SAY 'NO OF INCARTON,TRAY,RONDOBOX IN OUTER CARTON/SW POUCH :  '+LTRIM(STR(VUNITSOC))
       	    @19,1 SAY 'NO OF CARTON/POUCH IN SHIPPER                         :  '+LTRIM(STR(VOUTCART))
            VSHIP=VINCARTVAL*VUNITSOC*VOUTCART
     	    @20,1 SAY 'SHIPPERVALUE                                          :  '+LTRIM(STR(VSHIP))
   		    SET COLOR TO W+/B,W+/R
   		    SET COLOR TO W+/R
	        @23,10 say '!!!!...PRESS ANY KEY... TO VIEW PACKING MATERIAL..!!!!!..'
            SET COLOR TO W+/B,W+/R
            READ 
********************************
CLEA
SELE A
USE PKG_MST ORDER UOFF
IF SA_EX="E"
    SET FILT TO  ALLTRIM(NAME1)=ALLTRIM(MNAME1) .AND. ALLTRIM(NAME2)=ALLTRIM(MNAME2) .AND. BATCH=VBNO .AND. CATEGORY=SA_EX
ELSE
    SET FILT TO  ALLTRIM(NAME1)=ALLTRIM(MNAME1) .AND. ALLTRIM(NAME2)=ALLTRIM(MNAME2)  .AND. CATEGORY=SA_EX
ENDIF
    GO TOP
   IF EOF()
         SET COLOR TO W+/G
         IF SA_EX="E"
            @10,2 SAY 'NO P.M.FOUND...BPR NOT VERIFIED FOR ' +ALLTRIM(MNAME1)+' '+ALLTRIM(MNAME2) +'FOR '+VBNO
         ELSE
            @10,2 SAY '...NO P.M. FOUND FOR ' +ALLTRIM(MNAME1)+' '+ALLTRIM(MNAME2) +'FOR '+VBNO
          ENDIF
          SET COLOR TO W+/B,W+/R
     WAIT
     RETU
     ENDIF
         SET COLOR TO W+/BR
	     @4,0 SAY 'FOLLOWING P.M ARE  AVAILABLE FOR BPR  '+SUBSTR(MNAME1,1,12)+' '+SUBSTR(MNAME2,1,30)
	     SET COLOR TO W+/B,W+/R
	     @5,1 TO 5,78 DOUBLE
	     SELE A
	    IF SA_EX="E"
	     @6,2 SAY 'ITEM         CATEGORY   CODE       ORDER NO         QUANTITY'  
        ENDIF
	    IF SA_EX#"E"
	     @6,2 SAY 'ITEM         CATEGORY   CODE       '
        ENDIF
	     @7,1 TO 7,78 DOUBLE
	     LN=8
         @8,1 clea to 23,78 
         SELE A
         SET ORDER TO ORDCDBT
         GO TOP
   	      DO WHILE .NOT. EOF()
              	    IF SA_EX="E"
      	              @LN,2 SAY SUBSTR(A->ITEM,1,9)+'   '+A->CATEGORY+'        '+A->CODE+'     '+A->CIPORDNO+'         '+LTRIM(STR(QUANTITY))
			        ENDIF
	         
           	        IF SA_EX#"E"
			              @LN,2 SAY SUBSTR(A->ITEM,1,9)+'   '+A->CATEGORY+'        '+A->CODE
      			    ENDIF
 			              SELE A
			              SKIP
			              IF .NOT. EOF()
			                 LN=LN+1
			                 IF LN>20
			                    @22,2 SAY SPACE(75)
                                SET COLOR TO W+/GR
			                    @22,2 SAY '...........PRESS ANY KEY..FOR NEXT SCREEN'
                                 SET COLOR TO W+/B,W+/R
			                    READ VALID LASTKEY()#27
 			                    @8,1 CLEA TO 20,77
			                    LN=8
			                ENDIF
			              ENDIF    
            		    LOOP
                   ENDDO
	                   @22,2 SAY SPACE(75)
		               @23,2 SAY SPACE(75)
		               SET COLOR TO W+/N
           			   @23,1 SAY  '...........PRESS ANY KEY TO RETU.....'
		               SET COLOR TO W+/B,W+/R
		               READ VALID LASTKEY()#27
                       RETU