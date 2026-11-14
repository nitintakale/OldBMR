****AMPOULES BPR CALCULATION
PROC APCAL
STORE SPACE(4) TO VPG
STORE 0 TO XVPG
SELE A
USE CPKG_MST ORDER SRCPKG
SELE A
GO TOP
DO WHILE .NOT. EOF()
           STORE 0 TO TEMPVAR
           VPG=A->PKVAL
             IF LB="Y" .OR. RBOXLB="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
                     
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               IF A->QUANTITY<25000
                   TEMPVAR=CEILING(TEMPVAR)
               ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
          
               TEMPVAR=TEMPVAR*A->MINQTY
               &VPG=TEMPVAR        
           ENDIF
           IF TRAY="Y" .OR. IC="Y" .OR. RBOX="Y"
               IF A->UNITQTY>1
                   AUNIT=A->UNITQTY
               ENDIF    
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*A->MINQTY
                &VPG=TEMPVAR        
           ENDIF

             IF ENCLO="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
           
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
             IF A->QUANTITY<50000
               TEMPVAR=CEILING(TEMPVAR)
             ELSE
               TEMPVAR=ROUND(TEMPVAR,0)
             ENDIF  
               TEMPVAR=TEMPVAR*A->MINQTY
               &VPG=TEMPVAR        
      ENDIF     
           
               IF  OC="Y"
                  TEMPVAR= (A->QUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR/AUNIT        
            ENDIF

             IF  SHIP5="Y"
              TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
              TEMPVAR=CEILING(TEMPVAR)
              &VPG=TEMPVAR        
           ENDIF

              IF  SHIP7="Y"
               TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
               TEMPVAR=CEILING(TEMPVAR)    
               &VPG=TEMPVAR        
           ENDIF
            IF BTAPE="Y"
              TEMPVAR=0
              &VPG=TEMPVAR        
           ENDIF
           SKIP
           IF EOF()
               EXIT
           ENDIF
       ENDDO    
              SELE A
              SET FILT TO STATUS="Y" 
              GO TOP
           DO WHILE .NOT. EOF()
                 PG=A->PKVAL
                 REPL A->PMQTY WITH  &PG
                 SELE A
                 SKIP
            ENDDO
            SELE A
            GO TOP
RETU             


******************
