* BPR AMPOULES
@0,60 SAY 'PAGE : 3 OF 6'
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
 LN=25
 KKK = BGR+'STPK'
 do &KKK
 LN=LN+1
TEXT
                           INITIAL PREPARATORY WORK: 

A)  Overprinted label specimen attached:----------------------> [      ]

B)  Overprinted label specimen for rando box attached --------> [      ]

C)  Overprinted label specimen of outer carton attached ------> [      ]

D)  Enclosure specimen attached:------------------------------> [      ]

E)  Shipper klass mark impression attached:-------------------> [      ]


STARTED ON :___________ AT :________, COMPLETED ON :___________ AT :_______.


                        AMPOULE MACHINE LABELLING RECORD 
               -------------------------------------------------
               | DATE  | LOT  |   FROM     |    TO     | HOURS |  
               |_______|______|____________|___________|_______|
               |       |      |            |           |       |
               |_______|______|____________|___________|_______|
               |       |      |            |           |       |
               |_______|______|____________|___________|_______|      
               |       |      |            |           |       |
               |_______|______|____________|___________|_______|
ENDTEXT


@0,60 SAY 'PAGE : 3A OF 6'
DO PROC_1
DO apa3a
@0,60 SAY 'PAGE : 3B OF 6'
DO PROC_1
DO apa3b


