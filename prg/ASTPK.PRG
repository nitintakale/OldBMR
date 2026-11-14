**ST PACK AMPOULES
   STORE SPACE(1) TO RBOX,TRAY,ENCLO
*   SELE A
 IF FOPEN("CPKG_MST.DBF") = -1
   SELE CPKG_MST
 ELSE
   SELE A
   USE CPKG_MST
 ENDIF   
   SET ORDER TO SRPKG
   GO TOP
   SEEK 'RONDO BOX'
   IF FOUND()
      RBOX="Y"
   ENDIF   

   SELE  CPKG_MST   
   GO TOP
   SEEK 'TRAYPLAST'
   IF FOUND()
      TRAY="Y"
   ENDIF 
   SELE  CPKG_MST
   GO TOP
   SEEK 'ENCLOSURE'
   IF FOUND()
      ENCLO="Y"
   ENDIF 
   IF RBOX="Y"
    @LN,3 SAY 'Rando box                ='+ LTRIM(STR(VINCARTVAL))+'   Labelled ampoules '
     IF ENCLO="Y"
        LN=LN+1
        @LN,3 SAY '                        1 Enclosure.' 
     ENDIF
     LN=LN+1
     @LN,3 SAY 'Outer carton fill value  ='+ LTRIM(STR(UNITPACK2))+'   Rondobox kept in outer carton'
  ENDIF
  IF TRAY="Y"
    @LN,3 SAY 'Tray fill value          ='+ LTRIM(STR(VINCARTVAL))+'   Labelled ampoules '
    IF ENCLO="Y"
        LN=LN+1
        @LN,3 SAY '                          1 Enclosure.' 
      ENDIF
     LN=LN+1
     @LN,3 SAY 'Outer carton fill value  ='+ LTRIM(STR(UNITPACK2))+'   Trays kept in  inner carton'
 ENDIF

IF TRAY # "Y" .AND.  RBOX #"Y" .AND. ENCLO="Y"
   LN=LN+1
   @LN,3 SAY 'Outer carton fill value  ='+ LTRIM(STR(UNITPACK2))+'   AMPOULES ,'+' 1 Enclosure.' 
ENDIF 
LN=LN+1
@LN,3 SAY  'Shipper fill value       = '+ substr(VUNITPACK,1,2) +' Outer cartons   '            
SELE CPKG_MST
SET ORDER TO SRCPKG