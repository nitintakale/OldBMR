        do while .t.
          @23,1 SAY SPACE(78)
   		 @23,1 SAY 'BMR IS ALREADY TAKEN OUT.... ENTER PASSWORD FOR DUPLICATE'
          @23,60 SAY ' '
          set console off
          ACCEPT '      ' TO PASS
          IF PASS=SPACE(6)
             CLEA
             SET CONSOLE ON
             CLOSE DATABASES
             RETU
          ENDIF  
          if pass='MMMMMM'
               EXIT
			 ENDIF		
        ENDDO
          SET CONSOLE ON
          @23,1 SAY SPACE(78)
        