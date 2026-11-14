****PRG TO ENTER MFGDATE ,EXPDATE
           PUBLIC MEXPYR,MMFGYR,MEXPMN,MMFGMN,MMBSIZE,MMFGDATE,MEXPDATE,MBSIZE
           store 0 to mexpyr,mmfgyr
           store space(3) to mexpmn,mmfgmn
           STORE SPACE(10) TO MMBSIZE
   do while .t.
        @ 14,31 get mmfgmn pict "!!!"
        @ 23,20 say "Enter 1st 3 charectors of the month"
  	    read
	    mmfgmn = ltrim(mmfgmn)
	    if mmfgmn = "JAN" .or. mmfgmn = "FEB" .or. mmfgmn = "MAR" 
     	    exit
	    endif
	    if  mmfgmn = "APR" .or. mmfgmn = "MAY" .or. mmfgmn = "JUN"
	       exit
        endif
	    if  mmfgmn = "JUL" .or. mmfgmn = "AUG" .or. mmfgmn = "SEP"
	        exit
	    endif
	    if   mmfgmn = "OCT" .or. mmfgmn = "NOV" .or. mmfgmn = "DEC"
           exit
        endif
	enddo
   do while .t.
         @ 14,34 get mmfgyr pict "9999"
         read
         @ 23,10 say space(60)
         do case 
            case mmfgmn = "JAN"
                 mon = 1
            case mmfgmn = "FEB"
                 mon = 2
      	    case mmfgmn = "MAR"
	             mon = 3
     	    case mmfgmn = "APR"
   	             mon = 4
      	    case mmfgmn = "MAY"
	             mon = 5
      	    case mmfgmn = "JUN"
      	         mon = 6
      	    case mmfgmn = "JUL"
	              mon = 7
       	    case mmfgmn = "AUG"
	             mon = 8
            case mmfgmn = "SEP"
	                 mon = 9
       	    case mmfgmn = "OCT"
        	         mon = 10
           case mmfgmn = "NOV"
         	         mon = 11
           case mmfgmn = "DEC"
	                mon = 12
         endcase
         myear = year(date())
         yn=' '
        if mmfgyr < (myear)
                @ 23,10 say "manu. year is less than current year.. confirm.[Y]." get yn pict '!'
				 read
                if yn#'Y'
   	             loop
               ENDIF
      	 endif	 
         exit
      enddo      
         yn=' '
      do while .t.
         do while .t.
            @ 16,31 get mexpmn pict "!!!"
            @ 23,20 say "Enter 1st 3 charectors of the month"
  	        read
	        mexpmn = ltrim(mexpmn)
    	    if mexpmn = "JAN" .or. mexpmn = "FEB" .or. mexpmn = "MAR" 
	            exit
     	    endif
	        if mexpmn = "APR" .or. mexpmn = "MAY" .or. mexpmn = "JUN" 
     	      exit
	         endif
     	    if mexpmn = "JUL" .or. mexpmn = "AUG" .or. mexpmn = "SEP"
              exit
       	    endif
	        if  mexpmn = "OCT" .or. mexpmn = "NOV" .or. mexpmn = "DEC"
              exit
     	   endif
	   enddo
         @ 16,34 get mexpyr pict "9999"
         read
         @ 23,10 say space(60)
         do case 
            case mexpmn = "JAN"
                 mon = 1
            case mexpmn = "FEB"
                 mon = 2
  	        case mexpmn = "MAR"
                mon = 3
     	    case mexpmn = "APR"
 	            mon = 4
 	        case mexpmn = "MAY"
	             mon = 5
    	    case mexpmn = "JUN"
	            mon = 6
       	    case mexpmn = "JUL"
	           mon = 7
	       case mexpmn = "AUG"
	           mon = 8
      	    case mexpmn = "SEP"
	            mon = 9
    	    case mexpmn = "OCT"
	             mon = 10
            case mexpmn = "NOV"
	            mon = 11
    	    case mexpmn = "DEC"
	            mon = 12
        endcase
         myear = year(date())
        if mexpyr <=(myear)
            mmonth = month(date())
            mmonths = ltrim(str(mmonth))
            if mon  <= val(mmonths)
               @ 23,10 say "Invalid date.. Press any key to continue.."
               @ 23,52 get any pict "!"
    	       read
	           @ 23,10 say space(60)
	           loop
            endif
           endif
      exit
   enddo      
****************
      do while .t.
         @ 18,18 say "Batch Size :"
         @ 18,31 get Mmbsize pict repl("!",10)
         read
         if mmbsize = space(10)
	        loop         
          endif 
            EXIT
      ENDDO
                  MMFGDATE=LTRIM(MMFGMN)+'-'+LTRIM(STR(MMFGYR))
                  MEXPDATE=LTRIM(MEXPMN)+'-'+LTRIM(STR(MEXPYR))
                  MBSIZE=MMBSIZE