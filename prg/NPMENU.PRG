*******program for menu of options
***WITHOUT PASSWORD
  SET PRINT OFF
  SET PRINTER TO
  SET DEVI TO SCREEN
  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
           
DO WHILE .T.
     
        SET COLOR TO W+/B,W+/R 
        CLEA
        CLOSE DATA
        SET PRINT OFF
        SET PRINTER TO
        SET DEVI TO SCREEN
        PUBLIC VNAME,ciPNAME,N,PSQTY,Ldttype,Cdttype,VUNITPACK,VUNIT4,VSTAMP,VSTAMP1,vstamp2,VBPR
        PUBLIC SHIPNAME,PNAME,SNAME,SNAME1,BGR,VCIPORD
	    PUBLIC GNAME,ROT_SP,RM,RM1,RM2,RM3,RM4,rm5,rm6,RM7,RM8,RM9,RM10
	    PUBLIC RM11,RM12,RM13,RM14,RM15
	    PUBLIC PM1,PM2,PM3,PM4
	    PUBLIC EE,VCONSIZE,SE,BPRFILE
	    PUBLIC VOLVIAL,VBPRSR,VASRNO
        PUBLIC EE1,VDIR
	    PUBLIC VMFGDATE,VEXPDATE,VMFGDATE1,VEXPDATE1,VMFGDATE2,VEXPDATE2,VMFGDATE3,VEXPDATE3,BSIZE,VEXPYEAR,VMFGYEAR,VMFGMON,VEXPMON,VLMFGDT,VLEXPDT,VCMFGDT,VCEXPDT,varno,vbno,MMFGYEAR,MOPT,Aopt,AT
	    public vmfg,vemfg,vmrp,vlogo,SA_EX,EPS,VTYPE,LN,vbprno,VBAT_QTY
	    PUBLIC PG,PG1,PG2,PG3,PG4,PG5,PG6,PG7,PG8,PG9,VOUTCART,VUNITSOC,VINCARTVAL,VSHIP,YIELD,ENC,VSAMP,VPS,SPAGE,EPAGE,MP,CCON,AT,VBPRCODE
	    PUBLIC PG10,PG11,PG12,PG13,PG14,PG15,PG16,PG17,PG18,PG19,PG20,PG21,PG22,PG23,PG24,PG25,PG26,PG27,PG28,PG29,PG30,PG31,PG32,PG33,PG34,PG35,PG36
	    PUBLIC VSQTY1,VSQTY2,VSQTY3
	    PUBLIC VCONVRATE,VMMFNO,S_W_FILM,VFORMU_CODE,VVERSION,SPACK
        PUBLIC QT1,QT2,QT3,QT4,QT5,OOPT,VEXPIRY,VQTY
        PUBLIC VTXTN,V1TXTN,RBOX,TNAME,TKEYNM,clubbpr
*        PUBLIC OC,IC,DROP,ENCLO,SHIP5,SHIP7,BTAPE,LB

*--------FOR SEAL HT,FILLVOLUME 
        PUBLIC ULIMIT,LLIMIT,USEALHT,LSEALHT
        STORE SPACE(8) TO USERNM1
        STORE 0 TO  QT1,QT2,QT3,QT4,QT5,VQTY,LN,N,Ldttype,Cdttype
        STORE 0 TO UNITPACK1,UNITPACK2,VEXPIRY,VASRNO
	    STORE SPACE(5) TO VTXTN,VCODE,CIPNAME
        STORE SPACE(6) TO EPS
	    *STORE SPACE(5) TO VCODE,CIPNAME
	    STORE SPACE(7) TO VNAME,VBNO
	    STORE SPACE(8) TO VTXTN
	    STORE SPACE(1) TO AT,ENC,ROT_SP,VSAMP,VPS,AS,mp,SA_EX,S_W_FILM,VBPR,VCONSIZE
        STORE SPACE(1) TO TKEYNM,BGR,clubbpr
*        STORE SPACE(1) TO LB,OC,IC,DROP,ENCLO,SHIP5,SHIP7,BTAPE,ICORU,TRAY,RBOX,RBOXLB,SWI,SOLRE,NADPT,ICEPK,CAP
	    STORE SPACE(3) TO VEXPMON,VMFGMON
	    STORE SPACE(2) TO VDIR
	    STORE SPACE(12) TO SNAME,V1TXTN,SE
	    STORE SPACE(15) TO VPACK,TNAME,VCIPORD
	    STORE SPACE(30) TO SNAME1
	    STORE SPACE(10) TO VMMFNO,VBPRSR
	    STORE 0 TO VEXPYEAR,VMFGYEAR,BSIZE,MMFGYEAR,RM,rm1,rm2,rm3,rm4,RM5,RM6,RM7,RM8,RM9,RM10,RM11,RM12,RM13,RM14,pm1,pm2,pm3,PM4
	    STORE 0 TO PG1,PG2,PG3,PG4,PG5,PG6,PG7,PG8,PG9,VOLVIAL,VCONVRATE,VSQTY1,VSQTY2,VSQTY3
	    STORE 0 TO PG10,PG11,PG12,PG13,PG14,PG15,PG16,PG17,PG18,PG19,PG20,PG21,PG22,PG23,PG24,PG25,PG26,PG27,PG28,PG29,PG30,PG31,PG32,PG33
        store 0 to spage,epage,Nopt,mopt,EOPT,AOPT,OOPT,RCHON3,RCHON2
        STORE repli('=',78) TO EE
        STORE repli('-',78) TO EE1
      	 SET MESSAGE TO 22 CENTER
         SET COLOR TO R+/B
         @ 1,1 TO 23,78 DOUB
         SET COLOR TO W+/B,R+/B
         SET COLOR TO W+/G
         @ 0,1 SAY "M A I N   M E N U  F O R   B.M.R /B.P.R" 
         @ 0,49 SAY "ADITI PHARMACEUTICALS, SOLAPUR"
         SET COLOR TO B/BG
         @ 24,30 SAY "PRESS 'ESC' TO QUIT"
         SET COLOR TO W+/B,GR+/GR
         @   24,2 SAY SPACE(76)
      
         @   2,17 PROMPT "A. B.M.R. ALLPAGE              " MESSAGE "FOR BMR ALL PAGES...*"
         @   3,17 PROMPT "B. B.M.R. SINGLE PAGE          " MESSAGE "FOR BMR SINGLE PAGES...*"
         @   4,17 PROMPT "C. B.P.R. ALLPAGE              " MESSAGE "FOR BPR ALL PAGES...*"
         @   5,17 PROMPT "D. B.P.R. SINGLE PAGE          " MESSAGE "FOR BPR SINGLE PAGES...*"
         @   6,17 PROMPT "E. INDEXING                    " MESSAGE "FOR RE-ORGANISING ALL DATABASE FILES...."
         @   7,17 PROMPT "F. STATMENTS                 * " MESSAGE "FOR COMPANY STATMENTS..."
         @   8,17 PROMPT "G. BMR ENTRY DIRECT IN FILE    " MESSAGE "FOR BMR BATCH ENTRY DIRECT IN BATCH_NO FILE.."
         @   9,17 PROMPT "H. ENTRY / UPDATE MASTER FILES " MESSAGE "ENTRY / MODIFICATION IN PRODMAST /COMPANYMASTER/PKG_MST FILES   ...."  
         @  10,17 PROMPT "J. PASSWORD MAINTANANCE        " MESSAGE "FOR ADDING/MODIFYING PASSWORD/RIGHT...*"
         @  11,17 PROMPT "K. B.M.R. CANCELLATION         " MESSAGE "FOR BMR CANCELLATION...*"
         @  12,17 PROMPT "L. PENDING B.P.R.              " MESSAGE "FOR LISTING PENDING BPR...*"
         @  13,17 PROMPT "M. TXT FILE DISPLAY(VIEW)      " MESSAGE "FOR VIEWING TXT FILES..*"
         @  14,17 PROMPT "N. DELETE TRIAL(BM) BATCH      " MESSAGE "FOR DELETING TRIAL ENTRY..*"
         @  15,17 PROMPT "O. PRODUCT DETAIL VIEW FOR BPR " 
         @  16,17 PROMPT "P. B.P.R CANCELLATION          " 

         MENU TO MOPT
         if lastkey() = 27
             CLOSE DATA
             QUIT
         ENDIF      
         SET COLOR TO W+/B,W+/R
    DO CASE
      CASE MOPT = 1
           MP="M"
           AS="A"
           DO COMP
     CASE MOPT=2
           MP="M"
           AS="S"
           DO COMP
      CASE MOPT  =  3
           MP="P"
           AS="A"
           DO COMP
      CASE MOPT  =  4
           MP="P"
           AS="S"
           DO COMP
      CASE MOPT  =  5
           DO INDEX   && DO INDEX ( FOR TAG ORDER FILES)
      CASE MOPT  =  6
           DO MENU_F
      CASE MOPT  =  7
           do COMPNAME
           DO WORDBATC
      CASE MOPT = 8
           DO MENU_H  
      CASE MOPT  =  9
           DO USERIGHT
      CASE MOPT = 10
           DO BMR_CAN 
      CASE MOPT = 11
           DO PENDBPR 
      CASE MOPT = 12
           DO OUTVIEW 
      CASE MOPT = 13
           DO DELBM 
     CASE MOPT = 14
           DO PMVIEW 
     CASE MOPT = 15
           do COMPNAME
           DO BPR_CAN 
      OTHERWISE
          CLOSE DATABASES
          SET COLOR TO GR+/B,W+/R
exit
*          RETU
   ENDCASE
ENDDO
*---------------------------------
       proc compname		
        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
        CLEA
        SELE I
        USE MAINCODE
        SET COLOR TO GR+/B
		define window NAME from 5,25 to 17,40
        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
        SET COLOR TO W+/R
        @4,26 SAY " SELECT COMPANY "
        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
        ACTIVATE WINDOW NAME
        define popup s_list from 6,26 to 17,39 prompt fields COMPANY   
        activate window NAME
        SET COLOR TO G+/B
        @0,0 get vNAME  popup s_list
        read valid lastkey() = 13 .OR. LASTKEY()=27
        deactivate window NAME
        @4,26 SAY SPACE(40)
       IF LASTKEY()#13
           VNAME=" "
           CLOSE ALL
		   release all
       	   SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
           RETU
       ENDIF  
        VNAME=I.COMPANY
        SELE I
        USE
		SET COLOR TO W+/B,W+/R
		RETU
		
*-------------------*	
PROCEDURE MENU_F
CLEA
DO WHILE .T.
   SET DELI TO ''
   SET DELI OFF
   SET COLOR TO W+/B,W+/R,,GR+/B,G+/RB
   SET MESSAGE TO 24 CENTER
   SET COLOR TO W+/R
   @ 2,30 SAY "SUB MENU FOR : "
   SET COLOR TO W+/G
   @ 4,26 SAY " F. MISCELLENIOUS  ENRTY / STATMENTS"
   SET COLOR TO B/BG
   @ 3,60 SAY "PRESS 'ESC' TO QUIT"
   SET COLOR TO W+/B,W+/R
   @ 5,1 CLEA TO 22,78
   @ 5,5 TO 22,73 DOUB
    STORE 0 TO OPT_F
    @  9,10 PROMPT "1. TOTAL BMR IN A GIVEN PERIOD           "
    @ 10,10 PROMPT "2. TO ENTER MIXING DATE FOR UNPACKED QTY "
    @ 11,10 PROMPT "3. TOTAL QTY. MANUFACTURED IN A MONTH    "
    @ 12,10 PROMPT "4. QTY.PACKED IN A MONTH/YIELD STATMENT  "
    @ 13,10 PROMPT "5. UNPACKED QTY.(WIP)                    "
    @ 14,10 PROMPT "6. TOTAL QTY. PACKED IN A MONTH          "
    @ 15,10 PROMPT "7. DISPENSING DATE ENTRY                 "
    @ 16,10 PROMPT "8. STEREO                                "
     MENU TO OPT_F
     PERMIT = .F.
   if lastkey() # 27
      IF ! CHEKAUTH(PERMIT,MOPT,opt_F)
         SET COLOR TO W+/G
         @ 23,10 SAY "SORRY...U HAVE NO AUTHORITY TO USE THIS OPTION...PRESS ANY KEY.."
         SET COLOR TO W+/B,W+/R
         UX=INKEY(0)
         CLOSE DATA
         LOOP
      ENDIF
   endif   
   DO CASE
      CASE OPT_F = 1
	    do Nmonbmr
      CASE OPT_F = 2
	    do re_ent    
      CASE OPT_F = 3
	    do manu_tot
      CASE OPT_F = 4
         DO NMONPACK
      CASE OPT_F = 5
        SET COLOR TO W+/G
        TEXT
        BEFORE RUNNING THIS OPTION IT IS COMPULSARY TO RUN 
        
        OPTION (QTY PACKED IN A MONTH)'
        
        ENDTEXT
        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
        WAIT'' 
	    do unpack
      CASE OPT_F = 6
    	do pack_tot
      CASE OPT_F = 7
        do dient
      CASE OPT_F = 8
    	do streo
      OTHERWISE
           EXIT
    ENDCASE
ENDDO
RETURN
*-----------------------
PROCEDURE MENU_H
DO WHILE .T.
   SET DELI TO ''
   SET DELI OFF
   SET COLOR TO W+/B,W+/R,,GR+/B,G+/RB
   CLEA
   SET MESSAGE TO 24 CENTER
   CLEA
   @ 1,1 TO 23,78 DOUB
   SET COLOR TO W+/R
   @ 2,30 SAY "SUB MENU FOR : "
   SET COLOR TO W+/G
   @ 4,1 SAY " H. COMPANY_MST / PRODUCTMST,PKG_MST,ITEM_MST/BPRGROUP FILE  ADD-CHANGE"
   SET COLOR TO B/BG
   @ 3,60 SAY "PRESS 'ESC' TO QUIT"
   SET COLOR TO W+/B,W+/R
   @ 24,1 SAY SPACE(77)
   @ 7,1 TO 18,77 DOUB
   STORE 0 TO OPT_H
   @  8,2 PROMPT "1. COMPANY_MST(COMPANY NAME MST)                            "
   @ 10,2 PROMPT "2. PRODMAST(PRODUCT NAME MASTER)                            "
   @ 12,2 PROMPT "3. PKG_MST( PRODUCT WITH PACKING MATERIAL MASTER)           "
   @ 14,2 PROMPT "4. ITEM_MST (PACKIN MATERIAL NAME & CODE MASTER)            "
   @ 16,2 PROMPT "5. BPRGROUP FILE(MASTER FILE FOR SALE,EXPORT,PS P.M. IN SR) "
   MENU TO OPT_H
   DO CASE
      CASE OPT_H = 1
           DO COMP_ADD
      CASE OPT_H = 2
           DO BMRMD
      CASE OPT_H = 3
           DO MODIPKG
      CASE OPT_H = 4
           DO MODIITEM
      CASE OPT_H = 5
           DO ADMDBPRS
      OTHERWISE
            EXIT
      ENDCASE
ENDDO
@4,1 SAY SPACE(76)
RETURN

*----------------
PROCEDURE COMP
      do compname
      IF VNAME = " "
          CLOSE DATA
          RETU
       ENDIF  
       do prodconf
       RETU
*--------------
function chekauth
param permit,umopt,usopt
if len(alltrim(str(umopt))) = 1
   umopt = alltrim(str(umopt))+' '
else
   umopt = alltrim(str(umopt))
endif
if len(alltrim(str(usopt))) = 1
   usopt = alltrim(str(usopt))+' '
else
   usopt = alltrim(str(usopt))
endif

sele h
*use userpass inde userpass
use userpass 
*seek username
GO TOP
LOCATE FOR USER = USERNAME
stor h->level to lev1
@ 0,1 say username+' ['+umopt+']  ['+usopt+']'
if lev1 = 1
   sele h
   use
   permit = .t.
else
   if val(usopt) = 0
      sele g
      use useright inde useright
      locate for user = username .and. mainopt = umopt
      if found()
         permit = .t.
      else
         permit = .f.
      endif
      sele g
      use
   else
      sele g   
      use useright inde useright
      seek username+umopt+usopt
      if found()
         permit = .t.
      else
         permit = .f.
      endif
      sele g
      use
   endif          
endif
return(permit)
*******************

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
            