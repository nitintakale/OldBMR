
LN=1
@LN,1 SAY "                           CHECK LIST NO 4"
LN=LN+2
@LN,1 SAY "                COLLECTION OF VIALS AND TRANSFER OF BATCH / LOT  TO QUARANTINE"
LN=LN+2
@LN,1 SAY "                           FOR ASECPTIC PRODUCTS                              "
LN=LN+2
@LN,3 SAY 'PRODUCT NAME:'
@LN,18 SAY PNAME
@LN,50 SAY 'BATCH NO:'
@LN,65 SAY VBNO
LN=LN+2
@LN,3 SAY 'DATE       :'
@LN,50 SAY 'BATCH SIZE:'
@LN,65 SAY BSIZE
LN=LN+2
@LN,50 SAY 'PACKING  :'
LN=LN+1
@LN,50 SAY 'SIZE'
LN=16
TEXT         
-----------------------------------------------------------------------
DETAILS                   |    LOT A    |     LOT B     |   LOT C          
                          | CKD  | CCKD |  CKD  | CCKD  | CKD| CCKD
--------------------------|-------------|---------------|--------------                                   
|1 Check the status label |      |      |       |       |      
|  details of the pressure|      |      |       |       |      
|  vessel taken for       |      |      |       |       |      
|  filling for every lot. |      |      |       |       |      
|                         |      |      |       |       |      
|2 Check for removal of   |      |      |       |       |      
|  previous batch material|      |      |       |       |      
|  in the area.           |      |      |       |       |      
|                         |      |      |       |       |      
|3 Bring required no. of  |      |      |       |       |      
|  empty  crates for the  |      |      |       |       |      
|  collection of vials.   |      |      |       |       |      
|                         |      |      |       |       |      
|4  Check for cleanliness |      |      |       |       |      
|   of crates and removal |      |      |       |       |      
|   of previous batch     |      |      |       |       |      
|   status label.         |      |      |       |       |      
|                         |      |      |       |       |      
|5  Stock the crates in   |      |      |       |       |      
|  inverted podition and  |      |      |       |       |      
|  put the status label   |      |      |       |       |      
|  on each crate at the   |      |      |       |       |      
|                         |      |      |       |       |      
|6 After completion oflot |      |      |       |       |      
|  or batch check for     |      |      |       |       |      
|  proper status label on |      |      |       |       |      
|  each crate and write   |      |      |       |       |      
|  the total no. of crate |      |      |       |       |      
|  on the status label.   |      |      |       |       |      
|
|7 In presence of Q.C.    |      |      |       |       |      
|  supervisor transfer all|      |      |       |       |      
|  crates of lots / batch |      |      |       |       |      
|                         |      |      |       |       |      
|8 Total no. of crate     |      |      |       |       |      
|  filled.                |      |      |       |       |      
|                         |      |      |       |       |      
|
        REMARKS  : 




    CHECKED BY  :                          COUNTER CHECKED BY :

    PRODUCTION  :                          QUALITY CONTROL    :


ENDTEXT


