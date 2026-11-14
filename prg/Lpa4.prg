**azee p4
@0,60 SAY 'PAGE : 4 OF 6'
DO PROC_1
LN=7
LN=LN+1
text
                    SECTION III      PACKAGING  OPERATION
                              A. LINE CLEARNANCE
                             
Packing line No:____________________ PREVIOUS PRODUCT:_________________________

                                            BATCH NO :_________________________
             _____________________________________________________   
             | Checked & certified by: |                         |
             |-------------------------|-------------------------|
             | Date:                   | Time:                   |
             |_________________________|_________________________|
---------------------------------------------------------------------------
                        B.STANDARD PACK DESCRIPTION :
ENDTEXT
LN=21
 KKK = BGR+'STPK'
 do &KKK
 LN=26      
TEXT
                            INITIAL PREPARATORY WORK: 
A) 1.  Label overprinted specimen attached:-------------------> [      ]
   2.  Label overprinted specimen from M/C:   
       attached                           :-------------------> [      ]
B)  Inner printed carton overprinted specimen attached:-------> [      ]

C)  Enclosure specimen attached:------------------------------> [      ]

D)  Shipper klass mark impression attached:-------------------> [      ]

E)  Outer carton / Thermocol box  impresion with outer printed label attached    [      ]
STARTED ON __________ AT ____________ | COMPLETED ON _________ AT ________|
                               INSPECTION OF VIALS
                                                           LOT A/ LOT B/ LOT C
Inspection line No.:_________ Line clearance certified by:______/______/______
__________________________________________________________________________
|Sr |    Date     |      Inspected By         |  From -- To       | Ckd By|
|---|-------------|---------------------------|-------------------|-------|
|   |             |                           |                   |       |   
|   |             |                           |                   |       |
|   |             |                           |                   |       |
|--------------------------------------------------------------------------
                           IN-PROCESS CONTROL CHECKS
_______________________________________________________________________________
|DATE|TIME|GOOD VIALS |  REJECTS  |Ckd.||DATE|TIME|GOOD VIALS |  REJECTS  |Ckd.|
|    |    |OBSERVATION|OBSERVATION| BY ||    |    |OBSERVATION|OBSERVATION| BY |
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|
|    |    |           |           |    ||    |    |           |           |    |
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|
|    |    |           |           |    ||    |    |           |           |    |
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|
|    |    |           |           |    ||    |    |           |           |    |
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|
|    |    |           |           |    ||    |    |           |           |    |
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|
|    |    |           |           |    ||    |    |           |           |    |
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|
|    |    |           |           |    ||    |    |           |           |    |        
|----|----|-----------|-----------|----||----|----|-----------|-----------|----|

ENDTEXT
