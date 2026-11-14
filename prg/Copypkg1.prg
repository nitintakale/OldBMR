*** TO COPY PKG_MST TO TEMP FOR BPR PRINT MIM QTY FROM ADISALE PRODMAST
        STOR " " TO UVHYN
        CLEA
        @0,0 TO 24,78 DOUBLE
        GFILE=ALLTRIM(BGR)+ALLTRIM(EPS)+".DBF"
        IF FILE("&GFILE")
            SELE E
            USE &GFILE EXCLU
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
	SELE E
	USE
******************************  
         IF SA_EX="E"
                 USE PKG_MST 
                 COPY TO CPKG_MST FOR BATCH=VBNO .AND.(NAME1=SNAME .AND. NAME2=SNAME1) .AND. CIPORDNO=VCIPORD .AND. QUANTITY = VQTY .AND. CATEGORY =SA_EX 
                 USE
                 USE CPKG_MST EXCLU
                 INDE ON ITEM TAG SRPKG
                 INDE ON SR TAG SRCPKG
                 USE
                 SELE F
                 USE CPKG_MST ORDER SRPKG
                 SET FILT TO STATUS="Y" 
                 SELE G
                 USE &GFILE ORDER PMORD EXCLU
                 REPL ALL STATUS WITH " "
                 USE
                 SELE G
                 USE &GFILE ORDER PMORD SHARE
                 GO TOP
                 SELE F
              DO WHILE .NOT. EOF()
                 STORE F->ITEM TO FITEM
                 STORE F->CODE TO FCODE
                 SELE 19
                 USE CICDMNQT ORDER MNCD
                 SEEK FCODE
                 STORE CICDMNQT->STPACK TO CSTPK

                 USE
                 SELE G
                 GO TOP
                 SEEK FITEM
                 GOOUT = " " 
                 DO WHILE .T.
               IF RLOCK()
                 REPL G->STATUS WITH F->STATUS
                 REPL F->SR WITH G->SR
                 repl f->pkval with g->pkval
                 REPL F->UNITQTY WITH G->UNITQTY
                 REPL F->EXCESSQTY WITH G->EXCESSQTY
                 REPL F->MINQTY WITH CSTPK
                 UNLOCK 
                 flush
                 EXIT
             ELSE
                STOR " " TO GOOUT
                DO ER_RLOC 
             ENDIF    
           ENDDO
                 SELE F
                 SKIP
            ENDDO
        ENDIF
         IF SA_EX # "E"
                 USE PKG_MST
                 COPY TO CPKG_MST FOR (NAME1=SNAME .AND. NAME2=SNAME1) .AND. CATEGORY = SA_EX 
                 USE
                 USE CPKG_MST EXCLU
                 INDE ON ITEM TAG SRPKG
                 INDE ON SR TAG SRCPKG
                 USE
                 SELE F
                 USE CPKG_MST ORDER SRPKG
                 SELE G
                 USE &GFILE ORDER PMORD
                 SET FILT TO STATUS="Y" 
                 GO TOP
              DO WHILE .NOT. EOF()
                 STORE G->PM TO GPM
                 SELE F
                 GO TOP
                 SEEK GPM
                 STORE F->CODE TO FCODE
                 SELE 19
                 USE CICDMNQT ORDER MNCD
                 SEEK FCODE
                 STORE CICDMNQT->STPACK TO CSTPK
                 SELE CICDMNQT
                 USE
                 SELE F
                 GOOUT = " " 
                 DO WHILE .T.
               IF RLOCK()
                 REPL F->STATUS WITH G->STATUS
                 REPL F->SR WITH G->SR
                 repl f->pkval with g->pkval
                 REPL F->UNITQTY WITH G->UNITQTY
                 REPL F->EXCESSQTY WITH G->EXCESSQTY
                 REPL F->MINQTY WITH CSTPK
                 UNLOCK 
                 flush
                 EXIT
             ELSE
                STOR " " TO GOOUT
                DO ER_RLOC 
             ENDIF    
           ENDDO
                 SELE G
                 SKIP
            ENDDO
        ENDIF
            SELE F
            USE
            SELE G
            USE
            USE CPKG_MST EXCLU
            DELE ALL FOR SR=0
            DELE ALL FOR STATUS # "Y"
            PACK
            INDE ON SR TAG SRCPKG
            INDE ON ITEM TAG SRPKG
            USE
            CLEA
            DO SCRHEAD

          LN=10
          SELE A
          USE CPKG_MST ORDER SRCPKG    
          STORE SPACE(3) TO MVAR
          STORE SPACE(1) TO VN
          STOR " " TO UVHYN1    
DO WHILE .T.
       UVHYN1=" " 
  DO WHILE .T.
     SELE A
     DO WHILE .NOT. EOF()
         CNTR=LTRIM(STR(A->SR))
         AMQT='AMNQTY'+CNTR 
         ASTPK='ASTPACK'+CNTR 
         AEXQT='AEXQTY'+CNTR
         APMQT="APMQTY"+CNTR
         AITEM="AAITEM"+CNTR
        IF UVHYN # " "
       	     STORE A->UNITQTY    TO &AMQT
        	 STORE A->EXCESSQTY  TO &AEXQT
        	 STORE A->MINQTY     TO &ASTPK
       		 STORE A->PMQTY      TO &APMQT        
     	     STORE A->ITEM       TO &AITEM
        ELSE
	         SELE G
	         USE &GFILE ORDER SRORD
	         SEEK A->SR
	         STORE G->UNITQTY TO &AMQT
	         STORE G->EXCESSQTY TO &AEXQT
	         STORE A->ITEM TO &AITEM
	         SELE 21
	         USE CICDMNQT ORDER MNCD
	         SET FILT TO CIPLACODE= A->CODE
	         GO TOP
	         STORE CICDMNQT->STPACK TO &ASTPK
	         USE
	       ENDIF
*        ENDIF 
         SVAR=&AITEM
         SELE 18
         USE PKG_MST  ORDER ITEMPKG
         SET FILT TO ALLTRIM(NAME1)=SNAME .AND. ALLTRIM(NAME2)=SNAME1 .AND. ITEM=SVAR
         GO TOP
         IF EOF()
            VN="N"
          ENDIF   
         USE         
         SELE 20
         USE ITEM_MST ORDER ITEMNM
         SET FILT TO  ALLTRIM(CODE)=ALLTRIM(SVAR)
         GO TOP
         @LN,2 SAY ITEM_MST->NAME
         @LN,33 SAY ITEM_MST->UNIT
         IF VN="N"
              SET COLOR TO W+*/RG
              @LN,42 SAY '.ITEM FOR BPR NOT FOUND .'
              SET COLOR TO W+/B,W+/R
           ELSE
               @LN,40 SAY &AMQT PICT '999999'
               @LN,56 SAY &AEXQT PICT '999.99'
               @LN,64 SAY &ASTPK PICT '9999'
             IF UVHYN="N"
*               @LN,40 SAY &AMQT PICT '999999'
               @LN,56 GET &AEXQT PICT '999.99'
 *              @LN,64 SAY &ASTPK PICT '9999'
               READ
               SELE A
                 GOOUT = " " 
                 DO WHILE .T.
                 IF RLOCK()
                    REPL A->MINQTY WITH &AMQT
                    REPL A->EXCESSQTY WITH &AEXQT
                    REPL A->MINQTY WITH &ASTPK
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
            SELE A
            LN=LN+1                
            SKIP
            IF EOF()
                EXIT
            ENDIF    
        ENDDO
                    
          SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
          STOR " " TO UVHYN    
           IF UVHYN1 # "N"
               SET COLOR TO W+/N
               @ 23,12 SAY "ABOVE VALUES R CORRECT ?    SAY Y/N : " GET UVHYN PICT "!" VALID UVHYN $ "YN"
               READ
               SET COLOR TO W+/B,W+/R
             @ 23,1 SAY SPACE(77)
              IF UVHYN # "Y"
                 SELE A
                 GO TOP
                 LN=10
                 LOOP
              ELSE
                 EXIT
              ENDIF
       ELSE
                 STOR " " TO UVHYN    
                 SELE A
                 GO TOP
                 LN=10
                 LOOP
         ENDIF                 
   ENDDO 
       SELE 20
       USE
       IF SA_EX # "E"
                  SELE A
                  USE cpkg_mst EXCLU 
                  STOR " " TO GOOUT
               DO WHILE .T.
               IF FLOCK()
                 repl all batch with vbno
                 repl ALL quantity with vqty
                 repl ALL aditicode with vadcd
                 DELE ALL FOR CODE=SPACE(9)
                 SELE A
                 USE
                 FLUSH 
                 UNLOCK
                 EXIT  
               ELSE
                 STOR " " TO GOOUT 
                 DO ER_RLOC 
              ENDIF
         ENDDO
  ENDIF
  SELE G
  USE
  SELE F
  USE
  SELE A
  USE
*********************
  
      IF BGR="F"
       DO FPCAL
     ENDIF  
     CLEA
     DO SCRHEAD
     LN=10
     SELE A
     GO TOP
  
     DO WHILE .NOT. EOF()          
         SELE 20
         USE ITEM_MST ORDER ITEMNM
         SET FILT TO  ALLTRIM(CODE)=ALLTRIM(A->ITEM)
         GO TOP
         @LN,2 SAY ITEM_MST->NAME
         @LN,33 SAY ITEM_MST->UNIT     
         SELE 20
         USE
         SELE A
         @LN,40 SAY UNITQTY PICT '999999'
         @LN,56 SAY EXCESSQTY PICT '999.99'
         @LN,64 SAY MINQTY PICT '9999'     
         SET COLOR TO W+/GB
         @LN,70 SAY PMQTY PICT '9999999'     
         SET COLOR TO W+/B,W+/R    
         SELE A
         SKIP
         IF EOF()
             EXIT
        ENDIF    
         LN=LN+1
      ENDDO
             SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
             STOR " " TO UVHYN1    
             @23,2 SAY SPACE(76)
             SET COLOR TO W+/GB
             @ 23,12 SAY "ABOVE QUANTITY VALUES R CORRECT ?    SAY Y/N : " GET UVHYN1 PICT "!" VALID UVHYN1 $ "YN"
             READ
             SET COLOR TO W+/B,W+/R
             @ 23,1 SAY SPACE(77)
             IF UVHYN1 # "Y"
                SELE A
                GO TOP
                LN=10
                UVHYN="N"
                LOOP
         
            ELSE
               EXIT
            ENDIF

ENDDO
*****************************
PROC SCRHEAD
    @0,0 TO 23,78 DOUBLE
    @1,5 SAY 'FOLLOWING PACKING MATERIAL WILL BE PRINTED IN BPR AS PER SRNO'
    SET COLOR TO R+*/B
    @2,10  SAY 'FOR  ' +ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)      
    SET COLOR TO W+/B,W+/R
    @4,1 TO 22,78 DOUBLE
    LN=6
    @LN,2 SAY 'P.M.NAME'  
    @LN,40 SAY 'QTY '
    @LN,56 SAY 'EXCESS'
    @LN,64 SAY 'STD.'
    
    LN=LN+1
    @LN,40 SAY '/VIAL/UNIT '
    @LN,56 SAY 'QTY IN%'
    @LN,64 SAY '(PACK)'
    @LN,69 SAY 'QUANTITY'
    LN=LN+1
    @LN,40 SAY 'TO BE ISSUED'
    
    LN=LN+1
    @LN,1  TO LN,78  DOUBLE
    LN=LN+1


*********************
PROC FPCAL
STORE SPACE(4) TO VPG,VPG1
STORE 0 TO XVPG
STORE 0 TO VEXPG1
SELE A
USE CPKG_MST ORDER SRCPKG
LOCATE FOR ITEM="OUTERCART"
IF FOUND()
   OC="Y"
ENDIF
SELE A
GO TOP

DO WHILE .NOT. EOF()
           STORE 0 TO TEMPVAR,TEMPVAR1
           VPG=A->PKVAL
           IF ITEM="LABELPRIT"
               IF OC= "Y"
                  TEMPVAR1=(A->QUANTITY/VUNITSOC)
                ENDIF

               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               T1=TEMPVAR+TEMPVAR1
               T2=T1+(T1*(A->EXCESSQTY/100))
               T2=T2/A->MINQTY
               IF A->QUANTITY<25000
                   T3=CEILING(T2)
               ELSE
                   T3=ROUND(T2,0)
                ENDIF   
               
               T4=T3*A->MINQTY
               &VPG=T4        
           ENDIF
             IF ITEM="INNERCART"
               IC="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
              
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*A->MINQTY
                &VPG=TEMPVAR        
           ENDIF
            IF ITEM="PLASDROST"
                DROP="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               IF A->QUANTITY<50000
                  TEMPVAR=CEILING(TEMPVAR)
                ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
               TEMPVAR=TEMPVAR*A->MINQTY
               &VPG=TEMPVAR        
             ENDIF     
             IF ITEM = "ENCLOSURE"
                ENCLO="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
           
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
             IF A->QUANTITY<50000
               TEMPVAR=CEILING(TEMPVAR)
             ELSE
               TEMPVAR=ROUND(TEMPVAR,0)
             ENDIF  
               TEMPVAR=TEMPVAR*A->MINQTY
               &VPG=TEMPVAR        
      ENDIF     
            IF ITEM="OUTERCART"
                  OC="Y"
                  TEMPVAR= (A->QUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
            ENDIF
            IF ITEM="SHWRAPFIL"
               S_W_FILM="Y"
              
               A=(QUANTITY/VUNITSOC)
               B=A*(UNITQTY)
               C=B*(EXCESSQTY/100)
               C=CEILING(C)
               &VPG=C        
            ENDIF    
           IF ITEM="SHIP5CORU"
              SHIP5="Y"
              TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
              TEMPVAR=CEILING(TEMPVAR)
              &VPG=TEMPVAR        
           ENDIF
           IF ITEM="SHIP7CORU" .OR. ITEM="SHIP7LAMI"
               SHIP7="Y"
               TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
               TEMPVAR=CEILING(TEMPVAR)    
                &VPG=TEMPVAR        
           ENDIF
           IF ITEM="BOPP_TAPE"
              BTAPE="Y"
              TEMPVAR=0
              &VPG=TEMPVAR        
           ENDIF
           SKIP
           IF EOF()
               EXIT
           ENDIF
       ENDDO    
    
              SELE A
              SET FILT TO STATUS="Y" 
              GO TOP
           DO WHILE .NOT. EOF()
                 PG=A->PKVAL
                 REPL A->PMQTY WITH  &PG
                 SELE A
                 SKIP
            ENDDO
            SELE A
            GO TOP
RETU             
  
