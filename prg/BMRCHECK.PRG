LN=1
@LN,1 SAY "                           CHECK LIST NO 4"
LN=LN+2
@LN,1 SAY "                UNLOADING AND TRANSFER TO QUARANTINE"
LN=LN+2
@LN,1 SAY "                        FOR ASEPTIC PRODUCTS "
LN=LN+2
@LN,3 SAY 'PRODUCT NAME:'
@LN,18 SAY PNAME
@LN,50 SAY 'BATCH NO:'
@LN,65 SAY VBNO
LN=LN+2
@LN,3 SAY 'DATE       :'
@LN,50 SAY 'LOT NO  :'
LN=LN+2
@LN,50 SAY 'PACKING  :'
LN=LN+1
@LN,50 SAY 'SIZE'
LN=16
TEXT
         -----------------------------------------------------------------------
         DETAILS                   |    LOT A    |     LOT B     |    LOT C 
         --------------------------|-------------|---------------|--------------
                                   | CKD  | CCKD |  CKD  | CCKD  | CKD  | CCKD
         1  Check the label        |      |      |       |       |      |
            details of the pressure|      |      |       |       |      |
            vessel taken for       |      |      |       |       |      |
            filling [ every lot ]  |      |      |       |       |      |
                                   |      |      |       |       |      |
         2  Check & remove all the |      |      |       |       |      |
            labels vials etc. from |      |      |       |       |      |
            previous batch for     |      |      |       |       |      |
            line clearance.        |      |      |       |       |      |
                                   |      |      |       |       |      |
         3  At a time bring        |      |      |       |       |      |
            empty (blue) crates    |      |      |       |       |      |   
            for the batch.         |      |      |       |       |      |    
                                   |      |      |       |       |      |    
         4  Check that all the     |      |      |       |       |      |
            crates are clean & no  |      |      |       |       |      |
            earlier labels should  |      |      |       |       |      |
            be there.              |      |      |       |       |      |
                                   |      |      |       |       |      |
         5  Check that all crates  |      |      |       |       |      |
            are properly labelled. |      |      |       |       |      |
                                   |      |      |       |       |      |
         6  Transfer all the crates|      |      |       |       |      |
            of each lot to quaran- |      |      |       |       |      |
            tine under Q.C super-  |      |      |       |       |      |
            vision.                |      |      |       |       |      |
                                   |      |      |       |       |      |
         7  Number of crates filled|      |      |       |       |      |











               
               -----------------                             -------------------
                 ( Q.C DEPT. )                               ( PRODUCTION DEPT.)

.
ENDTEXT


















































