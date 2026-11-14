*** TO COPY PKG_MST TO TEMP FOR BPR PRINT MIM QTY FROM ADISALE PRODMAST

                SAVE TO DEF ALL LIKE *LIMIT
                RELEASE ULIMIT,LLIMIT

                SAVE TO MNO ALL LIKE QT*
                RELEASE ALL LIKE QT*               
               
                SAVE TO GHI ALL LIKE VSQTY*
                RELEASE VSQTY1,VSQTY2,VSQTY3
               
                SAVE TO JKL ALL LIKE PG*
                RELEASE ALL LIKE PG*
                               
                SAVE WINDOWS ALL TO temp
                CLEAR WINDOWS
        
                DO CICDMNQTY        
                STOR " " TO UVHYN
                STORE SPACE(8) TO USERNM1
                CLEA
                @0,0 TO 24,78 DOUBLE
             	SELE E
        	    USE
******************************  

         IF SA_EX="E"
              
              *SET TALK ON
              *SET STEP ON
              *SET ECHO ON
                 USE PKG_MST 
                 IF CLUBBPR="Y"
                     SET FILT TO BATCH=VBNO .AND.(NAME1=SNAME .AND. NAME2=SNAME1)  .AND. CATEGORY =SA_EX .AND. STATUS="C"
                     GO TOP
                     COPY TO CPKG_MST FOR BATCH=VBNO .AND.(NAME1=SNAME .AND. NAME2=SNAME1)  .AND. CATEGORY =SA_EX .AND. STATUS="C"
                 ELSE
                     SET FILT TO BATCH=VBNO .AND.(NAME1=SNAME .AND. NAME2=SNAME1) .AND. CIPORDNO=VCIPORD .AND. QUANTITY = VQTY .AND. CATEGORY = SA_EX 
                      GO TOP
                      COPY TO CPKG_MST FOR BATCH=VBNO .AND.(NAME1=SNAME .AND. NAME2=SNAME1) .AND. CIPORDNO=VCIPORD .AND. QUANTITY = VQTY .AND. CATEGORY = SA_EX 
                 ENDIF 
                  SELE PKG_MST
                  REPL ALL BPRSRNO WITH VBPRSR
                  USE
                  USE CPKG_MST EXCLU
                  *BROW
                  *SET TALK ON
                  *SET STEP ON
                  *SET ECHO ON
                  REPL ALL STATUS WITH 'Y'
                  INDE ON ITEM TAG SRPKG
                  INDE ON SR TAG SRCPKG
              IF CLUBBPR="Y"
                 SET UNIQUE ON
                 INDE ON NAME1+NAME2+BATCH+STR(QUANTITY)+CATEGORY TAG CPKGBQC
                 SET UNIQUE OFF
               ENDIF
                 USE
                 SELE F
                 USE CPKG_MST 
                 SET FILT TO STATUS="Y" 
                 GO TOP
                 SELE G
                 USE &GFILE ORDER PMORD EXCLU
                 REPL ALL STATUS WITH " "
                 USE
                 SELE G
                 USE &GFILE ORDER PMORD SHARE
                 GO TOP
                 SELE CPKG_MST
              DO WHILE .NOT. EOF()
                 STORE F->ITEM TO FITEM
                 STORE F->CODE TO FCODE
                 SELE 19
                 USE CICDMNQT ORDER MNCD
                 SEEK ALLTRIM(FCODE)
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
                    IF SA_EX="E"
                       IF G->CATEGORYVL>0
                           REPL F->UNITQTY WITH G->CATEGORYVL
                       ELSE
                          REPL F->UNITQTY WITH G->UNITQTY
                       ENDIF
                    ELSE
                       REPL F->UNITQTY WITH G->UNITQTY
                    ENDIF
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
                 LN=1
                 COL=1
                 SET COLOR TO R+/B    
                 @LN,COL SAY '*'                           
                 SET COLOR TO W+/B,W+/R    
                 USE PKG_MST
                 SET FILT TO (ALLTRIM(NAME1)=ALLTRIM(SNAME) .AND. ALLTRIM(NAME2)=ALLTRIM(SNAME1)) .AND. CATEGORY = SA_EX 
                 GO TOP
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
*                 SET FILT TO STATUS="Y" 
                 GO TOP
                 SET COLOR TO R+/B    
                 @LN+3,COL+10 SAY '*'                           
                 SET COLOR TO W+/B,W+/R    
                 LN=8
                 COL=20
              DO WHILE .NOT. EOF()
                 STORE G->PM TO GPM
                 STORE G->STATUS TO GSTATUS
                 SELE F
                 GO TOP
                 SEEK GPM
                 STORE F->CODE TO FCODE
                 SELE 19
                 USE CICDMNQT ORDER MNCD
                 SEEK ALLTRIM(FCODE)
                 STORE CICDMNQT->STPACK TO CSTPK
                 SELE CICDMNQT
                 USE
                 SELE F
                 GOOUT = " " 
                 SET COLOR TO R+/B
                 @LN,COL SAY '*'                           
                 SET COLOR TO W+/B,W+/R    
                 DO WHILE .T.
               IF RLOCK()
                 REPL F->STATUS WITH G->STATUS
                 REPL F->SR WITH G->SR
                 repl f->pkval with g->pkval
                IF G->CATEGORYVL>0
                   REPL F->UNITQTY WITH G->CATEGORYVL
                ELSE
                   REPL F->UNITQTY WITH G->UNITQTY  
               ENDIF
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
           LN=LN+5
           COL=COL+10
           IF COL>77
             COL=1
           ENDIF
           IF LN>20
              LN=1
           ENDIF     
           ENDDO
   ENDIF
            RELEASE COL
            SET COLOR TO W+/B,W+/R    
            SELE F
            USE
            SELE G
            USE
            SELE 20
            USE ITEM_MST ORDER ITEMNM
            @1,1 CLEA TO 22,77
            @5,2 TO 22,77 DOUBLE
            SET COLOR TO W+/GR
            @3,3 SAY '... CONFIRM PACKING MATERIAL FOR  BPR OF '+ ALLTRIM(SNAME) +' '+ALLTRIM(SNAME1)+'..'
            LN=8
            SET COLOR TO W+/B,W+/R    
                 SELE G
                 USE CPKG_MST EXCLU
                 SET UNIQUE ON
                 INDE ON LTRIM(STR(SR))+CODE+ITEM TAG UNICPK
                 SET UNIQUE OFF
                 USE
                 USE CPKG_MST ORDER UNICPK
                 GO TOP
                 IF EOF()
                     @15,4 SAY SPACE(70)
                     @15,4  SAY '....NO PACKING MATERIAL FOUND.....IN PKG_MST.DBF'
                     WAIT
                     CLOSE DATA
                     RETU
                  ENDIF                   
                  yn=" "
 do while .t.
     SELE G
     DO WHILE .NOT. EOF()          
         SELE 20
         SET FILT TO  ALLTRIM(CODE)=ALLTRIM(G->ITEM)
         GO TOP
         @LN,3 SAY ITEM_MST->NAME
         @LN,34 SAY ITEM_MST->UNIT     
         SELE G
         @LN,46 SAY '[Y / N ]'
         @LN,41 GET STATUS PICT '!' VALID STATUS$('YN')
         @LN,56 SAY CODE
       IF YN ='N'   
         READ
       ENDIF
         SET COLOR TO W+/B,W+/R    
         SELE G
         SKIP
         IF EOF()
             EXIT
          ENDIF    
         LN=LN+1
         IF LN>20 
            SET COLOR TO W+/BR  
            @23,1 SAY 'PRESS ANY KEY  FOR NEXT SCREEN....'
            SET COLOR TO W+/B,W+/R  
            READ VALID LASTKEY()#27
            @8,2 CLEA TO 23,77
            LN=8
            LOOP
          ENDIF  
    ENDDO

      @23,1 SAY 'CONFIRM STATUS OF ALL ABOVE P.M.? (Y/ N )' GET YN PICT '!' VALID YN$('YN')
      READ
      IF YN="Y"
         EXIT
      ELSE
           LN=8
           SELE G
           GO TOP
           LOOP
      ENDIF
    ENDDO   
     release yn
      SELE G
*     BROW
*     SET TALK ON
*     SET ECHO ON
*     SET STEP ON
      USE
      SELE G
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
            USE CPKG_MST  ORDER UNICPK 
            STORE SPACE(3) TO MVAR
            STORE SPACE(1) TO VN
            STOR " " TO UVHYN1,UVHYN    
            SET ESCAPE OFF
DO WHILE .T.
  UVHYN1=" " 
  DO WHILE .T.
     SELE A
     GO TOP
*   SET TALK ON
*   SET STEP ON
*   SET ECHO ON
     DO WHILE .NOT. EOF()
         CNTR=LTRIM(STR(A->SR))
         AMQT='AMNQTY'+CNTR 
         ASTPK='ASTPACK'+CNTR 
         AEXQT='AEXQTY'+CNTR
         APMQT="APMQTY"+CNTR
         AITEM="AAITEM"+CNTR
         ACODE="AACODE"+CNTR
        IF UVHYN # " "
       	     STORE A->UNITQTY    TO &AMQT
        	 STORE A->EXCESSQTY  TO &AEXQT
        	 STORE A->MINQTY     TO &ASTPK
       		 STORE A->PMQTY      TO &APMQT        
     	     STORE A->ITEM       TO &AITEM
             STORE A->CODE       TO &ACODE
        ELSE
	         SELE G
	         USE &GFILE ORDER SRORD
	         SET FILT TO G->PM=A->ITEM .AND. G->SR=A->SR
              GO TOP
                IF G->CATEGORYVL=0
        	         STORE G->UNITQTY TO &AMQT
                ELSE
          	         STORE G->CATEGORYVL TO &AMQT
               ENDIF
	         STORE G->EXCESSQTY TO &AEXQT
	         STORE A->ITEM TO &AITEM
             STORE A->CODE TO &ACODE
	         SELE 21
	         USE CICDMNQT ORDER MNCD
             SET FILT TO CIPLACODE= A->CODE
	         GO TOP
	         STORE CICDMNQT->STPACK TO &ASTPK
	         USE
	       ENDIF
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
         @LN,2 SAY SUBSTR(ITEM_MST->NAME,1,25)
         @LN,33 SAY ITEM_MST->UNIT
     
      IF VN="N"
              SET COLOR TO W+*/RG
              @LN,42 SAY '.ITEM FOR BPR NOT FOUND .'
              SET COLOR TO W+/B,W+/R
           ELSE
               @LN,27 SAY &ACODE PICT '!!!!!!'
               @LN,40 SAY &AMQT PICT '999999'
               @LN,56 SAY &AEXQT PICT '999.99'
               @LN,64 SAY &ASTPK PICT '9999'
             IF UVHYN="N"
               @LN,27 SAY &ACODE PICT '!!!!!!'
               @LN,40 get &AMQT PICT '999999'
               @LN,56 GET &AEXQT PICT '999.99'
               @LN,64 get &ASTPK PICT '9999'
               READ 
              ENDIF     
                 SELE A
                 GOOUT = " " 
                 DO WHILE .T.
                 IF RLOCK()
                    REPL A->UNITQTY WITH &AMQT
                    REPL A->EXCESSQTY WITH &AEXQT
                    REPL A->MINQTY WITH &ASTPK
                    flush
                    UNLOCK 
                    FLUSH
                    EXIT
                 ELSE
                    STOR " " TO GOOUT
                    DO ER_RLOC 
                 ENDIF    
                ENDDO
           ENDIF
            SELE A
            LN=LN+1                
             IF LN>22
                @23,1 SAY 'PRESS ANY KEY FOR NEXT SCREEN...'
                READ VALID LASTKEY()#27
                @10,2 CLEA TO 22,77
                LN=10
                LOOP
             ENDIF   
             SKIP
             IF EOF()
                 EXIT
             ENDIF    
          ENDDO
          SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
          STOR " " TO UVHYN    
*SET TALK ON
*SET STEP ON
*SET ECHO ON
          IF UVHYN1 # "N"
               SET COLOR TO W+/N
               @ 23,12 SAY "ABOVE VALUES R CORRECT ?    SAY Y/N : " GET UVHYN PICT "!" VALID UVHYN $ "YN"
               READ 
               SET COLOR TO W+/B,W+/R
              @ 23,1 SAY SPACE(77)
         IF UVHYN # "Y"
                SAVE TO ABC ALL LIKE RM*
                RELEASE RM1,RM2,RM3,RM4,rm5,rm6,RM7,RM8,RM9,RM10,RM11,RM12,RM13,RM14,RM15
                STORE USERNAME TO  USERNM1
                SAVE SCREEN TO AAA
                STORE SPACE(1) TO UCON,VVV
                  	IF (ALLTRIM(USERNAME)= "NAHID" .OR.  ALLTRIM(USERNAME)= "JEMINI")
                       UCON="N"
                    ELSE
                       UCON="Y"
                    ENDIF  
    
                IF UCON="Y"
                     DO WHILE .T.
                       DO XXX
                       IF ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)='JEMINI'
                             EXIT
                       ELSE  
                           @23,1 SAY 'NO AUTHORITY TO CHANGE VALUES...DEPT HEAD IS NEEDED..[ESC] TO CANCEL ELSE  PRESS ANY KEY' GET VVV PICT '!'
                           READ
                           IF VVV = " "
                               CLOS DATA
                               RETU
                           ELSE    
                               STOR "N" TO UVHYN    
                               SELE A
                               GO TOP
                               LN=10
                               LOOP
                       ENDIF
                       ENDIF
                   ENDDO     
                   STORE USERNM1 TO USERNAME
                   REST SCREEN FROM AAA
                   REST FROM JKL ADDI
                ENDIF          
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
                  USE cpkg_mst ORDER UNICPK EXCLU 
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
  SET ESCAPE ON
  REST FROM JKL ADDI


  DO FFPCAL
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
         @LN,27 SAY CODE PICT '!!!!!!'
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
            IF LN>22
                @23,1 SAY 'PRESS ANY KEY FOR NEXT SCREEN...'
                READ VALID LASTKEY()#27
                @10,2 CLEA TO 22,77
                LN=10
             ENDIF   
      ENDDO
             SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
             STOR " " TO UVHYN1    
             @23,2 SAY SPACE(76)
             SET COLOR TO W+/GB
             @ 23,12 SAY "ABOVE QUANTITY VALUES R CORRECT ?    SAY Y/N : " GET UVHYN1 PICT "!" VALID UVHYN1 $ "YN"
             READ VALID LASTKEY()=13
             SET COLOR TO W+/B,W+/R
             @ 23,1 SAY SPACE(77)
             IF UVHYN1 # "Y"
                STORE SPACE(1) TO UCON
                  	IF (ALLTRIM(USERNAME)= "NAHID" .OR.  ALLTRIM(USERNAME)= "JEMINI")
                       UCON="N"
                    ELSE
                       UCON="Y"
                    ENDIF  
                 IF UCON="Y"

                SAVE TO DEF ALL LIKE *LIMIT
                RELEASE ULIMIT,LLIMIT
               
                SAVE TO GHI ALL LIKE VSQTY*
                RELEASE VSQTY1,VSQTY2,VSQTY3
               
                SAVE TO JKL ALL LIKE PG*
                RELEASE ALL LIKE PG*
               
                SAVE TO MNO ALL LIKE QT*
                RELEASE ALL LIKE QT*
                               
                SAVE WINDOWS ALL TO temp
                CLEAR WINDOWS

                STORE USERNAME TO  USERNM1
                SAVE SCREEN TO AAA

                 DO WHILE .T.
                       DO XXX
                       IF ALLTRIM(USERNAME)="NAHID" .OR. ALLTRIM(USERNAME)='JEMINI'
                             EXIT
                       ELSE  
                           @23,1 SAY 'U R NOT ALLOWED TO CHANGE VALUES...DEPT HEAD IS NEEDED..PRESS ENTER KEY'
                           READ VALID LASTKEY()=13
                           STOR "N" TO UVHYN    
                           SELE A
                           GO TOP
                           LN=10
                           LOOP
                       ENDIF
                   ENDDO     
                   STORE USERNM1 TO USERNAME
                   REST SCREEN FROM AAA
                   REST FROM JKL ADDI
             ENDIF
                SELE A
                GO TOP

                LN=10
                UVHYN="N"
                LOOP
            ELSE
               EXIT
            ENDIF

ENDDO
    RELEASE USERNM1,MVAR,uvhyn1
*****************************
PROC SCRHEAD
    @0,0 TO 23,78 DOUBLE
    @1,5 SAY 'FOLLOWING PACKING MATERIAL WILL BE PRINTED IN BPR AS PER SRNO'
    SET COLOR TO W+/N
    IF SA_EX="E"
       IF CLUBBPR="Y"
           @2,10  SAY ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)+'  FOR CLUB ORDERS  :=  '
       ELSE
           @2,10  SAY ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)+'  FOR ORDER NO:=  '+LTRIM(VCIPORD)      
       ENDIF    
    ELSE
       @2,10  SAY ALLTRIM(SNAME)+' '+ALLTRIM(SNAME1)
    ENDIF
    @3,10  SAY 'FOR  QUANTITY  :=' +LTRIM(STR(VQTY))
    SET COLOR TO W+/B,W+/R
    @4,1 TO 22,78 DOUBLE
    LN=6
    @LN,2 SAY 'P.M.NAME'  
    @LN,40 SAY 'NO OF UNITS'
    @LN,56 SAY 'EXCESS'
    @LN,64 SAY 'STD.'
    
    LN=LN+1
    @LN,40 SAY '(STD.)'
    @LN,56 SAY 'QTY IN%'
    @LN,64 SAY '(PACK)'
    @LN,69 SAY '  QTY. '
    LN=LN+1
    @LN,40 SAY 'IN P.M.'
   
    LN=LN+1
    @LN,1  TO LN,78  DOUBLE
    LN=LN+1
    RELEASE VBDIR,BB,JJ,P_YR,USEALHT,LSEALHT
*********************
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
 PROC CICDMNQTY
 STORE SPACE(5) TO VBDIR
 STORE 0 TO ENO,MNO
         REST FROM \DBASE\ADISALE\EXPORT\PRODYR.MEM ADDI
         STORE P_YR TO VBDIR  
         STOR "\DBASE\ADISALE\"+VBDIR TO XPAT1
         FLC = XPAT1+"\CODENO"
         REST FROM &FLC ADDI
         STOR "CD_RW"+"_ENO" TO EENO
         STOR "CD_PG"+"_ENO" TO MENO
         ENO = &EENO
         MNO = &MENO
         STOR "\DBASE\ADISALE\"+VBDIR+"\"+"PRODMAST" TO XPAT
         SELE A
         USE &XPAT
         SET ORDER TO PCODE
*        SET FILT TO CODE>21000 .AND. CODE<30000
         SET FILT TO ((CODE > ENO .AND. CODE <= MNO).OR. CODE=10856 .OR. CODE=10917 .OR. CODE=10732.OR. CODE=10756 .OR. CODE=122 .OR. CODE=146 .OR. CODE=210)
         GO TOP
         SELE B
         USE \DBASE\BMR\CICDMNQT.DBF EXCLU
         ZAP
         SET ORDER TO MNCD
         N=1
DO WHILE N<=5
     JJ='CIPLACODE'+LTRIM(STR(N)) 
     SELE A
     GO TOP      
DO WHILE .NOT. EOF()
     BB=A->&JJ
     BB=ALLTRIM(BB)
     IF BB #"NIL" .AND. LEN(BB)>0
        SELE B
        SEEK BB
        IF .NOT. FOUND()
          APPE BLANK
          REPL B->ADITICODE WITH A->CODE
          REPL B->CIPLACODE WITH BB
          REPL B->STPACK WITH A->STPACK
       ENDIF  
    ENDIF
    SELE A
    SKIP
ENDDO   
N=N+1
IF N>5
   EXIT
ENDIF
ENDDO   
CLOSE DATA
