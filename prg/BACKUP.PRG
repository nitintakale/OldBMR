************ Backup program
CLOSE DATABASES
SET CONFIRM OFF
SET SAFETY OFF
clea
	   @ 10,0 to 13,70  double
	   @ 11,1 say "Insert zip drive for backup and Press any key to continue.." 
	   =inkey(0)
 	   @ 12,20 say "Backup in process. Please wait"
       DELE FILE  f:bmrdbf
       DELE FILE  f:bmrprg
	   !PKZIP f:bmrbfr *.dbf
	   !PKZIP f:bmrprg *.prg
	   !dir f:
       wait
retu
