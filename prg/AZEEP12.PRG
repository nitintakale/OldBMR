LN=7
TEXT     
    CURRENT ACTUAL VALUES DURING LYOPHILISATION OF VIALS   CONTD.
__________________________________________________________________________
|Stage  |Time |Vacuum|Shelves |Shelves|Condensor|Product|Product| Remarks|
|       |     |of cha|temp.OUT|temp IN| Temp.øC |Temp.øC|Temp.øC|        |
|       |     |-mber |        |       |         |No.1   |No.2   |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|
|       |     |      |        |       |         |       |       |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|
|       |     |      |        |       |         |       |       |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|
|       |     |      |        |       |         |       |       |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|
|       |     |      |        |       |         |       |       |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|
|       |     |      |        |       |         |       |       |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|
|       |     |      |        |       |         |       |       |        |
|-------|-----|------|--------|-------|---------|-------|-------|--------|

After completion of Lyophilisation cycle,stopper the plugs completely by applying
Hydraulic pressing system provided in the lyophilizer.
Hydaulic pressing of plugs checked by:_______.
Open the door of the chamber and unload the freezed and stoppered vials and
subject them to sealing. 

Seal placed by:______.      On Sealing Machne:_________.
 
Check the Sealing quality of intial 5 vials. Checked by:_______.
Sealing completed at:_______.
Seal rejection :_______.
ENDTEXT
ln=35
IF 'PHOTE'$SNAME
     @ln,1 say 'Transfer the sealed vials to Quarantine (REFRIGERATOR) between 2 to 8 deg.c'
else
     @ln,1 say 'Transfer the sealed vials to Quarantine and Store below 25øC.'
endif
ln=37
text
                     RECONCILIATION OF PACKAGING COMPONENTS
 ___________________________________________________________________________
 |  Sr. |                         |     QUANTITY in Number     |   CHECKED  |
 |  No. |   ACCOUNTING DETAILS    |----------------------------|      BY    |
 |      |                         |  VIALS  | PLUGS  | SEALS   |            | 
 |------|-------------------------|---------|--------|---------|------------|
 |  1   | NET ISSUED              |         |        |         |            |
 |------|-------------------------|---------|--------|---------|------------|
 |  2   | BREAKAGES/SEAL DAMAGE   |         |        |         |            |
 |------|-------------------------|---------|--------|---------|------------|
 |  3   | REJECTS                 |         |        |         |            |
 |------|-------------------------|---------|--------|---------|------------|
 |  4   | Q.C. SAMPLING           |         |        |         |            |
 |------|-------------------------|---------|--------|---------|------------|
 |  5   | PACKED QUANTITY         |         |        |         |            |
 |------|-------------------------|---------|--------|---------|------------|
 |  6   | TOTAL OF (2 + 5) =      |         |        |         |            |
 |------|-------------------------|---------|--------|---------|------------|
 |  7   | VARIANCE (6 - 1) =      |         |        |         |            |
 |______|_________________________|_________|________|_________|____________|

ENDTEXT








