****TO ADD ,MODI, DELE IN GROUP FILE
set date brit
set stat off
set score off
set safety off
set confirm on
set step off
set exact on
set talk off
set echo off
SET CENTURY ON
*----------------
set dele on
set exclusive off
set reprocess to 5
set multilocks on
*------------

  CLOSE DATA
  CLEA
  BGR=SPACE(1)
  EPS=SPACE(6)
DO WHILE .T.
         CLOSE DATA
         SELE A
         USE PRTYPE
         SET COLOR TO W+/RB
         @3,5 SAY '.....SELECT TYPE FROM FOLLOWING LIST....'
	     define window temp from 5,5 to 15,75
	     define popup s_list from 5,6 to 15,74 prompt fields LTRIM(TYPE)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
	     activate window temp
	     @0,0 get BGR popup s_list
         read valid lastkey() = 13 .OR. LASTKEY()=27
   	     deactivate window temp
         SET COLOR TO W+/B,W+/R
	     IF LASTKEY()=27
	          CLOSE ALL
              CLEAR WINDOWS
	          RELEASE ALL
         	  SET COLOR TO W+/B,W+/R
              RETU
           ENDIF
           BGR=A->KEY
           CLEA
           SELE A
           USE
      	  @4,25 to 18,50 double
          SET COLOR TO W+/R
	      @2,22 say 'select Category from following list'
	      @20,26 say 'blank space to exit'
 		  define window cat from 5,26 to 17,48
		    declare s1(4,1)
		    s1(1,1) = "EXIT   "
		    s1(2,1) = "SALE   "
		    s1(3,1) = "EXPORT "
		    s1(4,1) = "PS     "
            SET COLOR TO W+/B,W+/R
		    activate window CAT
		    @2,5 get EPS from s1
		    read valid lastkey() = 13 .OR. lastkey() = 27
		    deactivate window CAT
			if ALLTRIM(EPS)='EXIT' .OR. EPS=SPACE(6)
			    SET COLOR TO GR+/B,W+/R
			    close DATA
               EXIT
			ENdif            
		    CLEA
		    GFILE=ALLTRIM(BGR)+ALLTRIM(EPS)+".DBF"
		     SELE D
		     USE ITEM_MST ORDER ITEMCD
		     SELE E
		     USE &GFILE 
		     SET ORDER TO SRORD
		     GO TOP
		     CLEA
		     @0,0 TO 24,78 DOUBLE
		    SET COLOR TO GR+/B
		    @1,2 SAY 'YOU HAVE SELECTED '+BGR+EPS+ ' FILE  TO CHANGE'
            SET COLOR TO W+/B,W+/R
  		     @3,1 TO 3,77 DOUBLE
		     SELE E
		     GO TOP
		     @4,2 SAY 'P.M. NAME                      STATUS          QTY/UNIT     EXCESS IN %  SR'
		     @5,1 TO 5,77 
		     LN=7
             CHYN=" "                        
             SELE E
             GO TOP
             DO WHILE .NOT. EOF()
                 SELE D
		         USE ITEM_MST ORDER ITEMCD
		         SEEK E->PM
		         STORE  D->NAME TO DNAME
		         SELE D
		         USE
		         @LN, 2  SAY SUBSTR(DNAME,1,30)
		         @LN, 35 SAY E->STATUS PICT '!'
		         @LN, 49 SAY E->UNITQTY PICT '999'
		         @LN, 62 SAY E->EXCESSQTY PICT '999.99'
		         @LN, 70 SAY E->SR PICT '99'
		         SELE E
		         IF  EOF()
		           EXIT
		         ENDIF
		         SKIP
		         LN=LN+1
		         IF .NOT. EOF() .AND. LN>20
		            WAIT
		            @7,2 CLEA TO 20,77
		            LN=7
		         ENDIF
	      ENDDO
         @22,2 CLEA TO 23,76
         @22,2 SAY 'ENTER  [C] CHANGE [A] TO ADD NEW P.M ITEM <ESC> TO EXIT' GET CHYN PICT '!' VALID CHYN$('CA ')
         READ         
         @22,2 CLEA TO 23,76
         IF CHYN =" "
            CLOSE DATA
            EXIT
        endif
        IF CHYN="C"
              LN=7 
	          SELE E
		      GO TOP
		     DO WHILE .NOT. EOF()
		         SELE D
		         USE ITEM_MST ORDER ITEMCD
		         SEEK E->PM
		         STORE  D->NAME TO DNAME
		         SELE D
		         USE
		         @LN, 2  SAY SUBSTR(DNAME,1,30)
		         SELE E
		         GOOUT = " " 
                 DO WHILE .T.
                   IF RLOCK()
      		         @LN, 35 GET E->STATUS PICT '!'
            		 @LN, 49 GET E->UNITQTY PICT '999'
		             @LN, 62 GET E->EXCESSQTY PICT '999.99'
    		         @LN, 70 GET E->SR PICT '99'
	    	         READ 
		             UNLOCK 
                     flush
                     EXIT
                 ELSE
                  STOR " " TO GOOUT
                  DO ER_RLOC 
                 ENDIF    
                 ENDDO
		             SELE E
		             SKIP
	             IF EOF()
	               EXIT
	             ENDIF 
		         LN=LN+1
		         IF .NOT. EOF() .AND. LN>20
		            WAIT
		            @7,2 CLEA TO 20,77
		            LN=7
		         ENDIF
     	      
	           LOOP
          ENDDO
         @23,2 say space(75)
         @23,2 say '...........Changes  Accepted..........'
         =inkey(0)
      ENDIF
    IF CHYN="A"
            STORE 0 TO DUNIT,DEXCESS,DSR
            STORE SPACE(1) TO DSTATUS
            STORE SPACE(9) TO DCD
          DO WHILE .T.
            SELE F
            USE ITEM_MST ORDER ITEMCD
            GO TOP
            SAVE SCREEN TO ABCD
            @15,2 CLEA TO 20,76
            define window temp from 15,2 to 22,75
	        define popup s_list from 15,3 to 22,75 prompt fields LTRIM(CODE)+"  "+LTRIM(NAME)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
	        activate window temp
	        @0,0 get DCD popup s_list
            read valid lastkey() = 13 .OR. LASTKEY()=27
            deactivate window temp
            SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	        IF LASTKEY()=27
	          CLOSE DATA
	          SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
              LOOP
            ENDIF
            DCD=F->CODE    
            SELE F
            USE
            SELE E
            SET ORDER TO PMORD
            SEEK DCD
             IF FOUND()
                @23,2 SAY 'ABOVE SELECTED ITEM ALREADY EXIST IN MASTER FILE'
                WAIT
                LOOP
              ENDIF  
             REST SCREEN FROM ABCD
            SELE D
            USE ITEM_MST ORDER ITEMCD
            SEEK DCD
            STORE  D->NAME TO DNAME
            STORE D->PKVAL TO DPKVAL
            SELE D
            USE
            @LN, 2  SAY LTRIM(DNAME)
            @LN, 35 GET DSTATUS PICT '!' VALID DSTATUS$('YN')
            @LN, 49 GET DUNIT PICT '999'
            @LN, 62 GET DEXCESS PICT '999.99'
            @LN, 70 GET DSR PICT '99' VALID DSR>0
            READ
            ADYN=" "
            @22,2 SAY SPACE(75)
            @22,2 SAY 'ENTER  [C] CONFIRM & UPDATE [M] TO MODIFY <ESC> TO EXIT:=' GET ADYN PICT '!' VALID ADYN$('CM ')
            READ         
            IF ADYN="C"
                SELE E
                SET ORDER TO PMORD
                SEEK DCD
                  IF FOUND()
                      SELE E
                      GOOUT = " " 
                      DO WHILE .T.
                      IF RLOCK()
                         REPL E->SR WITH DSR
                         REPL E->PKVAL WITH DPKVAL
                         REPL E->STATUS WITH DSTATUS
                         REPL E->EXCESSQTY WITH DEXCESS
                         REPL E->UNITQTY WITH DUNIT                                                
                         UNLOCK 
                         flush
                         EXIT
                        ELSE
                           STOR " " TO GOOUT
                           DO ER_RLOC 
                        ENDIF    
                      ENDDO
                  ELSE
                      SELE E
                      APPE BLANK
                      GOOUT = " " 
                      DO WHILE .T.
                      IF RLOCK()
                         REPL E->PM WITH DCD
                         REPL E->SR WITH DSR
                         REPL E->PKVAL WITH DPKVAL
                         REPL E->STATUS WITH DSTATUS
                         REPL E->EXCESSQTY WITH DEXCESS
                         REPL E->UNITQTY WITH DUNIT                                                
                         UNLOCK 
                         flush
                         EXIT
                        ELSE
                           STOR " " TO GOOUT
                           DO ER_RLOC 
                        ENDIF    
                      ENDDO
                ENDIF        
         EXIT
         ENDIF
           
            IF ADYN="M"
               LOOP
            ENDIF   
            IF ADYN=" "
               EXIT
             ENDIF
    ENDDO   
  ENDIF
 CLEA
 LOOP
 ENDDO
   ************************
   PROCEDURE ER_RLOC
	@ 23,1 SAY SPACE(77)
	SET COLOR TO W+
	@ 23,1 SAY "SAME FILE/RECORD IS IN USE BY OTHER USER ....PRESS ANY KEY"
	SET COLOR TO
	UX = INKEY(0)
	@ 23,1 SAY SPACE(77)
	SET COLOR TO W+
	STOR " " TO GOOUT 
	@ 23,14 SAY "WAIT FOR SOME TIME AND PRESS ENTER TO TRY AGAIN : " GET GOOUT PICT "!"
	SET COLOR TO
	READ
	@ 23,1 SAY SPACE(77)
	IF GOOUT = " "
	   RETURN
	ELSE
	   RETURN
	ENDIF
	RETURN