****BOTTLES BPR CALCULATION
PROC BPCAL
STORE SPACE(4) TO VPG,VPG1
STORE 0 TO XVPG
STORE 0 TO VEXPG1
SELE A
USE CPKG_MST ORDER SRPKG
GO TOP

DO WHILE .NOT. EOF()
           STORE 0 TO TEMPVAR,TEMPVAR1

           IF LB="Y"
               SELE A
               SEEK 'LABELPRIT'
               VPG=A->PKVAL
               IF ICORU= "Y" 
                  TEMPVAR1=(A->QUANTITY/VUNITSOC)
                ENDIF
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               T1=TEMPVAR+TEMPVAR1

               T1=T1+(T1*(A->EXCESSQTY/100))
               T1=T1/A->MINQTY
               IF A->QUANTITY<25000
                   T1=CEILING(T1)
               ELSE
                   T1=ROUND(T1,0)
                ENDIF   
               
               TEMPVAR=T1*A->MINQTY
               &VPG=TEMPVAR        
           LB="N"
           ENDIF

             IF  IC="Y"
               SELE A
               SEEK "INNERCART"
               VPG=A->PKVAL
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*A->MINQTY
               &VPG=TEMPVAR        
               IC="N"
           ENDIF
            IF  ENCLO="Y"
               SELE A
               SEEK  "ENCLOSURE"
               VPG=A->PKVAL
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
                ENCLO="N"
          ENDIF     
           
             IF  ICORU="Y"
               SELE A
               SEEK "IN3PLYSHI"
               VPG=A->PKVAL
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
               ICORU="N"
          ENDIF     
             IF  SHIP5="Y"
              SELE A
              SEEK "SHIP5CORU"
              VPG=A->PKVAL
              TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
              TEMPVAR=CEILING(TEMPVAR)
              &VPG=TEMPVAR        
              SHIP5="N"
            ENDIF
             IF SHIP7="Y"
               SELE A
               SEEK "SHIP7LAMI"
               VPG=A->PKVAL
               TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
               TEMPVAR=CEILING(TEMPVAR)    
               &VPG=TEMPVAR        
               SHIP7="N"
           ENDIF
           IF BTAPE="Y"
              SELE A
              SEEK "BOPP_TAPE"
              VPG=A->PKVAL
              TEMPVAR=0
              &VPG=TEMPVAR        
              BTAPE="N"
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
