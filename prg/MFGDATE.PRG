****MFGDATE
 VMFGMON='   '
 DO WHILE .T.
     @LN,2 SAY 'MFG MONTH           :' GET VMFGMON PICT '!!!' VALID VMFGMON $('JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC')
     SET COLOR TO W+/G
     @LN+2,12 SAY 'ENTER 1ST 3 LETTERS OF MONTH '
     SET COLOR TO W+/B,W+/R
     READ
     @LN+2,2 SAY SPACE(60)          
     MDATE=SUBSTR(VMFGMON,1,3) 
     MONC=' '
     IF MDATE#SUBSTR(UPPER(CMONTH(DATE())),1,3)
        SET COLOR TO W+/G,R+/B
        @LN+1,15 SAY ' MFG MONTH IS NOT A CURRENT MONTH...ENTER [C] TO CONFIRM' GET MONC PICT '!' VALID MONC$('C ')
        READ
        SET COLOR TO W+/B,W+/R
           @LN+1,15 SAY SPACE(70)
        IF MONC#'C'
           LOOP
         ENDIF
      ENDIF         
      EXIT
 ENDDO
    IF MDATE="MAY"
       VMFGMON=MDATE+' '
    ELSE   
     VMFGMON=MDATE+'.'
    ENDIF
DO WHILE .T.
     SET COLOR TO W+/B,W+/R
     @LN,30 SAY 'MFG YEAR :' GET VMFGYEAR PICT '9999'
     SET COLOR TO W+/G
     @LN+2,2 SAY 'ENTER  4 DIGITS OF YEAR'
     SET COLOR TO W+/B,W+/R
     READ
     @LN+2,2 SAY SPACE(60)
    IF VMFGYEAR # YEAR(DATE())
         YEARCON=' '
         @LN+1,2 SAY SPACE(75)
         SET COLOR TO W+/RB,R+/B
         @LN+1,15 SAY 'YEAR ENTERED DOES NOT TELLY WITH CURRENT YEAR..CONFIRM [C]' GET YEARCON PICT '!' VALID YEARCON$('C ')
         READ
         SET COLOR TO W+/B,W+/R
         IF YEARCON='C'
             EXIT
         ELSE
            LOOP
         ENDIF      
     ENDIF
    EXIT
ENDDO 
    SET COLOR TO W+/B,W+/R
