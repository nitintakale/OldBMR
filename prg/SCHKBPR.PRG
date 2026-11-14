**CHECKLIST FOR BPR
 DO CHKPROC
 LN=LN+1
 TEXT
   _______________________________________________________________________
   SR.   |              OPERATION                     | CHECKED | COUNTER   
   NO.   |                                            |    BY   | CKD. BY
   ------|--------------------------------------------|---------|----------
    1.   | STEREO OF EARLIER BATCH IS RETURNED TO Q.C.|         |      
         |                                            |         | 
    2.   | REJECTED BOTTLES TRANSFER TO REJECTION ROOM|         |      
         |                                            |         | 
    3.   | REJECTED LABELS, CARTONS, INNER SHIPPER &  |         |      
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
         | c)  INSPECTION AREA                        |         |      
         |                                            |         | 
    7.   | ENSURE THAT ALL EMPTY CRATES OF PREVIOUS   |         |      
         | PRODUCT ARE TRANSFERED TO QUARANTINE AREA  |         |      
         | FROM PACKING DEPT.                         |         | 
         |                                            |         | 
    8.   | ENSURE THAT ALL EMPTY CRATES / BOWLS/ TRAYS|         |
         | ARE INVERTED AND STATUS LABEL IS REMOVED   |         |   
         |                                            |         |
    9.   | BRING THE BATCH TO BE INSPECTED & PACKED   |         |      
         | UNDER SUPERVISION OF Q.C.& CHECK EACH AND  |         |      
         | EVERY CONTAINERS FOR CORRECT PRODUCT NAME, |         |       
         | B. NO.LOT NO.& Number OF CONTAINERS        |         |      
         | WITH BPR AND  UNLOADING CHECKLIST          |         |      
         |                                            |         |
    10.  | TALLY THE QUANTITY OF CRATES WITH UNLOADING|         |      
         | CHECKLIST.                                 |         |      
         | BATCH NO.   LOT NO.         NO. OF CRATES  |         |      
         |                                            |         |  
    11.  | BRING CARTONS, LABELS FOR OVERPRINTING.    |         |      
         |                                            |         |      
    12.  | BRING INSERTS,INNER SHIPPERS,SHIPPERS WHICH|         |      
         | ARE ALREADY ISSUED BY STORES AND CHECKED   |         |      
         | BY Q.C.                                    |         |      
         |                                            |         |      
    13.  | CHECK STEREOS OF LABEL & CARTON FOR BATCH  |         |
         | OVERPRINTING DETAILS AND GIVE FOR          |         |
         | ADJUSTMENT/SETTING ON THE MACHINE.         |         |      
         | NO. OF        LABEL       CARTON           |         |  
         | STERIOS                                    |         |             
         |                                            |         |          
         |                                            |         |      
    14.  | CHECK OVERPRINTED LABEL FOR LABELLING      |         |      
         | MACHINE  AS PER BPR FOR LIC.NO. BATCH NO.  |         |     
         | MFG.DT. EXP.DT.RETAIL PRICE NOT TO         |         |      
         | EXCEED RS.                                 |         |      
         |                                            |         |  

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
    15.   | CHECK OVERPRINTED LABELS FOR INNER SHIPPER |         |      
          | & ALSO CHECK INNER SHIPPER IMPRESSION.     |         |      
          |                                            |         |      
    16.   | CHECK FOR NAME & CODE NO. OF ENCLOSURE     |         |                 
          |                                            |         |
    17.   | CHECK OVERPRINTED CARTON AS PER BPR FOR    |         |  
          | LIC.NO.BATCH NO.MFG.DT.EXP.DT. RETAIL PRICE|         |  
          | NOT TO EXCEED RS.                          |         |  
          |                                            |         |      
    18.   | TAKE OUT ONE LABEL FORM EACH PACKED BUNDLE |         |      
          | AND CARTON FROM EACH BUNDLE/BOX AND CHECK  |         |
          | FOR CODE NO. AND PREPARE ALBUM.            |         |      
    19.   | CHECK FOR PRODUCT DETAILS ON KLASS MARKING.|         |      
 ENDTEXT
  LN=20
  TEXT
          | PRODUCT:      ___________________________  |         |
  ENDTEXT
        @20,25 SAY LTRIM(PNAME)
   LN=21
   TEXT
          | BATCH NO:     ___________________________  |         |      
   ENDTEXT
          @LN,25 SAY LTRIM(VBNO)
  LN=22
  TEXT
          | EXPIRY DATE:  ___________________________  |         |      
  ENDTEXT
IF VAL(SUBSTR(VMFGDATE,5,4))<=2000
    @LN,25 SAY VEXPDATE
ENDIF
IF VAL(SUBSTR(VMFGDATE,5,4))>2000
   @LN,25 SAY SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
ENDIF
LN=23
@LN,10 SAY '| QUANTITY:     ___________________________  |         |      '
@LN,25 SAY VSTAMP2
LN=24
TEXT
          | LOGO:             _______________________  |         |      
ENDTEXT
          @ln,25 say vlogo
LN=25
TEXT
          | ADDRESS:      ___________________________  |         |      
          | PHYSICIAN'S SAMPLE _________/____________  |         |      
          |                                            |         |      
          | KLASS MARKING DONE BY:___________________  |         |      
    20.   | PUT STATUS LABEL ON THE CONTAINERS TO BE   |         |      
          | USED DURING INSPECTION, LABELLING AND      |         |      
          | PACKING.                                   |         |      
          |                                            |         |      
   ---------------------------------------------------------------------------
    NOTE: If there is change of product, or change of p.s. to sale or to exp.
          take line clearance first from senior  production person.

    LABEL                     : HUMIDIFIED / UNHUMIDIFIED
    CARTONS                   : LOCKED BOTTOM / BOTH SIDE OPEN.

    OPERATION                          PACKER'S NAME|  PACKER'S NAME.
                                       Date         |  Date
    Visual inspection         :                     |
                                                    |
    Vial Arranging on turntable                     |
                                                    |  
    On Labelling M/c.         :                     |
                                                    |
    Seal & labelling quality  :                     |
    checking                                        |
                                                    |
    On Carton printing M/c.   :                     |
    Printed carton checking   :                     |
                                                    |
    Carton Folding            :                     |
                                                    |
    Vial Putting in Carton    :                     |
                                                    |
    Insert putting            :                     |
                                                    |
    Droppers /Adopter putting :                     |
                                                    |
    Carton /Rando box Closing :                     |
                                                    |               
    Outer Carton labelling,   :                     |
    Stamping                  :                     |
                                                    |
    Final packing             :                     |
    Shipper fill value checking                     |

   ENDTEXT
   EJECT
   LN=1
   @LN,65 SAY 'PAGE 3 OF 3'
   LN=LN+2
   TEXT
   
    SHIPPER TRANSFERED  TO B.S.R.    B.S.R. NO.      DATE           CHECKED BY 
                                     __________     ________       __________

    REJECTION | QUANTITY     |
    __________|______________|  QUANTITY PACKED   ___________    
    Fibers    |              |  (SHIPPER WISE)                                            
    ----------|------------- |
    Black P   |              |                                                                            
    ----------|------------- |  TOTAL REJECTION   ___________                                 
    White P   |              |                                                                                                                                                                
    ----------|------------- | 
    Glass P   |              |                                     
    ----------|------------- |  LABEL TESTING     ___________               
    Sealdefect|              |
    ----------|------------- |                                  
    Crack & M |              |   Q.C.SAMPLE        ___________            
    ----------|------------- |                                  
    Leakage   |              |
    ----------|------------- |   TOTAL             ___________                                                                        
    OTHERS    |              |  
    ----------|------------- |                                    
    TOTAL     |              |
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
