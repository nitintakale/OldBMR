ln=7
text
                    STAGE D : FILLING AND SEALING OPERATION

  3) ENVIRONMENTAL CONTROL :
      ________________________________________________________________________
       |        |                           | Filling /       |              |
       | Date   |   Control checks          | Sealing  area   | Checked by   |
       |________|___________________________|_________________|______________|
       |        |  Temperature              |     ______Deg.C |              |
       |        |---------------------------|-----------------|--------------|
       |        |  Area Cleanliness         |                 |              |
       |---------------------------------------------------------------------|
       |         LAF :- MANOMETER READING IN mm OF WATER WHEN ON             |
       |---------------------------------------------------------------------|
       |       TIME     |   FILLING  AND SEALING            | CHECKED BY     |
       |----------------|-----------------------------------|----------------|
       |                |                                   |                |
       |---------------------------------------------------------------------|
       | Spraying with 70%   |Morning        Afternoon        Evening        |
       | IPA                 |[     ]         [      ]        [     ]        | 
       |_____________________|_______________________________________________|

4.   FILLING & SEALING RECORD :

     ON FILLING M/C _______/_______   
ENDTEXT
LN=30
@LN,3 SAY 'Adjust  the fill value to  '+LTRIM(STR(VOLVIAL,5,2)) +'  ML' 
LN=LN+1
SVOLVIAL=LTRIM(STR(VOLVIAL,5,2))
IF SUBSTR(SVOLVIAL,4,1)='5'
   ULIMIT=VOLVIAL+0.05
   LLIMIT=VOLVIAL-0.05
ELSE
   ULIMIT=VOLVIAL+0.1
   LLIMIT=VOLVIAL-0.1
ENDIF
@LN,7 SAY '(limit : '+LTRIM(STR(LLIMIT,5,2))+' ML TO  '+LTRIM(STR(ULIMIT,5,2))+' ML )'
LN=34
 TEXT

    Initially,check fill volume of 2 filled ampoules from each nozzle.
         Initial - Fill volume check in ml  Date :__________ Starting Time :____
          ____________________________________________________
          |    Nozzle No.     | Ampoule Numbers| Checked By  |
          |                   |  1    |    2   |             |
          |-------------------|-------|--------|-------------|
          |         1         |       |        |             |
          |-------------------|-------|--------|-------------|
          |         2         |       |        |             |
          |-------------------|-------|--------|-------------|
          |         3         |       |        |             |
          |-------------------|-------|--------|-------------|
          |         4         |       |        |             |
          ----------------------------------------------------
 5.2 Remove approx. 25 ml of the solution from each nozzle in glass container
     and discard the solution.
 5.3 Initially, check sealing quality of 5 filled ampoules from each sealing 
ENDTEXT
LN=50
USEALHT=VSEALHT+1
LSEALHT=VSEALHT-1
@LN,6 SAY ' head.Sealing ht.'+LTRIM(STR(LSEALHT,2))+ ' mm to ' +LTRIM(STR(USEALHT,2)) +' mm.  Checked By : ___.'
ln=53
text
 5.4 Carry out vacuum test on 2 units from individual sealing heads in  supine
     position for 5  minutes.   `No units should leak'.

     In  case of leakage observed, rectify sealing and perform the  same  test.
     When vacuum test is O.K., continue the filling and sealing.

endtext
