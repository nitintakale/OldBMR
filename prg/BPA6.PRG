*resp soln BPR
@0,60 SAY 'PAGE : 6 OF 6'
DO PROC_1
LN = 7
LN = LN+1
TEXT
INITIAL CHECKS
NOTE:[       ]  Tick mark after checking with standard  pack  specification  for 
correctness of the following parameters.               CHECKED BY :

Carton fill               :-----------> [       ]          ___________  
Inner corrugated   fill   :-----------> [       ]          ___________
Inner corrugated labelling:-----------> [       ]          ___________
& stamping done.
Shipper fill        :-----------------> [       ]          ___________

IN-PROCESS CONTROL CHECKS: 

- Check fill value as per pack description, every half hour.
ENDTEXT
LN=20
@LN,2 SAY '- Check  that inner shipper is labelled and stamped as  '+ VUNIT4 +' in BLACK '
LN=21
TEXT
  INK over the label. 
- Check atleast 10 % of packed bottles by opening outer cartons of one shipper
  every half an hour.
  Date :_________
_______________________________________________________________________________
|DATE |Time| Shipper |Fill    |Inner  |Carton    |Enclosure |Labelled | Ckd by.|
|     |    | number  |value   |Shipper|          |          |  vials  |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
|     |    |         |        |       |          |          |         |        |
|-----|----|---------|--------|-------|----------|----------|---------|--------|
NOTE :  [  _/  ]  = Satisfactory.
        [  X   ]  = Not Satisfactory - appropriate corrective action taken.
ENDTEXT
