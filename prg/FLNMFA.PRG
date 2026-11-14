DO BMR
if vbno=space(6)
   retu
endif	
DO flnalpa
DO PRINTOPT
DO flnfpa1
DO flnfpa2
DO flnfpa3
DO flnfpa4
DO flnfpa5
DO flnfpa6
DO flnfpa7
DO flnfpa8
DO flnfpa9
DO flnfpa10
DO flnfpa11
DO flnfpa12
DO flnfpa13
DO flnfpa14
DO flnfpa15
DO flnfpa16
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