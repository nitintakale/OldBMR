              SET PROC TO ADIHEAD
   	          clea 
              SET COLOR TO W+/B,W+/R
      		  VVYEAR=YEAR(DATE())
         	  VVYEAR=LTRIM(STR(VVYEAR))
	          VYEAR=SUBSTR(VVYEAR,3,2)
              @0,0 TO 24,78 DOUBLE
              sele a
*              USE BATCH_NO inde bno
             USE BATCH_NO order bno
		      SET FILT TO BPR#'Y' .AND. SUBSTR(BATCHNO,1,2)#'BM'
              GO TOP
              IF EOF()
                  @23,2 SAY SPACE(67)
                  SET COLOR TO GR+/W
           	      @23,2 SAY '..NO PENDING.... '
                  SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                  UX=INKEY(0)
                  RETU
              ENDIF
                        
                         DO PRINTOPT
                         IF OPT=0
                             CLOSE ALL
                             RETU
                          ENDIF   
 
              IF OPT=1
                     CLEA
     		         SET COLOR TO GR+/B
	     		     @2,15 SAY '.*.*.*.*.*.*.FOLLOWING BPR(FULL BATCH) ARE PENDING.*.*.*.*.*.*.'
       			     SET COLOR TO W+/B,W+/R
		             SET COLOR TO W+/G
		             @4,10 SAY 'BATCHNO'
                     @4,25 SAY 'PRODUCT NAME'
                     SET COLOR TO R+/B
               	     LN=6
                   	 DO WHILE .NOT. EOF()
	          	      	@LN,10 SAY BATCHNO
             	   		@LN,25 SAY NAME1
            	   		@LN,40 SAY NAME2
            	  		SKIP
	            		LN=LN+1
	          	        IF LN>21
                          SET COLOR TO R+/GB
                          @23,2 SAY SPACE(67)
               		      @23,2 SAY '...PRESS ANY KEY.TO VIEW MORE... '
                          UX=INKEY(0)

                          SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                          SET COLOR TO R+/B
                           @6,2 CLEA TO 23,77
 	            	       LN=6
                  	 	ENDIF        
  	    	          enddo
                        @23,2 SAY SPACE(67)
                        SET COLOR TO R+/N
             		    @23,2 SAY '..END ...PRESS ANY KEY.... '
                        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                        UX=INKEY(0)
       	  		ENDIF
	
	
              IF OPT=2 .OR. OPT=3
                  
                     @2,15 SAY '.*.*.*.*.*.*.FOLLOWING BPR(FULL BATCH) ARE PENDING.*.*.*.*.*.*.'
		             @4,10 SAY 'BATCHNO'
                     @4,25 SAY 'PRODUCT NAME'
               	     LN=6
                   	 DO WHILE .NOT. EOF()
	          	      	@LN,10 SAY BATCHNO
             	   		@LN,25 SAY NAME1
            	   		@LN,40 SAY NAME2
            	  		SKIP
	            		LN=LN+1
	          	        IF LN>60
                           EJECT
                           @4,10 SAY 'BATCHNO'
                           @4,25 SAY 'PRODUCT NAME'
                   	       LN=6
                  	 	ENDIF        
  	    	          enddo
                      EJECT
                      SET PRINT OFF
                      SET PRINTER TO
                      SET DEVI TO SCREEN
       	  		ENDIF
	       RETU		
*--------------