
@LN,3 SAY 'Inner carton fill value = 1 filled vial, 1 sterilised  plastic dropper with cap '
LN=LN+1
@LN,3 SAY '                          1 Enclosure'                    
LN=LN+1
IF  s_w_film # "Y"
    @LN,3 SAY 'Outer carton fill value  ='+ LTRIM(STR(UNITPACK2))+'   inner cartons'
*    @LN,3 SAY 'Outer carton fill value = 20 inner cartons. '                 
    LN=LN+1
    @LN,3 SAY  'Shipper fill value     = '+ substr(VUNITPACK,2) +'  '+'OUTER CARTONS '

ENDIF
IF  S_W_FILM = "Y"
    @LN,3 SAY 'Shrink wrap pack value  ='+ LTRIM(STR(UNITPACK2))+'   inner cartons'
    LN=LN+1
    @LN,3 SAY  'Shipper fill value     = '+ VUNITPACK              

ENDIF