********TO DECIDE DIRECTORY ACCORDING TO BATCH NO
	Vbno=ltrim(vbno)
	sbno=substr(Vbno,3,1)
   MBNO=VAL(SBNO)
   IF MBNO>=0 .AND. MBNO<=6
*      @21,1 SAY 'FOR YEAR 2000 YOU HAVE TO MAKE CHANGES IN PROC_3.PRG'
*      @22,1 SAY 'IN PLACE OF 9 YOU HAVE TO WRITE 0 AND CREATE DIRECTORY 01/02/03 ETC'
*		WAIT
    	vdir='0'+sbno
   ENDIF
   IF MBNO>=7 .AND. MBNO<=9
      	vdir='9'+sbno
   ENDIF
  	