****FFS BPR PAGE 2
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
 Maharshi/U.E  machine
 Over-printing M/c No:______________         Over-printing M/c No:_____________
 PREVIOUS PRODUCT:__________________         PREVIOUS PRODUCT:_________________
 BATCH No:__________________________         BATCH No:________________________
________________________________________     _________________________________ 
| Checked & certified by:|              |    | Checked & certified by:|       :
|------------------------|--------------|    |------------------------|-------:
| Date:____________     Time :__________|    | Date:____________  Time:_______|
|_______________________________________|    |________________________________:
                    B. OVER-PRINTING MACHINE SET UP & OPERATION
               LABELS                               INNER CARTONS
  ________________________________________   ________________________________
  |                        |MAHARSHI /U.E.|  |                        |      |
  |                        |     M/C
  |________________________|______________|  |________________________|______|
  |   Stereo-setting       |              |  |   Stereo-setting       |      : 
  | Checked & certified by:|              |  | Checked & certified by:|      |
  |---------------------------------------|  |-------------------------------|
  | Date:____________ Time :              |  | Date:_________    Time :_____ |
  |_______________________________________|  |_______________________________|
  | Operator  : ------->   |              |  | Operator  : ------->   |      |
  |________________________|______________|  |________________________|______|
  | Started   at :----->   |              |  | Started   at :----->   |      |
  |________________________|______________|  |________________________|______|
  | Completed at :----->   |              |  | Completed at :----->   |      |
  |________________________|______________|  |________________________|______|
              C. OVER-PRINTING INSTRUCTIONS FOR LABELS/CARTONS/SHIPPERS
                  NOTE:[  /  ]  Tick  mark  after  checking   for 
                                    correctness of overprinting matter.
                       [ N.A ]  Over-printing  matter  not applicable 
ENDTEXT
LN=42
@LN,1 SAY CHR(27)+CHR(77)
@LN,0 SAY '______________________________________________________________________________________'
LN=LN+1
@LN,0 SAY '|   DETAILS           |OVERPRINTING MATTER|__LABELS________|CARTONS  |OUT.CART|SHIPPER|'
LN=LN+1
@LN,0 SAY '|                     |    INITIATION     |MAHARSHI/U.E M/C|/RBOX LBL|  LABEL |       |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--L1------L2-----|---------|--------|-------|'
LN=LN+1
@ln,0 say '|Mfg.lic.no           |                   |                 |         |        |       |'
IF SA_EX='E'
   @LN,24 SAY vEmfg
ENDIF
IF SA_EX='S' .OR. SA_EX="P"
   @LN,24 SAY vmfg
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|--------|--------|--------|'
LN=LN+1
@LN,0 SAY '|Product  name        |                   |                 |        |        |        |'
@LN,24 SAY PNAME
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|--------|--------|--------|'
LN=LN+1
@LN,0 SAY '|Batch no.            |                   |                 |        |        |        |'
@LN,24 SAY VBNO
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|--------|--------|--------|'
LN=LN+1
@LN,0 SAY '|Manufacturing date L/C                   |                 |        |        |        |'
@LN,24 SAY VLMFGDT
@LN,34 SAY VCMFGDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|--------|--------|--------|'
LN=LN+1
@LN,0 SAY '|Expiry date  L/C     |                   |                 |        |        |        |'
@LN,24 SAY VLEXPDT
@LN,34 SAY VCEXPDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|---------|-------|--------|'
LN=LN+1
@LN,0 SAY '|Max retail price  Rs.|                   |                 |         |       |        |'
IF SA_EX="S" 
   @LN,24 SAY VMRP PICT '999.99'
ENDIF
IF  SA_EX="E"  
   @LN,24 SAY '  N.A.'
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|----------|------|---------|'
LN=LN+1
@LN,0 SAY '|Physicians sample    |                   |                 |          |      |         |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|----------|------|---------|'
ln=ln+1
@LN,0 SAY '| _____ Logo & address|                   |                 |          |      |         |'
@ln,2 say vlogo
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|-----------------|----------|------|---------|'
ln=ln+1
@ln,0 say '|Quantity to be Overprinted in numbers.   |                 |          |      |         |'
ln=ln+1
@LN,0 SAY '|---------------------|-------------------|-----------------|----------|------|---------|'
ln=ln+1
@ln,0 say ' INITIATED BY :_____________________    COUNTER-CHECKED BY:___________________'
@LN,1 SAY CHR(27)+CHR(80)
EJECT
