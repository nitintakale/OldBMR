**azee p2
  STORE SPACE(1) TO SWI,SOLRE,NADPT,ICEPK
*********** REQ ON PAGE 2
  SELE A
  USE CPKG_MST
  SET ORDER TO SRPKG
  SEEK 'STWATERIN'
  IF FOUND()
    SWI="Y"
  ENDIF  
  go top
  SEEK 'SOLVFORRE'
  IF FOUND()
     SOLRE="Y"
  ENDIF
  go top
  SEEK 'N_ADAPTOR'
  IF FOUND()
    NADPT="Y"
  ENDIF
  go top
  SEEK 'ICE PACKS'
  IF FOUND()
     ICEPK="Y"
  ENDIF
 IF CLUBBPR="Y"
	SELE CPKG_MST
	SET ORDER TO  UNICPK
	GO TOP
 ELSE	
	SELE CPKG_MST
	SET ORDER TO SRCPKG
	GO TOP
 ENDIF


@0,60 SAY 'PAGE : 2 OF 6'
DO PROC_1
LN=7
LN=LN+1
TEXT
                    B A T C H  P A C K A G I N G  R E C O R D
============================================================================
 SECTION: II          OVER-PRINTING OF PACKAGING MATERIALS        
                              A. LINE CLEARANCE 
           LABELS                                   INNER CARTONS 
 Over-printing M/c No:______________         Over-printing M/c No:_____________
 PREVIOUS PRODUCT:__________________         PREVIOUS PRODUCT:_________________
 BATCH No:__________________________         BATCH No:________________________
________________________________________     _________________________________ 
| Checked & certified by:|              |    | Checked & certified by:|       :
|------------------------|--------------|    |------------------------|-------:
| Date:____________     Time :__________|    | Date:____________  Time:_______|
|_______________________________________|    |________________________________:
 --------------------------------------------------------------------------
                    B. OVER-PRINTING MACHINE SET UP & OPERATION
               LABELS                               INNER CARTONS
  ________________________________________   ________________________________
  |                        |OVER PRINTING |  |                        |      |
  |_______________________ | M /C         |  |                        |      |
  |   Stereo-setting       |--------------|  |   Stereo-setting       |      : 
  | Checked & certified by:|              |  | Checked & certified by:|      |
  |---------------------------------------|  |-------------------------------|
  | Date:____________ Time :____________  |  | Date:_________    Time :_____ |
  |_______________________________________|  |_______________________________|
  | Operator  : ------->   |              |  | Operator  : ------->   |      |
  |________________________|______________|  |________________________|______|
  | Started   at :----->   |              |  | Started   at :----->   |      |
  |________________________|______________|  |________________________|______|
  | Completed at :----->   |              |  | Completed at :----->   |      |
  |________________________|______________|  |________________________|______|
 --------------------------------------------------------------------------
              C. OVER-PRINTING INSTRUCTIONS FOR LABELS/CARTONS/SHIPPERS
                  NOTE:[  /  ]  Tick  mark  after  checking   for 
                                    correctness of overprinting matter.
                       [ N.A ]  Over-printing  matter  not applicable 
____________________________________________________________________________
|   DETAILS           |OVERPRINTING MATTER|__LABELS________|CARTONS|SHIPPER|
|                     |    INITIATION     |OVER PRINTINGM/C|       |       |
|---------------------|-------------------|----------------|-------|-------|
ENDTEXT
LN=45
@ln,0 say '|Mfg.lic.no           |                   |                |       |       |'
IF SA_EX='E'
 @LN,24 SAY vEmfg
ENDIF
IF SA_EX='S'
 @LN,24 SAY vmfg
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Product  name        |                   |                |       |       |'
@LN,24 SAY PNAME
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|--------|'
LN=LN+1
@LN,0 SAY '|Batch no.            |                   |                |       |        |'
@LN,24 SAY VBNO
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|--------|'
LN=LN+1
@LN,0 SAY '|Manufacturing date L/C                   |                |       |        |'
@LN,24 SAY VCMFGDT
@LN,35 SAY VLMFGDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|--------|'
LN=LN+1
@LN,0 SAY '|Expiry date  L/C     |                   |                |       |        |'
@LN,24 SAY VCEXPDT
@LN,35 SAY VLEXPDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|---------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Max retail price     |                   |               |       |         |'

IF SA_EX = 'S'
   @LN,24 SAY VMRP PICT '999.99'
ENDIF
IF  SA_EX="E"  
   @LN,24 SAY '  N.A.'
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|---------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Physicians sample    |                   |               |       |         |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|---------------|-------|---------|'
ln=ln+1
@LN,0 SAY '|_____  Logo & address|                   |               |       |         |'
@ln,2 say vlogo
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|---------------|-------|---------|'
ln=ln+1
@ln,0 say '|Quantity to be Overprinted in numbers.   |               |       |         |'
ln=ln+1
@LN,0 SAY '|---------------------|-------------------|---------------|-------|---------|'
ln=ln+1
@ln,0 say ' INITIATED BY :_____________________    COUNTER-CHECKED BY:___________________'
***
IF SWI="Y" 
   @0,60 SAY 'PAGE : 2(A) OF 6'
   DO PROC_1
   LN=7
   do SWI2A
   @0,60 SAY 'PAGE : 2(B) OF 6'
   DO PROC_1
   LN=7
   LN=LN+1
   DO SWI2A
   EJECT
   @0,60 SAY 'PAGE : 2(C) OF 6'
   DO PROC_1
   LN=7
   LN=LN+1
   DO SWI2A
ENDIF
IF  SOLRE="Y" 
   @0,60 SAY 'PAGE : 2(A) OF 6'
   DO PROC_1
   LN=7
   do SOLRE2A
   @0,60 SAY 'PAGE : 2(B) OF 6'
   DO PROC_1
   LN=7
   LN=LN+1
   DO SOLRE2A
   EJECT
   @0,60 SAY 'PAGE : 2(C) OF 6'
   DO PROC_1
   LN=7
   LN=LN+1
   DO SOLRE2A
endif
EJECT







