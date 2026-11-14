*********ADDITION/MODIFICATION IN PACKING MASTER
     CLEA 
     STORE SPACE(8) TO USERNM1
     STORE SPACE(20) TO SSNAME,STNAME
     DO WHILE .T.  && 1
  			  IF ALLTRIM(USERNAME)="JEMINI" .OR. ALLTRIM(USERNAME)="NAHID"
 			        EXIT
              ELSE
                    STORE USERNAME TO USERNM1
                    SAVE SCREEN TO AAA		           
                    WAIT ".PACKING HEAD WILL OPERATE  THIS OPTION...RE ENTER PASSWORD IN NEXT SCREEN."
                    DO WHILE .T.
                          DO XXX
                          IF LEN(ALLTRIM(USERNAME))=0
                             CLOSE DATA
                             RETU
                           ENDIF   
                            IF ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)="JEMINI"
                                  EXIT
                            ELSE  
                                 STOR SPACE(8) TO USERNAME
                                 @23,1 SAY 'U R NOT ALLOWED TO CHANGE VALUES...DEPT HEAD IS NEEDED..PRESS ANY KEY'
                                 READ VALID LASTKEY()#27
                                 STOR "N" TO UVHYN    
                                 LN=10
                                LOOP
                         ENDIF
                     ENDDO &&1    
                      IF ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)="JEMINI"
                          STORE USERNM1 TO USERNAME
                           REST SCREEN FROM AAA
                           RELEASE USERNM1		             
                           EXIT
                       ENDIF
                     ENDIF            
                ENDDO && 1

            USE ITEM_MST
            INDE ON CODE TO ITEM_MST
            USE
            CLEA
            SELE A
            USE PKG_MST EXCLU
            INDE ON CODE TAG DPKG
            USE
      	    SELE A
            USE PKG_MST ORDER DPKG
            SELE B
            USE PRODMAST
            SELE C
            USE ITEM_MST  ORDER ITEMCD
            SET COLOR TO W+/B,W+/R
DO WHILE .T.
      CLEA
      CIPNAME=SPACE(5)
   DO WHILE .T. &&2
	     @22,1 SAY SPACE(78)
		 @22,10 say '1 ST 5 CHARACTERS OF FINISHED PRODUCT NAME ' get CIPNAME pict '!!!!!'
	     READ
         if cipname=space(5)
             retu
         endif    
		 sele B
	     set filt to CIPNAME$NAME1
	     go top
	     IF EOF()
  		     SET COLOR TO W+/R,W+/R
	         @23,1  SAY '...........ITEM DOES NOT EXIST................'
	          =INKEY(0)   
	         SET COLOR TO W+/B,W+/R
             LOOP
         ELSE
		     SELE B
		     GO TOP
		     SET FILT TO CIPNAME$NAME1
		     GO TOP
	         SET COLOR TO W+/B,W+/R
	         @10,2 SAY 'SELECT PRODUCT FROM FOLLOWING LIST..............'
		     define window temp from 12,1 to 22,75
		     define popup s_list from 12,1 to 22,75 prompt fields LTRIM(name1)+" "+LTRIM(name2)+ "   " +Ltrim(company)+" "+ltrim(category)+" "+LTRIM(TYPE)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
		     activate window temp
		     @0,0 get STNAME popup s_list
	    	 read valid lastkey() = 13 .OR. LASTKEY()=27
		     deactivate window temp
		     IF LASTKEY()=27
	    	      CLOSE ALL
	        	  RELEASE ALL
	    	      RETU
	          ELSE
    	          SELE B
	              SNAME=B->NAME1
				  SNAME1=B->name2
    	      ENDIF
     ENDIF
         EXIT
    ENDDO &&2
CLEA
	         SET COLOR TO W+/GB
             ?SPACE(20)+ ALLTRIM(SNAME) +' '
             ??ALLTRIM(SNAME1)
	         SET COLOR TO W+/B,W+/R
* DO WHILE .T.
             
             STOR 0 TO RCHO 
			 @ 18,1 SAY SPACE(77)
	         SET MESSAGE TO 18 CENTER
    	     SET COLOR TO W+/R
    	     @5,10 SAY 'SELECT OPTION FOR '+ ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)
    	     SET COLOR TO W+/B,W+/R
	    	  @  6,25 TO 16,55 DOUBLE
	          @  8,33 PROMPT "A. ADD P.M.    " MESSAGE "FOR ADDITION OF NEW CODES TO PKG_MST"
			   @ 10,33 PROMPT "M. MODIFY P.M. "  MESSAGE "FOR MODIFICATION OF PKG_MST INFORMATION"
			   @ 12,33 PROMPT "D. DELETE P.M. " MESSAGE "FOR DELETION OF INFORMATION FROM PKG_MST"
			   @ 14,33 PROMPT "E. EXIT        " MESSAGE "GO BACK TO MAIN-MENU"
			   MENU TO RCHO
			   DO CASE
		      CASE RCHO = 1
		           OPT = "A"
		      CASE RCHO = 2
		           OPT = "M"
		      CASE RCHO = 3
		           OPT = "D"
		      OTHERWISE
		           CLOSE DATABASES
		           RETU
 		   ENDCASE

CLEA

****************
   if opt='A'
                  clea
                  @ 0,0 to 24,79 doub   
                  @ 1,32 say "Addition Screen "
                  @ 2,32 say "-------- ------ "
                  @3,1 clea to 22,78
                  SET COLOR TO W+/B,W+/R
                  @3,10 SAY ALLTRIM(SNAME) +' '+ALLTRIM(SNAME1)
                  STORE CTOD('  /  /    ') TO MFRDATE,MTODATE
                 SELE A
                 USE PKG_MST ORDER N12CIC
       DO WHILE .T.
          DO WHILE .T.
                   SELE A
                   SET FILT TO  (NAME1=SNAME .AND. NAME2=SNAME1) .AND. CATEGORY # "E" .AND. STATUS="Y"
                   GO TOP
                    IF EOF()
                       SET COLOR TO W+/G
                       @10,5 SAY '...NEW ITEM ENTRY.....PRESS ANY KEY'
                       SET COLOR TO W+/B,W+/R
                       READ VALID LASTKEY()#27
                    ENDIF
  			             SET COLOR TO W+/BR
			             @4,2 SAY 'FOLLOWING ITEMS ARE PRESENT IN PKG_MST FOR '+ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)
			              SET COLOR TO W+/B,W+/R
			              @5,1 TO 5,78 DOUBLE
			              SELE A
			              @6,2 SAY 'ITEM CODE    DISC                                CATEGORY  CODE'  
			              @7,1 TO 7,78 DOUBLE
			              LN=8
	                      @8,1 clea to 23,78 
                        IF .NOT. EOF()
		    	            DO WHILE .NOT. EOF()
			                   SELE C
				              SEEK A->ITEM
				              STORE NAME TO ANAME
				              STORE A->CATEGORY TO ACAT
				              IF ACAT="P"
					              AACAT='[PS]'
				              ENDIF   
				              IF ACAT="S"
				                 AACAT='[SALE]'
				              ENDIF   
				              @LN,2 SAY A->ITEM+'   '+ALLTRIM(ANAME)+'  '+AACAT+'  '+A->CODE
				              SELE A
				              SKIP
				              IF .NOT. EOF()
				                 LN=LN+1
				                 IF LN>20
				                    @22,2 SAY SPACE(75)
				                    @22,2 SAY 'PRESS ANY KEY..'
				                    READ VALID LASTKEY()#27
				                    @4,1 CLEA TO 20,77
				                    LN=8
				                ENDIF
				              ENDIF    
            		    LOOP
        		   ENDDO
		         ENDIF && NOT EOF
		              SET COLOR TO W+/N
        			  @24,2 SAY 'PRESS ANY KEY TO CONTI.....'
		              SET COLOR TO W+/B,W+/R
		              READ VALID LASTKEY()#27
		              @24,2 SAY SPACE(78)
                      @4,1 CLEA TO 22,77
                      STORE SPACE(1) TO mCATEGORY,MSTATUS
                      STORE SPACE(6) TO MCODE
           	          STORE SPACE(9) TO MITEM
                    DO WHILE .T. && **
                        @ 4,3 say "CIPLA CODE FOR NEW P.M    :" GET MCODE pict "!!!!!!" 
                        READ
                        IF LASTKEY()=27 .OR. MCODE=SPACE(6)
                            CLOSE ALL
                            RETU
                        ENDIF    
                         SELE A
                         SET FILT TO  CODE=MCODE
                         GO TOP
                         IF .NOT. EOF()
                             @15,2 SAY SPACE(70)
                             CODEYN=' '
                             SET COLOR TO W+/G,W+/R
                             @15,2 SAY 'CODE  ALREADY EXIST FOR '
                             @17,2 SAY ALLTRIM(A-> NAME1)+' '+ALLTRIM(A->NAME2)+' '+TRIM(A->ITEM)+'..CONFIRM [ Y ]' GET CODEYN PICT '!'
                             SET COLOR TO W+/B,W+/R
                             READ
                             @15,2 CLEA TO 17,78
	                           IF CODEYN='Y'
	                                EXIT
	                           ELSE
	                             STORE SPACE(1) TO mCATEGORY,MSTATUS
	                             STORE SPACE(6) TO MCODE
	                  	         STORE SPACE(9) TO MITEM
	                             LOOP
	                          ENDIF
                          ELSE
    	                         EXIT
                          ENDIF
                      ENDDO &&****  
                        @15,1 SAY SPACE(70)
                        @ 6,3 say "CATEGORY                   :" GET Mcategory pict "!" VALID MCATEGORY $('P#S')
                        SET COLOR TO W+/G,W+/R
                        @ 6,45 say '[P] FOR P.S. [S] FOR SALE'
                        SET COLOR TO W+/B,W+/R
                        READ
                        @ 8,3 say "ITEM                       :" 
                         SELE C
                         GO TOP
                         SET ORDER TO ITEMNM
			            SET COLOR TO W+/B,W+/G
			            define window temp from 15,1 to 22,75
         	            define popup s_list from 15,1 to 22,75 prompt fields LTRIM(CODE)+" "+LTRIM(NAME) footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
                  	     activate window temp
                	     @0,0 get MITEM popup s_list
               	    	 read valid lastkey() = 13 .OR. LASTKEY()=27
					     deactivate window temp
					     IF LASTKEY()=27
					          CLOSE ALL
					          RELEASE ALL
	    		    	      RETU
    	    	          ELSE
                              MITEM=C->CODE
                              MNAME=C->CODE
                             @ 8,32 SAY MITEM +' '+'['+MNAME+']'
                         ENDIF
	                    MSTATUS="Y"
                        SELE A
        		    	GO TOP
	 				    LOCATE FOR (NAME1=SNAME .AND. NAME2=SNAME1 .AND. ITEM=MITEM .AND. CATEGORY=MCATEGORY .and. STATUS=MSTATUS)
		                any = " "
					    IF FOUND()
                           SET COLOR TO W+/G,W+/R
        		           @ 23,17 say "Above entry already exsist. Press any key to continue.."
                           SET COLOR TO W+/B,W+/R
		                   LOOP
  		              ENDIF   
		        	   exit
                     ENDDO	&&+++
                    YN=' '
                   @ 23,1 say space(70)	
                   SET COLOR TO W+/G,W+/R
    	     	   @23,1 SAY 'CONFIRM ENTRY [Y/N]' GET YN PICT '!A'
                   SET COLOR TO W+/B,W+/R
   	    	       READ
    	    	IF YN='Y'
                   SELE A
			   	   APPE BLANK
                   repl NAME1 WITH UPPER(SNAME)
                   repl NAME2 WITH UPPER(SNAME1)
                   repl CATEGORY WITH UPPER(MCATEGORY)
                   repl ITEM WITH UPPER(MITEM)
                   repl CODE WITH MCODE
                   repl STATUS WITH MSTATUS
                   repl FR_DATE WITH MFRDATE							  
                   repl TO_DATE WITH MTODATE
               	endif
                     ANY=' '
                     @ 23,1 say space(70)	
                     SET COLOR TO W+/G,W+/R
                     @ 23,5 say "Do you want to continue addition for same product(Y/N)" GET ANY PICT '!' VALID ANY$('YN')
                     read
 		             SET COLOR TO W+/B,W+/R
                     if any # "Y"
                         exit
                      endif
                  enddo
           endif

***************************************
      if opt = "M"
          DO WHILE .T.
                  STORE SPACE(6) TO newCODE
                  STORE SPACE(1) TO mCATEGORY,MSTATUS
                  STORE SPACE(6) TO MCODE
	    	      STORE SPACE(9) TO MITEM
                  SELE A
                  USE PKG_MST ORDER N12CIC
                  SET FILT TO  (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. CATEGORY # "E" .AND. STATUS="Y"
                  GO TOP
		          IF EOF()
    		         SET COLOR TO W+/BR
		             @5,10 SAY '..NO P.M. MATERIAL FOUND.....'
		             SET COLOR TO W+/B,W+/R
		             WAIT
		             RETU
		          ENDIF 
                  SET COLOR TO W+/BR
		          @4,2 SAY 'FOLLOWING ITEMS ARE PRESENT IN PKG_MST FOR '+ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)
		          SET COLOR TO W+/B,W+/R
		              SELE A
                      GO TOP
                      SET FILT TO  (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. (CATEGORY = "S" .OR. CATEGORY = "P") .AND. STATUS="Y"
                      GO TOP
                      
                  DO WHILE .T.
		              SELE PKG_MST
                      GO TOP
                      SET FILT TO  (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. (CATEGORY = "S" .OR. CATEGORY = "P") .AND. STATUS="Y"
                      GO TOP
         	          DEFINE WINDOW PTEMP FROM 6,1 TO 20,75 
			          define popup s_list from 6,2 to 20,74 prompt fields SUBSTR(name1,1,13)+" "+SUBSTR(name2,1,25)+ " " +Ltrim(CODE)+ " " +Ltrim(ITEM)+" "+ltrim(category)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window Ptemp 
			          activate window Ptemp
     			      @0,0 get SSname popup s_list
     		          read VALID LASTKEY()=27 .OR. LASTKEY()=13
        	         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
		    	     IF LASTKEY()=27
			             CLOSE DATA
		                 SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
        	             RETU
			         ENDIF		            
	 		   	     deactivate window Ptemp
                 IF LASTKEY()=13
		 	        SELE A
		            MCODE     =A->CODE 	        
		 		    ACAT      =a->category
		     		mitem    =a->item	            
		     		MNAME1   =A->NAME1
		     		MNAME2   =A->NAME2
		            IF ACAT="P"
		              AACAT='[PS]'
		            ENDIF   
		            IF ACAT="S"
		                AACAT='[SALE]'
		            ENDIF   
		     		SELE A
		     		GO TOP
		     		SET FILT TO NAME1=MNAME1 .AND. NAME2=MNAME2 .AND. CODE=MCODE .AND. CATEGORY=ACAT
		            GO TOP		            
		            STORE RECNO() TO M
				    CLEA
				    @0,0 TO 24,78  DOUBLE            
		            SET COLOR TO W+/G,W+/R
		            @1,5 SAY 'MODIFICATION SCREEN FOR '+ALLTRIM(MNAME1)+' '+ALLTRIM(MNAME2)       		            
		            SET COLOR TO W+*/GR
		            @2,25 SAY AACAT 
		            SET COLOR TO W+/B,W+/R
		            @3,1 TO 3,75  DOUBLE     
		             SET COLOR TO W+/B,W+/R
		             @3,1 CLEA TO 22,78
		             @ 4,3 say "CIPLA CODE (OLD)     :" 
		             @ 5,3 say "OF PACKING MATERIAL  :" 
		             SET COLOR TO W+/GB
		             @5,40 GET MCODE
		             SET COLOR TO W+/B,W+/R
   		             @ 7,3 say  "ITEM                :"
	                 @ 7,30 SAY MITEM pict "!!!!!!!!!"
		             SELE C
		             SET ORDER TO ITEMCD
		             SEEK MITEM
                     SET COLOR TO W+*/GR
		             @ 7,51 SAY C->NAME
   		             SET COLOR TO W+/B,W+/R
		             @ 9,3 say  'NEW CODE            :' 
		             SET COLOR TO W+/GB
					 @ 9,30 GET NEWCODE PICT '!!!!!!'
		             SET COLOR TO W+/B,W+/R
		             READ
		            IF LEN(ALLTRIM(NEWCODE))>0
			             CHYN=" "
			             @12,3 SAY 'ENTER [C] TO CHANGE ITEM NAME(IF NEED TO):' GET CHYN PICT '!' VALID CHYN$('C ')
			             READ
		                 @12,3 SAY SPACE(60) 
			             IF CHYN="C"
			                  SELE C
                              SET ORDER TO ITEMCD
			 	              define window PTEMP from 10,30 to 22,75
			         	      define popup s_list from 10,31 to 22,74 prompt fields LTRIM(CODE)+" "+LTRIM(NAME) footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window PTEMP 
			                  activate window PTEMP
			                  @0,0 get MITEM popup s_list
			               	  read valid lastkey() = 13 .OR. LASTKEY()=27
							  deactivate window PTEMP
							  IF LASTKEY()=27
							      MITEM=MITEM
					          ELSE
			                      MITEM=C->CODE
      				              SET COLOR TO W+/G,W+/R
 				                  @ 12,3 say  "NEW ITEM NAME(CHANGED):"
			                      @ 12,30 SAY MITEM pict "!!!!!!!!!"
				                  SET COLOR TO W+/G,W+/R
			                 ENDIF
		               ENDIF 
        		   ELSE
		              NEWCODE=MCODE
		              MITEM=MITEM
		           ENDIF
                  
	               YN=' '
		           @ 23,1 say space(70)	
		            SET COLOR TO W+/G,W+/R
		 		    @23,1 SAY 'CONFIRM ENTRY [Y/N]' GET YN PICT '!' VALID YN$('YN')
                    SET COLOR TO W+/B,W+/R
        			READ
    				IF YN='Y'
					   SELE A
                       GO TOP
                       GOTO M
                       IF (MCODE#NEWCODE) .AND. NEWCODE#SPACE(6)
                            REPL CODE WITH NEWCODE
                            repl status WITH "Y"
                            SELE A
                            GO TOP
                       ENDIF
       	           endif && confirm
                ENDIF
		          	 any = " "
			         @5,1 clea to 23,77
			         @ 23,1 say space(70)
		             SET COLOR TO B+/W,W+/R
		            @ 23,2 say "Do you want to continue modification OF SAME ITEM(Y/N)" GET ANY PICT '!' VALID ANY$('YN')
        		    SET COLOR TO W+/B,W+/R
		            read
		           if any # "Y"
		              exit
		           endif
             @5,1 CLEA TO 22,78
	        enddo && conti..
       	 PKGANY = " "
        @ 23,1 say space(77)
        SET COLOR TO B+/W,W+/R
        @ 23,2 say "Do you want to continue IN PKG_MST DATABASE?(Y/N)" get pkgany pict "!" VALID PKGANY$('YN')
        SET COLOR TO W+/B,W+/R
         read
        if PKGany # "Y"
           exit
        ELSE
           LOOP
        endif
ENDDO
ENDIF
**************
 	  any = " "
      @ 23,10 say space(65)
       SET COLOR TO R+/N,W+/R
      @ 23,3 say "Do you want to continue maintaince of database ? (Y/N)" get any pict "!"
      read
      if any # "Y"
           exit
      endif
 enddo

**********************************
  PROC XXX
  STOR SPACE(8) TO USERNAME
  PERMIT = .F.
IF ! CHECKPS(PERMIT)
   SET COLOR TO W+/G
   @ 23,12 SAY "SORRY...UNAUTHORISED PERSON...PRESS ANY KEY.."
   SET COLOR TO W+/B,W+/R
   =INKEY(0)
   CLOSE DATA
   @ 13,0 CLEA
   RETURN
ENDIF   
@ 0,0 CLEA
RETU