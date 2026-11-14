** AMOSS /lomac  MFG page 5  
LN=7
@LN,0 SAY CHR(27)+'E'

@LN,1 SAY ' Sterilisation of Garments:'
LN=LN+1
@LN,0 SAY CHR(27)+'F'
LN=9
TEXT
__________________________________________________________________________
|DATE  |LOAD  | STERILIZATION    | TEMP.   | UNLOADING   | DONE  |CHECKED |                
|      |NO.   | FROM  | TO       | IN øC   | TIME | DATE |   BY  |   BY   |                
|______|______|_______|__________|_________|______|______|_______|________|                
|      |      |       |          |         |      |      |       |        |                
|______|______|_______|__________|_________|______|______|_______|________|                
Note: Sterilisation of garments is done with pre-vaccum of 15 min.& post
      vaccum of 25 mins. and sterilize at 121øC. for 30 min.
ENDTEXT
LN=19
TEXT
   INSTRUCTIONS:
     1] Transfer the PH meter inside the Mfg area.Calibrate the ph meter with 
        freshly prepared buffer solutions.
     2] Use batch water for rinsing the electrode after every use.
endtext
ln=23
@ln,1 say ee1
ln=ln+1
@ln,1 say 'Steps/'
@ln,12 say 'Procedure'  
@ln,37 say 'Time'  
@ln,45 say 'Observation'  
@ln,60 say 'Done/'  
@ln,67 say 'Ckd'  
@ln,72 say 'Counter'  
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say 'Date/'
@ln,59 say 'Added/'  
@ln,67 say 'By'  
@ln,72 say 'Ckd'  
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,60 say 'By'  
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say '1]'
@ln,9 say 'Collect(approximately)'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say round(3.10*bsize,0) pict '999'
@ln,13 say 'Lts fresh Water for '
@ln,44 say 'volume :_______'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'injection in a 60 Lts reactor'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say '& cool it to about 10øC'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'under conti.N2 bubbling'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say '2]'
@ln,8 say '|'
@ln,9 say 'Transfer about      Lof'
@ln,24 say ROUND((bsize-1),0) pict '99.99'
@ln,36 say '|'
@ln,43 say '|'
@ln,44 say 'Volume:_____'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'above Water for injection '
@ln,44 say 'Temp:_____'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'in a  10 LTS R.B.F'
@ln,44 say '(Below 10øC)'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
*@ln,9 say ''
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say '3]'
@ln,8 say '|'
@ln,9 say 'Add & dissolve batch qty'
@ln,44 say 'Omeprazole'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'of Omeprazole Sodium BP/Ph.Eur '
@ln,44 say 'Sodium BP/Ph.Eur'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,8 say '|'
@ln,9 say 'till clear soln. is formed'
@ln,46 say '______gms.'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,8 say '|'
@ln,9 say 'with the aid of stirring'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say '4]'
@ln,9 say 'Withdraw an aliquot of'
@ln,44 say 'pH:_____'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'soln.to check pH'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say '5]'
@ln,9 say 'Adjust the pH to 12.0 ñ 0.2'
@ln,44 say '____ml of'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'using 0.5N Sodium Hydroxide soln.'
@ln,44 say '0.5 N NaOH'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'Transfer above soln. in S.S.316 P.V.'
@ln,44 say 'pH :_____'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say '6]'
@ln,9 say 'Make the volume to'
@ln,45 say 'volume:_____'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say bsize pict '999.99'
@ln,13 say '   Lts with Water for inj.'
@ln,45 say 'Stirring time'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'Stir the bulk for 10 minutes.'
@ln,45 say 'From:_______'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,45 say 'To:_______' 
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say '7]'
@ln,9 say 'Withdraw an aliquot of soln.'
@ln,45 say '________PH'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say 'to check pH & Assay.'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,9 say '(Range:12.0 ñ 0.20)'
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
ln=ln+1
@ln,1 say ee1
@ln,8 say '|'
@ln,36 say '|'
@ln,43 say '|'
@ln,58 say '|'
@ln,66 say '|'
@ln,71 say '|'
@ln,79 say '|'
EJECT

