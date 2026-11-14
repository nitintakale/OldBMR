***TO ENTER dispensing date
SET PROC TO ADIHEAD
CLEA
VMONTH=SPACE(3)
vyear=0
todate=ctod('  /  /    ')
clea
STORE SPACE(4) TO MMDIR,SEARCHYEAR
STORE SPACE(6) TO VBATCH
close data
@17,1 say 'enter last FOUR digit of SEARCHING YEAR :' get SEARCHYEAR pict '!!!!'
read
 VYEAR=LTRIM(STR(VYEAR))
 SYEAR=SUBSTR(VYEAR,3,2)
 SSEARCHYEAR=LTRIM(SEARCHYEAR)
 SHSYEAR=SUBSTR(SSEARCHYEAR,3,2)
 SET PATH TO &SHSYEAR
 DO DATE
CLEA
PKRW=' '
CLEA
@5,1 SAY '[R] RAW MATERIAL BMR LIST [P] FOR PACKING MATERIAL LIST' GET PKRW PICT '!'
READ
IF PKRW='R'
     USE BATCH_NO
	 INDE ON RWDISPDATE TO TP
	 CLOSE DATA
	 SELE A
	 USE BATCH_NO INDE TP
DO WHILE .T.
	SELE A
	SET FILT TO RWdispdate=CTOD('  /  /    ')  .AND. SUBSTR(ADIARNO,7,2)=SHYEAR 
	GO TOP
	IF EOF()
    	CLEA
	    @25,10 SAY '..............NO PENDING.............'
	    WAIT
	    EXIT
	ENDIF    
    DEFINE WINDOW ETEMP from 15,1 to 22,55
    activate window Etemp 
    define popup s_list from 15,1 to 22,55 prompt fields  (BATCHNO)+LTRIM(NAME1)+''+TRIM(NAME2) footer "Press ENTER key to Select"   && in window Etemp 
    activate window Etemp
    @0,0 get VBATCH  popup s_list
    read valid lastkey() = 13  .or. lastkey()=27
    deactivate window Etemp
    if lastkey()=27
         close data
         retu
      endif   
    VBATCH=a->BATCHNO
    clea
    @8,5 say   'BATCHNO   :'+LTRIM(VBATCH)
    @10,5 SAY  'DISPENSING DATE :' GET VDIDATE PICT '!!!!!!!!!'
    READ
    SELE A
    GO TOP
    SET FILT TO A->BATCHNO=VBATCH
    GO TOP
    REPL A->RWDISPDATE WITH VDIDATE      
    CON=' '
     @4,5 SAY SPACE(78)
     @4,5 SAY '[C] TO CONTI..' GET CON PICT '!'
     READ
     IF CON='C'
         LOOP
      ELSE
           EXIT
      ENDIF
ENDDO
ENDIF
    !DEL TP.*