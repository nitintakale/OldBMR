CLEA
LN=3
COL=0
LN1=16
COL1=30
EE=REPL('³',30)
@LN,1 SAY EE
@LN1,1 SAY EE
LN=3
  DO WHILE LN<=LN1
     @LN,COL SAY '³'
     @LN,COL1 SAY '³'
     LN=LN+1+1
   ENDDO


