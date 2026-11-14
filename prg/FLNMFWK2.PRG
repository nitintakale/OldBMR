LN=10
@LN,10 SAY 'CALCULATION :'
LN=LN+2
@LN,2 SAY '* Fluorometholone USP   =       X 100'
@LN,30 SAY RM1 PICT '999'
LN=LN+1
@LN,1 SAY '                       --------------      =        gms.'
LN=LN+1
@LN,1 SAY '                      Assay value in %'
LN=LN+3
TEXT

**  Neomycin SulphateIP
 
 As per IP Each mg of Neomycin Sulphate has potency NLT 600 units of
 Neomycin
 
 Assay on as such basis     Assay in units/mg on dried basis X(100-LOD)
 in units/mg             =  -----------------------------------------
                                          100
 

 Batch quantity tobe dispensed = Std.batch qty.X 600 units/mg   
                                 ----------------------------
                                 Assay on as such basis in units/mg

ENDTEXT
LN=35
ln=ln+1
@LN,0 SAY CHR(27)+'E'
@ln,1 say ee
LN=LN+1
@ln,1 say 'STAGE 1.2 : PACKAGING WORKS ORDER - DISPENSING OF PACKAGING MATERIALS'
LN=LN+1
@ln,1 say ee
*ln=ln+1
@LN,0 SAY CHR(27)+'F'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@LN,34 SAY 'STD.'
@LN,44 SAY 'AR'
@LN,51 SAY 'ISSUED'
@LN,58 SAY 'EXTRA'
@LN,65 SAY 'EXCESS'
@LN,73 SAY 'NET'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@LN,2 SAY 'CODE'
@LN,8 SAY 'PACKGING MATERIALS'
@LN,34 SAY 'QTY.IN'
@LN,42 SAY 'NUMBER'
@LN,51 SAY 'QTY.'
@LN,58 SAY 'ISSUES'
@LN,65 SAY 'RETURNS'
@LN,73 SAY 'ISSUED'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@LN,2 SAY 'NO'
@LN,34 SAY 'KGS'
@LN,58 SAY 'QTY.'
@LN,65 SAY 'QTY.'
@LN,73 SAY 'QTY.'
LN=LN+1
@LN,1 SAY EE1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@ln,1 say '4358A'
@ln,8 say 'LDPE GRANULES'
@ln,34 say pm1 pict '99999'
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@ln,8 say '(INDOTHENE 22FA002)'
ln=ln+1
@ln,1 say ee1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
LN=LN+1
@LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED BY____________'
LN=LN+1
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
