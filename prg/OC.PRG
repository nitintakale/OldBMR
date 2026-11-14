SET TALK ON
SET STEP ON
SET ECHO ON    
               STORE 0 TO TEMPVAR
               AQUANTITY=33
               AEXCESSQTY=1
               AUNIT=20
               AMINQTY=1
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(AEXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               IF AQUANTITY<50000
                  TEMPVAR=CEILING(TEMPVAR)
                ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
                TEMPVAR=TEMPVAR*AMINQTY
                RETU