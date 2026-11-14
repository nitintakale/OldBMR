CLEA
LN=1
TEXT


                                 CHECK-LIST NO. 3               Page 1 of 1

                      UNLOADING AND TRANSFER TO QUARENTINE

                       FOR TERMINALLY STERILIZED PRODUCT
ENDTEXT
LN=9
@LN,1 SAY CHR(27)+'E'
@LN,3 SAY 'PRODUCT NAME:'
@LN,18 SAY PNAME
@LN,50 SAY 'BATCH NO:'
@LN,65 SAY VBNO
@LN,1 SAY CHR(27)+'F'
LN=LN+2
@LN,3 SAY 'DATE       :'
@LN,50 SAY 'LOT NO  :'
LN=LN+2
@LN,50 SAY 'PACKING  :'
LN=LN+1
@LN,50 SAY 'SIZE'
LN=16
TEXT

          DETAILS                             Checked By   Counter Checked By
                              
    1     Check for removal of previous  
          batch materials in the area           :

    2     At a time take only single        
          autoclave load ( 2 trolleys for   
          each autoclave load )                 : 

    3     Check the  trolley no.&  record.      :

    4     Check labels from trolley   for    
          batch No. and lot No. hand over   
          these labels to Q.C. & put fresh
          status labels.                        :
    5.    Bring required no. of crates in   
          for unloading of vials & check for
          no status labels on the crates        :

    6.    Stock the crates in inverted position 
          and put status label on each crate  
          at the time of use.                   :
    7.    After completion of lot / batch     
          check for proper status label on each
          crate and write the total no. of 
          crates on the status label.              : 
    8.    Check that all crates have status label  :                         

    9.    Transfer all the crates to quarantine  
          under Q.C. supervision                    :

    10.   Details of unloaded vials no. of crates   :


                                                            TOTAL   -----------

                                         Breakage during 
                                         autoclaving        Nos     -----------




    REMARK :
                                                                            
    CHECKED BY :                                  COUNTER CHECKED BY :

    PRODUCTION :                                  QUALITY CONTROL :
.

ENDTEXT
















