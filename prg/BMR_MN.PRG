*-------------------BMR                                                                    
         IF MP='M'
               IF AS='A'
                   DO BMR
                   IF VCONSIZE='F'
                      CLOSE ALL
                      RETU
                    ENDIF
                    sele B
                    USE PRODMAST ORDER PN12 
                    SEEK SNAME+SNAME1
                    VCAL=B->BMRCAL
                    DO &VCAL
                    DO WHILE .T.
                       DO PRINTOPT
                         IF OPT=0
                             CLOSE ALL
                             RETU
                          ENDIF   
                         IF OPT=1
                            CLEA
                            @15,5 SAY '------  N O   S C R E E N  VIEW-----'
                            WAIT
                           LOOP
                         ENDIF  
                       EXIT
                    ENDDO
                    pno=1
                    do while PNO<=25
                      Vbmrpa=space(7)
                      mno=ltrim(str(pno))
                      Vbmrpa='BMRPA'+MNO
                      SELE B
                      IF LEN(ALLTRIM(&VBMRPA))>0
                          PPAGE=&VBMRPA
                          DO &PPAGE
                          PNO=PNO+1
                          IF PNO>25
                             EXIT
                          ENDIF
                      ELSE
                          PNO=PNO+1
                          IF PNO>25
                             EXIT
                          ENDIF
                      ENDIF
                  ENDDO  
              *EJECT
              SET PRINTER TO
              SET PRINT OFF
              SET DEVI TO SCREEN
              DO BMRAPPEND
           ENDIF     && AS='A'
           IF  AS='S'
               DO BATCHENT
               IF VBNO=SPACE(7)
                   RETU
               ENDIF    
               sele B
              USE PRODMAST ORDER PN12 
               SEEK SNAME+SNAME1        
               VCAL=B->BMRCAL
               DO &VCAL
               DO WHILE .T.
         	   DO STA_END.PRG
                   DO WHILE .T.
                         DO PRINTOPT
                          IF OPT=0
                              CLOSE ALL
                              RETU
                          ENDIF   
                          IF OPT=1
                             CLEA
                             @15,5 SAY '------  N O   S C R E E N  VIEW-----'
                             WAIT
                             LOOP
                         ENDIF  
                       EXIT
                    ENDDO
                    PNO=SPAGE
                    Vbmrpa=space(7)
	             do while PNO<=EPAGE
                   SELE B
     	           mno=ltrim(str(pno))
                   Vbmrpa='BMRPA'+MNO
                  IF LEN(ALLTRIM(&VBMRPA))>0
                      PPAGE=&VBMRPA
                      DO &PPAGE
                      PNO=PNO+1
                     IF PNO>EPAGE
                        EXIT
                     ENDIF
                 ELSE
                     PNO=PNO+1
                     IF PNO>EPAGE
                        EXIT
                     ENDIF
                 ENDIF
               ENDDO  
                EJECT
                SET PRINTER TO
                SET PRINT OFF
                SET DEVI TO SCREEN
                YN = SPACE(1)
                @0,0 CLEA TO 24,78
                 SET COLOR TO W+/R
                 @22,1 SAY 'ENTER [C] TO CONTINUE FOR SINGLE PAGE BMR' GET YN PICT '!'
                 SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
                 READ
                 @22,1 SAY SPACE(70)
                 IF YN='C'
                     CLEA
                     LOOP
                ENDIF	   
                EXIT
            ENDDO
         ENDIF
            CCHK=' '
            CLEA
            SELE B
            USE PRODMAST ORDER PN12
            SEEK SNAME+SNAME1
            @15,1 SAY 'CONFIRM [Y] FOR CHKLIST:=' GET CCHK PICT '!'
            READ
             IF CCHK='Y' 
                DO WHILE .T.
                  DO PRINTOPT
                  IF OPT=0 
                    CLOSE ALL
                    SET COLOR TO W+/B,W+/R
                    RETU
                  ENDIF   
                 IF OPT=1 
                   LOOP
                 ENDIF  
               EXIT
             ENDDO  
           VVV=SPACE(8)
           VVV=LTRIM(B->BMRCHK)
           IF LEN(VVV)#0
                 DO &VVV
                 EJECT
                 SET PRINT OFF
                 SET PRINTER TO
                 SET DEVI TO SCREEN
          ENDIF
      ENDIF	     
      SELE C
      USE BATCH_NO ORDER BNO
      SEEK VBNO
      GOOUT = " " 
      DO WHILE .T.
         IF RLOCK()
            REPL COMPANY    WITH VNAME
            REPL ADITICODE  WITH  VADCD
            REPL USERNM WITH USERNAME
            UNLOCK 
            EXIT
         ELSE
            STOR " " TO GOOUT
            DO ER_RLOC 
         ENDIF
      ENDDO
ENDIF
RETU