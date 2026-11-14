*resp.soln BPR
@0,60 SAY 'PAGE : 4 OF 6'
DO PROC_1
LN=7
LN=LN+1
TEXT
                    SECTION III      PACKAGING  OPERATION

                              A. LINE CLEARANCE
                             
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
LN=22
 KKK = BGR+'STPK'
 do &KKK
LN=LN+1

TEXT
                             INITIAL PREPARATORY WORK: 
A)  Label overprinted specimen attached :-------------------->  [      ]

B)  Printed carton overprinted specimen attached :----------->  [      ]

C)  Label overprinted specimen of inner corrugated boxes :--->  [      ]

D)  Enclosure specimen attached :---------------------------->  [      ]

E)  Shipper klass mark impression attached :----------------->  [      ]

STARTED ON __________ AT ____________ | COMPLETED ON _________ AT ________|

                              INSPECTOIN OF VIALS

Inspection line No.:_________ Line clearance certified by:_______________
__________________________________________________________________________
|Sr |    Date     |      Inspected By         |  From -- To       | Ckd By|
|---|-------------|---------------------------|-------------------|-------|
|   |             |                           |                   |       |   
|   |             |                           |                   |       |
|   |             |                           |                   |       |
|--------------------------------------------------------------------------
                           IN-PROCESS CONTROL CHECKS
_______________________________________________________________________________
|DATE|TIME|GOOD VIALS |  REJECTS  |Ckd.||DATE|TIME|GOOD VIALS |  REJECTS  |Ckd.
|    |    |OBSERVATION|OBSERVATION| BY ||    |    |OBSERVATION|OBSERVATION| BY 
|----|----|-----------|-----------|----||----|----|-----------|-----------|----
|    |    |           |           |    ||    |    |           |           |    
|----|----|-----------|-----------|----||----|----|-----------|-----------|----
|    |    |           |           |    ||    |    |           |           |    
|----|----|-----------|-----------|----||----|----|-----------|-----------|----
|    |    |           |           |    ||    |    |           |           |    
|----|----|-----------|-----------|----||----|----|-----------|-----------|----
|    |    |           |           |    ||    |    |           |           |    
|----|----|-----------|-----------|----||----|----|-----------|-----------|----

ENDTEXT
EJECT




