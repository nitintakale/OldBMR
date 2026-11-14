LN=6
@LN,1 SAY CHR(27)+'E'
@LN,1 SAY '5.   FILLING & SEALING RECORD :'
@LN,1 SAY CHR(27)+'F'
LN=LN+1
TEXT
     ON FILLING M/C _______/_______   PP CAP PLACING ________/________.
ENDTEXT
LN=8
@LN,2 SAY '5.1 Adjust Fill volume to:'+LTRIM(STR(VOLVIAL,5,2))+ 'ml.'+ 'ñ 0.10 ml.' 
text

     Initially, check fill volume of 5 filled bottles from each nozzle.
     Initial - Fill volume check in ml  Date :__________ Starting Time :_______
_____________________________________________________________________________
       | 1  |  2  |  3  |  4  |  5  |   |  1  |  2  |  3 |  4 | 5 |Checked by|
  1.   |----|-----|-----|-----|-----| 2 |-----|-----|----|----| --|----------|
_______|____|_____|_____|_____|_____|___|_____|_____|____|____|___|__________|
_____________________________________________________________________________
       | 1  |  2  |  3  |  4  |  5  |   |  1  |  2  |  3 |  4 | 5 |Checked by|
  3.   |----|-----|-----|-----|-----| 4 |-----|-----|----|----| --|----------|
_______|____|_____|_____|_____|_____|___|_____|_____|____|____|___|__________|
 5.2 Remove approx. 250 ml of the solution from all the nozzles together in 
     glass container and discard.
 5.3 Check the initial clarity of soln.from each nozzles separately.
 5.4 Initially, check sealing quality of 5 filled bottles:-  Ckd by :________
     On sealing  machine :______/________.
 5.5 Carry out vacuum test on 4 units from  sealing heads at  400 
     mm  vacuum  in  inverted  position for 15  minutes  (containing  product)' 
     `No units should leak'.
     In  case of leakage observed, rectify head and perform the  same  test.
     When vacuum test is O.K., continue the filling and sealing.
ENDTEXT
LN=32
@LN,1 SAY CHR(27)+'E'
@LN,1 SAY '  6.  In-process  control  checks  for:- fill volume ,quality  of  sealing  of '
LN=LN+1
@LN,1 SAY '      filled vials  Every hour, and Vacuum test at Every four hours interval:'
@LN,1 SAY CHR(27)+'F'
LN=LN+1
       TEXT
		  Date :____________
           ____________________________________________________________
           |        | Fill volume    |  Sealing  | Vacuum   | Checked  |
           | Lot/   | check in ml    |  quality  |  test    |   by     |
           | Time   |---Nozzle---    |  of 16/4  |  vacuum  |          |
           |        | 1 | 2 | 3  | 4 |  bottles  |In mm|    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|     
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|     
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |________|___|___|____|___|___________|_____|____|__________|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|
           |        |   |   |    |   |           |     |    |          |
           |--------|---|---|----|---|-----------|-----|----|----------|

ENDTEXT