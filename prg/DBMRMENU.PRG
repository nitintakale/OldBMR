*******program for menu of options
CLOSE ALL
SET PROC TO ADIHEAD
DO ADISTART
SET DECIMAL TO 3
SET COLOR TO W
DO WHILE .T.
    CLEA ALL
    CLOSE ALL
    PUBLIC SHIPNAME,PNAME,SNAME,SNAME1,GNAME,ROT_SP,RM,RM1,RM2,RM3,RM4,rm5,rm6,RM7,PM1,PM2,PM3,volvial,EE,EE1,VDIR
    PUBLIC VMFGDATE,VEXPDATE,BSIZE,VEXPYEAR,VMFGYEAR,VMFGMON,VEXPMON,varno,vbno,MMFGYEAR,MOPT,AT
    PUBLIC PG1,PG2,PG3,PG4,PG5,PG6,VOUTCART,VSHIP,YIELD,ENC,VSAMP,VPS,MATCH1,MATCH2,MATCH3,SPAGE,EPAGE,MP,CCON,AT
    PUBLIC VCONVRATE,VCODE,VMMFNO
    STORE SPACE(5) TO VCODE
    STORE SPACE(6) TO VBNO
    STORE SPACE(1) TO AT,ENC,ROT_SP,VSAMP,VPS,AS,mp
    STORE SPACE(3) TO VEXPMON,VMFGMON
    STORE SPACE(2) TO VDIR
    STORE SPACE(12) TO SNAME
    STORE SPACE(30) TO SNAME1
    STORE SPACE(10) TO VMMFNO
    STORE 0 TO VEXPYEAR,VMFGYEAR,BSIZE,MMFGYEAR,RM,rm1,rm2,rm3,rm4,RM5,RM6,RM7,pm1,pm2,pm3
    STORE 0 TO PG1,PG2,PG3,PG4,PG5,PG6,VOLVIAL,VCONVRATE
    ee=repli('=',80)
    ee1=repli('-',80)
 do while .t.
	clea 
	store 0 to mopt,EOPT
	SET PROC TO ADIHEAD
	@ 0,30 SAY 'B.M.R./B.P.R. MENU'
	define window BMR from 1,20 to 24,60
	declare s1(24,1)
	s1(1,1) = "Ciplox eye/ear drops              "
	s1(2,1) = "Prorflox eye drops"
	s1(3,1) = "Cromal eye drops"
	s1(4,1) = "Norflox eye/ear drops"
	s1(5,1) = "Profenac eye drops"
	s1(6,1) = "Optipres-S eye drops"
	s1(7,1) = "Optipres eye drops"
	s1(8,1) = "Optipres eye drops [SAMPLE]"
	s1(9,1) = "Optipres-S eye drops [SAMPLE]"
	s1(10,1) = "Dinospray."
	s1(11,1) = "Asthalin Respirator soln."
	s1(12,1) = "Asthalin Respules"
	s1(13,1) = "Ipravent Resp. soln."
	s1(14,1) = "Beclate Aquanase."
	s1(15,1) = "Budanase Aq."
	s1(16,1) = "Budecort Respules [0.5 MG]."
	s1(17,1) = "Budecort Respules [1 MG]."
	s1(18,1) = 'Next screen'
	s1(19,1) = 'Exit'
	s1(20,1) = "Cromal Respules."
	s1(21,1) = "Ipravent Respules."
	s1(22,1) = "Ocumol eye drpos 0.25% w/v"
	s1(23,1) = "Ocumol eye drpos 0.50% w/v"
	s1(24,1) = "Azee injection 500(lypholised)"
	activate window BMR
	@0,0 get mOPT from s1
	read valid lastkey() = 13
	deactivate window BMR
	if mopt=19
	   close all
	   clea all
	   release all
	   !cd\
	   quit
	endif           
       if mopt#18
     	  exit
       endif          
IF MOPT=18
	declare s2(14,1)
	s2(1,1) = "Previous screen                   "
	s2(2,1) = "Exit"
	s2(3,1) = "Modifications in prodmast/pkg_mst"
	s2(4,1) = "BMR Cancellation."
	s2(5,1) = "Total BMR in month"
	s2(6,1) = "To change individual password"
	s2(7,1) = "To Enter mixing date for unpack qty"
	s2(8,1) = "Backup"
	s2(9,1) = "To change washing machine page"
	s2(10,1) = "Total qty  mfgd. in month"
	s2(11,1) = "Qty  packed. in month"
	s2(12,1) = "Unpacked qty  "
	s2(13,1) = " Total Qty  packed. in month"
	s2(14,1) = " Dispensing_date entry"
	activate window BMR
	@0,0 get eOPT from s2
	read valid lastkey() = 13
	deactivate window BMR
       if Eopt=1
	      LOOP
       endif
       if eopt=2
      	   close all
	       clea all
     	   release all
	       !cd\
    	   quit
	   endif
       if Eopt#1
     	  exit
       endif  
endif 
enddo
  IF MOPT#18  
	@0,0,23,78 box ''
	@6,20 clea to 22,77 
	@7,20 SAY '[M] FOR B.M.R. [P] FOR B.P.R. SHEET' GET MP PICT '!A' VALID MP $('M#P')
	@9,20 SAY '[A] FOR ALL PAGES [S] FOR SINGLE PAGE' GET AS PICT '!A'VALID AS $('A#S')
	READ
	IF (MP='M' .AND. AS='A').OR.(MP='M' .AND. AS='S') .OR. (MP='P' .AND. AS='S')
		DO BMRAPASS
	    IF MATCH1#'Y' .OR. MATCH2#'Y'
		     CLOSE DATABASES
			  LOOP
		    ENDIF         
	ENDIF
	IF MP='P' .AND. AS='A'
	     DO BPRAPASS
  	     IF MATCH1#'Y' .OR. MATCH2#'Y'
		     CLOSE DATABASES
			  LOOP
	      ENDIF       
    ENDIF
	IF MOPT=7 .OR. MOPT=6  && NOT TO ENTER SAMPLE FOR OPTIPRES/OPTIPRES-S AS SAMPLE PRG IS DIFFERENT FOR BOTH
	   VPS='N'
	ELSE
	    VPS='Y'
	ENDIF
      clea 
      IF AS='A' .AND. MP='P'
    	  VVYEAR=YEAR(DATE())
	      VVYEAR=LTRIM(STR(VVYEAR))
    	  VVYEAR=SUBSTR(VVYEAR,3,2)
	      !CD\DBASE\BMR\&VVYEAR   
    	  USE BATCH_NO
	      INDE ON BATCHNO TO BATCH
    	  USE BATCH_NO INDE BATCH
    	  SET FILT TO BPR#'Y' .AND. 'ZD' $ BATCHNO
    	  GO TOP
       	  CLEA
       	  IF .NOT. EOF()
	         @0,0,23,78 BOX '*'
      	     SET COLOR TO W*+
	         @2,2 SAY 'FOLLOWING BPR ARE PENDING IN THE YEAR'+'  '+LTRIM(STR(YEAR(DATE())))
       	     SET COLOR TO   
	         @4,10 SAY 'BATCHNO'
    	     @4,25 SAY 'PRODUCT NAME'
	         LN=6
	         DO WHILE .NOT. EOF()
          		@LN,10 SAY BATCHNO
          		@LN,25 SAY NAME1
          		@LN,40 SAY NAME2
          		SKIP
          		LN=LN+1
          		IF LN>21
           		    WAIT''
          		    LN=6
          		    @6,2 CLEA TO 21,71
           		ENDIF        
      	      enddo
	         WAIT''
    	ENDIF
    	!DEL BATCH.*
        IF YEAR(DATE())>1997
	      LYEAR=YEAR(DATE())-1
    	  llyear=lyear
    	  LYEAR=LTRIM(STR(LYEAR))
	      LYEAR=SUBSTR(LYEAR,3,2)
    	  !CD\DBASE\BMR\&LYEAR   
      	  USE BATCH_NO
      	  INDE ON BATCHNO TO BATCH
	      USE BATCH_NO INDE BATCH
       	  SET FILT TO BPR#'Y' .AND. 'ZD' $ BATCHNO
      	  GO TOP
      	  if .not. eof()
	         CLEA
       	     @2,2 SAY 'FOLLOWING BPR ARE PENDING IN THE YEAR'+'  '+LTRIM(STR(llyear))
	         @4,1 SAY 'BATCHNO'
       	     @4,15 SAY 'PRODUCT NAME'
	         LN=5
      	    DO WHILE .NOT. EOF()
	          @LN,1 SAY BATCHNO
      	      @LN,15 SAY NAME1
	          @LN,25 SAY NAME2
	          SKIP
              LN=LN+1
	          IF LN>21
           		  WAIT''
          		  LN=6
          		  @6,2 CLEA TO 21,71
      	      ENDIF        
      	   enddo
        	 WAIT''
      ENDIF
        !DEL BATCH.*
   endif
ENDIF
   !CD\DBASE\BMR
   CLOSE DATABASES
   SELE A
   USE PRODMAST 
   DO CASE
   @4,1 CLEA TO 22,77
case mopt = 1
     CLEA
     @5,1 SAY '[T] FOR TERMINAL [A] FOR ASEPTIC [F] FOR F.F.S.' GET AT PICT '!' VALID AT $('A#T#F')
*     @5,1 SAY '[T] FOR TERMINAL [A] FOR ASEPTIC ' GET AT PICT '!' VALID AT $('A#T')
	 READ
	 if at='T'
		   VMMFNO='C/C5309/01'
    	   SNAME='CIPLOX'
		   SNAME1='EYE/EAR DROPS[RUBBER PLUGS]'
	 ENDIF
     if at='A'
	      VMMFNO='D/C5309/01'
		   SNAME='CIPLOX'
		   SNAME1='EYE/EAR DROPS[LDPE]'
	 ENDIF
	 if at='F'
	      VMMFNO='E/C-5309/1'
		   SNAME='CIPLOX'
		   SNAME1='EYE/EAR DROPS[F.F.S.]'
	 ENDIF
	  SELE A
	  GO TOP
      LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	  VOLVIAL=A->FILLVOLUME
      VCONVRATE=A->RATE
      VCODE=SUBSTR(A->FORMU_CODE,1,5)
	  PNAME='CIPLOX EYE/EAR DROPS'
	  GNAME='(CIPROFLOXACIN EYE/EAR DROPS)'
	  IF MP='M'              
	    IF  AT='T' .AND. AS='A'
			 do proc_2 
			 do cimtA
       ENDIF
 	   IF AT='T' .AND. AS='S'
    	   do cimtS
	   ENDIF
	   IF  AT='A' .AND. AS='A'
	      do proc_2 
	      do cimAA
	  ENDIF
	  IF AT='A' .AND. AS='S'
	    do cimAS
	  ENDIF
	   IF  AT='F' .AND. AS='A'
	  *    do proc_2 
	      do ciMFA
	  ENDIF
	  IF AT='F' .AND. AS='S'
	    do cimFS
	  ENDIF
 ENDIF
IF (AT='T'.OR. AT='A') .AND. MP='P'         
	    do todate
      if as='S' 
	      DO STA_END.PRG
      ENDIF     
	  	 DO BPRCAL
         IF VBNO=SPACE(6)
	       !CD\ 
	       QUIT
	     ENDIF                                      
         IF AS='A'
	       do ALLPAGE
	     ENDIF
		  IF  AS='S'
			   do SI_PAGE
	     ENDIF
 ENDIF
IF (AT='F') .AND. (MP='P')              
    		   do todate
			   if as='S' 
			      DO STA_END.PRG
				ENDIF     
	 	      DO BPRCAL
    	      IF VBNO=SPACE(6)
    		     !CD\
			     QUIT 
		       ENDIF                                      
			   IF AS='A'
			       do FFSPALL
			   ENDIF
			  IF  AS='S'
				   do Fsi_page
			   ENDIF
  ENDIF
case mopt = 2
    VMMFNO='P/1411/01'
	SNAME='PROFLOX'
	SNAME1='EYE DROPS'
	SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='PROFLOX EYE DROPS'
	GNAME='(PEFLOXACIN EYE DROPS)'
	IF MP='M'
	  IF AS='A'
	    do proc_2 
	    do PRmtA
	  ENDIF
	  IF AS='S'
	   do PRmtS
	  ENDIF
   ENDIF
	IF MP='P'               
	     DO TODATE
	   if as='S' 
	        DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
	      IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	       ENDIF                                      
         IF AS='A'
	        do ALLPAGE
  	     ENDIF
    	  IF  AS='S'
		     do SI_PAGE
	      ENDIF
    ENDIF
case mopt = 3
    VMMFNO='C/C7508'
	SNAME='CROMAL'
	SNAME1='EYE DROPS'
    SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='CROMAL EYE DROPS'
	GNAME='(CROMOLYN SODIUM OPTHALMIC SOLN. USP 2% W/V)'
    IF MP='M'
	 IF AS='A'
	    do proc_2 
	    do CRmtA
	 ENDIF
	 IF AS='S'
	   do CRmtS
	ENDIF
    ENDIF
    IF MP='P'           
	   do todate
	   if as='S' 
	        DO STA_END.PRG
		ENDIF     
		    DO BPRCAL
	    IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	     ENDIF                                      
  	     IF AS='A'
	       do allpage
	     ENDIF
	  IF  AS='S'
		   do si_page
	   ENDIF
    ENDIF
****************    
case mopt = 4
      CLEA
	  AT=' '
	  @5,1 SAY '[T] FOR TERMINAL [A] FOR ASEPTIC [F] FOR F.F.S' GET AT PICT '!A'
	  READ
   	  IF AT='T'        
	    VMMFNO='C/N2307/01'
	    SNAME='NORFLOX'
	    SNAME1='EYE/EAR DROPS[RUBBER PLUGS]'
	  ENDIF
      IF AT='A'        
        VMMFNO='D/N2307/01'
	    SNAME='NORFLOX'
	    SNAME1='EYE/EAR DROPS[LDPE]'
	  ENDIF
     IF AT='F'        
	    VMMFNO='C/N2307/01'
	    SNAME='NORFLOX'
	    SNAME1='EYE/EAR DROPS[F.F.S.]'
	  ENDIF
    	  SELE A
		  GO TOP
		  LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
		  VOLVIAL=A->FILLVOLUME
	      VCONVRATE=A->RATE
	      VCODE=SUBSTR(A->FORMU_CODE,1,5)
		  PNAME='NORFLOX EYE/EAR DROPS'
	 	  GNAME='(NORFLOXACIN EYE/EAR DROPS)' 
  IF MP='M'              
	    IF  AT='T' .AND. AS='A'
			      do proc_2 
			      do NOmtA
		   ENDIF
		  IF AT='T' .AND. AS='S'
			   do NOmtS
		  ENDIF
    	   IF  AT='F' .AND. AS='A'
		     * do proc_2 
		      do NOmFA
		    ENDIF
		  IF AT='F' .AND. AS='S'
			   do NOmFS
		  ENDIF
		  IF  AT='A' .AND. AS='A'
				do proc_2 
				do NOmAA
		   ENDIF
		  IF AT='A' .AND. AS='S'
			   do NOmAS
		  ENDIF

 ENDIF
IF (AT='T'.OR. AT='A') .AND. (MP='P')              
    		   do todate
			   if as='S' 
			      DO STA_END.PRG
				ENDIF     
		     DO BPRCAL
	      IF VBNO=SPACE(6)
    	     !CD\
		     QUIT 
	       ENDIF                                      
	   IF AS='A'
	       do allpage
	   ENDIF
	  IF  AS='S'
			   do si_page
	   ENDIF
 ENDIF
	IF (AT='F') .AND. (MP='P')              
    		   do todate
			   if as='S' 
			      DO STA_END.PRG
				ENDIF     
	 	      DO BPRCAL
    	      IF VBNO=SPACE(6)
    		     !CD\
			     QUIT 
		       ENDIF                                      
			   IF AS='A'
			       do FFSPALL
			   ENDIF
			  IF  AS='S'
				   do Fsi_page
			   ENDIF
       ENDIF
case mopt = 5
	  IF AT='A'        
        VMMFNO='D/N2307/01'
	    SNAME='NORFLOX'
	    SNAME1='EYE/EAR DROPS[LDPE]'
	  ENDIF
      VMMFNO='A/P2405/01'
	SNAME='PROFENAC'
	SNAME1='EYE DROPS'
    SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='PROFENAC EYE DROPS'
	GNAME='(DICLOFENAC SODIUM OPTHALMIC SOLN.)'
    AT='A'
   IF MP='M'
  	 IF  AS='A'
	    do proc_2 
	    do PFmAA
     ENDIF
     IF  AS='S'
		   do PFmAS
     ENDIF
  ENDIF
 IF MP='P'              
	   do todate
	   if as='S' 
	      DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
 	      IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	       ENDIF                                      
	   IF AS='A'
	       do allpage
	   ENDIF
	  IF  AS='S'
			   do si_page
	   ENDIF
	ENDIF
case mopt = 6
    VMMFNO='A/01604/01'
	SNAME='OPTIPRES-S'
	SNAME1='EYE DROPS'
	  SELE A
		  GO TOP
		  LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
		  VOLVIAL=A->FILLVOLUME
	      VCONVRATE=A->RATE
	      VCODE=SUBSTR(A->FORMU_CODE,1,5)
		  PNAME='OPTIPRES-S EYE DROPS'
		  GNAME='(BETAXOLOL OPTHALMIC SUSPENSION)'
	  IF MP='M'
		     IF AS='A'
		       do proc_2 
	    	   do OSmtA
		     ENDIF
		     IF AS='S'
			   do OSmtS
		     ENDIF
	  ENDIF
 IF MP='P'              
	   do todate
	   if as='S' 
	    	  DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
       IF VBNO=SPACE(6)
		     !CD\
		     QUIT
       ENDIF                                      
	   IF AS='A'
	       do ALLPAge
	   ENDIF
	  IF  AS='S'
			   do si_page
	   ENDIF
	ENDIF
case mopt = 7
		SNAME='OPTIPRES'
		SNAME1='EYE DROPS'
		  SELE A
		  GO TOP
		  LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
		  VOLVIAL=A->FILLVOLUME
	      VCONVRATE=A->RATE
    	  VCODE=SUBSTR(A->FORMU_CODE,1,5)
		  PNAME='OPTIPRES EYE DROPS'
		  GNAME='(BETAXOLOL OPTHALMIC SOLUTION USP)'
		 IF MP='M'
			  IF AS='A'
			    do proc_2 
			    do OPmtA
		  ENDIF
		  IF AS='S'
				   do OPmtS
		  ENDIF
       ENDIF
		IF MP='P'               
		   do todate
		   if as='S' 
		      DO STA_END.PRG
			ENDIF     
			     DO BPRCAL
		      IF VBNO=SPACE(6)
			     !CD\
			     QUIT
	       ENDIF                                      
	   IF AS='A'
	       do ALLPAge
	   ENDIF
	  IF  AS='S'
			   do si_page
	   ENDIF
   ENDIF
case mopt = 8
	  VSAMP='Y'
      VMMFNO='B/01602/01'
      SNAME='OPTIPRES'
	  SNAME1='EYE DROPS'
	  SELE A
	  GO TOP
	  LOCATE FOR NAME1=SNAME .and. category='P' .AND. NAME2=SNAME1
	  VOLVIAL=A->FILLVOLUME
      VCONVRATE=A->RATE
      VCODE=SUBSTR(A->FORMU_CODE,1,5)
	  PNAME='OPTIPRES EYE DROPS [P.S]'
	  GNAME='(BETAXOLOL OPTHALMIC SOLUTION USP)'
	IF MP='M'
		  IF AS='A'
		    do proc_2 
		    do OPmtA
		ENDIF
		  IF AS='S'
			   do OPmtS
		ENDIF
   ENDIF
	   IF MP='P'            
		   do todate
		   if as='S' 
	    	  DO STA_END.PRG
			ENDIF     
		     DO BPRCAL
		      IF VBNO=SPACE(6)
			     !CD\
			     QUIT
		       ENDIF                                      
		   IF AS='A'
	    	   do ALLPAge
		   ENDIF
		  IF  AS='S'
			   do SI_page
		   ENDIF
	 ENDIF
case mopt = 9
    	VSAMP='Y'
	    VMMFNO='A/01604/01'
	    SNAME='OPTIPRES-S'
	    SNAME1='EYE DROPS'
    	SELE A
		GO TOP
		LOCATE FOR NAME1=SNAME .and. category='P' .AND. NAME2=SNAME1
	  VOLVIAL=A->FILLVOLUME
      VCONVRATE=A->RATE
      VCODE=SUBSTR(A->FORMU_CODE,1,5)
	  PNAME='OPTIPRES-S EYE DROPS [P.S]'
	  GNAME='(BETAXOLOL OPTHALMIC SUSPENSION)'
	IF MP='M'
	  IF AS='A'
	    do proc_2 
	    do OSmtA
      ENDIF
		  IF AS='S'
		   do OSmtS
       	ENDIF
    ENDIF
   IF MP='P'                
	   do todate
	   if as='S' 
      	      DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
       IF VBNO=SPACE(6)
   	        !CD\
		     QUIT
       ENDIF                                      
	   IF AS='A'
	       do ALLPAge
	   ENDIF
 	  IF  AS='S'
			   do SI_PAge
	   ENDIF
   ENDIF
case mopt = 10
    VMMFNO='A/D-2418/1'
	SNAME='DINOSPRAY'
	SNAME1=' '
	SELE A
    GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='DINOSPRAY'
	GNAME='(ISOSORBIDE DINITRATE BUCCAL SPRAY)'
	IF MP='M'
       IF AS='A'
	    do DImtA
	   ENDIF
	   IF AS='S'
	     do DImtS
	   ENDIF
	ENDIF
	IF MP='P'               
	   do todate
	   if as='S' 
	      DO STA_END.PRG
    	ENDIF     
	    DO BPRCAL
	      IF VBNO=SPACE(6)
	        !CD\
		    QUIT
	      ENDIF                                      
	   IF AS='A'
	       do DIALLPA
	   ENDIF
	  IF  AS='S'
			   do DISIPA
	   ENDIF
ENDIF
case mopt = 11
    VMMFNO='C/A-3513/1'
    SNAME='ASTHALIN'
	SNAME1='RESP. SOLUTION'
	SELE A
		GO TOP
		LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
		VOLVIAL=A->FILLVOLUME
	    VCONVRATE=A->RATE
	    VCODE=SUBSTR(A->FORMU_CODE,1,5)
		PNAME='ASTHALIN RESPIRATOR SOLUTION'
		GNAME='(SALBUTAMOL RESPIRATOR SOLUTION)'
        SHIPNAME='ASTHALIN RESP. SOLN'
	IF MP='M'
		  IF AS='A'
		    do ASmtA
		ENDIF
		  IF AS='S'
			   do ASmtS
		ENDIF
   ENDIF
       IF MP='P'                
		   do todate
		   if as='S' 
	    	  DO STA_END.PRG
			ENDIF     
		     DO BPRCAL
		      IF VBNO=SPACE(6)
				     !CD\
			     QUIT
	    	   ENDIF                                      
	   IF AS='A'
	       do SOLALLPA
	   ENDIF
	  IF  AS='S'
			   do SOLSIPA
	   ENDIF
   ENDIF
case mopt = 12
    VMMFNO='C/A-3514/1'
    SNAME='ASTHALIN'
	SNAME1='RESPULES'
   	SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
    VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='ASTHALIN RESPULES'
	GNAME='(SALBUTAMOL RESPIRATOR SOLUTION)'
	 IF MP='M'
		  IF AS='A'
		      do ARmtA
		   ENDIF
		   IF AS='S'
			  do ARmtS
		  ENDIF
	ENDIF
	IF MP='P'               
	   do todate
	   if as='S' 
	    	  DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
	      IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	       ENDIF                                      
	   IF AS='A'
	       do RUALLPA
	   ENDIF
	  IF  AS='S'
		  do RUSIPA
	   ENDIF
	ENDIF
 case mopt = 13
    VMMFNO='A/I1805/01'
    SNAME='IPRAVENT'
	SNAME1='RESP. SOLUTION'
	SELE A
    GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='IPRAVENT RESPIRATOR SOLUTION'
	GNAME='(IPRATROPIUM BROMIDE  RESPIRATOR SOLUTION)'
    SHIPNAME='IPRAVENT RESP.SOLN'
	 IF MP='M'
		  IF AS='A'
		    do IPmtA
		  ENDIF
		  IF AS='S'
		   do IPmtS
		ENDIF
    ENDIF
       IF MP='P'                
		   do todate
		   if as='S' 
	    	  DO STA_END.PRG
			ENDIF     
		     DO BPRCAL
	      IF VBNO=SPACE(6)
			 !CD\
		     QUIT
	       ENDIF                                      
		   IF AS='A'
	    	   do SOLALLPA
		   ENDIF
		  IF  AS='S'
			   do SOLSIPA
		   ENDIF
    ENDIF
    *********
case mopt = 14
    VMMFNO='C/B-2004/1'
    SNAME='BECLATE'
	SNAME1='AQUANASE'
	SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='BECLATE AQUANASE'
	GNAME='(BECLOMETHASONE INTRANASAL SOLUTION)'
	IF MP='M'
		  IF AS='A'
		    do BEmtA
		  ENDIF
		  IF AS='S'
			   do BEmtS
		 ENDIF
    ENDIF
       IF MP='P'                
		   do todate
		   if as='S' 
	    	  DO STA_END.PRG
			ENDIF     
		     DO BPRCAL
		      IF VBNO=SPACE(6)
			     !CD\
			     QUIT
	    	   ENDIF                                      
		   IF AS='A'
		       do BEUALLPA
		   ENDIF
		  IF  AS='S'
		   do BEUSIPA
		   ENDIF
    ENDIF
 case mopt = 15
    VMMFNO='C/B-8702/1'
	SNAME='BUDENASE'
	SNAME1='AQ.'
	SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='BUDENASE AQ.'
	GNAME='(BUDESONIDE AQUEOUS NASAL SPRAY)'
	IF MP='M'
		  IF AS='A'
		    do BUmtA
			ENDIF
			  IF AS='S'
				   do BUmtS
				ENDIF
      ENDIF
	 IF MP='P'              
	   do todate
		   if as='S' 
		      DO STA_END.PRG
			ENDIF     
		     DO BPRCAL
	    	  IF VBNO=SPACE(6)
			    !CD\
		    	 QUIT
		       ENDIF                                      
			     IF AS='A'
					do BEUALLPA
			     ENDIF
			     IF  AS='S'
				   do BEUSIPA
			     ENDIF
	ENDIF
case mopt = 16
    VMMFNO='A/B 8518/01'
	SNAME='BUDECORT'
	SNAME1='RESPULES 0.5 MG'
	SELE A
    GO TOP
    LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='BUDECORT RESPULES 0.5 MG'
	GNAME='(BUDESONIDE RESPIRATOR SUSPENSION)'
	IF MP='M'
	 IF AS='A'
	    do BDmtA
	ENDIF
	IF AS='S'
	    do BDmtS
	ENDIF
    ENDIF
    IF MP='P'                
	   do todate
       if as='S' 
	      DO STA_END.PRG
		ENDIF     
	     DO BPRCAL
	      IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	       ENDIF                                      
	   IF AS='A'
	       do BDALLPA
	   ENDIF
	  IF  AS='S'
			   do BDSIPA
	   ENDIF
    ENDIF
case mopt = 17
    VMMFNO='A/B 8520/01'
	SNAME='BUDECORT'
	SNAME1='RESPULES 1 MG'
	SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='BUDECORT RESPULES 1 MG'
	GNAME='(BUDESONIDE RESPIRATOR SUSPENSION)'
	IF MP='M'
	  IF AS='A'
	    do BD1mtA
	  ENDIF
	  IF AS='S'
        do BD1mtS
   	  ENDIF
   ENDIF
	 IF MP='P'              
	   do todate
	   if as='S' 
	      DO STA_END.PRG
	   ENDIF     
		  DO BPRCAL
	    IF VBNO=SPACE(6)
		    !CD\
		    QUIT
	    ENDIF                                      
	   IF AS='A'
	       do BDALLPA
	   ENDIF
	  IF  AS='S'
		  do BDSIPA
	   ENDIF
	ENDIF
case mopt = 20
    VMMFNO='A/C-7511/01'
    SNAME='CROMAL'
	SNAME1='RESPULES 2 ML'
	SELE A
	GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='CROMAL RESPULES 2 ML'
	GNAME='(SODIUM CROMOGLYCATE RESPULES)'
	 IF MP='M'
		  IF AS='A'
		      do CPmtA
		   ENDIF
		   IF AS='S'
			  do CPmtS
			  ENDIF
	ENDIF
	IF MP='P'               
	   do todate
	   if as='S' 
	    	  DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
	      IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	       ENDIF                                      
	   IF AS='A'
	       do CPALLPA
	   ENDIF
	  IF  AS='S'
    	   do CPSIPA
	   ENDIF
	ENDIF
case mopt = 21
    VMMFNO='A/I-1804/01'
    SNAME='IPRAVENT'
	SNAME1='RESPULES'
	SELE A
    GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='IPRAVENT RESPULES'
	GNAME='(IPRATROPIUM BROMIDE RESPIRATOR SOLUTION)'
	 IF MP='M'
		  IF AS='A'
		      do IRmtA
		   ENDIF
		   IF AS='S'
			  do IRmtS
		  ENDIF
	ENDIF
	IF MP='P'               
	   do todate
	   if as='S' 
		      DO STA_END.PRG
		ENDIF     
		     DO BPRCAL
	     IF VBNO=SPACE(6)
		     !CD\
		     QUIT
	      ENDIF                                      
	   IF AS='A'
	       do IRALLPA
	   ENDIF
	  IF  AS='S'
		   do IRSIPA
	   ENDIF
	ENDIF
case mopt = 22
    VMMFNO='ZD/01801/1'
    SNAME='OCUMOL'
	SNAME1='EYE DROPS 0.25% W/V'
	SELE A
    GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='OCUMOL EYE DROPS 0.25 % W/V'
	GNAME='(TIMOLOL MALEATE OPTHALMIC SOLUTION USP 0.25%W/V)'
	 IF MP='M'
	     DO PROC_2
	  IF AS='A'
	      do OC25MAA
   	   ENDIF
		   IF AS='S'
			  do OC25MAS
		  ENDIF
	ENDIF
   IF MP='P'         
	    do todate
      if as='S' 
	      DO STA_END.PRG
      ENDIF     
	  	 DO BPRCAL
         IF VBNO=SPACE(6)
	       !CD\ 
	       QUIT
	     ENDIF                                      
         IF AS='A'
	       do ALLPAGE
	     ENDIF
		  IF  AS='S'
			   do SI_PAGE
	     ENDIF
    ENDIF
case mopt = 23
    VMMFNO='ZD/01802/1'
    SNAME='OCUMOL'
	SNAME1='EYE DROPS 0.50% W/V'
	SELE A
    GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='OCUMOL EYE DROPS 0.50 % W/V'
	GNAME='(TIMOLOL MALEATE OPTHALMIC SOLUTION USP 0.50%W/V)'
	 IF MP='M'
	     DO PROC_2
	  IF AS='A'
	      do OC50MAA
   	   ENDIF
		   IF AS='S'
			  do OC50MAS
	  ENDIF
	ENDIF
   IF MP='P'         
	    do todate
      if as='S' 
	      DO STA_END.PRG
      ENDIF     
	  	 DO BPRCAL
         IF VBNO=SPACE(6)
	       !CD\ 
	       QUIT
	     ENDIF                                      
         IF AS='A'
	       do ALLPAGE
	     ENDIF
		  IF  AS='S'
			   do SI_PAGE
	     ENDIF
    ENDIF
*******
case mopt = 24
    VMMFNO='E/A 4111/01'
    SNAME='AZEE'
	SNAME1='INJECTION 500(Lyophilised)'
	SELE A
    GO TOP
	LOCATE FOR NAME1=SNAME .and. category='S' .AND. NAME2=SNAME1
	VOLVIAL=A->FILLVOLUME
    VCONVRATE=A->RATE
    VCODE=SUBSTR(A->FORMU_CODE,1,5)
	PNAME='AZEE INJECTION 500 (Lyophilised)'
	GNAME='(Azithromycin for injection 500 mg.)'
	 IF MP='M'
	     DO PROC_2
	  IF AS='A'
	      do AZEEMA
   	   ENDIF
		   IF AS='S'
			  do AZEEMS
	  ENDIF
	ENDIF
   IF MP='P'         
	    do todate
      if as='S' 
	      DO STA_END.PRG
      ENDIF     
	  	 DO BPRCAL
         IF VBNO=SPACE(6)
	       !CD\ 
	       QUIT
	     ENDIF                                      
         IF AS='A'
	       do AZEEALL
	     ENDIF
		  IF  AS='S'
			   do AZEE_SI
	     ENDIF
    ENDIF
 endcase
     DO CHK.PRG
 endif && mopt#0
if eopt#0
    do case
      case Eopt=3
         do modifile
     case Eopt=4
	    do bmr_can
	case Eopt=5
	    do monbmr
	case Eopt=6
    	do chpass    
	case Eopt=7
	    do re_ent    
	case Eopt=8
    	do backup
	case Eopt=9
	    do rotsp
	case Eopt=10
	    do manu_tot
	case Eopt=11
	    do mon_pack
	case Eopt=12
	    do unpack
	case Eopt=13
    	do pack_tot
	case Eopt=14
    	do dient
endcase
endif
ENDDO    
