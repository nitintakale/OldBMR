


SET TALK OFF
DEFINE WINDOW popupex FROM 5,10 TO 15,55 ;
	FLOAT DOUBLE COLOR SCHEME 5
CLOSE DATABASES
USE customer
DIMENSION dbftags(256)
dbftags(1) = 'Record #'
FOR i = 2 to 256
	IF empty(tag(i-1))
		i = i - 1
		DIMENSION dbftags(i)
		EXIT
	ELSE
		dbftags(i) = tag(i-1)
	ENDIF
ENDFOR
dbforder = 'Record #'

ACTIVATE WINDOW popupex
@ 3,7  GET dbforder PICTURE '@^' FROM dbftags SIZE 3, 14
@ 0,2  TO 7,43
@ 0,5  SAY ' Customer Browse Order: '
@ 2,27 GET okcancel PICTURE '@*VT \!OK;\?Cancel' ;
	SIZE 1, 10, 2 DEFAULT 0
READ CYCLE
RELEASE WINDOW popupex

IF okcancel = 1
	IF dbforder = "Record #"
		SET ORDER TO
	ELSE
		SET ORDER TO (dbforder)
	ENDIF
	WAIT WINDOW 'Order set to '+dbforder NOWAIT
	BROWSE WIDTH 10 NOWAIT
ELSE
	WAIT WINDOW 'Order not set' NOWAIT
ENDIF

