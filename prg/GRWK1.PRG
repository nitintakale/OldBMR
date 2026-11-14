***GRANICIP INJ. WORKS1
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
@ln,0 say '7977A'
@ln,7 say 'Granisetron-'
@ln,30 say 'gms'
@ln,35 say rm1 pict '9999.99'
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
@ln,0 say '*'
@ln,7 say 'Hydrochloride'
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
@ln,0 say '1171A'
@ln,7 say 'Sodium chloride IP'
@ln,30 say 'gms'
@ln,35 say rm2 pict '9999.99'
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
@ln,0 say '1185A'
@ln,7 say 'Sodium Hydroxide AR IP'
@ln,30 say 'gms'
@ln,35 say rm3 pict '9999.99'
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
@ln,7 say 'water for inj.IP'
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
ln=ln+3
@ln,1 say 'Note: *   Quantity of Granisetron hydrochloride to be dispensed based on 100%'
ln=ln+2
@ln,1 say '          assay value.'
ln=ln+2
@ln,1 say '      **  Freshly collected water for injection is to be used.'
ln=ln+2
@ln,1 say '        0.1N NaOH is added to adjust pH to 5.50 ñ 0.5.'
ln=ln+1
@ln,1 say  '       Add 2.0 gm. in 500 ml of H2O.'
ln=ln+2
@ln,1 say ee1
ln=ln+2
@ln,1 say 'Calculations:                ' + LTRIM(STR(RM1,6,2)) +' X  100'
ln=ln+1
@ln,1 say 'Granisetron Hydrochloride =     ------------------------------------------- =           gms.'
ln=ln+1
@ln,1 say '                                     Assay value in %'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say 'MATERIAL ISSUED BY :________Dt._______. RECEIVED  BY :_________ Dt______'
ln=ln+2
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
@ln,1 say '0081E'
@ln,8 say '1 ML Flint Glass ampoules'
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
@ln,8 say 'USP TYPE -I green snap'
LN=LN+1
@ln,1 say ee
ln=ln+2
@LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED & CHECKED BY____________'
LN=LN+2
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
