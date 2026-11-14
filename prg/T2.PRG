*SET TALK ON
*SET ECHO ON
*SET STEP ON
SET CENTURY ON



*@ 5,0 SAY longdate({08/19/89})
*@ 6,5 SAY quarter(DATE())

*FUNCTION longdate
*PARAMETER mdate
*RETURN CDOW(mdate) + ', ' + MDY(mdate)

*FUNCTION quarter
*PARAMETER qdate
*DO CASE
	*CASE MONTH (qdate) > 9
*		RETURN 'Fourth Quarter'
*	CASE MONTH (qdate) > 6
*		RETURN 'Third Quarter'
*	CASE MONTH (qdate) > 3
*		RETURN 'Second Quarter'
*	OTHERWISE
*		RETURN 'First Quarter'
*ENDCASE


SET TALK OFF
DEFINE WINDOW example FROM 4,3 TO 21,76 TITLE ' List Example ' ;
	FLOAT SHADOW SYSTEM COLOR SCHEME 8

*** Fill the array ITEMarray with ITEM data ***

SELECT DISTINCT ITEM FROM PKG_MST INTO ARRAY ITEMarray
SELECT PKG_MST

*** Define a popup that contains the structure of PKG_MST ***

DEFINE POPUP popstru PROMPT STRUCTURE SCROLL MARGIN MARK CHR(16)

*** Define a popup containing data from the ITEM field ***

DEFINE POPUP popfield PROMPT FIELD ITEM SCROLL MARGIN MARK CHR(16)
ACTIVATE WINDOW example
@ 1,3 SAY 'Structure Popup:'

*** Get information using predefined popstru popup ***

@ 2,2 GET liststructure POPUP popstru SIZE 11, 20;
  DEFAULT FIELD(1,'PKG_MST') WHEN refresh();
  VALID dispitem(liststructure) COLOR SCHEME 9
@ 13,3 SAY liststructure SIZE 1, 18
@ 1,26 SAY 'Field Popup:'

*** Get information using predefined popfield popup ***

@ 2,25 GET listfield POPUP popfield SIZE 11, 20 ;
	DEFAULT ITEM  WHEN refresh() VALID dispitem(listfield);
 	COLOR SCHEME 9
@ 13,26 SAY listfield SIZE 1, 18
@ 1,50 SAY 'Array of ITEM Names:'

*** Get information using predefined array ***

@ 2,49 GET arrayitem FROM ITEMarray SIZE 11, 20 ;
 DEFAULT ITEMarray(1) WHEN refresh() VALID dispitem(arrayitem);
 COLOR SCHEME 9
@ 13,50 SAY Arrayitem SIZE 1,18
@ 14,63 GET ok FUNCTION '*t \!OK' DEFAULT 1 SIZE 1, 6
READ CYCLE SHOW popshow()  && Activate gets
RELEASE WINDOW example
RELEASE POPUPS popstru, popfield

FUNCTION refresh

*** Refresh window information without calling subroutine ***

SHOW GETS OFF
FUNCTION dispitem

*** Display which item has been chosen ***

PARAMETER item
WAIT WINDOW 'You have chosen: ' + ALLTRIM(item) NOWAIT

FUNCTION popshow

*** Display current items for each list ***

@ 13,3 SAY liststructure SIZE 1, 18
@ 13,26 SAY listfield SIZE 1, 18
@ 13,50 SAY arrayitem SIZE 1, 18


