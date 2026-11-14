******************* Program for ADDITION / MODIFICATIONS IN PRODMAST
****PRODMAST MODIFICATION (INFORMATION REQ FOR) STORE ONLY
        SET PROC TO ADIHEAD
        DO ADISTART
        SET DELI TO '[]'
        SET DELI ON
        CLOSE DATA
        STOR " " TO UVHYN,UCON
        STORE SPACE(8) TO USERNM1
        STORE 0 TO RCHO5     	
			       @ 16,1 CLEA TO 23,77
				   SET COLOR TO W+/B,W+/R
				   SET COLOR TO W+/G
				   @ 16,1 SAY "SELECT OPTION FROM FOLLOWING "
				   SET COLOR TO W+/B,W+/R
				   STOR 0 TO RCHO5
				   @ 18,1 PROMPT " ADD/ MODIFY INFORMATION IN PRODMAST(REQ BY STORE) "
     			   @ 20,1 PROMPT " ADD/ MODIFY INFORMATION IN PRODMAST(AUTHORITY TO PACKING HD.) "
				   SET COLOR TO W+/B,W+/R
				   SET COLOR TO GR+/GR,W+/R
				   @ 23,23 SAY "PRESS 'ESC' TO RETURN TO MAIN-MENU"   
				   SET COLOR TO W+/B,W+/R
				   MENU TO RCHO5       
                   IF LASTKEY()=27
                      CLOSE DATA
                      RETU
                   ENDIF    
                DO WHILE .T.
                   	IF RCHO5=1 
                     	IF (ALLTRIM(USERNAME)= "SANDIP" .OR.  ALLTRIM(USERNAME)= "JEMINI")
                          UCON="Y"
                          EXIT
                        ELSE
                          WAIT ".STORE HEAD WILL OPERATE  THIS OPTION.....RE ENTER PASSWORD IN NEXT SCREEN."
                     ENDIF
                    ENDIF   

                   	IF RCHO5=2 
                     	IF  (ALLTRIM(USERNAME)= "NAHID" .OR.  ALLTRIM(USERNAME)= "JEMINI")
                          UCON="Y"
                          EXIT
                       ELSE
                          WAIT ".PACKING HEAD WILL OPERATE  THIS OPTION. .....RE ENTER PASSWORD IN NEXT SCREEN."
                       ENDIF
                    ENDIF  
             ENDDO			
            
            
          IF UCON # "Y"
                 STORE USERNAME TO USERNM1
                 DO WHILE .T.
                          SAVE SCREEN TO AAA		           
                          DO WHILE .T.
                             DO XXX
                             IF LEN(ALLTRIM(USERNAME))=0
                                 CLOSE DATA
                                 RETU
                             ENDIF   
                            IF (RCHO5=1 .AND. ALLTRIM(USERNAME)="SANDIP" .OR. ALLTRIM(USERNAME)="JEMINI") .OR. (RCHO5=2 .AND. ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)="JEMINI")
                                 EXIT
                              ELSE  
                                  STOR SPACE(8) TO USERNAME
                                   @23,1 SAY 'U R NOT ALLOWED TO CHANGE VALUES...DEPT HEAD IS NEEDED..PRESS ANY KEY'
                                   READ VALID LASTKEY()#27
                                   STOR "N" TO UVHYN    
                                   LN=10
                                   LOOP
                             ENDIF
                             ENDDO     
                            
        		           STORE USERNM1 TO USERNAME
		                   REST SCREEN FROM AAA
		                   RELEASE USERNM1		             
                          IF ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)="JEMINI"
                              EXIT
                          ENDIF  
                        ENDDO
                  ENDIF
                 IF RCHO5=2
                   DO BPRDATA
                ENDIF        
       IF RCHO5=1
           do while .t.
	          clea
		      store space(1) to opt,any,V1
	          STOR 0 TO RCHO 
			  @ 18,1 SAY SPACE(77)
	          SET MESSAGE TO 18 CENTER
	    	   @  6,25 TO 16,55 DOUBLE
			   @  8,33 PROMPT "A. ADD    " MESSAGE "FOR ADDITION OF NEW CODES TO PRODMAST"
			   @ 10,33 PROMPT "M. MODIFY " MESSAGE "FOR MODIFICATION OF PRODMAST INFORMATION"
			   @ 12,33 PROMPT "D. DELETE " MESSAGE "FOR DELETION OF INFORMATION FROM PRODMAST"
			   @ 14,33 PROMPT "E. EXIT   " MESSAGE "GO BACK TO MAIN-MENU"
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
		           EXIT
 		   ENDCASE
           CLEA
           sele a
           use PRODMAST 
    	    if opt='A'
         	   SET COLOR TO GR+/GB
        	   @10,1 SAY 'WHILE WORKING IN THIS OPTION..ADITICODE IN SALE SHOULD BE ...'
			   @12,1 SAY 'KNOWN & ALL INFORMATION SHOULD BE ENTERED '
		       @14,1 SAY 'FROM THE DETAILS FILLED  BY PRODUCTION PERSON '
		       @16,1 SAY 'ON GIVEN FORMAT( FOR B.M.R.) .....PRESS ANY KEY TO CONTI... '
               UX=INKEY(0)
  	           SET COLOR TO W+/B,W+/R
               STORE SPACE(12) TO MFORMU_CODE
               STORE SPACE(20) TO MNAME1
		       STORE SPACE(35) TO MNAME2
		       STORE SPACE(1) TO mCATEGORY,MTYPE,V1,V2,VC
		       STORE SPACE(60) TO MGEN_NAME
		       STORE SPACE(7) TO MUNIT,MCOMPANY,MMCOMPANY
		       STORE SPACE(10) TO MVERSION,MCODE
		       STORE SPACE(16) TO MMMFNO,MPACK
		       STORE 0 TO MVOLUME,MFILLVOLUME
		       STORE 0 TO MEXPIRY,MYIELD,MRATE,MSTDQTY1,MADITICODE,MSTDQTY2,MSTDQTY3
		       STORE SPACE(5) TO CIPNAME
     ENDIF && ADDITION
     if opt='M' &&===
		      CLEA
		   	      DO WHILE .T.
				       STORE SPACE(12) TO MFORMU_CODE
                       STORE SPACE(20) TO MNAME1
				       STORE SPACE(35) TO MNAME2
				       STORE SPACE(1) TO MCATEGORY,MTYPE,V1,V2,VC
				       STORE SPACE(60) TO MGEN_NAME
				       STORE SPACE(7) TO MUNIT,MCOMPANY
				       STORE SPACE(10) TO MVERSION,MCODE
				       STORE SPACE(16) TO MMMFNO,MPACK
				       STORE SPACE(5) TO CIPNAME
				       STORE 0 TO MVOLUME
				       STORE 0 TO MEXPIRY,MYIELD,MRATE,MSTDQTY1,MMRP,MADITICODE,MSTDQTY2,MSTDQTY3
				       @23,1 SAY SPACE(78)
				       @23,10 say '1st 5 characters of PRODUCT NAME ' get CIPNAME pict '!!!!!'
				       READ
				      if cipname=space(5)
				            retu
				      endif    
					 sele A
				   	 go top
				     set filt to CIPNAME$ALLTRIM(NAME1)
				     go top
				     IF EOF()
               		     SET COLOR TO GR+/GR,W+/R
	    		         @22,1  SAY 'ITEM DOES NOT EXIST'
         	             SET COLOR TO W+/B,W+/R
				         LOOP
			          ELSE
			             EXIT
				      ENDIF  
	    		  ENDDO
			     SELE A
			     GO TOP
			     SET FILT TO CIPNAME$ALLTRIM(NAME1) 
			     GO TOP
                 SET COLOR TO W+/GB
                 @13,10 SAY 'FOLLOWING PRODUCTS ARE FOUND IN PRODMAST'
                 SET COLOR TO W+/B,W+/R
			     define window temp from 15,1 to 22,75
			     define popup s_list from 15,1 to 22,74 prompt fields LTRIM(name1)+" "+LTRIM(name2)+ " " +LTRIM(STR(ADITICODE))+' '+Ltrim(company)+" "+ltrim(category)+" "+LTRIM(TYPE)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
			     activate window temp
			     @0,0 get sname popup s_list
		    	 read valid lastkey() = 13 .OR. LASTKEY()=27
			     deactivate window temp
			     IF LASTKEY()=27
			          CLOSE ALL
			          RELEASE ALL
		    	      RETU
		          ENDIF
		          MNAME1=SNAME
		          MNAME2=A->NAME2
		          MCOMPANY=A->COMPANY
                  MMCOMPANY=A->COMPANY
		          MADITICODE=A->ADITICODE
		          MCODE=A->CODE
        		  MPACK=A->PACK
		          MCATEGORY=A->CATEGORY
		          MTYPE=A->TYPE
		          MGEN_NAME=LTRIM(A->GEN_NAME)
		          MVOLUME=A->VOLUME
		          MUNIT=A->UNIT
		          MFILLVOLUME=A->FILLVOLUME
		          MEXPIRY=A->EXPIRY
		          MYIELD =A->YIELD
		          MFORMU_CODE=A->FORMU_CODE
		          MVERSION=A->VERSION
		          MRATE=A->RATE
		          MSTDQTY1=A->STDQTY1
		          MSTDQTY2=A->STDQTY2
		          MSTDQTY3=A->STDQTY3
		          MMMFNO=A->MMFNO
                  STORE RECNO() TO G    
   endif          &&===MODIFY
        		 clea
		        @ 0,0 to 24,79 doub   
                        SET COLOR TO GR+/GR,W+/R
		       if opt='A'
		         @ 1,32 say "Addition Screen"
		       ELSE
		         @ 1,32 say "Modification Screen"
		       ENDIF
	             SET COLOR TO W+/B,W+/R
   	             @ 2,32 say "-------- ------"
     	         @ 3,1 CLEA TO 22,78
*  	        	DO WHILE .T.
    			    SET COLOR TO W+/B,W+/R
    			    @4,1 SAY 'SELECT MAIN COMPANYNAME [ESC TO EXIT]    :' +MCOMPANY
                    SET COLOR TO GR+/GR,W+/R
                    SELE B
	    		    USE MAINCODE ORDER MAINCODE
                    define window temp from 6,25 to 15,75
   			        define popup s_list from 6,26to 22,74 prompt fields LTRIM(COMPANY)+" "+LTRIM(name) footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
				     activate window temp
				     @0,4 get MMCOMPANY popup s_list
			         read valid lastkey() = 13 .OR. LASTKEY()=27
			   	     deactivate window temp
			         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
				     IF LASTKEY()=27
				       IF OPT="A"
				          CLOSE ALL
                          SET COLOR TO W+/G
                          @23,1 SAY "COMPANY NOT SELECTED QUITING..PRESS ANY KEY"
				          =INKEY(0)
			              SET COLOR TO W+/B,W+/R
				          RETU
      
				       ENDIF   
				       MCOMPANY=MCOMPANY   
                     ELSE
                       MCOMPANY=B->COMPANY
	                 ENDIF
                     IF LEN(ALLTRIM(MCOMPANY))=0
                        SELE B
                        USE
                        LOOP
                      ENDIF

                            @4,48 SAY MCOMPANY PICT REPL("!",7) 
					        @5,1 SAY 'ADITI PRODUCT CODE                  :'
           			        SET COLOR TO W+*/G
                            @5,40 GET MADITICODE PICT '99999'
                            READ
                            SET COLOR TO W+/B,W+/R
                           IF OPT="A"
                            SELE A
                            set order to adiprod
                            SEEK MADITICODE
                            IF FOUND()
                               @22,2 SAY SPACE(77)
                               SET COLOR TO W+/GB
                               @22,1 SAY 'CODE ALREADY EXIST FOR '+ALLTRIM(A->NAME1)+' '+ALLTRIM(A->NAME2)
                               SET COLOR TO W+/B,W+/R
                               WAIT
                               LOOP
                             ENDIF        
                          ENDIF
                            @6,1 SAY 'CIPLA PRODUCT CODE                  :'GET MCODE PICT REPL("!",10)  VALID LEN(ALLTRIM(MCODE))>0
                            READ VALID LASTKEY()=13
                            @7,1 say "FIRST NAME                          :"GET MNAME1 PICT REPL("!",12)  VALID LEN(ALLTRIM(MNAME1))>0  
                   			 READ VALID LASTKEY()=13
 	    					@8,1 say "SECOND NAME                         :"GET MNAME2 PICT "@S35!"  
 	    					READ VALID LASTKEY()=13
                  		   @9,1 say "PACK                                 :"
			    		    SELE A
                		    SET FILT TO 
			     		    SET ORDER TO PRODPACK
					        define window temp from 9,25 to 18,55
			   		        define popup s_list from 9,26to 18,54 prompt fields ALLTRIM(PACK) footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
				            activate window temp
						    @0,4 get MPACK popup s_list
					        read valid lastkey() = 13 .OR. LASTKEY()=27
					   	    deactivate window temp
					         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
						     IF LASTKEY()=27
						       MPACK=MPACK   
		                     ELSE
		                       MPACK=A->PACK
			                 ENDIF
                             @9,40 say mpack PICT '@!'
                          IF OPT#"A"
					         SELE A
		                     SET FILT TO RECNO()=G
					         SET ORDER TO         
                          ENDIF
							@10,1 say "CATAGORY [P] FOR P.S. [S] FOR SALE' :"GET MCATEGORY pict "!" valid mcategory $('P#S')
							@11,1 say "TYPE{A}(ASEPTIC) / {T}(TERMINAL / {F) FFS:"GET MTYPE PICT '!' VALID MTYPE $('A#T#F')
                    	    READ VALID LASTKEY()=13
                    		@12,1 say "GENERIC NAME   :"
                    		@12,20 SAY  MGEN_NAME 
                            SELE A
                            SELE PRODMAST
                            SET FILT TO 
       			            GO TOP
       			            SET ORDER TO PRODGEN
			                SET FILT TO LEN(ALLTRIM(GEN_NAME))>0
			                GO TOP
			                define window temp from 14,15 to 23,77
	   		                define popup s_list from 14,16to 23,76 prompt fields LTRIM(GEN_NAME) footer "Press [ESC] TO ENTER NEW NWME [ENTER] key to Select"   && in window temp 
		                    activate window temp
				            @0,4 get MGEN_NAME popup s_list
         		            read valid lastkey() = 13 .OR. LASTKEY()=27
			   	            deactivate window temp
			                SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
				            IF LASTKEY()=27
				              MGEN_NAME=MGEN_NAME   
                            ELSE
                              MGEN_NAME=A->GEN_NAME
	                       ENDIF
                   		   @12,20 SAY  MGEN_NAME 
                           IF LEN(ALLTRIM(MGEN_NAME))=0
                          		@12,20 GET MGEN_NAME 
                           ENDIF
                           SELE A
                           IF OPT#"A"
                            SET FILT TO RECNO()=G                                                 
                            GO TOP
                           ENDIF
                           @13,1 say "VOLUME                              :"GET MVOLUME PICT '99.99'  VALID MVOLUME>0
                     	   @14,1 say "UNIT(ML)                            :"GET MUNIT PICT REPL("A",8)    VALID LEN(ALLTRIM(MUNIT))>0
                    	   @15,1 say "FILL VOLUME                         :"GET MFILLVOLUME pict "99.99"  VALID MFILLVOLUME>0
                    	   @16,1 say "EXPIRY IN MONTHS                    :"GET MEXPIRY pict "99"  VALID MEXPIRY>0
                    	   @17,1 SAY 'YIELD IN %                          :'GET MYIELD pict "99.99" VALID MYIELD>0
                   	       @18,1 say 'FORMULATION CODE                    :'GET MFORMU_CODE pict REPL("!",12)  VALID LEN(ALLTRIM(MFORMU_CODE))>0   
							READ VALID LASTKEY()=13
							@23,1 say space(60)
				            SET COLOR TO GR+/GR,W+/R
							@23,1 say 'CONFIRM ABOVE ENTRY..(C) to confirm' get v1 pict '!'
                   		    SET COLOR TO W+/B,W+/R
							READ 
							IF V1#'C'
							    LOOP
							ENDIF    
							if v1='C'
							    @ 3,1 CLEA TO 23,78
   	                		    DO WHILE .T.
							 	     @4,1 say 'VERSION                    :'GET MVERSION pict REPL("!",10)    VALID LEN(ALLTRIM(MVERSION))>0 
					    		     @5,1 SAY 'COVERSION RATE             :'GET MRATE PICT '999999.99'   VALID MRATE>0    
					     		     @6,1 SAY 'STD.BATCHSIZE IN LTS       :'GET MSTDQTY1 PICT '9999.99'    
								     @7,1 SAY '                           :'GET MSTDQTY2 PICT '9999.99'  
								     @8,1 SAY '                           :'GET MSTDQTY3 PICT '9999.99'   
								  	 @9,1 SAY 'MMFNO                      :'GET MMMFNO PICT REPL("!",15)   VALID LEN(ALLTRIM(MMMFNO))>0  
								     READ VALID LASTKEY()=13
								     @23,1 say space(60)
         						     v2=' '
		         		             SET COLOR TO GR+/GR,W+/R
								     @23,1 say 'CONFIRM ABOVE ENTRY..(C) to confirm' get v2 pict '!'
                         		     SET COLOR TO W+/B,W+/R
								     read
								     if v2='C'
								         EXIT
								      ELSE
								         LOOP
		        				     ENDIF    
                    	     ENDDO
                            ENDIF
                      CLOSE DATA
					  IF OPT='A'
				          SELE A
                          USE PRODMAST
				          GO TOP
				    	   SET FILT TO ALLTRIM(NAME1)=ALLTRIM(MNAME1) .AND. CATEGORY=MCATEGORY .AND. ALLTRIM(NAME2)=ALLTRIM(MNAME2)
				    	   GO TOP &&UPEN
				   	        any = " "
							IF .NOT. EOF()
      				            SET COLOR TO GR+/GR,W+/R
			                   @ 23,17 say "Above product already exsist..no addition"
                      		   SET COLOR TO W+/B,W+/R
			                   STORE SPACE(1) TO v1,V2
			                endif
			         endif
		            if v1='C' .AND. V2='C'

    				          SELE A
                              USE PRODMAST
			        	      SET FILT TO ALLTRIM(NAME1)=ALLTRIM(MNAME1) .AND. ALLTRIM(CATEGORY)=ALLTRIM(MCATEGORY) .AND. ALLTRIM(NAME2)=ALLTRIM(MNAME2)
                              GO TOP 
			                 IF OPT='A'
			      			   APPE BLANK
			                 ENDIF
			                 IF OPT='M'
			        	       SET FILT TO ALLTRIM(NAME1)=ALLTRIM(MNAME1) .AND. ALLTRIM(CATEGORY)=ALLTRIM(MCATEGORY) .AND. ALLTRIM(NAME2)=ALLTRIM(MNAME2)
                               GO TOP 
                             ENDIF  
				                 REPL COMPANY WITH UPPER(MCOMPANY)
				                 REPL ADITICODE WITH MADITICODE
			                     REPL CODE WITH MCODE
	        		             repl NAME1 WITH UPPER(MNAME1)
			                     REPL MMFNO WITH MMMFNO
			                     REPL PACK WITH MPACK
			                     repl NAME2 WITH UPPER(MNAME2)
			                     repl CATEGORY WITH UPPER(MCATEGORY)
			                     REPL TYPE WITH UPPER(MTYPE)
			                     REPL GEN_NAME WITH UPPER(MGEN_NAME)
			                     repl VOLUME WITH MVOLUME
			                     REPL UNIT WITH MUNIT
			                     repl FILLVOLUME WITH MFILLVOLUME
			                     repl EXPIRY WITH MEXPIRY
			                     repl YIELD WITH MYIELD
			                     repl FORMU_CODE WITH MFORMU_CODE
			                     repl VERSION WITH MVERSION
                                 REPL RATE WITH MRATE
			                     REPL STDQTY1 WITH MSTDQTY1
			                     REPL STDQTY2 WITH MSTDQTY2
			                     REPL STDQTY3 WITH MSTDQTY3
			               	endif
                      	  any = " "
  					    @ 23,1 say space(75)
				       SET COLOR TO GR+/GR,W+/R
				      @ 23,3 say "Do you want to continue in  PRODMAST (BY STORE) (Y/N) ?" get any pict "!"
                      SET COLOR TO W+/B,W+/R
				      read
				      if any # "Y"
			           exit
				      endif
				   enddo
			ENDIF
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
**************
