**CHECKLIST FOR BPR
****FOR GERERIC
CLOSE DATA
DO CHKPROC
LN=LN+1
TEXT
   ___________________________________________________________________________
   SR.   |              OPERATION                     | CHECKED | COUNTER   
   NO.   |                                            |    BY   | CKD. BY
   ------|--------------------------------------------|---------|-------------
    1.   | STEREO OF EARLIER BATCH IS RETURNED TO Q.C.|         |      
         |                                            |         | 
    2.   | REJECTED AMPOULES ARE TRANSFER TO REJECTION|         |      
         | ROOM OR ARE DESTOOYED                      |         
         |                                            |         |                                                                
    3.   | REJECTED LABELS, OUTER CARTONS &           |         |      
         | EXCESS OVER PRINTED MATERIAL IS RETURNED   |         |      
         | FOR DESTRUCTION.                           |         |      
         |                                            |         |      
    4.   | GOOD EXCESS MATERIAL IS TRANSFERED TO STORE|         |      
         | ALONG WITH EMR SLIP.                       |         |      
         |  Note:Loose Labels,Cartons To be destroyed.|         |
         |                                            |         |      
    5.   | PACKED SHIPPERS OF PREVIOUS BATCH ARE      |         |      
         | REMOVED.                                   |         |      
         |                                            |         | 
    6.   | CHECK AREA AROUND AND BELOW  :             |         |      
         | a)  LABELLING MACHINE.                     |         |      
         | b)  CONVEYER BELT.                         |         |      
         | c)  INSPECTION HOOD & AREA                 |         |      
         | d)  JACTION M/C                            |         |      
         |                                            |         | 
    7.   | ENSURE THAT ALL EMPTY CRATES OF PREVIOUS   |         |      
         | PRODUCT ARE TRANSFERED TO QUARANTINE AREA  |         |      
         | FROM PACKING.                              |         |      
         |                                            |         |      
         |                                            |         | 
    8.   | ENSURE THAT ALL EMPTY CRATES / BOWLS/ TRAYS|         |
         | ARE INVERTED AND STATUS LABEL IS REMOVED   |         |   
         |                                            |         |
    9.   | BRING THE BATCH TO BE INSPECTED            |         |      
         | UNDER SUPERVISION OF Q.C.& CHECK EACH AND  |         |      
         | EVERY CONTAINERS FOR CORRECT PRODUCT NAME, |         |       
         | B. NO.LOT NO.& Number OF CONTAINERS        |         |      
         | WITH BPR AND  UNLOADING CHECKLIST          |         |      
         |                                            |         |
    10.  | TALLY THE QUANTITY OF CRATES WITH UNLOADING|         |      
         | CHECKLIST.                                 |         |      
         | BATCH NO.   LOT NO.         NO. OF CRATES  |         |      
         |                                            |         |    
         |                                            |         |      
   11.   | BRING LABELS,P.TRAYS,INSERTS,OUTER CARTONS |         |
         | SHIPPERS,WHICH ARE ALREADY ISSUED BY STORES|         |                   
         | AND CHECKED BY Q.C.                        |         |                                                                 
         |                                            |         |      
   12.   | CHECK OVERPRINTED LABEL FOR LABELLING      |         |      
         | MACHINE  AS PER BPR FOR LIC.NO. BATCH NO.  |         |     
         | MFG.DT. EXP.DT.RETAIL PRICE NOT TO         |         |      
         | EXCEED RS.                                 |         |      
 ENDTEXT
 EJECT
 LN=1
 @LN,65 SAY 'PAGE 2 OF 3'
 LN=LN+2
 TEXT
    ___________________________________________________________________________
    SR.   |              OPERATION                     | CHECKED | COUNTER   
    NO.   |                                            |    BY   | CKD. BY
    ------|--------------------------------------------|---------|--------------
    13.   | CHECK OVERPRINTED LABELS FOR OUTERCARTONS  |         |      
          | & ALSO CHECK OUTER CARTON IMPRESSION.      |         |      
          |                                            |         |      
    14.   | CHECK FOR NAME & CODE NO. OF ENCLOSURE     |         |                 
          |                                            |         |
    15.   | TAKE OUT ONE LABEL FORM EACH PACKED BUNDLE |         |      
          | AND CARTON FROM EACH BUNDLE/BOX AND CHECK  |         |
          | FOR CODE NO. AND PREPARE ALBUM.            |         |      
    16.   | CHECK FOR PRODUCT DETAILS ON KLASS MARKING.|         |      
ENDTEXT
 LN=16
 @LN,10 SAY'| PRODUCT:      ___________________________  |         |  '
 @LN,25 SAY PNAME
 LN=LN+1
 @LN,10 SAY '| BATCH NO:     ___________________________  |         |  '
 @LN,25 SAY LTRIM(VBNO)
  LN=LN+1
 @LN,10 SAY '| EXPIRY DATE:  ___________________________  |         | '
 IF VAL(SUBSTR(VMFGDATE,5,4))<=2000
    @LN,25 SAY VEXPDATE
ENDIF
IF VAL(SUBSTR(VMFGDATE,5,4))>2000
   @LN,25 SAY SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
ENDIF
LN=LN+1
@LN,10 SAY '| QUANTITY:     ___________________________  |         |      '
@LN,25 SAY VSTAMP2
LN=LN+1
@LN,10 SAY '| LOGO:             _______________________  |         |      '
@LN,25 SAY VLOGO
LN=LN+1
LN=22
TEXT
          | ADDRESS:      ___________________________  |         |      
          | PHYSICIAN'S SAMPLE _________/____________  |         |      
          |                                            |         |      
          | KLASS MARKING DONE BY:___________________  |         |      
    17.   | PUT STATUS LABEL ON THE CONTAINERS TO BE   |         |      
          | USED DURING INSPECTION, LABELLING AND      |         |      
          | PACKING.                                   |         |      
          |                                            |         |      
   ---------------------------------------------------------------------------
    NOTE: If there is change of product, take line clearance first from senior
          production person.

    Labelling machine- 
    Gum used 

    LABEL                   : HUMIDIFIED / UNHUMIDIFIED
                            : LOCKED BOTTOM / BOTH SIDE OPEN.

    Cartons
    
    Carton printing m/c
    
    OPERATION                          PACKER'S NAME|  PACKER'S NAME.
                                       Date         |  Date
    Visual inspection         :                     |
                                                    |  
    On Labelling M/c.         :                     |
                                                    |
    Seal & labelling quality  :                     |
    checking                                        |
                                                    |
    Ampoule Putting in        :                     |
    plastic trays                                   |                
                                                    |
                                                    |
    plastic tray putting      :                     |
                                                    |
    inner carton closing      :                     |
                                                    |               
    Outer Carton labelling,   :                     |
    Stamping,inner carton     :                     |
    putting,& outer carton closing                  |
    Final packing             :                     |
                                                    |
    Shipper fill value checking                     |

   ENDTEXT
    EJECT
   LN=1
   @LN,65 SAY 'PAGE 3 OF 3'
   LN=LN+2
   TEXT
   
    SHIPPER TRANSFERED  TO B.S.R.    B.S.R. NO.      DATE              CHECKED BY 
                                     __________     ________          ____________

    REJECTION | QUANTITY     |
    __________|______________|           QUANTITY PACKED   ___________    
    Fibers    |              |           (SHIPPER WISE)                                            
    ----------|------------- |     
    Black P   |              |                                                                                     
    ----------|------------- |           TOTAL REJECTION   ___________                                 
    White P   |              |                                                                                                                                                                         
    ----------|------------- |          
    Glass P   |              |                                              
    ----------|------------- |           LABEL TESTING     ___________               
    Sealdefect|              |
    ----------|------------- |                                           
    Crack & M |              |            Q.C.SAMPLE        ___________            
    ----------|------------- |                                           
    Leakage   |              |        
    ----------|------------- |            TOTAL             ___________                                                                        
    volume    |              |
    ----------|------------- |                
    others    |              |     
    ----------|------------- |                                       
    Total     |              |
    --------------------------                                      

    CONTROL SAMPLES  =







    PACKING DEPARTMENT                              PRODUCTION IN-CHARGE





     NOTE:

                   Stereo Returned            Stereo Received 
                        by                          by


     Labels stereo _________________          __________________                   

     Cartons stereo  _______________          ___________________
     .
ENDTEXT
