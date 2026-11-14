	CLEAR
DEFINE WINDOW TEST1 FROM 1, 1 TO 20, 30 FONT 'ROMAN', 16 	
*	DEFINE WINDOW test1 ;
			FROM 1, 1 TO 20, 30 ;
			TITLE "Test1"				&& Parent window.
	ACTIVATE WINDOW test1
	
	DEFINE WINDOW test2 ;
			FROM 1, 1 TO 20, 20 ;
			TITLE "Test2" ;
			IN WINDOW test1				&& Child window.
	ACTIVATE WINDOW test2
	
	ACTIVATE SCREEN
	
	WAIT WINDOW 'Press a key to clear the windows'
	
	RELEASE WINDOW test1, test2
	CLEAR