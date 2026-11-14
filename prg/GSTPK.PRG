*GLASS VIALS BPR ST PACK REQ FOR 
    store space(1) to ENCLO
    SELE CPKG_MST
    SET ORDER TO SRPKG
    SEEK 'ENCLOSURE'
    IF FOUND()
       ENCLO="Y"
    ENDIF    
    SELE CPKG_MST
    SET ORDER TO SRPKG
    SEEK 'INNERCART'
IF FOUND()
    @LN,3 SAY 'Inner carton fill value = 1 filled vial'
    IF ENCLO="Y"
        @LN,3 SAY '                        1 Enclosure'                    
        LN=LN+1
    ENDIF
    @LN,3 SAY 'Outer Carton value      ='+ LTRIM(STR(UNITPACK2))+'   inner cartons'
    LN=LN+1
    @LN,3 SAY  'Shipper fill value     = '+ substr(VUNITPACK,1,2) +'   outer cartons.'            
ENDIF  
    SELE CPKG_MST
    SET ORDER TO SRPKG
    SEEK 'PLASCONTA'
   IF FOUND()
    @LN,3 SAY 'Plastic container      ='+ LTRIM(STR(UNITPACK2))+'   labelled vials'
    LN=LN+1
    IF ENCLO="Y"
        @LN,3 SAY '                        1 Enclosure'                    
        LN=LN+1
    ENDIF
    @LN,3 SAY  'Shipper fill value     = '+ substr(VUNITPACK,1,2) +'   Plastic container.'            
   ENDIF
