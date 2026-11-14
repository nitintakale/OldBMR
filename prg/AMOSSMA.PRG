DO BMR
if vbno=space(6)
   retu
endif	
DO AMOALPA
do while .t.
   DO PRINTOPT
   if opt=0 
     close data
     retu
    endif 
    if opt=1
      loop
   endif
   exit
   enddo   
DO AMOSPA1
DO AMOSPA2
DO AMOSPA3
DO AMOSPA4
DO AMOSPA5
DO AMOSPA6
DO AMOSPA7
DO AMOSPA8
DO AMOSPA9
DO AMOSPA10
DO AMOSPA11
DO AMOSPA12
eject
SET PRINT OFF
SET DEVI TO SCREEN
SET PRINTER TO
   DO PROC_3
   !cd\dbase\bmr\&vdir
       USE BATCH_NO
       APPE BLANK
       REPL MFGDATE WITH VMFGDATE
       REPL EXPDATE WITH VEXPDATE
       REPL BATCHNO WITH VBNO
       REPL ROTSP WITH ROT_SP 
       REPL BAT_SIZE WITH BSIZE
       REPL BAT_QTY WITH RM
       REPL NAME1 WITH SNAME
       REPL NAME2 WITH SNAME1
       REPL CONVRATE WITH VCONVRATE
       REPL CODE WITH  VCODE       
*    ENDIF
    CLOSE DATABASES       
	 !cd..