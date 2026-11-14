CLOSE DATABASES
USE customer
DIMENSION dbftags(256)
dbftags(1) = 'Record #'
FOR i = 2 TO 256
	IF EMPTY(TAG(i-1))
		i = i - 1
		DIMENSION dbftags(i)
		EXIT
	ELSE
		dbftags(i) = TAG(i-1)
	ENDIF
ENDFOR
DISPLAY MEMORY LIKE dbftags  
