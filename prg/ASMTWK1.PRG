***asthalin respirator  SOLUTION  WORKS1
SET PROC TO ADIHEAD
*CLOSE  DATABASES
DO HEADP1
@ln,0 say '1124J'
@ln,6 say '|'
@ln,7 say 'Salbutamol Sulphate'
@ln,29 say '|'
@ln,30 say 'gms'
@ln,34 say '|'
@ln,35 say rm1 pict '9999.99'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say '*'
@ln,6 say '|'
@ln,7 say 'IP '
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
ln=ln+1
@ln,0 say '0596B'
@ln,6 say '|'
@ln,7 say 'Disodium Edetate IP'
@ln,29 say '|'
@ln,30 say 'gms'
@ln,34 say '|'
@ln,35 say rm2 pict '9999.99'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,0 say '0352C'
@ln,6 say '|'
@ln,7 say 'Benzalkonium Chloride'
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
@ln,1 say '**'
@ln,6 say '|'
@ln,7 say 'solution 50 % W/V'
@ln,29 say '|'
@ln,30 say 'gms'
@ln,34 say '|'
@ln,36 say rm3 pict '999.99'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,6 say '|'
@ln,7 say 'equivalent to Benzalko-'
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
@ln,7 say 'nium Chloride NF '+ltrim(str((rm3/2),6,2))
*@ln,23 say (rm3/2) pict '999.99'
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
@ln,7 say 'gms'
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
ln=ln+1
@ln,0 say '1213B'
@ln,6 say '|'
@ln,7 say 'Sulphuric Acid'
@ln,29 say '|'
@ln,30 say 'ml'
@ln,34 say '|'
@ln,36 say '15'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
@ln,0 say '***'
@ln,6 say '|'
@ln,7 say 'A.R. Grade IP'

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
ln=ln+1
@ln,6 say '|'
@ln,7 say 'Purified water IP'
@ln,29 say '|'
@ln,34 say '|'
@ln,35 say 'q.s...'
@ln,42 say '|'
@ln,51 say '|'
@ln,54 say 'to..'
@ln,57 say '|'
@ln,58 say bsize pict '9999'
@ln,63 say '|'
@ln,64 say 'litres'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
ln=ln+1
*@ln,1 say ee1
@ln,6 say '|'
@ln,7 say '(Prepared by distillation)'
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
ln=ln+1
@ln,1 say 'Note: *   Quantity of Salbutamol sulphate IP include 4 % overage'
ln=ln+2
@ln,1 say '     **  Benzalkonium Chloride 50 % solution is used as Benzalkonium Chloride'
ln=ln+1
@ln,1 say '         is highly hygroscopic '
ln=ln+2
@ln,1 say '     *** Sulphuric acid AR is added to adjust pH between 3.5+/- 0.2 as' 
ln=ln+1
@ln,1 say '         1 N Sulphuric Acid solution'
ln=ln+1
@ln,1 say '        1 N Sulphuric Acid solution prepared by adding 15 ml conc. Sulphuric acid'
ln=ln+1
@ln,1 say '        in  510 ml of freshly collected and cooled purified water'
ln=ln+2
@ln,1 say ee1
ln=ln+2
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
@LN,34 SAY 'STD.'
@ln,41 say '|'
@LN,44 SAY 'AR'
@ln,50 say '|'
@LN,51 SAY 'ISSUED'
@LN,58 SAY 'EXTRA'
@ln,57 say '|'
@ln,64 say '|'
@LN,65 SAY 'EXCESS'
@ln,72 say '|'
@LN,73 SAY 'NET'
@ln,80 say '|'
LN=LN+1
@LN,2 SAY 'CODE'
@ln,7 say '|'
@LN,8 SAY 'PACKGING MATERIALS'
@ln,33 say '|'
@LN,34 SAY 'QTY.IN'
@ln,41 say '|'
@LN,42 SAY 'NUMBER'
@ln,50 say '|'
@LN,51 SAY 'QTY.'
@ln,57 say '|'
@LN,58 SAY 'ISSUES'
@ln,64 say '|'
@LN,65 SAY 'RETURNS'
@ln,72 say '|'
@LN,73 SAY 'ISSUED'
@ln,80 say '|'
LN=LN+1
@LN,2 SAY 'NO'
@ln,7 say '|'
@ln,33 say '|'
@LN,34 SAY 'NUMBERS'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@LN,58 SAY 'QTY.'
@ln,64 say '|'
@LN,65 SAY 'QTY.'
@ln,72 say '|'
@LN,73 SAY 'QTY.'
@ln,80 say '|'
LN=LN+1
@LN,1 SAY EE1
LN=LN+1
@ln,1 say '0105A'
@ln,7 say '|'
@ln,8 say '22 ML Amber glass bottles'
@ln,34 say pm1 pict '99999'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say '0106B'
@ln,7 say '|'
@ln,8 say '22 mm PP caps' 
@ln,33 say '|'
@ln,34 say pm2 pict '99999'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,7 say '|'
@ln,8 say 'with E.P.E Liner'
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
LN=LN+2
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
