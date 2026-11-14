*****BPR CHK LIST FOR FFS
CLOSE DATA
DO CHKPROC
LN=LN+1
TEXT
    ___________________________________________________________________________
    SR.   |              OPERATION                     | CHECKED | COUNTER   
    NO.   |                                            |    BY   | CKD. BY
    ------|--------------------------------------------|---------|-------------
     1.   | STEREO OF EARLIER BATCH IS RETURNED TO Q.C.|         |      
     2.   | REJECTED VIALS TRANSFER TO REJECTION ROOM. |         |      
     3.   | REJECTED LABELS, CARTONS, OUTER CARTONS /S.W.FILM &  |               
          | EXCESS OVER PRINTED MATERIAL IS RETURNED   |         |      
          | FOR DESTRUCTION.                           |         |      
     4.   | GOOD EXCESS MATERIAL IS TRANSFERED TO STORE|         |      
          | ALONG WITH EMR SLIP.                       |         |      
          |  Note:Loose Labels,Cartons To be destroyed.|         |
     5.   | PACKED SHIPPERS OF PREVIOUS BATCH ARE      |         |      
          | REMOVED.                                   |         |      
     6.   | CHECK AREA AROUND AND BELOW  :             |         |      
          | a)  LABELLING MACHINE.                     |         |      
          | b)  CONVEYER BELT.                         |         |      
          | c)  INSPECTION  AREA                       |         |      
          | d)  CARTONATOR                             |         |      
          | e)  SHRINK WRAP M/C                        |         |      
     7.   | ENSURE THAT ALL EMPTY CRATES OF PREVIOUS   |         |      
          | PRODUCT ARE TRANSFERED TO QUARANTINE AREA  |         |        
          | FROM PACKING DEPT.                         |         | 
     8.   | ENSURE THAT ALL EMPTY CRATES / BOWLS/ TRAYS|         |
          | ARE INVERTED AND STATUS LABEL IS REMOVED   |         |   
     9.   | BRING THE BATCH TO BE INSPECTED & PACKED   |         |      
          | UNDER SUPERVISION OF Q.C.& CHECK EACH AND  |         |      
          | EVERY CONTAINERS FOR CORRECT PRODUCT NAME, |         |       
          | B. NO.LOT NO.& Number OF CONTAINERS        |         |      
          | WITH BPR AND  FILLING CHECKLIST            |         |      
    10.   | TALLY THE QUANTITY OF CRATES WITH FILLING  |         |      
          | CHECKLIST.                                 |         |      
          | BATCH NO.   LOT NO.         NO. OF CRATES  |         |      
          |                                            |         |
    11.   | BRING CARTONS, LABELS FOR OVERPRINTING.    |         |      
    12.   | BRING CAPS,INSERTS,O.CARTONS//S.W.FILM  SHIPPERS WHICH               
          | ARE ALREADY ISSUED BY STORES AND CHECKED   |         |      
          | BY Q.C.& CHECK THAT CUPBOARDS ARE EMPTY    |         |      
    12A   | CHECK THAT CUPBOARDS ARE EMPTY.            |         |                                                 |         |      
    13.   | CHECK STEREOS OF LABEL & CARTON FOR BATCH  |         |
          | OVERPRINTING DETAILS AND GIVE FOR          |         |
          | ADJUSTMENT/SETTING ON THE MACHINE.         |         |      
          | NO. OF      LABELS       CARTONS           |         |         
          | STERIOS                                    |         |      
    14.   | CHECK OVERPRINTED LABEL AS PER BPR         |         |      
          | FOR LIC.NO. BATCH NO. MFG.DT.EXP DT.RETAIL |         |     
          | PRICE NOT TO EXCEED RS.                    |         |      
    15.   | CHECK OVERPRINTED CARTON AS PER BPR        |         |      
          | FOR LIC.NO. BATCH NO. MFG.DT.EXP DT.RETAIL |         |     
          | PRICE NOT TO EXCEED RS.                    |         |      
    16.   | CHECK FOR NAME & CODE NO. OF ENCLOSURE     |         |                   

ENDTEXT
 EJECT
 LN=1
 @LN,65 SAY 'PAGE 2 OF 4'
 LN=LN+2
 TEXT
   ________________________________________________________________________________
    SR.   |              OPERATION                     | CHECKED | COUNTER   
    NO.   |                                            |    BY   | CKD. BY
    ------|--------------------------------------------|---------|-----------------
    17.   | TAKE OUT ONE LABEL FORM EACH PACKED BUNDLE |         |      
          | OR ROLL AND CARTON FROM EACH PKT AND CHECK |         |
          | FOR CODE NO. AND PREPARE ALBUM.            |         |     
          |                                            |         |
    18.   | CHECK FOR PRODUCT DETAILS ON SHIPPER MARKING.        |      
  ENDTEXT
  LN=11
    TEXT
          | PRODUCT:      ___________________________  |         |      
    ENDTEXT
          @LN,25 SAY PNAME
   LN=12
   TEXT
          | BATCH NO:     ___________________________  |         |      
   ENDTEXT
          @LN,25 SAY LTRIM(VBNO)
  LN=13
  TEXT
          | EXPIRY DATE:  ___________________________  |         |      
  ENDTEXT
IF VAL(SUBSTR(VMFGDATE,5,4))<=2000
    @LN,25 SAY VEXPDATE
ENDIF
IF VAL(SUBSTR(VMFGDATE,5,4))>2000
   @LN,25 SAY SUBSTR(VEXPDATE,1,4)+SUBSTR(VEXPDATE,7,2)
ENDIF
LN=14
 
@LN,10 SAY '| QUANTITY:     ___________________________  |         |      '
    @LN,25 SAY VSTAMP2
ln=15
text
          | LOGO:             _______________________  |         |      
endtext
          @ln,25 say vlogo
ln=16
text
          | ADDRESS:      ___________________________  |         |      
          | PHYSICIAN'S SAMPLE _________/____________  |         |      
          |                                            |         |      
          | SHIPPER MARKING DONE BY:_________________  |         |      
    19.   | PUT STATUS LABEL ON THE CONTAINERS TO BE   |         |      
          | USED DURING INSPECTION, LABELLING AND      |         |      
          | PACKING.                                   |         |      
          |                                            |         |      
    ---------------------------------------------------------------------------

    NOTE: If there is change of product, take line clearance first from senior
          production person.


    LABEL                   : HUMIDIFIED / UNHUMIDIFIED

    CARTONS                 : LOCKED BOTTOM / BOTH SIDE OPEN.

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
    On Carton printing M/c.   :                     |
    Printed carton checking   :                     |
    Carton Folding            :                     |
    Vial Putting in Carton    :                     |
    Insert putting            :                     |
    Droppers /Adapter /Caps   :                     |
    putting                                         |
    Carton /Rando box Closing :                     |
    Outer Carton labelling,   :                     |
    Stamping                  :                     |
    S.W. Film  M/C            :                     |
    Final packing             :                     |
    Shipper fill value checking                     |
ENDTEXT
 EJECT
 LN=1
 @LN,65 SAY 'PAGE 3 OF 4'
 LN=3
 TEXT
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
                                                    |
    Printed carton checking   :                     |
                                                    |
    Carton Folding            :                     |
                                                    |
    Vial Putting in Carton    :                     |
                                                    |
    Insert putting            :                     |
                                                    |
    Droppers /Adapter /Caps   :                     |
    putting                                         |
    Carton /Rando box Closing :                     |
                                                    |               
    Outer Carton labelling,   :                     |
    Stamping                  :                     |

    S.W. Film  M/C            :                     |
                                                    |
    Final packing             :                     |
                                                    |
    Shipper fill value checking                     |
ENDTEXT
 EJECT
*
 LN=1
 @LN,65 SAY 'PAGE 4 OF 4'
 LN=3
 TEXT
    SHIPPER TRANSFERED  TO B.S.R.    B.S.R. NO.   DATE         CHECKED BY 
                                   __________  ________     ____________
  
   |    GLASS VIALS        |    FFS VIALS        |
   |  REJECTION | QUANTITY |REJECTION | QUANTITY |
   |  __________|__________|__________|__________|
   |  Fibers    |          |Emp.Vials |          |
   |  ----------|--------- |----------|--------- |
   |  Black P   |          |Leakages  |          |
   |  ----------|--------- |----------|--------- |
   |  White P   |          |Deformed  |          |
   |  ----------|--------- |----------|--------- |
   |  Glass P   |          |Flash     |          |
   |  ----------|--------- |----------|--------- |
   |  Sealdefect|          |Extra Plast.         | QUANTITY PACKED___________ 
   |  ----------|--------- |----------|--------- |                                              
   |  Crack & M |          |Shift     |          | TOTAL REJECTION___________ 
   |  ----------|--------- |----------|--------- |                                               
   |  Leakage   |          |Base line |          | LABEL TESTING ___________ 
   |  ----------|--------- |----------|--------- |                  
   |  OTHERS    |          |Black spot|          | BATCH IDENTITY ___________  
   |  ----------|--------- |----------|--------- |                   
   |  TOTAL     |          |Volume    |          | Q.C.SAMPLE   ___________ 
      -------------------- |----------|--------- |                                                                                              
                           |Stains    |          | TOTAL         ___________
                           |----------|--------- |
                           |Lab.m/c Rej.         |
                           |----------|--------- |
                           |Others    |          |   
                           |----------|----------|  
                           |Total     |          |
                           |----------|----------|  



 CONTROL SAMPLES  = _________________   
                       

    PACKING DEPARTMENT                              PRODUCTION IN-CHARGE

                           STERIO RETURNED BY           RECEIVED BY       

    LABELS STERIO  -

    CARTONS STERIO  _

ENDTEXT
LN=50
@LN,2 SAY 'NOTE : FILLED VALUE OF EACH OUTER CARTON / SHRINK WRAP OF  '+LTRIM(STR(VUNITSOC))
LN=LN+1
@LN,2 SAY '       CARTON & SHIPPER IS CHECKED ON SUITABLE WEIGHING BALANCE . '
LN=LN+1

@LN,2 SAY '       NO DEVIATIONS OBSERVED.'
LN=LN+1
@LN,2 SAY '       DONE BY :'

EJECT




