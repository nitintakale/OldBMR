*****BPR CANCELLATION 
CLOSE DATA
@23,1 SAY SPACE(78)
DO WHILE .T.
         @23,10 say '1st 5 characters of Product Name for BPR Cancellation:='get CIPNAME pict '!!!!!'
         READ
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
         if cipname=space(5)
            SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
            retu
         endif    
         sele B
         USE PRODMAST ORDER PN12
         set filt to CIPNAME$NAME1 .AND. COMPANY=VNAME
         go top
         IF EOF()
           SET COLOR TO W+/G
           @22,2  SAY '......ITEM FOR  COMPANY '+VNAME+'  DOES NOT EXIST.....PRESS ANY KEY TO ENTER NEXT '
           SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
           LOOP
          ELSE
             EXIT
          ENDIF  
         SET COLOR TO R+/B,W+/G
	     define window temp from 15,1 to 22,75
	     define popup s_list from 15,1 to 22,75 prompt fields LTRIM(name1)+" "+LTRIM(name2)+ "   " +Ltrim(company)+" "+ltrim(category)+" "+LTRIM(TYPE)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
	     activate window temp
	     @0,0 get sname popup s_list
         read valid lastkey() = 13 .OR. LASTKEY()=27
   	     deactivate window temp
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	     IF LASTKEY()=27
	          CLOSE DATA
	          RELEASE ALL
         	  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
              RETU
         ELSE
              EXIT
         ENDIF
        ENDDO
            CLEA
             SNAME   = B->NAME1
             SNAME1  = B->name2
                  @2,5 SAY '........SELECT BPR SRNO TO CANCEL FROM FOLLOWING LIST ...........'
      	          SELE 25
      	          USE BPRDATA ORDER DATASR
          	      SET FILT TO CANCELLED #"Y" .AND. (NAME1=SNAME .AND. NAME2=SNAME1)
          	      GO TOP
          	      define window temp from 3,2 to 22,77
           	      define popup s_list from 4,2 to 22,76 prompt fields SUBSTR(BPRSRNO,1,6)+" "+SUBSTR(name1,1,12)+ " " +SUBSTR(NAME2,1,25)+' '+LTRIM(KEY)+' '+SUBSTR(batchno,1,7)+' '+SUBSTR(CIPORDNO,1,15)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
	              activate window temp
        	      @0,0 get VBPRSR popup s_list
                  read valid lastkey() = 13 .OR. LASTKEY()=27
   	              deactivate window temp
                  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
         	     IF LASTKEY()=27
         	          CLOSE ALL
    	              RELEASE ALL
                 	  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                      RETU
                ENDIF
      	           VBPRSR=ALLTRIM(BPRDATA->BPRSRNO)
                   USE
                   CLEA               	         
       	           SELE B
       	           USE BPRDATA ORDER DATASR EXCLU
       	           SEEK (VBPRSR)
                   VSRNO       =B->SRNO
                   VBNO        =B->BATCHNO
                   BGR         = B->BPRGROUP 
                   VADCD       = B->ADITICODE
                   SNAME       = B->NAME1
                   SNAME1      = B->name2
                   PNAME       = trim(B->name1)+'  '+trim(B->name2)
                   GNAME       = B->gen_name
                   VNAME       = B->COMPANY
                   REPL B->CANCELLED WITH "Y"
                   DELE 
                   SELE C
                   USE STOREBPR
                   REPL ALL CANCELLED WITH "Y" FOR BPRSRNO=VBPRSR
                   SELE C
                   USE
                   SELE C
                   USE PKG_MST EXCLU
                   DELE ALL FOR  SRNO=VSRNO .AND. BATCH=VBNO
                   PACK
                   USE
                   SELE C
                   USE CBBPR
                   REPL ALL CANCELLED WITH "Y" FOR BPRSRNO=VBPRSR
                   USE
                   SELE C
                   USE \DBASE\ADISALE\EXPORT\BATALOTD EXCLU
                   SET FILT TO (SRNO=VSRNO .AND. BATCH=VBNO .AND. ADITICODE=VADCD)
                   GO TOP
                   REPL ALL BPRAPPROVE WITH " "
                   CLOSE DATA
                 
                  CLEA
                  @15,10 SAY       '   C A N C E L L E D    '
                  @20,1 SAY ' '
                  WAIT
                  =INKEY(0)
                                 
                                 
                       
                       
                       
                       
                       
                       
                                 