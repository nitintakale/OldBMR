 *****P.M. CALCULATION
           PROC LABELPRIT
                SELE A
                GO TOP
                LOCATE ALL FOR ITEM='OUTERCART' .OR. ITEM='IN3PLYSHI'
                IF FOUND()
                    TEMPVAR=(AQUANTITY/VUNITSOC)
                ENDIF
                SELE A
                GO TOP
               LOCATE ALL FOR ITEM='LABELPRIT' .AND. RECNO()=MRECNO
               TEMPVAR = TEMPVAR+(AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               IF AQUANTITY<25000
                   TEMPVAR=CEILING(TEMPVAR)
               ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
                TEMPVAR=TEMPVAR*AMINQTY
                 &VPG=TEMPVAR        
                 RETU
                               
*********************
      PROC RONDBOXLB
               SELE A
               TEMPVAR = TEMPVAR+(AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               IF AQUANTITY<25000
                   TEMPVAR=CEILING(TEMPVAR)
               ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
                TEMPVAR=TEMPVAR*AMINQTY
                 &VPG=TEMPVAR        
                 RETU               
*******************               
      PROC PLCONT_LB
               SELE A
               TEMPVAR = TEMPVAR+(AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               IF AQUANTITY<25000
                   TEMPVAR=CEILING(TEMPVAR)
               ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
                TEMPVAR=TEMPVAR*AMINQTY
                 &VPG=TEMPVAR        
                 RETU
 *******************NOT REQ FOR GENTACIP EXPORT
*                IF AINUNIT="Y"
*                  &VPG=TEMPVAR/AUNIT        
*               ENDIF
                 RETU               
*******************               


       PROC PLASCONTA
                  SELE A
                  TEMPVAR= (AQUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
                IF AINUNIT="Y"
                  &VPG=TEMPVAR/AUNIT        
                 ENDIF
                 RETU
************************
 PROC OUTERCART
                  SELE A
                  TEMPVAR= (AQUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
                  IF AINUNIT="Y"
                    IF VINCARTVAL>1  .AND. ((VUNITSOC/2)=VINCARTVAL)
                     &VPG=TEMPVAR/AUNIT*2        
                    ELSE
                    IF VINCARTVAL>1  .AND. ((VUNITSOC*2)=VINCARTVAL)
                      &VPG=round((TEMPVAR/VINCARTVAL),-2)   
                      
                    ELSE
                      &VPG=TEMPVAR/AUNIT
                  ENDIF
                ENDIF
              ENDIF
                  RETU
*************************                  
PROC  INNERCART         && SAME FOR RONDO BOX,TRAY
               SELE A
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*AMINQTY
               &VPG=TEMPVAR        
                 RETU
*****************
PROC ENCLOSURE
              
               SELE A
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
                 IF AQUANTITY<50000
                   TEMPVAR=CEILING(TEMPVAR)
                 ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                  ENDIF  
                  TEMPVAR=TEMPVAR*AMINQTY
                  &VPG=TEMPVAR        
                  RETU
                  
*******************************                  
PROC  STWATERIN         
               SELE A
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*AMINQTY
               &VPG=TEMPVAR        
                 RETU

**************************
     PROC  SOLVFORRE        
               SELE A
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               TEMPVAR=CEILING(TEMPVAR)
               TEMPVAR=TEMPVAR*AMINQTY
               &VPG=TEMPVAR                       
                RETU
************************
     PROC  ICEPACKS        
                  SELE A
                  TEMPVAR= (AQUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
                  IF AINUNIT="Y"
                    IF VINCARTVAL>1  .AND. ((VUNITSOC/2)=VINCARTVAL)
                     &VPG=TEMPVAR/AUNIT*2        
                    ELSE
                      &VPG=TEMPVAR/AUNIT
                  ENDIF
                ENDIF
                 &vpg=&vpg*3
                  RETU
*********************
        PROC  PLACAPSST
               SELE A
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               IF AQUANTITY<50000
                  TEMPVAR=CEILING(TEMPVAR)
                ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
               TEMPVAR=TEMPVAR*AMINQTY
               &VPG=TEMPVAR        
               RETU
  ******************
 
*************
PROC IN3PLYSHI
               SELE A
               TEMPVAR = (AQUANTITY/AUNIT)
               TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
               TEMPVAR=TEMPVAR/AMINQTY
               IF AQUANTITY<50000
                  TEMPVAR=CEILING(TEMPVAR)
                ELSE
                   TEMPVAR=ROUND(TEMPVAR,0)
                ENDIF   
                TEMPVAR=TEMPVAR*AMINQTY
                &VPG=TEMPVAR        
                RETU
         *****************
            PROC SELFSEALB
                  SELE A
                  TEMPVAR= (AQUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
                  IF AINUNIT="Y"
                    IF VINCARTVAL>1  .AND. ((VUNITSOC/2)=VINCARTVAL)
                     &VPG=TEMPVAR/AUNIT*2        
                    ELSE
                      &VPG=TEMPVAR/AUNIT
                  ENDIF
                ENDIF
                  RETU
       ***************
      PROC THERMOBOX
                  SELE A
                  TEMPVAR= (AQUANTITY/VUNITSOC)
                  TEMPVAR=TEMPVAR+(TEMPVAR*(A->EXCESSQTY/100))
                  TEMPVAR=CEILING(TEMPVAR)
                  &VPG=TEMPVAR        
                  IF AINUNIT="Y"
                    IF VINCARTVAL>1  .AND. ((VUNITSOC/2)=VINCARTVAL)
                     &VPG=TEMPVAR/AUNIT*2        
                    ELSE
                      &VPG=TEMPVAR/AUNIT
                  ENDIF
                ENDIF
                  RETU
*********************

         ***************
         PROC SHWRAPFIL
               SELE A 
               TEMPVAR=(AQUANTITY/VUNITSOC)
               TEMPVAR=TEMPVAR*(UNITQTY)
               TEMPVAR=TEMPVAR*(EXCESSQTY/100)
               TEMPVAR=CEILING(TEMPVAR)
               *-------REQ BY JHAGIRDAR FOR  BATCH ZD5008 SALE
                TEMPVAR=TEMPVAR/100
               &VPG=TEMPVAR        
                 RETU
     *******************
         PROC SHIP5CORU
              SELE A
           
              TEMPVAR=AQUANTITY/VSHIP
              TEMPVAR=TEMPVAR+(TEMPVAR*(EXCESSQTY/100))+2
       
              TEMPVAR=CEILING(TEMPVAR)
    
              &VPG=TEMPVAR        
               RETU
        **************
       PROC SHIP5LAMI
               SELE A
          
              TEMPVAR=AQUANTITY/VSHIP
              TEMPVAR=TEMPVAR+(TEMPVAR*(EXCESSQTY/100))+2
           
              TEMPVAR=CEILING(TEMPVAR)
    
              &VPG=TEMPVAR        
               RETU
        **************
        PROC  SHIP7LAMI 
             SELE A
          
              TEMPVAR=AQUANTITY/VSHIP
              TEMPVAR=TEMPVAR+(TEMPVAR*(EXCESSQTY/100))+2
              TEMPVAR=CEILING(TEMPVAR)
              &VPG=TEMPVAR       
               RETU
*************************
        PROC  SHIP7CORU 
              SELE A
              TEMPVAR=AQUANTITY/VSHIP
              TEMPVAR=TEMPVAR+(TEMPVAR*(EXCESSQTY/100))+2
              TEMPVAR=CEILING(TEMPVAR)
              &VPG=TEMPVAR       
              RETU
*************************
 PROC BOPP_TAPE
              SELE A
              VPG=A->PKVAL
              TEMPVAR=0
              &VPG=TEMPVAR        
              RETU
**************
 PROC STRAPTAPE
              SELE A
              VPG=A->PKVAL
              TEMPVAR=0
              &VPG=TEMPVAR                 
              RETU