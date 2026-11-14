****TO ENTER START PAGE /ENDPAGE
		  do while .t.
                 STORE 0 TO SPAGE,EPAGE
                 @6,1 CLEA TO 22,70
                 @7,5 say 'START PAGE NO :' GET SPAGE PICT '99'
                 READ
                 IF SPAGE=0
                    LOOP
                 ENDIF    
                IF MP='P' 
                   IF SPAGE>1
        	           @9,5 say 'END PAGE NO   :' GET EPAGE PICT '99'
    	               READ
	        	         IF EPAGE<SPAGE
                		    LOOP
		                 ENDIF                    
                         EXIT
                 ELSE
					 EPAGE=1
                     EXIT 
                 ENDIF						  
                ENDIF
                IF MP='M' 
        	           @9,5 say 'END PAGE NO   :' GET EPAGE PICT '99'
    	               READ
	        	         IF EPAGE<SPAGE
                		    LOOP
		                 ENDIF                    
                         EXIT
                 ENDIF						  
           ENDDO