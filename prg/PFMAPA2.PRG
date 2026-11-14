******PROFENAC aseptic page 2
LN=0
*@0,15 SAY '[LDPE]'
LN=0
@0,60 SAY 'PAGE : 2 OF 14'
DO PROC_1
   IF ROT_SP='R'
       DO TRCOMP1
   ENDIF
   IF ROT_SP='S'
      DO TSCOMP1
    ENDIF




