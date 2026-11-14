****PROC FPCAL
STORE SPACE(4) TO VPG
STORE 0 TO XVPG
SELE A
USE CPKG_MST ORDER SRCPKG
GO TOP
*DO WHILE .NOT. EOF()
           IF LB="Y"
               STORE 0 TO TEMPVAR
               SELE A
               SET FILT TO ALLTRIM(A->ITEM)= 'LABELPRIT'
               GO TOP
               VPG=A->PKVAL
               IF OC= "Y" 
                  TEMPVAR=(A->QUANTITY/VUNITSOC)
                ENDIF
               TEMPVAR = TEMPVAR+(A->QUANTITY/A->UNITQTY)
*               TEMPVAR=TEMPVAR+TEMPVAR1
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
             IF IC="Y"
               STORE 0 TO TEMPVAR
               SELE A
               SET FILT TO ALLTRIM(A->ITEM)="INNERCART"
               GO TOP
               VPG=A->PKVAL
               TEMPVAR = (A->QUANTITY/A->UNITQTY)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/A->MINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*A->MINQTY
                &VPG=TEMPVAR        
           ENDIF
            IF CAP="Y"
               STORE 0 TO TEMPVAR
               SELE A
               SET FILT TO ALLTRIM(A->ITEM)= "PLACAPSST"
               GO TOP
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
             ENDIF     

              IF  ENCLO="Y"
               STORE 0 TO TEMPVAR

               SELE A
               SET FILT TO ALLTRIM(A->ITEM)=  "ENCLOSURE"
               GO TOP
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
           ENDIF     
           
            IF ICORU="Y"
               STORE 0 TO TEMPVAR
               SELE A
               SET FILT TO ALLTRIM(A->ITEM)= "IN3PLYSHI"
               GO TOP
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
          ENDIF     
              IF  OC="Y"
                  STORE 0 TO TEMPVAR
                  SELE A
                  SET FILT TO ALLTRIM(A->ITEM)= "OUTERCART"
                  GO TOP
                  VPG=A->PKVAL
                  TEMPVAR= (A->QUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
            ENDIF
            IF S_W_FILM="Y"
           STORE 0 TO TEMPVAR
               SELE A
               SET FILT TO ALLTRIM(A->ITEM)= "SHWRAPFIL"
               GO TOP
               VPG=A->PKVAL
               A=(QUANTITY/VUNITSOC)
               B=A*(UNITQTY)
               C=B*(EXCESSQTY/100)
               C=CEILING(C)
               &VPG=C        
            ENDIF    
           IF SHIP5="Y"
             STORE 0 TO TEMPVAR
             SELE A
              SET FILT TO ALLTRIM(A->ITEM)= "SHIP5CORU"
              GO TOP
              VPG=A->PKVAL
              TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
              TEMPVAR=CEILING(TEMPVAR)
              &VPG=TEMPVAR        
           ENDIF
           IF  SHIP7="Y"
                 STORE 0 TO TEMPVAR
                SELE A
              SET FILT TO  ALLTRIM(A->ITEM)= "SHIP7LAMI"
              GO TOP
               VPG=A->PKVAL
               TEMPVAR=CEILING(A->QUANTITY/A->UNITQTY)
               TEMPVAR=CEILING(TEMPVAR)    
                &VPG=TEMPVAR        
           ENDIF
           IF  BTAPE="Y"
              STORE 0 TO TEMPVAR
              SELE A
              SET FILT TO ALLTRIM(A->ITEM)= "BOPP_TAPE"
              GO TOP
              VPG=A->PKVAL
              TEMPVAR=0
              &VPG=TEMPVAR        
           ENDIF
    
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
***************
