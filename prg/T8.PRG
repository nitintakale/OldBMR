CLEA
			        SELE A
                    USE PRODMAST
                    GO TOP
                    MPACK=A->PACK
                    SET FILT TO 
			        SET ORDER TO PRODPACK
			        define window temp from 9,25 to 18,55
	   		        define popup s_list from 9,26to 18,54 prompt fields LTRIM(PACK) footer "Press [ Go down] [ Go up]  [ENTER] key to Select"   && in window temp 
		            activate window temp
				    @0,15 get MPACK popup s_list
			        read valid lastkey() = 13 .OR. LASTKEY()=27
			   	    deactivate window temp
			         SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
				     IF LASTKEY()=27
				       MPACK=MPACK   
                     ELSE
                       MPACK=A->PACK
	                 ENDIF
                     ?MPACK
                     WAIT