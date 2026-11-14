****ITEM NAME TYPE CONFIRMATION FOR BMR/BPR
    SET PROC TO ADIHEAD
   STORE 0 TO VADCD
   STORE SPACE(60) TO VBPRGENNM
 IF MP="P"
   USE CPKG_MST EXCLU
   ZAP
   USE
 ENDIF 
DO WHILE .T.
   DO WHILE .T.
         SET COLOR TO W+/GR,W+/G
         @23,1 SAY SPACE(78)
         @23,10 say '1st 5 characters of Product Name ' get CIPNAME pict '!!!!!'
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
    ENDDO
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
            ENDIF
   	        IF B->PRGBMR#'Y' .AND. MP='M'
 	             CLEA
                 SET COLOR TO W+/G
                 @15,1 SAY 'BMR OF THIS PRODUCT IS NOT THRO FOXPRO PRG.U HAVE TO TRY FROM WS'
                 SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
 	             WAIT
                 LOOP
           ENDIF
           EXIT
ENDDO           
              SELE B
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
              VUNIT       = B->UNIT
              VVOLUME     = B->VOLUME
              STORE B->PACK TO SPACK,VPACK,VUNITPACK
            IF B->CATEGORY='P'
 	    	     VPS='Y'
               ENDIF
               if B->type#'F' .AND. MP='M'
                 DO PROC_2
               ENDIF       
              IF MP="M"
                DO BMR_MN
              ENDIF   
  IF MP="P"
      SELE 22
      USE PRTYPE ORDER PRKEY
      SEEK BGR
      STORE PRTYPE->TYPE TO PTYPE
      SELE 22
      USE
      CLEA
      SET COLOR TO W+*/RB
      @15,2 SAY 'SELECTED '+PNAME+' BELONGS TO '+PTYPE+'  GROUP'
      SET COLOR TO W+/B,W+/R
      SET COLOR TO W+/R
      @17,2 SAY 'IF GROUP IS NOT CORRECT'
      @19,2 SAY 'PRESS..<ESC> TO CANCEL   ...OR...ANY OTHER KEY TO CONTI...'
      SET COLOR TO W+/B,W+/R
      READ
      IF LASTKEY()=27
         CLOSE DATA
         RETU
      ENDIF   
      CLEA
      SET COLOR TO W+/G,RB+/GR
      @1,1 SAY 'SELECT GENERIC NAME FOR BPR PRINTING FOR '
      @2,10 SAY LTRIM(PNAME)
      SET COLOR TO W+/B,W+/R
      SELE B
	 * SET ORDER TO GENCOMP
    	SET ORDER TO PRODGEN
    	SET FILT TO LEN(ALLTRIM(GEN_NAME))>0 
    	GO TOP
        define window temp from 5,1 to 22,77
	    define popup s_list from 5,2 to 22,75 prompt fields LTRIM(GEN_NAME)   footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
	    activate window temp
	     @0,0 get VBPRGENNM popup s_list
         read valid lastkey() = 13 .OR. LASTKEY()=27
   	     deactivate window temp
         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	     IF LASTKEY()=27
	          CLOSE DATA
	          RELEASE ALL
         	  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
              RETU
            ENDIF
           SET ORDER TO PN12
              DO BPR_MN
             ENDIF
         *********
      PROC PACKMODI
                 SELE F
                 USE DFILE
                 LN=6
                 CNT=1
              DO WHILE .NOT. EOF()
                  SELE E
                  USE ITEM_MST
                  SET ORDER TO ITEMCD
                  SEEK F->PACK
                  STOR E->NAME TO ENAME
                  SELE E
                  USE             
                  @LN,2 SAY CNT  PICT '99'
                  @LN,10 SAY F->PACK
                  READ
                  @LN,22 SAY ENAME
                  SELE F
                  SKIP
                  LN=LN+1
                ENDDO  