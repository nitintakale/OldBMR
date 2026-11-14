    
LN=1
@LN,1 SAY "                           CHECK LIST NO 11"
LN=LN+2
@LN,1 SAY "          COLLECTION OF LEAK TESTED VIALS AND TRANSFER TO QUARANTINE"
LN=LN+2
@LN,1 SAY "                      FOR FFS PRODUCTS    "
LN=LN+2
@LN,3 SAY 'PRODUCT NAME:'
@LN,18 SAY PNAME
@LN,50 SAY 'BATCH NO:'
@LN,65 SAY VBNO
LN=LN+2
@LN,3 SAY 'DATE       :'
@LN,50 SAY 'BATCH SIZE:'
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
            details of the holding |      |      |       |       |      |
            tank   taken for       |      |      |       |       |      |
            filling.               |      |      |       |       |      |
            ( Holding tank No.____)|      |      |       |       |      |
                                   |      |      |       |       |      |
         2  Check & remove all the |      |      |       |       |      |
            labels vials etc. from |      |      |       |       |      |
            previous batch for     |      |      |       |       |      |
            line clearance.        |      |      |       |       |      |
                                   |      |      |       |       |      |
         3  Bring empty crates &   |      |      |       |       |      |
            check that all crates  |      |      |       |       |      |
            are clean & no earlier |      |      |       |       |      |
            labels.                |      |      |       |       |      |
                                   |      |      |       |       |      |
         4  After completion of lot|      |      |       |       |      |
            Check that all crates  |      |      |       |       |      |
            are properally labelled|      |      |       |       |      |
                                   |      |      |       |       |      |
         5  Transfer all checked   |      |      |       |       |      |
            crates to quarantine   |      |      |       |       |      |
            under Q.C. supervision |      |      |       |       |      |
                                   |      |      |       |       |      |
         6  No. of crates filled.  |      |      |       |       |      |
                                   |      |      |       |       |      |
                                   |      |      |       |       |      |
         -----------------------------------------------------------------------








               -----------------                             -------------------
                 ( Q.C DEPT. )                               ( PRODUCTION DEPT.)


    CAUTION :
    ========

    

    REMARKS :
    =======

ENDTEXT











































