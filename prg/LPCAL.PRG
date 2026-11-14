****LYOPHILISED PRODUCT  BPR CALCULATION
PROC LPCAL
STORE SPACE(4) TO VPG,VPG1
STORE 0 TO XVPG
STORE 0 TO VEXPG1
SELE A
USE CPKG_MST ORDER SRCPKG
GO TOP
DO WHILE .NOT. EOF()
           STORE 0 TO TEMPVAR,TEMPVAR1
           VPG=A->PKVAL
           IF LB="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               T1=TEMPVAR+TEMPVAR1
               T2=T1+(T1*(A->EXCESSQTY/100))
               T2=T2/A->MINQTY
               IF A->QUANTITY<25000
                   T3=CEILING(T2)
               ELSE
                   T3=ROUND(T2,0)
                ENDIF   
               
               T4=T3*A->MINQTY
               &VPG=T4        
           ENDIF
           IF IC="Y" .OR. TRAY="Y"
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*A->MINQTY
                &VPG=TEMPVAR        
           ENDIF

              IF  ENCLO="Y"
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
                  &VPG=TEMPVAR        
            ENDIF

              IF  SHIP5="Y"
                  TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
               ENDIF
       
               IF SHIP7="Y"
                   TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
                   TEMPVAR=CEILING(TEMPVAR)    
                   &VPG=TEMPVAR        
               ENDIF
              
              IF  BTAPE="Y"
                TEMPVAR=0
                &VPG=TEMPVAR        
           ENDIF
           IF SWI="Y"  .OR. SOLRE="Y"
              TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
              TEMPVAR=CEILING(TEMPVAR)    
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
