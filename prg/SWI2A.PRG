LN=LN+1
TEXT
              D. OVER-PRINTING INSTRUCTIONS FOR WATER FOR INJECTION 5 ML / 10 ML
                  NOTE:[  /  ]  Tick  mark  after  checking   for 
                                    correctness of overprinting matter.
                       [ N.A ]  Over-printing  matter  not applicable 
_________________________________________________________________
|   DETAILS           |OVERPRINTING MATTER             |CARTONS  |
|                     |    INITIATION                  |         |
|---------------------|--------------------------------|---------|
|M.L. NO.             |                                |         |
|---------------------|--------------------------------|---------|
|Product  name        |Water for injection  (f.f.s)    |         |
|---------------------|--------------------------------|---------|
|Batch no.            |                                |         |
|---------------------|--------------------------------|---------|
|Manufacturing  date  |                                |         |
|---------------------|--------------------------------|---------|
|Expiry date          |                                |         |
|---------------------|--------------------------------|---------|
|                     |                                |         |
|_____  Logo & address|                                |         |
|                     |                                |         |
|                     |                                |         |
|                     |                                |         |
|---------------------|--------------------------------|---------|
|Quantity to be       |                                |         |
|Overprinted in numbers.                               |         |
|---------------------|--------------------------------|---------|
 INITIATED BY :_____________________    COUNTER-CHECKED BY:__________________

INITIAL CHECKS :
_____________________________________________________________________
|        PRODUCT         |  MFG.   |  EXP    |  SHELF LIFE    |CKD BY|
|                        |  DATE   |  DATE   |STANDARD| ACTUAL|      |
|------------------------|---------|---------|--------|-------|------|
ENDTEXT
LN=41
@LN,1 SAY LTRIM(PNAME)
@LN,26 SAY VMFGDATE1
@LN,37 SAY VEXPDATE1
@LN,47 SAY LTRIM(STR(VEXPIRY))+' MONTHS'
LN=44
TEXT
|------------------------|---------|---------|--------|-------|------|
|Water for injection     |         |         |        |       |      |
|  (f.f.s)               |         |         |        |       |      |
|________________________|_________|_________|________|_______|______|
NOTE  : 
1. The expiry date of Solvent for Reconstitution should be same or more than
the expiry date of product.
2. If the expiry of solvent for renconstitution is less than the expiry date of 
the product, then the consignment of solvent for reconstitution should be 
rejected.
ENDTEXT




