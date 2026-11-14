                  SELE A
                  USE ITEM_MST
                           GO TOP
                           TVV=SUBSTR(PKVAL,3,2)
                           TVV=VAL(TVV)
                           SKIP
                           SELE A
                           DO WHILE .NOT. EOF()
                               VV=SUBSTR(PKVAL,3,2)
                               VV=VAL(VV)
                               MAXVV=MAX(TVV,VV)
                               SKIP
                           ENDDO            
                           MAXVV=MAXVV+1
                           MMAXVV='PG'+LTRIM(STR(MAXVV))
                           ?MMAXVV
                           WAIT