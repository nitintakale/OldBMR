****PROC FFPCAL

SAVE TO SSS ALL LIKE VSTAMP*
RELEASE ALL LIKE VSTAMP*     
SET PROC TO ITEMCAL
STORE 0 TO AUNIT,AMINQTY
AINUNIT=" "
IF CLUBBPR="Y"
	USE CBBPR
    GO TOP
	SUM QUANTITY TO CQTY FOR BPRSRNO=VBPRSR
	USE
	SELE A
	USE CPKG_MST ORDER UNICPK
	GO TOP
ELSE
	SELE A
	USE CPKG_MST ORDER SRCPKG
	GO TOP
ENDIF
SET PROC TO ITEMCAL

DO WHILE .NOT. EOF()
               STORE 0 TO TEMPVAR
               STORE SPACE(4) TO VPG         
               STORE A->ITEM TO AITEM
               STORE A->PKVAL TO VPG
               STORE A->QUANTITY TO AQUANTITY
         
               STORE RECNO() TO MRECNO 
               IF A->ITEM='TRAYPLAST' .OR. A->ITEM='RONDO BOX' .OR. A->ITEM='INNERCART'  .OR. A->ITEM='PLASCONTA' 
                     AITEM='INNERCART'&& AS SAME AS INNERCART
                     IF A->UNITQTY>1
                       AUNIT=A->UNITQTY
                       AINUNIT="Y" && MORE THEN 1 IN I.C.\TRAY
                     ELSE
                       AUNIT=1
                     ENDIF  
               ENDIF
               IF A->UNITQTY=0
                 AUNIT=1
               ELSE
                  AUNIT=A->UNITQTY
               ENDIF    
               IF A->MINQTY=0
                 AMINQTY=1
               ELSE
                  AMINQTY=A->MINQTY
               ENDIF    
      IF A->ITEM ='ICE PACKS'
           AITEM='ICEPACKS'
      ENDIF           
             IF CLUBBPR="Y"
                 AQUANTITY=CQTY
             ENDIF    
               DO &AITEM                     
               SELE A
               GOTO MRECNO
               SKIP
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
            REST FROM SSS ADDI
            RETU             



           