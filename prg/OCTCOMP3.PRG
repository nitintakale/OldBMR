********ciplox page 4
LN=6
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY '2)   RUBBER CLOSURES :      '
LN=LN+1
@LN,1 SAY '     INSTRUCTIONS:'
LN=LN+1
@LN,1 SAY '2.1  Teepol treatment :'
@LN,0 SAY CHR(27)+'F'
TEXT
 1.  Prepare 0.5% teepol solution in filtered D.M.Water.      
     Qty. of teepol ______ made up to _____ L  with filtered D.M.Water, for
     each lot.
     Prepared by:____________. Checked by :_______________. Date :___________.
 2.  Take 20 lts of 0.5 % teepol solution in 30 lts s.s. container.Add about    
     7500  rubber  closures  in  the container and cover  with  lid.Make  such 
     required no. of containers.
 3.  Autoclave above container at 10 psi (115 deg. C) for 15 minutes.
  ______________________________________________________________________
  |DATE  |LOT   | LOAD |  Steam  | Temp.in  |    Time    |  Checked by |
  |      |NO.   |  NO. | pressure| deg.C    |From |   To |             |
  |      |      |      | in psi  |          |     |      |             |
  |______|______|______|_________|__________|_____|______|_____________|
  |      |      |      |         |          |            |             |
  | _____|______|______|_________|__________|____________|_____________|
  |      |      |      |         |          |            |             |
  |______|______|______|_________|__________|____________|_____________|
  |      |      |      |         |          |            |             |
  |______|______|______|_________|__________|____________|_____________|
 4. After the completion of cycle, unload the closures from the autoclave 
  chamber and make the closures teepol free by rinsing with filtered D.M water
ENDTEXT
LN=31
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY '2.2 Autoclaving with disodium edetate solution A.R.NO.of EDTA.__________'
@LN,0 SAY CHR(27)+'F'
LN=LN+1
TEXT
     1.  Prepare 0.1% disodium edetate solution in filtered D.M.WATER                   
         Qty.of disodium edetate ______ made up to _____L with filtered
         D.M. Water.Prepared by:__________. Ckd by :_______. Date :_______.
     2.  Transfer approximately  7,500 of step 2.1 closures into 30L S.S.
         vessel, containing approx. 25 L 0.1%  disodium  edetate solution.
         Make such required no. of containers.Autoclave at 15psi (121 deg.C) 
         for 30 minutes. 
  ______ ______________________________________________________________________
  |DATE  |LOT   | LOAD |  Steam  | Temp.in  |    Time    |  Checked by |
  |      |no    |  NO  | pressure| deg.C    |From |   To |             |
  |      |      |      | in psi  |          |     |      |             |
  |______|______|______|_________|__________|_____|______|_____________|
  |      |  I   |      |         |          |            |             |
  | _____|______|______|_________|__________|_____|______|_____________|
  |      |  II  |      |         |          |            |             |
  |______|______|______|_________|__________|____________|_____________|
     After  the  completion  of cycle, unload the closures from the autoclave   
     chamber & drain out solution immediately from tanks. 
ENDTEXT
LN=51
@LN,0 SAY CHR(27)+'E'
@LN,1 SAY '2.3    Rinsing rubber closures in the bubbler: manometer reading __ mm of water'
@LN,0 SAY CHR(27)+'F'
LN=LN+1
TEXT
       Date:_______________.From:____________.To:____________
    1. Charge approx.5000  rubber  closures  in the bubbler kept under LAF Unit.  
    2. Fill  up the bubbler with 2 microne & 6 microne filtered Hot D.M.Water from  
       bottom inlet.
    3. Start the filtered air supply to the bubbler and adjust the  qty.  such 
       that water overflows at a slow rate from the top drain while the  closures 
       are  still  being agitated.  Continue this rinsing operation  till  the 
       rinse  water  is clear when checked in the inspectionhood.   (This  may 
       take about 45 minutes per load)
    4. Repeat steps 1 to 4 for the batch qauntity of rubber closures.
  ____________________________________________________________________________
  |  Lot No.          | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |10 |11 |12 |13 |14 |
  |___________________|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
  |  Quantity         |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
  |-------------------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
  |  Rinse clarity    |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
  |__Checked by_______|___|___|___|___|___|___|___|___|___|___|___|___|___|___|
ENDTEXT
EJECT
