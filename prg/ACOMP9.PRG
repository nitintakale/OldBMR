   LN=6
   @LN,1 SAY CHR(27)+'E'
   @LN,1 SAY '            STAGE D : FILLING AND SEALING OPERATION'
   lN=LN+1
   @LN,1 SAY CHR(27)+'F'
  TEXT
   1. LIST OF  FILLING ACCESSORIES 
_____________________________________________________________________________
       ITEMS            |QTY. | CKD.BY |    ITEMS               |QTY. | CKD.BY|
________________________|_____|________|________________________|_____|_______|
  S.S.SYRINGES.         | 2   |        |   GLASS SYRINGES.      | 4   |       |
________________________|_____|________|________________________|_____|_______|
  PVC & SILICON TUBES.  |LOT  |        |      G 3   30 mm       | 4   |       |
________________________|_____|________|________________________|_____|_______|
  20 lts FILLING VESSEL |     |        |   DRESS & GLOVES FOR   | 3   |       |
  WITH  DISTILLED WATER.| 1   |        |   SEALING M/C.         |SETS |       |
________________________|_____|________|________________________|_____|_______|
  250 ml BEAKER.        | 2   |        |   R.F.B.FLASK 500 ml.  | 3   |       |
________________________|_____|________|________________________|_____|_______|
  5 lts CONICAL FLASK.  | 1   |        |   CONICAL FLASK 100 ml.| 2   |       |
________________________|_____|________|________________________|_____|_______|
  FORCEPS.              | 3   |        |   S.S.SCISSOR.         | 1   |       |
________________________|_____|________|________________________|_____|_______|
  S.S.POTS.             | 2   |        |   S.S.CONTAINER +LID.  | 1   |       |
________________________|_____|________|________________________|_____|_______|
  ALUMINIUM FOIL.       |1LOT |        | S.S.CONTAINER FOR PLUGS| 1   |       |
________________________|_____|________|________________________|_____|_______|
  MOPS.                 | 3   |        |  AL.SEALS IN BEAKER.   | 50  |       |
________________________|_____|________|________________________|_____|_______|
Q.C.SAMPLING ACCESSORIES|LOT  |        | 10 ml GLASS CYLINDER.  | 1   |       |
________________________|_____|________|________________________|_____|_______|
S.S."T" CONNECTOR.      | 1   |        | FILIING NOZZELS.       | 2   |       |
________________________|_____|________|________________________|_____|_______|
endtext
if mopt=5
text
S.S.CLAMPS.             | 4   |        | NITROGEN FLUSHING      |     |       |
                        |     |        | NOZZLES AND MANIFOLD.  |     |       |
________________________|_____|________|________________________|_____|_______|
endtext
else
text
S.S.CLAMPS.             | 4   |        | INDICATOR.             |  1  |       |
                        |     |        |                        |     |       |
________________________|_____|________|________________________|_____|_______|
endtext
ENDIF
TEXT
     ABOVE ACCESSORIES CLEANED BY:_______________. CHECKED BY:________________
  2. STERILIZATION RECORD : Autoclave above load in autoclave at 15 lbs
                             for 1 hour at 121 Deg.C
 _____________________________________________________________________________                 
 |DATE  |LOAD  | STERILIZATION    | TEMP.   | UNLOADING   | DONE   | CHECKED |                
 |      |NO.   | FROM  | TO       |IN Deg.C | TIME | DATE |   BY   |   BY    |                
 |______|______|_______|__________|_________|______|______|________|_________|                
 |      |      |       |          |         |      |      |        |         |                
 |______|______|_______|__________|_________|______|______|________|_________|                
  3)  ENVIRONMENTAL CONTROL
       ______________________________________________________________________
       |        |                           | Filling /       |              |
       | Date   |   Control checks          | Sealing  area   | Checked by   |
       |________|___________________________|_________________|______________|
       |        |  Temperature              |   ______Deg.C   |              |
       |        |---------------------------|-----------------|--------------|
       |        |  Area Cleanliness         |                 |              |
       |---------------------------------------------------------------------|
       |         LAF :-          MANOMETER READING IN mm OF WATER WHEN ON    |
       |---------------------------------------------------------------------|
       |  TIME  | FILTERATION| COOLING | FILLING | PLUGGING | SEALING| CKD   |
       |        |            | ZONE    |1 | 2 |3 | 1  |  2  |        |  BY   |
       |--------|------------|---------|--|---|--|----|-----|--------|-------|
       |        |            |         |  |   |  |    |     |        |       |
       |---------------------------------------------------------------------|
       | Spraying with 70%   |Morning        Afternoon        Evening        |
       | IPA                 |[     ]         [      ]        [     ]        | 
       |_____________________|_______________________________________________|

      4.CLEANING OF LDPE PLUGGING MACHINE HOPPER & CHUTE
  NOTE: Hopper to be cleaned with filtered sterlized D.water and followed by
        filtered 70 % IPA.
 ENDTEXT
		  EJECT