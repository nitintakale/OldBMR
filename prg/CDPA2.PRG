
@0,60 SAY 'PAGE : 2 OF 6'
DO OKPROC_1
LN=7
TEXT
                    B A T C H  P A C K A G I N G  R E C O R D
===============================================================================
 SECTION: II          OVER-PRINTING OF PACKAGING MATERIALS        

                              A. LINE CLEARANCE 
 LABELS                                      CARTONS 
 MAHARSHI MACHINE
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
               LABELS                                  INNER  CARTONS
  ________________________________________   ________________________________
  |                        |MAHARSHI M/C |  |                        |      |
  |                        |             |  |                        |      |
  |________________________|_____________|  |________________________|______|
  |   Stereo-setting       |             |  |   Stereo-setting       |      | 
  | Checked & certified by:|             |  | Checked & certified by:|      |
  |--------------------------------------|  |-------------------------------|
  | Date:____________ Time :___________  |  | Date:_________    Time :_____ |
  |______________________________________|  |_______________________________|
  | Operator  : ------->   |             |  | Operator  : ------->   |      |
  |________________________|_____________|  |________________________|______|
  | Started   at :----->   |             |  | Started   at :----->   |      |
  |________________________|_____________|  |________________________|______|
  | Completed at :----->   |             |  | Completed at :----->   |      |
  |________________________|_____________|  |________________________|______|
 -----------------------------------------------------------------------------
              C. OVER-PRINTING INSTRUCTIONS FOR LABELS/CARTONS/SHIPPERS
                  NOTE:[  /  ]  Tick  mark  after  checking   for 
                                    correctness of overprinting matter.
                       [ N.A ]  Over-printing  matter  not applicable 
____________________________________________________________________________
|   DETAILS           |OVERPRINTING MATTER|LABELS|CARTONS|SHIPPER|ON AMBICA|
|                     |    INITIATION     |      |       |       |MACHINE  |
|                     |                   |      |       |       |LABELS   |
|---------------------|-------------------|------|-------|-------|---------|
ENDTEXT
LN=44
@ln,0 say '|Mfg.lic.no          |                   |              |       |         |'
IF SA_EX='E'
@LN,24 SAY vEmfg
ENDIF
IF SA_EX='S'
@LN,24 SAY vmfg
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Product  name        |                   |              |       |         |'
@LN,24 SAY PNAME
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Batch no.            |                   |              |       |         |'
@LN,24 SAY VBNO
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Manufacturing date L/C|                   |                |       |        |'
@LN,24 SAY VCMFGDT
@LN,38 SAY VLMFGDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|--------|'
LN=LN+1
@LN,0 SAY '|Expiry date  L/C     |                   |                |       |        |'
@LN,24 SAY VCEXPDT
@LN,38 SAY VLEXPDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Max retail price     |                   |              |       |         |'
IF VAL(N)=5
  @LN,24 SAY VMRP
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Physicians sample    |                   |              |       |         |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
ln=ln+1
@LN,0 SAY '|_____  Logo & address|                   |              |       |         |'
@ln,2 say vlogo
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
ln=ln+1
@ln,0 say '|Quantity to be Overprinted in numbers.   |      |       |       |         |'
ln=ln+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
ln=ln+1
@ln,0 say ' INITIATED BY :_____________________    COUNTER-CHECKED BY:___________________'
