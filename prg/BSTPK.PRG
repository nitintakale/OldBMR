****ST PACK SOLN

  SELE A
  USE CPKG_MST
  STORE SPACE(1) TO ENCLO
  SET ORDER TO SRPKG
  SEEK 'ENCLOSURE'
  IF FOUND()
    ENCLO="Y"
  ENDIF  

  IF ENCLO="Y"
     @LN,3 SAY 'Inner carton fill value         ='+LTRIM(STR(VINCARTVAL))+ '   filled bottle, 1 Enclosure.'                     
  ELSE
      @LN,3 SAY 'Inner carton fill value         ='+LTRIM(STR(VINCARTVAL))+ '   filled bottle'
   ENDIF
LN=LN+1
@LN,3 SAY 'Inner corrugated box fill value = '+ ltrim(str(VSHIP/VOUTCART,4))+'  cartons'                 
LN=LN+1
@LN,3 SAY 'Shipper fill value              = '+ LTRIM(STR(VOUTCART,3))+ '  Inner corrugated boxes'             
