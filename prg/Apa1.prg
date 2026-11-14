***BPR PAGE1 FOR AMPOULES
SET PROC TO ADIHEAD
        
    SELE C
    USE ITEM_MST ORDER ITEMCD
 IF CLUBBPR="Y"
	SELE A
	USE CPKG_MST ORDER UNICPK
	GO TOP
ELSE	
	SELE A
	USE CPKG_MST ORDER SRCPKG
	GO TOP
ENDIF
    @0,0 say chr(27)+'E'
    @0,60 SAY 'PAGE : 1 OF 6'
  	ln=ln+1
    do pheadp1
    LN=LN+1
    SELE A
    DO WHILE .NOT. EOF()
       SELE C
       SEEK A->ITEM 
       @ln,7 say '³'
       @ln,33 say '³'
       @ln,41 say '³'
       @ln,50 say '³'
       @ln,57 say '³'
       @ln,64 say '³'
       @ln,72 say '³'
       @ln,1 say A->CODE
       @ln,8 say CHR(15)+substr(C->NAME,1,35)+' ['+ALLTRIM(C->UNIT)+']'+CHR(18)
       IF A->PMQTY>0
         @ln,34 say a->PMQTY pict '999999'
       ENDIF
       ln=ln+1
       @ln,1 say ee1
       @ln,7 say '³'
       @ln,33 say '³'
       @ln,41 say '³'
       @ln,50 say '³'
       @ln,57 say '³'
       @ln,64 say '³'
       @ln,72 say '³'
       ln=ln+1
       SELE A
       SKIP
     ENDDO       
       LN=LN+2
       @LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED & CHECKED BY____________'
       LN=LN+1
       @LN,1 SAY '     DATE          :_______________             DATE:    ___________'
       LN=LN+1
       @LN,1 SAY EE1
       LN=LN+1
     
        @0,60 SAY 'PAGE : 1(A) OF 6'
        DO PROC_1
        LN=7
        LN=LN+1
        DO BPR_I
        EJECT


    



