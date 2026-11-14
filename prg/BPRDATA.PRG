****BPR DETAIL ENTRY/MODIFICATION IN PRODMAST BY PACKING DEPT
        SET PROC TO ADIHEAD
        DO ADISTART
        SET DELI TO '[]'
        SET DELI ON
        CLOSE DATA
        V1=" "
    do while .t.
          clea
	      store space(1) to opt,any
          STORE SPACE(15) TO VVT
           CLEA
                     
          STOR 0 TO RCHO 
			  @ 18,1 SAY SPACE(77)
	          SET MESSAGE TO 18 CENTER
	    	   @  6,25 TO 14,55 DOUBLE
			   @ 8,33 PROMPT "M. MODIFY " MESSAGE "FOR MODIFICATION OF PRODMAST INFORMATION"
			   @ 10,33 PROMPT "E. EXIT   " MESSAGE "GO BACK TO MAIN-MENU"
			   MENU TO RCHO
			   DO CASE
 		       CASE RCHO = 1
		           OPT = "M"
		       OTHERWISE
		           CLOSE DATABASES
		           RETU
     		   ENDCASE
           CLEA
       	   SET COLOR TO GR+/GR,W+/R
      	   @10,1 SAY 'WHILE ADDING BPR INFORMATION,  BE SURE THAT BMR DETAIL OF '
		   @12,1 SAY 'PARTICULAR ITEM IS PROPERLY FILLED BY STORE DEPT..!!      '
           SET COLOR TO W+/B,W+/R
           SET COLOR TO RB+/B
   	       @16,1 SAY 'PRESS ANY KEY TO CONTI...                                 '
           UX=INKEY(0)
           SET COLOR TO W+/B,W+/R
               sele a
               use PRODMAST 
		       STORE SPACE(12) TO MNAME1,SNAME
		       STORE SPACE(35) TO MNAME2
		       STORE SPACE(10) TO MMFG_LIC_NO,MLOGO
		  	   STORE SPACE(16) TO MEXPORT_LIC
		       STORE SPACE(6) TO MBPRCODE
               STORE SPACE(1) TO MCATEGORY
		       STORE 0 TO MINCARTVAL
		       STORE 0 TO MOUTCARTVAL,MSHIPPERVAL,MADITICODE,MUNITSINOC
               STORE SPACE(5) TO CIPNAME
           DO WHILE .T.
               @23,10 say '1ST 5 CHARACTERS OF PRODUCT NAME ' get CIPNAME pict '!!!!!'
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
	    		    @22,1  SAY '................ITEM DOES NOT EXIST...........'
         	        SET COLOR TO W+/B,W+/R
				    LOOP
			    ELSE
			        EXIT
				ENDIF  
   		  ENDDO
			     SELE A
			     GO TOP
			     SET FILT TO CIPNAME$NAME1 
			     GO TOP
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
		          MNAME1     =A->NAME1
		          MNAME2     =A->NAME2
		          MCOMPANY   =A->COMPANY
		          MADITICODE =A->ADITICODE
		          MCODE      =A->CODE
        	      MPACK      =A->PACK
        		  MBPRCODE   =A->BPRCODE
		          MOUTCARTVAL=A->OUTCARTVAL
                  MUNITSINOC =A->UNITSINOC
		          MINCARTVAL =A->INCARTVAL
		          MSHIPPERVAL=A->SHIPPERVAL
		          MMFG_LIC_NO=A->MFG_LIC_NO
		          MEXPORT_LIC=A->EXPORT_LIC
		          MMRP       =A->MRP
                  MLOGO      =A->LOGO
                  MCATEGORY  =A->CATEGORY		        
                  MBPRGR     =A->BPRGROUP
         		  clea
		        @ 0,0 to 24,79 doub   
                SET COLOR TO GR+/GR,W+/R
  	             @ 1,32 say "BPR INFORMATION SCREEN"
       		     SET COLOR TO W+/B,W+/R
   	             @ 2,32 say "---------------------"
		         @ 3,1 CLEA TO 22,78
       		     SET COLOR TO W+/G
                 @4,1 TO 22,78 DOUBLE
         		 SET COLOR TO W+/B,W+/R

                 SET COLOR TO R+/B
                 @5,60 TO 10,60 DOUBLE
                 @5,62 SAY 'THIS DATA IS'
                 @6,62 SAY 'UPDATED BY'
                 @7,62 SAY 'STORE DEPT.'
   			    SET COLOR TO W+/B,W+/R
                SET COLOR TO W+/GB
   			     @5,2 SAY 'COMPANY                 :' + MCOMPANY 
    			 @6,2 SAY 'ADITI PRODUCT CODE      :' +LTRIM(STR(MADITICODE))
				 @7,2 SAY 'CIPLA PRODUCT CODE      :' +LTRIM(MCODE)              
				 @8,2 say "FIRST NAME              :" +LTRIM(MNAME1)
 	    		 @9,2 say "SECOND NAME             :" +ALLTRIM(MNAME2)
			     @10,2 say "PACK                    :" +LTRIM(MPACK)
                 SET COLOR TO W+/B,W+/R
                 @11,1 TO 11,78 DOUBLE
               
   		DO WHILE .T.
				@12,2 say "NO OF OUTER CARTONS IN 1 SHIPPER (SALE)   :"GET MOUTCARTVAL pict "99"
                @13,2 say "NO OF I.C./TRAY/RONDO BOX  IN OUTER CARTON/S.W FILM(SALE):"GET MUNITSINOC pict "99"
				@14,2 say "NO OF UNITS IN INNER CARTON (SALE)        :"GET MINCARTVAL pict "999"
				@15,2 say "SHIPPER VALUE     (SALE)                  :"GET MSHIPPERVAL pict "9999"
				@16,2 say "BPRCODE           (SALE)                  :"GET MBPRCODE pict "@!"
				@17,2 say "EXPORT LIC.NO.                            :"GET  MEXPORT_LIC pict "@!"
   				@18,2 say "MFG.LIC.NO                                :"GET  MMFG_LIC_NO pict "@!"
   				@19,2 say "MRP                                       :"GET  MMRP pict "99999.99"
                @20,2 SAY 'LOGO                                      :'GET MLOGO  PICT REPL("!",10)   
                @21,2 SAY 'GROUP FOR BPR                             :' + MBPRGR 
                READ VALID LASTKEY()=13
                @12,2 FILL TO 20,77 COLOR W+/N
                @21,2 SAY 'GROUP FOR BPR {press [C] to change group} :' + MBPRGR 
                SET COLOR TO W+/B,W+/R
                SKEY = 0
                SET ESCAPE OFF
                DO WHILE SKEY = 0
                  SKEY = INKEY()
                ENDDO
               SET ESCAPE ON
            IF SKEY=67
                SELE 20
                USE PRTYPE
		        GO TOP
			    define window temp from 16,49 to 23,75
			    define popup s_list from 16,50 to 23,74 prompt fields LTRIM(TYPE)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
			    activate window temp
 			    SET COLOR TO W+/GB
			    @0,0 get VVT popup s_list
		    	read VALID LASTKEY()=13
			    deactivate window temp
                MBPRGR=PRTYPE->KEY
                SELE PRTYPE 
                USE
                SET COLOR TO W+/B,W+/R
                @21,2 CLEA TO 21,75
			    @21,2 SAY 'GROUP FOR BPR                             :'+'  '+ MBPRGR     
                @21,2 FILL TO 21,77 COLOR W+/G
        ENDIF				
	               
					@23,1 say space(60)
		            SET COLOR TO GR+/GR,W+/R
     				@23,10 say '[C] CONFIRM [Q] QUIT WITOUT SAVING..' get v1 pict '!'VALID V1$('CQ ')
           		    SET COLOR TO W+/B,W+/R
    				read
               
	                IF V1='Q' .OR. V1=" "
                       CLOSE DATA
                       RETU
                    ENDIF   
     	           IF V1='C' 
	  	             SELE A
                     USE PRODMAST
 				     GO TOP
				     SET FILT TO NAME1=MNAME1 .AND. CATEGORY=MCATEGORY .AND. NAME2=MNAME2
				     GO TOP &&UPEN
                     GOOUT = " " 
                     DO WHILE .T.
                     IF RLOCK()
                        REPL BPRCODE WITH MBPRCODE
	                    REPL OUTCARTVAL WITH MOUTCARTVAL
	                    REPL UNITSINOC WITH MUNITSINOC
                        REPL INCARTVAL WITH MINCARTVAL
   	                    REPL SHIPPERVAL WITH MSHIPPERVAL							  
  	                    REPL A->EXPORT_LIC WITH MEXPORT_LIC
	                    REPL MRP WITH MMRP
	               	    REPL MFG_LIC_NO WITH MMFG_LIC_NO
                        REPL BPRGROUP WITH MBPRGR
                        UNLOCK 
                        flush
                        EXIT
                      ELSE
                        STOR " " TO GOOUT
                        DO ER_RLOC 
                     ENDIF    
                    ENDDO
                    EXIT
  	            ENDIF
              ENDDO
           	  any = " "
              @ 23,10 say space(65)
              SET COLOR TO GR+/GR,W+/R
              @ 23,23 say "Do you want to continue maintaince(Y/N)"
              @ 23,65 get any pict "!"
              SET COLOR TO W+/B,W+/R
              read VALID LASTKEY()=13
                        
              if any # "Y"
                 V1=" "
                 RETU
             endif
    enddo
***********************
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