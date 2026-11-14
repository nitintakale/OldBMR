****PASSWORD FOR CANCELLATION OF BMR 
CLEA
SET DELI TO '[]'
SET DELI ON
SELE A
USE PASS_WORD
   CLEA
   STORE SPACE(8) TO VPASS1,VPASS2,VPASS3,VMDPASS
   STORE SPACE(30) TO BNAME1,BNAME2,BNAME3
   STORE SPACE(12) TO VDEP1,VDEP2,VDEP3
   STORE 0 TO BLEVEL1,VLEVEL2,VLEVEL3,VPROD,VQC    
   STORE SPACE(1) TO MATCH1,MATCH2,MATCH3,VKEY1,VKEY2,VKEY3,VMD
   CLEA

DO WHILE .T.   
   SET COLOR TO
   @3,5 SAY  'ENTER  PASSWORD 1 : ' 
   @3,30 SAY ' '
   set console off
   ACCEPT '         ' TO VPASS1
   IF VPASS1=SPACE(8)
       CLOSE DATABASES
       MATCH1='N'
       RETU
   ENDIF  
      SELE A
      GO TOP
      LOCATE FOR PASSWORD=VPASS1  .and. key='C'
      IF .NOT. FOUND()
		     @23,1 SAY SPACE(72)
		  	  SET COLOR TO W+*
			  @23,1 SAY 'W R O N G    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
              LOOP
       ELSE
              MATCH1='Y'
              MATCH2='Y'
              MATCH3='Y'
	        EXIT
       ENDIF			  
 ENDDO
   @23,1 SAY SPACE(78) 
   SET CONSOLE ON

*              VLEVEL1=A->LEVEL
* 			  VDEP1=A->DEPARTMENT
*              VKEY1=A->KEY
*           IF VKEY1='M'
*              VMD='Y'
*			  EXIT
*            ENDIF				  
*           IF VKEY1='P'
*			     VPROD=VPROD+1
*   		  ENDIF	  		     
*           IF VKEY1='Q'
*			     VQC=VQC+1
*		  ENDIF	  		     

*************************
*IF VMD#'Y'
*DO WHILE .T.   
*   SET COLOR TO
*   @5,5 SAY  'ENTER Q.C. LEVEL 1 PASSWORD 2 : ' 
*   @5,49 SAY ' '
*   set console off
*   ACCEPT '         ' TO VPASS2
*   IF VPASS2=SPACE(8)
*       CLOSE DATABASES
*       MATCH2='N'
*       RETU
*   ENDIF  
*      SELE A
*      GO TOP
*      LOCATE FOR PASSWORD=VPASS2 
*      IF .NOT. FOUND()
*		     @23,1 SAY SPACE(72)
*		  	  SET COLOR TO W+*
*			  @23,1 SAY 'W R O N G    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
*           LOOP
*       ELSE
*           VLEVEL2=A->LEVEL
* 			  VDEP2=A->DEPARTMENT
*           VKEY2=A->KEY
*           IF VKEY2='P'
*			     VPROD=VPROD+1
*			  ENDIF	  		     
*           IF VKEY2='Q'
*			     VQC=VQC+1
*			  ENDIF	  		     
*			  EXIT
*       ENDIF			  
* ENDDO
* @23,1 SAY SPACE(78) 
* SET CONSOLE ON
*DO WHILE .T.   
*   SET COLOR TO
*   @7,5 SAY  'ENTER Q.C. LEVEL 1 PASSWORD 3 : ' 
*   @7,49 SAY ' '
*   set console off
*   ACCEPT '         ' TO VPASS3
*   IF VPASS3=SPACE(8)
*       CLOSE DATABASES
*       MATCH3='N'
*       RETU
*   ENDIF  
*      SELE A
*      GO TOP
*      LOCATE FOR PASSWORD=VPASS3 
*      IF .NOT. FOUND()
*		     @23,1 SAY SPACE(72)
*		  	  SET COLOR TO W+*
*			  @23,1 SAY 'W R O N G    P A S S W O R R D... ENTER AGAIN .KEEP BLANK TO EXIT'
*             LOOP
*       ELSE
*          VLEVEL3=A->LEVEL
* 		   VDEP3=A->DEPARTMENT
*           VKEY3=A->KEY
*           IF VKEY3='P'
*			     VPROD=VPROD+1
*		  ENDIF	  		     
*           IF VKEY3='Q'
*			     VQC=VQC+1
* 		  ENDIF	  		     
*		     EXIT
*       ENDIF			  
* ENDDO
*       @23,1 SAY SPACE(78) 
*       IF VPROD=1 .AND. VQC=2 
*           @22,1 SAY SPACE(78)
*       ELSE
*          @22,1 SAY SPACE(78)
*          @22,1 SAY 'COMBINATION OF DEPARTMENT ENTERED IS NOT AUTHORISED'
*       	  WAIT
*          LOOP 	      
*        ENDIF	
*        IF VLEVEL1#1 .OR. VLEVEL2#1 .OR. VLEVEL3#1
*               @22,1 SAY SPACE(78)
*               @22,1 SAY 'COMBINATION OF LEVEL ENTERED IS NOT AUTHORISED'
*             	WAIT
*             	LOOP 	      
*        ENDIF	

*              EXIT
*        ELSE
*                MATCH1='Y'
*                MATCH2='Y'
*                MATCH3='Y'
*                EXIT
* ENDIF && MD#'Y'
****************************

* ENDDO