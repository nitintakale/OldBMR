*FFS BPR ST PACK REQ FOR BPR 3 PAGE
STORE SPACE(1) TO ENCLO,S_W_FILM
@LN,3 SAY 'Inner carton fill value = 1 filled vial, 1 sterilised  polystyrine cap '
LN=LN+1
   SELE A
   USE CPKG_MST
   SET ORDER TO SRPKG
   GO TOP
   SEEK 'ENCLOSURE'
   IF FOUND()
      ENCLO="Y"
   ENDIF   
   SELE  CPKG_MST   
   GO TOP
   SEEK 'SHWRAPFIL'
   IF FOUND()
      S_W_FILM="Y"
   ENDIF 



IF ENCLO="Y"
   @LN,3 SAY '                          1 Enclosure'                    
   LN=LN+1
ENDIF
IF  s_w_film # "Y"
    @LN,3 SAY 'Outer carton fill value  = '+ LTRIM(STR(UNITPACK2))+'   Inner cartons'
    LN=LN+1
    @LN,3 SAY  'Shipper fill value      = '+ Substr(VUNITPACK,1,2)+'   Outer cartons'              
ENDIF
IF  S_W_FILM = "Y"
    @LN,3 SAY 'Shrink wrap pack value   = '+ LTRIM(STR(UNITPACK2))+'    Inner cartons'
    LN=LN+1
    @LN,3 SAY  'Shipper fill value      = '+ substr(VUNITPACK,1,2) +'   Shrink packs '            
ENDIF