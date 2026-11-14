*************ADD/MODI/DEL ITEM_MST
CLEA
     STORE SPACE(8) TO USERNM1
     DO WHILE .T. 
  			  IF ALLTRIM(USERNAME)="JEMINI"
 			        EXIT
  			   ELSE    
                   WAIT ".MRS.J.A. BAKSHI ONLY WILL OPERATE  THIS OPTION... PRESS ENTER TO CONI.RE ENTER PASSWORD IN NEXT SCREEN."
                   SAVE SCREEN TO AAA		           
                   STORE USERNAME TO USERNM1
                   DO WHILE .T.
                        DO XXX
                         IF LEN(ALLTRIM(USERNAME))=0
                             CLOSE DATA
                             RETU
                          ENDIF   
                          IF ALLTRIM(USERNAME)="JEMINI"
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
                          IF ALLTRIM(USERNAME)="JEMINI"
                            STORE USERNM1 TO USERNAME
                            REST SCREEN FROM AAA
                            RELEASE USERNM1		             
                            EXIT
                         ENDIF
                   ENDIF
              ENDDO
              CLEA
              SELE A
              USE ITEM_MST
DO WHILE .T.
         STORE SPACE(9) TO VCODE
         STORE SPACE(40) TO VNAME
         STORE SPACE(7) TO VVUNIT
         SET COLOR TO W+/B,R+/B
         STOR 0 TO RCHO 
   	     @ 18,1 SAY SPACE(77)
	     SET MESSAGE TO 18 CENTER
	     @  6,25 TO 16,55 DOUBLE
		 @  8,33 PROMPT "A. ADD    " MESSAGE "FOR ADDITION OF NEW CODES TO ITEM_MST"
		 @ 10,33 PROMPT "M. MODIFY " MESSAGE "FOR MODIFICATION OF ITEM_MST INFORMATION"
		 @ 12,33 PROMPT "D. DELETE " MESSAGE "FOR DELETION OF INFORMATION FROM ITEM_MST"
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
		     RETU
 		   ENDCASE
                 if opt='A'
                          clea
                         @ 0,0 to 24,79 doub   
                         @ 1,32 say "Addition Screen"
                 ELSE
                         clea
                         @ 0,0 to 24,79 doub   
                         @ 1,32 say "Modification Screen"
                endif
                         @ 2,32 say "-------- ------"
                         @3,1 clea to 22,78
               IF OPT='M'
                        SET COLOR TO W+/B,W+/G
                        SELE A
			            define window temp from 8,2 to 20,75
         	            define popup s_list from 8,3 to 20,74 prompt fields LTRIM(NAME)+' '+LTRIM(UNIT) footer "select item for changes in name"   && in window temp 
                  	    activate window temp
                	    @0,0 get vNAME popup s_list
               	    	read valid lastkey() = 13 .OR. LASTKEY()=27
					    deactivate window temp
					    IF LASTKEY()=27
					          CLOSE ALL
					          RELEASE ALL
			    	          RETU
                        ELSE
                        SET COLOR TO W+/B,W+/R
                        vcode=A->CODE
                        VVUNIT=A->UNIT
                        VNAME=A->NAME
                        @ 21,1 say 'Code:'+' '+vcode
                        @ 21,30 say 'Nane:'
                        @ 21,40 get  Vname PICT '@!'
                        @ 22,1 say 'UNIT(NOS/ROLLS/KGS):' GET VVUNIT PICT '!!!!!!!!' 
                         READ
                         YN=' '
                         SET COLOR TO W+/GR
                         @23,1 SAY SPACE(78)
                         @23,1 SAY ' CONFIRM ENTRY[Y/N]:' GET YN PICT '!' VALID YN $('YN')
                         SET COLOR TO W+/B,R+/B
                         READ
                       IF YN="Y"
                         SELE A
                         REPL NAME WITH VNAME
                         REPL UNIT WITH VVUNIT
                         @23,1 SAY SPACE(78)
                         SET COLOR TO W+*/G
                         @23,1 SAY ' CANGES ACCEPTED !!!!...PRESS ANY KEY'
                         SET COLOR TO W+/B,R+/B
                         READ VALID LASTKEY()#27
                       ENDIF
                   ENDIF                
              ENDIF && KEY='M'
                  if opt='A'
                        @ 2,2 CLEA TO 23,77
                        SET COLOR TO W+/G
                        @4,3 SAY '.....LIST OF EXISTING ITEMS......'
                        SET COLOR TO W+/B,R+/B
                        LN=6
                        SELE A
                        SET COLOR TO R+/B,W+/G
                        define window temp from 8,2 to 20,75
                	     define popup s_list from 8,3 to 20,74 prompt fields LTRIM(CODE)+" "+LTRIM(name)   footer "Press [ Go down] [ Go up]  [ESC] key to EXIT"   && in window temp 
          			     activate window temp
					     @0,0 get VCODE popup s_list
				         read valid  LASTKEY()=27
				   	     deactivate window temp
				         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                         VCODE=SPACE(8)
                        @ 21,1 say 'Code:'GET VCODE PICT '!!!!!!!!' VALID LEN(ALLTRIM(VCODE))=9
                        @ 21,20 say 'Name:' GET VNAME PICT REPL('!',40)
                        @ 22,1 say 'UNIT(NOS/ROLLS):'
                        @ 22,15 GET VVUNIT PICT '@!'
                         READ
                         YN=' '
                         SET COLOR TO W+/GR
                         @23,1 SAY SPACE(78)
                         @23,1 SAY ' CONFIRM ENTRY[Y/N]:' GET YN PICT '!'
                         SET COLOR TO W+/B,W+/R
                         READ
                        IF YN='Y'
                           SELE A
                           GO TOP
                           TVV=SUBSTR(PKVAL,3,2)
                           TVV=VAL(TVV)
                           DO WHILE .NOT. EOF()
                               VV=SUBSTR(PKVAL,3,2)
                               VV=VAL(VV)
                               MAXVV=MAX(TVV,VV)
                               SKIP
                           ENDDO                               
                           MAXVV=MAXVV+1
                           MMAXVV='PG'+LTRIM(STR(MAXVV))
                           SELE A
                           GO TOP
                           APPE BLANK
                           REPL CODE WITH VCODE
                           REPL NAME WITH VNAME
                           REPL PKVAL WITH MMAXVV
                           REPL UNIT WITH VVUNIT
                           CLEA
                           LN=0
                            SET COLOR TO W+/R
    TEXT
         IF CODE IS NEW  WITH NEW CALCULATION ITEMCAL.PRG
         SHOULD BE UPDATED WITH CALCULATION FORMULA
    ENDTEXT
     SET COLOR TO W+/B,W+/R
     WAIT "........DATA UPDATED........."
ENDIF      
ENDIF    && KEY="A"
 any = " "
 @ 23,1 say space(77)
 SET COLOR TO GR+/GR,W+/R
 @ 23,3 say "Do you want to continue IN ITEM_MST maintaince(Y/N)? " GET ANY PICT '!' VALID ANY$('YN')
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