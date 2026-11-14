CLOSE DATA
SET PROC TO ADIHEAD
DO PRINTOPT
sele a
use prodmast inde prodmast
ln=1
ee=repl('-',220)
@ln,1 say chr(15)
@ln,1 say ee
ln=ln+1
@ln,1 say 'code     name                                            bmrall   bmrsingle   bprall  bprsingle   bmrchk    bprchk   prgbmr prgbpr'
ln=ln+1
@ln,1 say ee
ln=ln+1
sele a
go top
do while .not. eof()
   @ln,1 say code   +  name1        +NAME2                        + bmrall  + bmrsingle  + bprall + bprsingle  + bmrchk   + bprchk  + prgbmr +'       '  + prgbpr
   skip
   ln=ln+1
   if ln>60
      eject
      ln=1
      @ln,1 say chr(15)
      @ln,1 say ee
      ln=ln+1
      @ln,1 say 'code     name                         bmrall   bmrsingle   bprall  bprsingle   bmrchk    bprchk   prgbmr    prgbpr'
      ln=ln+1
      @ln,1 say ee
      ln=ln+1   
    ENDIF
    ENDDO  