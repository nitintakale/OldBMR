****FFS BPR PAGE 3
@0,60 SAY 'PAGE : 3 OF 6'
DO OKPROC_1
LN=7
LN=LN+1
TEXT

                    D. RECONCILIATION OF PACKAGING MATERIALS

ABBREVIATION CODES: IC= Inner cartons, OC= Outer cartons,PC= Polystyrine
                        CAPS LV=Labels for vials/ Labels for Outer Cartons
                        S= Shippers E=Enclosures.
          _______________________________________________________________
          | Sr.|TYPES OF DEFECTS      |      QUANTITY IN NUMBERS    |    |
          |    |                      |-----------------------------|----|
          | No.|& ACCOUNTING DETAILS  | IC  | OC  | PC  |  LV  | S  | E  |
          |----|----------------------|-----|-----|-----|------|----|--- |
          | 1  | RECEIPT QUANTITY     |     |     |     |      |    |    | 
          |----|----------------------|-----|-----|-----|------|----|--- |
          | 2  | EXCESS CONSUMED      |     |     |     |      |    |    |
          |----|----------------------|-----|-----|-----|------|----|--- |
          | 3  | TOTAL RECEIPT        |     |     |     |      |    |    |
          |----|----------------------|-----|-----|-----|------|----|--- |
          | 4  | RETAINED AS SAMPLE   |     |     |     |      |    |    | 
          |----|----------------------|-----|-----|-----|------|----|--- |
          | 5  | O.P TOTAL REJECTION  |     |     |     |      |    |    |
          |----|----------------------|-----|-----|-----|------|----|----|
          | 6  | PACKED QUANTITY      |     |     |     |      |    |    |
          |----|----------------------|-----|-----|-----|------|----|----| 
          | 7  | Q.C. SAMPLE          |     |     |     |      |    |    |
          |----|----------------------|-----|-----|-----|------|----|--- |
          | 8  | EXCESS RETURNED TO   |     |     |     |      |    |    |
          |    |   STORES             |     |     |     |      |    |    | 
          |----|----------------------|-----|-----|-----|------|----|----|
          | 9  | QUANTITY  USED FOR   |     |     |     |      |    |    |
          |    | RELABELLING          |     |     |     |      |    |    |
          |____|______________________|_____|_____|_____|______|____|____|
          |    |                      |     |     |     |      |    |    |
         *| 10 | WASTAGES             |     |     |     |      |    |    |
          |____|______________________|_____|_____|_____|______|____|___ |
        **| 11 | QUANTITY DESTROYED   |     |     |     |      |    |    |
          |____|______________________|_____|_____|_____|______|____|___ |
          |    |                      |     |     |     |      |    |    |
          | 12 | TOTAL OF (4 to 11)   |     |     |     |      |    |    |
          |____|______________________|_____|_____|_____|______|____|___ |
          |    | SHORT FALL (12-3)    |     |     |     |      |    |    |
          |____|______________________|_____|_____|_____|______|____|____|

                                              CHECKED BY _______________

     *    WASTAGES :     During machine labelling and packing.
    **    Quantity Destroyed : For labels & cartons, excess goods over printed.
ENDTEXT  


