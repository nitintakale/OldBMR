*eye/ear drops BPR
@0,60 SAY 'PAGE : 6 OF 6'
DO PROC_1
LN=7
LN=LN+1
TEXT
INITIAL CHECKS
===============
NOTE:[      ] Tick mark after checking for correctness of the following 
              parameters.                              CHECKED BY :

Inner carton fill value :-----------> [       ]          ___________  
Outer carton fill value :-----------> [       ]          ___________
Outer carton labelling  :-----------> [       ]          ___________
& stamping done.
Shipper fill value:-----------------> [       ]          ___________

  PACKING IN-PROCESS CONTROL CHECKS: 

- Check fill value as per pack description, every half an hour.
ENDTEXT
    LN = 23
    @LN,0 SAY '- Check  that outer carton is labelled and is printed as  '+ VUNIT4 +' in BLACK '
    LN = 25
TEXT
  INK over the label.  Also check for arrow mark.
- Check atleast 10 % of packed vials by opening outer cartons of one shipper
  every half an hour.
  Date :______________

  
______________________________________________________________________________
| Time | Shipper| Fill value | Outer | Inner | Dropper|Enclosure|Labelled|Ckd.|
|      | Number |            | carton| Carton|        |         |vials   |by  |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|      |        |            |       |       |        |         |        |    |
|------|--------|------------|-------|-------|--------|---------|--------|----|
|______|________|____________|_______|_______|________|_________|________|____|

NOTE :  [      ]  = Satisfactory.
        [  X   ]  = Not Satisfactory - appropriate corrective action taken.
Remarks:  Quantity of lot A :__________

          Quantity of lot B :__________ 

          Quantity of lot C :__________ 
ENDTEXT		  

