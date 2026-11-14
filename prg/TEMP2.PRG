CLEAR
SET TALK ON
SET ECHO ON
SET STEP ON
DEFINE WINDOW output FROM 2,1 TO 13,75 TITLE 'Output' ;
	CLOSE FLOAT GROW SHADOW ZOOM
ACTIVATE WINDOW output

@ 1,1 SAY 'This is the contents of the window'

SAVE WINDOWS output TO temp
CLEAR WINDOWS

WAIT WINDOW 'The window has been saved - Press a key'

RESTORE WINDOW output FROM temp
ACTIVATE WINDOW output
WAIT WINDOW 'The window has been restored - Press a key'
DEACTIVATE WINDOW output
RELEASE WINDOW output

DELETE FILE temp.win
