CLEAR
DEFINE WINDOW output FROM 2,1 TO 13,75 TITLE 'Output' ;
	CLOSE FLOAT GROW SHADOW ZOOM

ACTIVATE WINDOW output
WAIT WINDOW 'press any key to hide window output'
HIDE WINDOW output
WAIT WINDOW 'press any key to show window output'
SHOW WINDOW output
WAIT WINDOW 'press any key to release window output'
RELEASE WINDOW  output