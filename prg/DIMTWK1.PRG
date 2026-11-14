***dinospray  WORKS1
SET PROC TO ADIHEAD
CLOSE  DATABASES
DO HEADP1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
@ln,0 say '4104B'
@ln,7 say '* Diluted Isosorbide'
@ln,30 say 'Kgs.'
@ln,35 say rm1 pict '999.999'
ln=ln+1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
@ln,7 say 'dinitrate IP 40 %'
ln=ln+1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
@ln,1 say ee1
ln=ln+1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
@ln,0 say '1490B'
@ln,7 say 'Ethanol (95%) IP.'
@ln,30 say 'Lts.'
@ln,35 say rm2 pict '999.99'
ln=ln+1
@ln,1 say ee1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@LN,0 SAY '0673A'
@ln,7 say 'Glycerine IP'
@ln,35 say 'q.s...'
@ln,54 say 'to..'
@ln,58 say bsize pict '9999'
@ln,64 say 'litres'
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
@ln,6 say '|'
@ln,29 say '|'
@ln,34 say '|'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say 'Note: * 1]  Includes 5 % overages & to be used on 100% assay basis.'
ln=ln+1
@ln,1 say '        2]  Diluted Isosorbide dintrate IP contains 40% Isosorbide dinitrate.'
ln=ln+1
@ln,1 say '            Dispense         Kgs.of Glycerine IP.'
@LN,22 SAY (0.1255*BSIZE)  PICT '999.999'      
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say chr(27)+'E'
text
   CAUTION :Diluted Isosorbide dintrate is used in the formulation as undiluted
            Isosorbide dintrate,is a powerful explosive & can be exploded with
            percussion or excessive heat. proper precaution must be taken in 
            handling it.
endtext
ln=43
@ln,1 say chr(27)+'F'   
@ln,1 say ee1
ln=ln+1
@ln,1 SAY 'CALCULATION :* DILUTED ISOSORBIDE DINITRATE IP.'
LN=LN+1
@LN,15 SAY RM1 PICT '99.999'
@LN,25 SAY ' X 100 =        Kgs.'
ln=ln+1
@LN,15 SAY '------------------'
LN=LN+1
@ln,15 say 'Assay value in %'
LN=LN+1
@ln,1 say 'MATERIAL ISSUED BY :________Dt._______. RECEIVED  BY :_________ Dt______'
ln=ln+1
@LN,0 SAY CHR(27)+'E'
@ln,1 say ee
LN=LN+1
@ln,1 say 'STAGE I : PACKAGING WORKS ORDER - DISPENSING OF PACKAGING MATERIALS'
LN=LN+1
@ln,1 say ee
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
@LN,34 SAY 'NUMBERS'
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
@ln,0 say '4090I'
@ln,8 say '20 ML Amber colour vials'
@ln,34 say pm1 pict '99999'
ln=ln+1
@ln,8 say '(schott glass)'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
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
ln=ln+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@LN,0 SAY '4117I'
@ln,8 say 'Spray Pump(10902.19004)'
@ln,34 say pm1 pict '99999'
ln=ln+1
@ln,8 say '(pfeiffer)'
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee
ln=ln+2
@LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED & CHECKED BY____________'
LN=LN+1
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
