LN=4
TEXT
                    B A T C H  P A C K A G I N G  R E C O R D
===============================================================================
 SECTION: II          OVER-PRINTING OF PACKAGING MATERIALS        
                              A. LINE CLEARANCE 
           LABELS                        
 United Eng.machine 
 Over-printing M/c No:______________     
 PREVIOUS PRODUCT:__________________     
 BATCH No:__________________________     
________________________________________ 
| Checked & certified by:|              |
|------------------------|--------------|
| Date:____________     Time :__________|
|_______________________________________|
 OVER-PRINTING MACHINE SET UP & OPERATION   
                    LABELS                      
  ________________________________________ 
  |                        |O.P.  |U/E    |
  |                        | M/C  | M/C   |
  |________________________|______|_______|
  |   Stereo-setting       |      |       | 
  | Checked & certified by:|      |       |
  |---------------------------------------|
  | Date:____________ Time :______|_____  |
  |_______________________________|_______|
  | Operator  : ------->   |      |       |
  |________________________|______|_______|
  | Started   at :----->   |      |       |
  |________________________|______|_______|
  | Completed at :----->   |      |       |
  |________________________|______|_______|
   C. OVER-PRINTING INSTRUCTIONS FOR LABELS/CARTONS/SHIPPERS
   NOTE:[ /  ] Tick mark after checking for correctness of overprinting matter.
              [ N.A ]  Over-printing  matter not applicable
____________________________________________________________________________
|   DETAILS           |OVERPRINTING MATTER| AMPOULE LABEL| OUTER  |SHIPPER|
|                     |    INITIATION     |              | CARTON | KLASS |       
|                     |                   |              | LABEL  | MARK  |       
|---------------------|-------------------|--------------|--------|-------|
ENDTEXT
LN=45
@ln,0 say '|Mfg.lic.no           |                   |              |       |         |'
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
@LN,24 SAY VMRP
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
LN=LN+1
@LN,0 SAY '|Physicians sample    |                   |              |       |         |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
ln=ln+1
@LN,0 SAY '|_____  Logo &        |                   |              |       |         |'
@ln,2 say vlogo
LN=LN+1
@LN,0 SAY '|ADITI address        |                   |              |       |         |'  
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
ln=ln+1
@ln,0 say '|Quantity to be Overprinted in numbers.   |      |       |       |         |'
ln=ln+1
@LN,0 SAY '|---------------------|-------------------|--------------|-------|---------|'
ln=ln+1
@ln,0 say ' INITIATED BY :_____________________    COUNTER-CHECKED BY:___________________'
