 *------------------BPR START
       IF AS='A'
            SELE C
            USE BPRNO
            GO TOP
            VBPRSR=C->BPRSRNO
            LBPR=LEN(ALLTRIM(C->BPRSRNO))
            STORE SUBSTR(C->BPRSRNO,1,(LBPR-3)) TO VBPRSRNO
            STORE SUBSTR(C->BPRSRNO,(LBPR-1),2) TO VBPRYEAR
            STORE BPRSRNO TO VBPRSR 
            VBPRSRNO=VAL(VBPRSRNO)
            SELE C
            USE
              CLEA
              @0,0 TO 23,78 DOUBLE
              @10,5 SAY '[S] FOR SALE/SAMPLE [E] FOR EXPORT [P] FOR P.S. ' GET SA_EX PICT '!' VALID SA_EX$('PES')
    		  READ
              IF SA_EX="P"
                 EPS='PS'
              ENDIF   
              IF SA_EX="S"
                 EPS='SALE'
              ENDIF     
              IF SA_EX="E"
                  EPS='EXPORT'
              ENDIF
                 DO BPRCAL                 
                 IF VBNO=SPACE(7)
      	    	     RETU
   	             ENDIF
                 *do todate
                 CLEA
   	             IF VBPR='Q'
                    CLOSE ALL
                    RETU
                 ENDIF   
                   
  		          DO WHILE .T.
                      SET PROC TO ADIHEAD
                      DO PRINTOPT
                      IF OPT=0
                          CLOSE ALL
                          RETU
                       ENDIF   
                      IF OPT=1
                         CLEA
                         @15,5 SAY '------  N O   S C R E E N  VIEW-----'
                         WAIT
                        LOOP
                      ENDIF  
                   EXIT
                ENDDO
        		   pno=1
		           VPG=space(4)
                   SELE D
                   USE BPRPG ORDER PGTYPE
                   SEEK BGR
           do while PNO<=10
                   mno=ltrim(str(pno))
                   VPG='BPR_PG'+MNO
                   SELE D
                IF LEN(ALLTRIM(&VPG))>0
                  PPAGE=&VPG
                  DO &PPAGE
                  PNO=PNO+1
                  IF PNO>10
                    EXIT
                   ENDIF
              ELSE
                   PNO=PNO+1
                   IF PNO>10
                      EXIT
                   ENDIF
               ENDIF
       ENDDO  
      SELE D
      USE
      IF OPT=2
                      EJECT
				      SET PRINT OFF
				      SET PRINTER TO
				      SET DEVI TO SCREEN
     
              SELE C
              use batch_no order bno
	          seek vbno
	          GOOUT = " " 
             DO WHILE .T.
              IF RLOCK()
     	           repl bpr        with 'Y'
                   repl company    with vname
	               REPL ADITICODE  WITH  VADCD
                   REPL LABLMFGDT  WITH VLMFGDT
                   REPL CARTMFGDT  WITH VCMFGDT
                   REPL LABLEXPDT  WITH VLEXPDT
                   REPL CARTEXPDT  WITH VCEXPDT
	               UNLOCK 
                   EXIT
             ELSE
                   STOR " " TO GOOUT
                   DO ER_RLOC 
             ENDIF    
           ENDDO    
            SELE C
            USE
            SELE C
            USE
            CBM=1
            IF SA_EX="S"
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
                REPL QUANTITY WITH VQTY
                REPL BATCH WITH VBNO
                REPL ADITICODE WITH VADCD
	            REPL KEY WITH 'S'
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
            IF SA_EX="E"
                SELE CBBPR
                USE
                SELE C
                USE CBBPR EXCLU
                SET FILT TO BPRSRNO=VBPRSR .AND. BATCH=VBNO  
                GO TOP
               * REPL ALL SRNO WITH 
                COUNT TO CBM            
                SUM QUANTITY TO CLQTY
                SELE C
                USE
            ENDIF
            SELE C
            USE BPRDATA EXCLU
            GO TOP
            LOCATE FOR BATCHNO=VBNO .AND. BPRSRNO=VBPRSR
            IF .NOT. FOUND()
	            APPEND FROM PRODMAST FOR NAME1=SNAME .AND. NAME2=SNAME1
	            GO BOTT
	            REPL BPRSRNO WITH VBPRSR
                REPL SRNO WITH VASRNO 
                REPL BPRGENNM WITH VBPRGENNM
            ENDIF   
            IF CBM=1
                REPL CIPORDNO WITH VCIPORD
            ENDIF
            IF CBM >1
                REPL CIPORDNO WITH 'CLUBBED '+LTRIM(STR(CBM))+ '  ORDERS'
            ENDIF
	            REPL KEY WITH SA_EX
	            REPL BATCHNO WITH VBNO 
	            REPL INCARTVAL WITH VINCARTVAL
	            REPL OUTCARTVAL WITH VOUTCART 
	            REPL UNITSINOC WITH VUNITSOC
	            VSHIP=VUNITSOC*VOUTCART*VINCARTVAL
	            REPL SHIPPERVAL WITH VSHIP
	            REPL MFG_LIC_NO WITH VMFG
	            REPL MMFNO WITH VMMFNO
	            REPL LOGO WITH VLOGO
                REPL LABLMFGDT  WITH VLMFGDT
                REPL CARTMFGDT  WITH VCMFGDT
                REPL LABLEXPDT  WITH VLEXPDT
                REPL CARTEXPDT  WITH VCEXPDT
                REPL MFGDATE    WITH VMFGDATE1  
                REPL EXPDATE    WITH VEXPDATE1  
                SELE C
	            USE STOREBPR EXCLU
	            DELE ALL FOR (BPRSRNO=VBPRSR .AND. BATCHNO=VBNO)
                PACK
                use
                sele c
                use storebpr share
                GO TOP
	            IF .NOT. EOF()
    	             GO BOTT
    	             STORE RECNO() TO VREC 
    	        ENDIF
        	    IF EOF()
            	  VREC=0
  	            ENDIF   
    	        IF VREC=0  
        	       SET FILT TO RECNO()>=VREC
            	   GO TOP
	            ELSE
    	           SET FILT TO RECNO()>VREC
        	       GO TOP
	            ENDIF
	            SELE C
	            APPEND FROM CPKG_MST 
	            SELE C
	            GO TOP
    	        IF VREC=0  
        	        REPL ALL BPRSRNO WITH VBPRSR FOR RECNO()>=VREC
            	     REPL ALL SRNO WITH VASRNO 
            	   GO TOP
	            ELSE
    	            REPL ALL BPRSRNO WITH VBPRSR FOR RECNO()>VREC
                    REPL ALL SRNO WITH VASRNO 
        	       GO TOP
	            ENDIF
	            REPL ALL BPRSRNO WITH VBPRSR
                REPL ALL SRNO WITH VASRNO 
                IF CBM>1
                   REPL ALL QUANTITY WITH CLQTY
                ENDIF   
	            SELE C              
	            USE
	            VBPRSRNO=VBPRSRNO+1
	            MBPRSRNO=STR(VBPRSRNO)+'/'+VBPRYEAR
	            SELE C
	            USE BPRNO
	            GO TOP
	            REPL BPRNO->BPRSRNO WITH ALLTRIM(MBPRSRNO)
	            SELE C
	            USE
	       ENDIF           
				      SET PRINT OFF
				      SET PRINTER TO
				      SET DEVI TO SCREEN
                      REST FROM ABC ADDI
     ENDIF   && AS="A"
*---------*****************************-----------------------
         IF  AS='S'
      	          CLEA
                  @2,5 SAY '........SELECT BPR SRNO FROM FOLLOWING LIST ...........'
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
       	           USE BPRDATA ORDER DATASR
       	           SEEK ALLTRIM(VBPRSR)
                   VBNO        =B->BATCHNO
                   BGR         = B->BPRGROUP 
                   VADCD       = B->ADITICODE
                   VMMFNO      = B->MMFNO
                   VFORMU_CODE = B->FORMU_CODE
                   VBPRCODE    = B->BPRCODE
                   SNAME       = B->NAME1
                   SNAME1      = B->name2
                   VVERSION    = B->VERSION
                   VOLVIAL     = B->FILLVOLUME
                   VCONVRATE   = B->RATE
                   VCODE       = B->CODE
                   VSQTY1      = B->STDQTY1
                   VSQTY2      = B->STDQTY2
                   VSQTY3      = B->STDQTY3
                   vsealht     = b->sealht
                   vlogo       = B->logo
                   vmfg        = B->mfg_lic_no
                   vemfg       = B->export_lic
                   vmrp        = B->mrp
                   PNAME       = trim(B->name1)+'  '+trim(B->name2)
                   GNAME       = B->gen_name
                   VTYPE       = B->TYPE 
                   AT          = B->TYPE
                   VEXPIRY     = B->EXPIRY 
                   VOUTCART    = B->OUTCARTVAL
                   VUNITSOC    = B->UNITSINOC
                   VINCARTVAL  = B->INCARTVAL
                   VSHIP       = B->SHIPPERVAL
                   YIELD       = B->YIELD
                   VBPRCODE    = B->BPRCODE
                   VNAME       = B->COMPANY
                   VMFGDATE1   = B->MFGDATE
                   VEXPDATE1   = B->EXPDATE
                   VLMFGDT     = B->LABLMFGDT  
                   VCMFGDT     = B->CARTMFGDT  
                   VLEXPDT     = B->LABLEXPDT  
                   VCEXPDT     = B->CARTEXPDT  

	              IF B->KEY="P"
	                 SA_EX="P"
	                 EPS='PS'
	              ENDIF   
	              IF B->KEY="S"
  	                 SA_EX="S"
	                 EPS='SALE'
	              ENDIF     
	              IF B->KEY="E"
   	                  SA_EX="E"
	                  EPS='EXPORT'
	              ENDIF
                   STORE B->PACK TO SPACK,VPACK,VUNITPACK
                   SELE B
                   USE
                   SELE C
        		   USE BATCH_NO.DBF ORDER BNO
		           SEEK ALLTRIM(VBNO) 	
            	   BSIZE    =C->BAT_SIZE
        		  * VEXPDATE =C->EXPDATE
        		  * VMFGDATE =C->MFGDATE
        		      
                   VBAT_QTY =C->BAT_QTY
        		        		  
        		   SELE C
        		   USE
        		  * VM1=SUBSTR(VMFGDATE,1,3) 
        		  * VM2=SUBSTR(VEXPDATE,1,3) 
         		  * VMFGDATE1=SUBSTR(VMFGDATE,1,4)+SUBSTR(VMFGDATE,7,2)
         		  * VEXPDATE1=SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
                * 	SELE E
        	    *    USE MONTH
         	*		GO TOP
   		*			LOCATE FOR CMONTH=VM1
	*				VMFGDATE2=E->NOMON+'/'+SUBSTR(VMFGDATE,5,4)
*					VMFGDATE3=E->NOMON+'/'+SUBSTR(VMFGDATE,7,2)*
*					SELE E
*					GO TOP
*					LOCATE FOR CMONTH=VM2    
*					VEXPDATE2=E->NOMON+'/'+SUBSTR(VEXPDATE,5,4)
*					VEXPDATE3=E->NOMON+'/'+SUBSTR(VEXPDATE,7,2)
*                    SELE E
*                    USE
                    DO UNITPACK
                    USE CPKG_MST EXCLU
                    ZAP
                    USE STOREBPR 
                    COPY TO CPKG_MST FOR ALLTRIM(STOREBPR->BPRSRNO)= VBPRSR
                    USE
       	            USE CPKG_MST EXCLU
      	            INDE ON ITEM TAG SRPKG
     	            INDE ON SR TAG SRCPKG
      	            SET UNIQUE ON
      	            INDE ON NAME1+NAME2+BATCH+ITEM  TAG SISTORE
                    SET UNIQUE OFF
      	            SET ORDER TO SISTORE
      	            COPY TO CC
      	            
      	            SELE CPKG_MST
      	            USE
                    DELE FILE CPKG_MST.DBF
                    COPY FILE CC.DBF TO CPKG_MST.DBF
                    DELE FILE CC.DBF
              
                    USE CPKG_MST EXCLU
      	            INDE ON ITEM TAG SRPKG
     	            INDE ON SR TAG SRCPKG
                    USE
                       
  	          DO WHILE .T.
    	              IF  AS='S'
                     	  DO STA_END.PRG
                      ENDIF	  
    	 		  	  
    	 		  	  DO WHILE .T.
                        SET PROC TO ADIHEAD
     				    DO PRINTOPT
					    IF OPT=0
					       CLOSE ALL
					       RETU
					    ENDIF   
					    IF OPT=1
					       CLEA
					       @15,5 SAY '------  N O   S C R E E N  VIEW-----'
					       WAIT
						   LOOP
					    ENDIF  
						EXIT
					 ENDDO
	 	                pno=SPAGE
      	                SELE 19
 	                    USE BPRPG
 	                    LOCATE FOR TYPE=BGR
  	                    BPR_PG=space(7)
                       if epage>10
                          epage=10
                       endif   
                       do while PNO<=EPAGE
     			           mno=ltrim(str(pno))
			               VBPR_PG='BPR_PG'+MNO
		                 IF LEN(ALLTRIM(BPRPG->&VBPR_PG))>0
			                  PPAGE=BPRPG->&VBPR_PG
			                  DO &PPAGE
			                  PNO=PNO+1
			                  IF PNO>EPAGE
			                    EXIT
                              ENDIF
			              ELSE
    		                  PNO=PNO+1
            		          IF PNO>EPAGE
		                         EXIT
		                      ENDIF
		                ENDIF
		            ENDDO  
                      SELE 19
                      USE
				      SET PRINT OFF
				      SET PRINTER TO
				      SET DEVI TO SCREEN
	                  YN = SPACE(1)
                      @0,0 CLEA TO 24,78
               	      SET COLOR TO W+/R,W+/G
                  	  @22,1 SAY 'ENTER [C] TO CONTINUE FOR SINGLE PAGE BPR' GET YN PICT '!'
                      
              	      SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
       				  READ
                      @22,1 SAY SPACE(70)
      				  IF YN='C'
                        LOOP
                      ENDIF	   
                      EXIT
                  ENDDO
   	 		ENDIF
          CCHK=' '
         @2,1 CLEA TO 23,77
         SET COLO TO W+/G
         @15,1 SAY 'CONFIRM [Y] FOR CHKLIST:=' GET CCHK PICT '!'
         READ
         SET COLO TO W+/B, W+/R
      IF CCHK='Y' 
     	     DO PRINTOPT
	         SELE B
   	         USE PRODMAST ORDER PN12
             SEEK SNAME+SNAME1
	        IF OPT=0 .OR. OPT=1
	           CLOSE ALL
			   SET COLOR TO W+/B,W+/R
	           RETU
	        ENDIF   
    	      VVV=SPACE(8)
            IF MP='P'
               VVV = BGR+'CHKBPR'
               DO &VVV
               CLEA
                DO PACKCHK
            ENDIF
             SET PRINT OFF
             SET PRINTER TO
             SET DEVI TO SCREEN
  ENDIF
RETU