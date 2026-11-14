
@LN,3 SAY 'Inner carton fill value = 1 filled bottle, 1 Enclosure'                    
LN=LN+1
@LN,3 SAY 'Inner corrugated box fill value ='+ ltrim(str(VSHIP/VOUTCART,4))+'  inner cartons'                 
LN=LN+1
@LN,3 SAY  'Shipper fill value       ='+ LTRIM(STR(VOUTCART,3))+'    '+'Inner corrugated boxes'             
