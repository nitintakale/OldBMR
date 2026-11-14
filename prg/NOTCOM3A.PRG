LN=7
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY '2.2      Autoclaving with disodium edetate solution A.R.NO.of EDTA.__________'
@LN,0 SAY CHR(27)+'F'
LN=LN+1
TEXT
     1.  Prepare 0.1% disodium edetate solution in filtered D.M.WATER                   
         Qty.of disodium edetate ______ made up to _____L with filtered
         D.M. Water.Prepared by:__________. Ckd by :_______. Date :_______.
     2.  Transfer approximately  7,500 of step 2.1 closures into 30L S.S.
         vessel, containing approx. 25 L 0.1%  disodium  edetate solution.
         Make such required no. of containers.
         Autoclave at 15psi (121 deg.C) for 55 minutes.
  ______________________________________________________________________
  |DATE  |LOT   | LOAD |  Steam  | Temp.in  |    Time    |  Checked by |
  |      |no    |  NO  | pressure| deg.C    |From |   To |             |
  |      |      |      | in psi  |          |     |      |             |
  |______|______|______|_________|__________|_____|______|_____________|
  |      |  I   |      |         |          |            |             |
  | _____|______|______|_________|__________|_____|______|_____________|
  |      |  II  |      |         |          |            |             |
  |______|______|______|_________|__________|____________|_____________|
     After  the  completion  of cycle, unload the closures from the autoclave   
     chamber & drain out solution immediately from vessels. 
ENDTEXT
LN=30
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY '2.3    Rinsing rubber closures in the bubbler:'
@LN,0 SAY CHR(27)+'F'
LN=LN+1
TEXT
       Date:_______________.From:____________.To:____________
    1. Charge approximately 5000  rubber  closures  in the bubbler kept 
       under LAF Unit. 
    2. Fill  up the bubbler with  6 microne filtered Hot D.M.Water from  
       bottom inlet.
    3. Start the filtered air supply to the bubbler and adjust the  qty.  such 
       that water overflows at a slow rate from the top drain while the  closures 
       are  still  being agitated.  Continue this rinsing operation  till  the 
       rinse  water  is clear when checked in the inspectionhood.   (This  may 
       take about 45 minutes per load)
    4. Repeat steps 1 to 4 for the batch qauntity of rubber closures.
    ____________________________________________________________________
    |  Lot No.          | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |
    |___________________|___|___|___|___|___|___|___|___|___|___|___|___|
    |  Quantity         |   |   |   |   |   |   |   |   |   |   |   |   |
    |-------------------|---|---|---|---|---|---|---|---|---|---|---|---|
    |  Rinse clarity    |   |   |   |   |   |   |   |   |   |   |   |   |
    |__Checked by_______|___|___|___|___|___|___|___|___|___|___|___|___|
ENDTEXT
EJECT