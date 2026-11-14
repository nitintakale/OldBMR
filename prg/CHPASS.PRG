****PRG TO CHANGE PASSWORD
CLEA
SELE A
USE PASS_WORD
DO WHILE .T.
   STORE SPACE(8) TO OPASS,NPASS
   STORE SPACE(30) TO VNAME
	STORE SPACE(12) TO VDEP1
   STORE 0 TO VLEVEL1
   CLEA
DO WHILE .T.   
   SET COLOR TO
   @3,5 SAY  'ENTER EXISTING PASSWORD1 : ' 
   @3,33 SAY ' '
   set console off
   ACCEPT '         ' TO OPASS
   IF OPASS=SPACE(8)
       CLOSE DATABASES
       RETU
   ENDIF  
   SET CONSOLE ON
   SELE A
   GO TOP
   LOCATE FOR PASSWORD=OPASS 
      IF .NOT. FOUND()
		    @23,1 SAY SPACE(72)
			 SET COLOR TO W+*
			  @23,1 SAY 'P A S S W O R R D.. NOT FOUND . ENTER AGAIN .KEEP BLANK TO EXIT'
           LOOP
       ELSE
		    EXIT
       ENDIF			  
ENDDO
          mrecno=recno()
          VLEVEL1=A->LEVEL
  		  VDEP1=A->DEPARTMENT
          VNAME=A->NAME           
		 @5,5 SAY  A->NAME +'   '+'LEVEL:-'+LTRIM(STR(LEVEL))+'  FROM  '+LTRIM(VDEP1)+'  '+'DEPARTMENT'			 
DO WHILE .T.		    
		  @8,5 SAY  'ENTER NEW PASSWORD : ' 
          @8,33 SAY ' '
          set console off
          ACCEPT '         ' TO NPASS
          IF NPASS=SPACE(8)
              CLOSE DATABASES
              RETU
          ENDIF  
          SET CONSOLE ON
          l=len(ltrim(npass))
			 if l#8
             @23,1 say space(78)
				 @23,1 say 'Password should  be 8 characters/digits'
			    loop
          endif				 
          @23,1 say space(78)
          sele a
			 go top
			 locate for password=npass
			 if found()
			    @23,1 say  'Your new password is already used by other person'
				 loop
           endif				 
			 YN=' '
			 @23,1 SAY 'ENTER [C] TO CONFIRM' GET YN PICT '!'
			 READ
			 IF YN='C'
                 SELE A
                 goto mrecno
				 REPL  PASSWORD WITH UPPER(NPASS)
		  	     EXIT
          ELSE
			    LOOP
	       ENDIF
ENDDO			 				 
CY=' '
@23,1 SAY SPACE(78)
@23,1 SAY '[C] TO CONTINUE...' GET CY PICT '!'
READ
IF CY='Y'
   LOOP
ELSE
  EXIT
ENDIF
ENDDO  	