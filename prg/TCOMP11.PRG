LN=6
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY '                   STAGE E  :  TERMINAL STERILISATION RECORD'
LN=LN+1
@LN,0 SAY CHR(27)+'F'
TEXT
_______________________________________________________________________________

 Subject the vials for terminal sterilization at 115 Deg.C (10 lbs) 
 for 30 minutes.

 Autoclave number:__________________     Cleanliness ckd.by:________________
 Steamline pressure: ______kgs/sq.cm.    Sterilization date:________________
_________________________________________________________________________________
 |Steps/|    Procedure    |     Lot A       |Checked |    Lot B         |CKD |                 
 |Date. |                 |  Observation    |  by    |  Observation     | BY |                  
 |______|_________________|_________________|_______ |__________________|____|              
 |      |                 |                 |        |                  |    |   
 |      |                 |                 |        |                  |    |                   
 |1.    | Loaded at :     | Time:_______    |        | Time:_______     |    |                   
 |      |                 |                 |        |                  |    |                   
 |      |                 |                 |        |                  |    |                   
 |2.    |Proper locking of|                 |        |                  |    |                   
 |      |autoclave.       |                 |        |                  |    |                   
 |      |                 |                 |        |                  |    |                   
 |3.    |Jacket pressure. | _________ psig  |        | _________ psig   |    |                   
 |      |                 |                 |        |                  |    |                   
 |4.    |Evacuate chamber | Vacuum:_____"Hg |        | Vacuum:_____"Hg  |    |                   
 |      |using vacuum     | From:  _____    |        | From:  _____     |    |                   
 |      |pump             | To:    _____    |        | To:    _____     |    |                   
 |      |vacuum 12-14 "Hg |                 |        |                  |    |                   
 |      |                 |                 |        |                  |    |                   
 |5.    |Chamber pressure | _________ psig  |        | _________ psig   |    |                   
 |      |                 |                 |        |                  |    |                   
 |6.    |Scanner temp. of |Temp: _____ deg.C|        | Temp: _____ deg.C|    |                                                  
 |      |all probes       |                 |        |                  |    |                   
 |      |                 |                 |        |                  |    |                               
 |7.    |Sterilisation    |Temp:_______Deg.C|        | Temp:_______Deg.C|    |                   
 |      |temperature      |                 |        |                  |    |                   
 |      |attained at:     | Time:________   |        | Time:________    |    |                   
 |      |                 |                 |        |                  |    |                   
 |8.    |Temp. maintained |Temp:_______Deg.C|        | Temp:_______Deg.C|    |                   
 |      |till :           |Time:________    |        | Time:________    |    |                   
 |      |                 |                 |        |                  |    |                   
 |9.    |Cooling cycle    |                 |        |                  |    |                   
 |      |Apply compressed |                 |        |                  |    |
 |      |air & maintain as|                 |        |                  |    |
 |      |mentioned        |                 |        |                  |    |
 |      | STEP I          |14 PSIG/40 MIN   |        |14 PSIG/40 MIN    |    |
 |      | time            |From:_______     |        |From:________     |    |
 |      |                 |To  :________    |        |To  :________     |    |                   
 |      | STEP II         |14 PSIG/50 MIN   |        |14 PSIG/50 MIN    |    |
 |      | time            |From:_______     |        |From:_______      |    |
 |      |                 |To  :________    |        |To  :________     |    |
 |      |                 |                 |        |                  |    |                   
 |10.   |Unloaded at      |Time:________    |        | Time:________    |    |                   
 |      |                 |                 |        |                  |    |                   
 |11.   |Breakages        |__________nos.   |        | __________nos.   |    |                   
 |      |                 |                 |        |                  |    |                   
 |      |                 |                 |        |                  |    |                   
------------------------------------------------------------------------------
ENDTEXT
LN=64
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY  'REMARKS.: Keep sterilised vials in quarantine area for minimum 2 days.'
LN=LN+1
@LN,0 SAY CHR(27)+'F'
@LN,1 SAY  ' Stored on ________.   '
EJECT
