LN=7
text
              B A T C H   P A C K I N G   R E C O R D
==============================================================================
 SECTION: II          OVER-PRINTING OF PACKAGING MATERIALS        

                              A. LINE CLEARANCE 

           LABELS                                   INNER CARTONS 
 Ambica machine 
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
  |                        |O.P.  |AMBICA |  |                        |      |
  |                        | M/C  | M/C   |  |                        |      |
  |________________________|______|_______|  |________________________|______|
  |   Stereo-setting       |      |       |  |   Stereo-setting       |      : 
  | Checked & certified by:|      |       |  | Checked & certified by:|      |
  |---------------------------------------|  |-------------------------------|
  | Date:____________ Time :______|_____  |  | Date:_________    Time :_____ |
  |_______________________________|_______|  |_______________________________|
  | On Machine  : ------>  |      |       |  | On Machine  : ------>  |      |
  |________________________|______|_______|  |________________________|______|
  | Started   at :----->   |      |       |  | Started   at :----->   |      |
  |________________________|______|_______|  |________________________|______|
  | Completed at :----->   |      |       |  | Completed at :----->   |      |
  |________________________|______|_______|  |________________________|______|
 --------------------------------------------------------------------------
              C. OVER-PRINTING INSTRUCTIONS FOR LABELS/CARTONS/SHIPPERS

                  NOTE:[  /  ]  Tick  mark  after  checking   for 
                                    correctness of overprinting matter.
                       [ N.A ]  Over-printing  matter  not applicable 
____________________________________________________________________________
|   DETAILS           |OVERPRINTING MATTER|__LABELS________|CARTONS|SHIPPER|
|                     |    INITIATION     |OP.M/C| AMB. M/C|       |       |
|---------------------|-------------------|------|---------|-------|-------|
ENDTEXT
LN=50
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
@LN,0 SAY '|Manufacturing date L/C                   |                |       |        |'
@LN,24 SAY VLMFGDT
@LN,36 SAY VCMFGDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|--------|'
LN=LN+1
@LN,0 SAY '|Expiry date  L/C     |                   |                |       |        |'
@LN,24 SAY VLEXPDT
@LN,36 SAY VCEXPDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Max retail price     |                   |              |       |         |'
IF VAL(N)=5
@LN,24 SAY VMRP PICT '99.99'
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








