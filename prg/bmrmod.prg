******************** Program for MODIFICATIONS IN PRODMAST,PKG_MST,ITEM_MST
        SET PROC TO ADIHEAD
        DO ADISTART
        DO PKGPASS
        CLOSE DATA
 IF MATCH1='Y' .AND. MATCH2='Y'
    do while .t.
        clea
        store space(1) to opt,any
        store space(8) to mfl
        @ 6,25 to 16,55 double
        @ 8,33 say "[A] ADD"
        @ 10,33 say "[M] MODIFY"
        @ 12,33 say "[E] EXIT"
        @ 14,30 say "Enter your option"
        @ 14,48 get opt pict "!" 
        read
        if opt = "E"
           CLOSE DATABASES
  	       RETU
         ENDIF
         CLEA
       	define window PKG from 1,25 to 7,45
        ACTIVATE WINDOW PKG
		declare s3(3,1)
		s3(1,1) = "PRODMAST   "
		s3(2,1) = "PKG_MST    "
		s3(3,1) = "ITEM_MST   "
		@0,0 get MFL from s3
		read valid lastkey() = 13 .OR. LASTKEY()=27
		deactivate window PKG
        CLEA
       IF LASTKEY()=27
          RETU
       ENDIF   
          sele a
          use &mfl 
if mfl = ("PRODMAST") 
    if opt='A'
       STORE SPACE(12) TO MNAME1,MFORMU_CODE
       STORE SPACE(35) TO MNAME2
       STORE SPACE(1) TO mCATEGORY,MTYPE,V1,V2,VC
       STORE SPACE(60) TO MGEN_NAME
       STORE SPACE(8) TO MUNIT,MCOMPANY
       STORE SPACE(10) TO MVERSION,MMFG_LIC_NO,MLOGO
  	   STORE SPACE(10) TO MVERSION,MCODE
       STORE SPACE(16) TO MVERSION,MEXPORT_LIC,MMMFNO,MPACK
       STORE SPACE(6) TO MBPRCODE
       STORE 0 TO MVOLUME,MFILLVOLUME,MINCARTVAL
       STORE 0 TO MOUTCARTVAL,MSHIPPERVAL,MEXPIRY,MYIELD,MRATE,MSTDQTY1,MMRP,MADITICODE,MSTDQTY2,MSTDQTY3
  ENDIF
   if opt='M'
       CLEA
    DO WHILE .T.
       STORE SPACE(12) TO MNAME1,MFORMU_CODE
       STORE SPACE(35) TO MNAME2
       STORE SPACE(1) TO mCATEGORY,MTYPE,V1,V2,VC
       STORE SPACE(60) TO MGEN_NAME
       STORE SPACE(8) TO MUNIT,MCOMPANY
       STORE SPACE(10) TO MVERSION,MMFG_LIC_NO,MLOGO
  	   STORE SPACE(10) TO MVERSION,MCODE
       STORE SPACE(16) TO MVERSION,MEXPORT_LIC,MMMFNO,MPACK
       STORE SPACE(6) TO MBPRCODE
       STORE 0 TO MVOLUME,MFILLVOLUME,MINCARTVAL
       STORE 0 TO MOUTCARTVAL,MSHIPPERVAL,MEXPIRY,MYIELD,MRATE,MSTDQTY1,MMRP,MADITICODE,MSTDQTY2,MSTDQTY3
	     @23,1 SAY SPACE(78)
		 @23,10 say '1st 5 characters of PRODUCT NAME ' get CIPNAME pict '!!!!!'
	     READ
         if cipname=space(5)
             retu
         endif    
		 sele A
	   	 go top
	     set filt to CIPNAME$NAME1
	     go top
	     IF EOF()
	         @22,1  SAY 'ITEM DOES NOT EXIST'
	         LOOP
          ELSE
             EXIT
	      ENDIF  
      ENDDO
		 sele A
	   	 go top
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
          MNAME1=SNAME
          MNAME2=A->NAME2
          MCOMPANY=A->COMPANY
          MADITICODE=A->ADITICODE
          MCODE=A->CODE
          MBPRCODE=A->BPRCODE
          MPACK=A->PACK
          MCATEGORY=A->CATEGORY
          MTYPE=A->TYPE
          MGEN_NAME=A->GEN_NAME
          MVOLUME=A->VOLUME
          MUNIT=A->UNIT
          MFILLVOLUME=A->FILLVOLUME
          MOUTCARTVAL=A->OUTCARTVAL
          MINCARTVAL=A->INCARTVAL
          MSHIPPERVAL=A->SHIPPERVAL
          MEXPIRY=A->EXPIRY
          MYIELD =A->YIELD
          MFORMU_CODE=A->FORMU_CODE
          MVERSION=A->VERSION
          MRATE=A->RATE
          MSTDQTY1=A->STDQTY1
          MSTDQTY2=A->STDQTY2
          MSTDQTY3=A->STDQTY3
          MMFG_LIC_NO=A->MFG_LIC_NO
          MEXPORT_LIC=A->EXPORT_LIC
          MMRP=A->MRP
          MLOGO=A->LOGO
          MMMFNO=A->MMFNO
     endif          
        
        clea
        @ 0,0 to 24,79 doub   
       if opt='A'
         @ 1,32 say "Addition Screen"
       ELSE
         @ 1,32 say "Modification Screen"
       ENDIF
         @ 2,32 say "-------- ------"
         @ 3,1 CLEA TO 22,78
DO WHILE .T.
    @4,1 SAY 'MAIN COMPANYNAME [BLANK TO EXIT]    :' GET MCOMPANY PICT REPL("!",7) 
    READ
    IF MCOMPANY=SPACE(7)
       EXIT
     ENDIF   
    IF LTRIM(MCOMPANY)='CIPLA'  .OR. LTRIM(MCOMPANY)='ADITI' .OR.  LTRIM(MCOMPANY)='OKASA' .OR. LTRIM(MCOMPANY)='MEDITAB'    
       VC='Y'
    ENDIF
   IF VC#'Y'
      LOOP
   ENDIF   
DO WHILE .T.
@5,1 SAY 'ADITI PRODUCT CODE [0 TO QUIT]      :'GET MADITICODE PICT REPL("9",5)   
READ
IF MADITICODE=0
    RETU
ENDIF    
IF OPT='A'
SELE A
SET FILT TO ADITICODE=MADITICODE
GO TOP
IF .NOT. EOF()
    @23,1 SAY SPACE(70)
    @23,1 SAY 'ADITI CODE ALREADY EXIST'
    LOOP
ENDIF    
ENDIF
EXIT
ENDDO
@6,1 SAY 'CIPLA PRODUCT CODE                  :'GET MCODE PICT REPL("!",10)   
@7,1 say "FIRST NAME                          :"GET MNAME1 PICT REPL("!",12)   
@8,1 say "SECOND NAME                         :"GET MNAME2 PICT REPL("!",35)   
DO WHILE .T.
@9,1 say "PACK (VIALS,AMPOULES,BOTTLES,UNITS) :"GET MPACK PICT REPL("!",8) 
READ
IF LTRIM(MPACK)='VIALS' .OR. LTRIM(MPACK)='UNITS'.OR. LTRIM(MPACK)='AMPOULES' .OR. LTRIM(MPACK)='BOTTLES'
    EXIT
ELSE
   LOOP
ENDIF
ENDDO       
DO WHILE .T.
@10,1 say "CATAGORY [P] FOR P.S. [S] FOR SALE' :"GET MCATEGORY pict "!" 
READ
IF MCATEGORY= 'P' .OR. MCATEGORY='S' 
   EXIT
 ELSE
   LOOP
ENDIF
ENDDO     
DO WHILE .T.
@11,1 say "TYPE(A/T/F)                         :"GET MTYPE PICT '!'
READ
IF MTYPE= 'A' .OR. MTYPE='T' .OR. MTYPE='F'
   EXIT
 ELSE
   LOOP
ENDIF
ENDDO
@12,1 say "GENERIC NAME                        :"GET MGEN_NAME PICT REPL("!",60)   
@14,1 say "VOLUME                              :"GET MVOLUME PICT '99.99'  
@15,1 say "UNIT(ML)                            :"GET MUNIT PICT REPL("!",8)   
@16,1 say "FILL VOLUME                         :"GET MFILLVOLUME pict "99.99"
@17,1 say "OUTER CARTON VALUE                  :"GET MOUTCARTVAL pict "99"
@18,1 say "INNER CARTON VALUE                  :"GET MINCARTVAL pict "999"
@19,1 say "SHIPPER VALUE                       :"GET MSHIPPERVAL pict "9999"
@20,1 say "EXPIRY IN MONTHS                    :"GET MEXPIRY pict "99"
@21,1 SAY 'YIELD IN %                          :'GET MYIELD pict "99.99"
@22,1 say 'FORMULATION CODE                    :'GET MFORMU_CODE pict REPL("!",12)   
read
@23,1 say space(60)
@23,1 say 'CONFIRM ABOVE ENTRY..(C) to confirm' get v1 pict '!'
read
IF V1#'C'
    LOOP
ENDIF    
if v1='C'
    @ 3,1 CLEA TO 23,78
  DO WHILE .T.
 	 @4,1 say 'VERSION                    :'GET MVERSION pict REPL("!",10)       
   	 @5,1 SAY 'COVERSION RATE             :'GET MRATE PICT '999999.99'
     @6,1 SAY 'STD.BATCHSIZE IN LTS       :'GET MSTDQTY1 PICT '9999.99'
     @7,1 SAY '                           :'GET MSTDQTY2 PICT '9999.99'
     @8,1 SAY '                           :'GET MSTDQTY3 PICT '9999.99'
	 @9,1 SAY 'MFG.LICENCE NO.            :'GET MMFG_LIC_NO PICT REPL("!",10)   
   	 @10,1 SAY 'EXPORT LICENCE NO          :'GET MEXPORT_LIC PICT REPL("!",16)   
     @11,1 SAY 'M.R.P.                     :'GET MMRP PICT '999.99'
	 @12,1 SAY 'LOGO                       :'GET MLOGO  PICT REPL("!",10)   
   	 @13,1 SAY 'MMFNO                      :'GET MMMFNO PICT REPL("!",15)   
     @14,1 SAY 'BPRCODE                    :'GET MBPRCODE PICT REPL("!",6)   
     read
     @23,1 say space(60)
     v2=' '
     @23,1 say 'CONFIRM ABOVE ENTRY..(C) to confirm' get v2 pict '!'
     read
     if v2='C'
         EXIT
      ELSE
         LOOP
     ENDIF    
  ENDDO
  EXIT
  ENDIF
  ENDDO
       IF OPT='A'
          SELE A
          GO TOP
    	   LOCATE FOR NAME1=MNAME1 .AND. CATEGORY=MCATEGORY .AND. NAME2=MNAME2
   	        any = " "
				IF FOUND()
                   @ 23,17 say "Above product already exsist..no addition"
                   v1=' '
                   v2=' '
                endif
         endif
         if v1='C' .AND. V2='C'
                IF OPT='A'
                     SELE A
      				 APPE BLANK
                  ENDIF
                     REPL COMPANY WITH UPPER(MCOMPANY)
                     REPL ADITICODE WITH MADITICODE
                     REPL CODE WITH MCODE
                     repl NAME1 WITH UPPER(MNAME1)
                     REPL MMFNO WITH MMMFNO
                     REPL BPRCODE WITH MBPRCODE
                     REPL PACK WITH MPACK
                     repl NAME2 WITH UPPER(MNAME2)
                     repl CATEGORY WITH UPPER(MCATEGORY)
                     REPL TYPE WITH UPPER(MTYPE)
                     REPL GEN_NAME WITH UPPER(MGEN_NAME)
                     repl VOLUME WITH MVOLUME
                     REPL UNIT WITH MUNIT
                     repl FILLVOLUME WITH MFILLVOLUME
                     repl OUTCARTVAL WITH MOUTCARTVAL
                     REPL INCARTVAL WITH MINCARTVAL
                     repl SHIPPERVAL WITH MSHIPPERVAL							  
                     repl EXPIRY WITH MEXPIRY
                     repl YIELD WITH MYIELD
                     repl FORMU_CODE WITH MFORMU_CODE
                     repl VERSION WITH MVERSION
                     REPL RATE WITH MRATE
                     REPL STDQTY1 WITH MSTDQTY1
                     REPL STDQTY2 WITH MSTDQTY2
                     REPL STDQTY3 WITH MSTDQTY3
                  	 REPL MFG_LIC_NO WITH MMFG_LIC_NO
               	endif
            endif && prodmast
****************************************************************************
if mfl = ("PKG_MST") 
   DO MODIPKG
ENDIF
if mfl = ("ITEM_MST") 
    DO MODIITEM
ENDIF
 	  any = " "
      @ 23,10 say space(65)
      @ 23,23 say "Do you want to continue maintaince(Y/N)"
      @ 23,65 get any pict "!"
      read
      if any # "Y"
           exit
      endif
   enddo
ENDIF