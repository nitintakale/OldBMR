******starting heading
proc ADIstart
CLEAR
*CLOSE ALL
set date brit
set stat off
set score off
set safety off
set confirm on
set step off
set exact on
set talk off
set echo off
SET CENTURY ON
*----------------
set dele on
set exclusive off
set reprocess to 5
set multilocks on
*------------
retu
*********
* program for printing
proc printopt
@5,0 CLEA
public opt
store 0 to opt
SET PRINT OFF
SET DEVI TO SCREEN
@ 6,25 to 18,55 double
@ 8,33 say "[1] SCREEN"
@ 10,33 say "[2] PRINTER"
@ 12,33 say "[3] TEXTFILE"
@ 14,33 say "[0] EXIT"
@ 16,30 say "Enter your option"
*@ 16,48 get opt pict "9"  VALID OPT=2 .OR. OPT=3 .OR. OPT=0 .OR. OPT=1
@ 16,48 get opt pict "9"  RANGE 0,3
read
do case
   case opt = 0
        CLOSE DATABASES
        retu
   case opt = 1
        set devi to screen
   case opt = 2
	@ 11,23 say "Printing in Progress.. Please Wait !!"   
    set devi to print
	set print on
    case opt = 3
    	@ 20,20 say "ENTER NAME OF TEXT FILE(8 CHAR) :=" GET VTXTN PICT '!!!!!!!!' VALID VTXTN # SPACE(8)
      	READ  
        V1TXTN=ALLTRIM(VTXTN)+'.TXT'
        SET COLOR TO G+/NB
    	@ 22,2 say "DATAS are added to text file '+&V1TXTN+'  ..do not disturb !!"   
        SET COLOR TO W+/B,W+/R,,W+/G,RB+/GR
	    set print on
     	set devi to print
        set printer to &V1TXTN
endcase
retu
*************PROGRM FOR DATE ENTRY
PROC DATE
public mfrdate,mtodate
mfrdate = ctod("  /  /    ")
mtodate = ctod("  /  /    ")
any=' '
   do while .t.
      @ 10,2 say "Enter Date:"
      @ 10,15 say "From:"
      @ 10,30 say "To:"
      @ 10,20 get mfrdate pict "D"
      read
      if mfrdate = ctod("  /  /    ")
         @ 23,12 say "From date should not blanks.. Press any key to continue"
	 @ 23,65 get any
	 read
	 @ 23,10 say space(60)
	 loop
      endif
      if mfrdate > date()
         any = " "
         @ 23,8 say "From date should not > current date.. Press any key to continue"
	 @ 23,72 get any
	 read
	 @ 23,8 say space(65)
	 mfrdate = ctod("  /  /    ")
	 loop      
      endif
      @ 10,33 get mtodate pict "D"
      read
      if mtodate = ctod("  /  /    ")
         mtodate = date()
      endif
      if mtodate < mfrdate
         any = " "
         @ 23,8 say "To date should not  <  From  date.. Press any key to continue"
	 @ 23,72 get any
	 read
	 @ 23,8 say space(65)
	 mtodate = ctod("  /  /    ")
	 loop            
      endif
      exit
   enddo
retu
********************
PROCEDURE ER_RLOC
@ 23,1 SAY SPACE(77)
SET COLOR TO W+
@ 23,1 SAY "SAME FILE/RECORD IS IN USE BY OTHER USER ....PRESS ANY KEY"
SET COLOR TO
UX = INKEY(0)
@ 23,1 SAY SPACE(77)
SET COLOR TO W+
STOR " " TO GOOUT 
@ 23,14 SAY "WAIT FOR SOME TIME AND PRESS ENTER TO TRY AGAIN : " GET GOOUT PICT "!"
SET COLOR TO
READ
@ 23,1 SAY SPACE(77)
IF GOOUT = " "
   RETURN
ELSE
   RETURN
ENDIF
RETURN
********************
PROC MIDCLM
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
***********
PROC ERR1
RETURN
