***QUINARSOL WORKS SHEET1
SET PROC TO ADIHEAD
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
@ln,0 say '3163A'
@ln,7 say '*Quinine dihydrochl-'
@ln,30 say 'kgs'
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
*ln,0 say '*'
@ln,7 say '- oride IP'
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
@ln,0 say '0596B'
@ln,7 say 'Disodium Edetate IP'
@ln,30 say 'Gms'
@ln,35 say rm2 pict '9999.99'
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
LN=LN+1
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
@ln,0 say '1177A'
@ln,7 say '***Sodium Citrate IP'
@ln,30 say 'Gms'
@ln,35 say rm3 pict '9999.99'
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
@ln,7 say '** Water for inj.IP'
@ln,30 say 'L'
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
ln=ln+2
@ln,1 say 'Note: *   Quantity of Quinine dihydrochloride includes 2 % overages.'
ln=ln+1
@ln,1 say  '    : *   Quantity of Quinine dihydrochloride is to be dispended based on 100 %'
ln=ln+1
@ln,1 say '          assay value.'
ln=ln+1
@ln,1 say '      **  Freshly collected water for injection is to be used.'
ln=ln+1
@ln,1 say 'Note: *** Sodium citrate IP is used as 10 % soln. for pH adjustment'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say 'Calculations:             Assay on dried basis  X  (100-LOD)'
LN=LN+1
@LN,1 SAY  'Assay on as such basis = -------------------------------------------'
ln=ln+1
@ln,1 say '                                       100'
ln=ln+1
@ln,1 say'Qty. of Quinine Dihydrochloride  =            X 100'
@ln,38 say ltrim(str(rm1,5,2))
ln=ln+1
@LN,1 SAY  '                               -------------------------------------------'
ln=ln+1
@LN,1 SAY  '                                     Assay on as such basis '
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say 'MATERIAL ISSUED BY :________Dt._______. RECEIVED  BY :_________ Dt______'
ln=ln+2
do packwork
*LN=LN+1
@ln,7 say '|'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
@ln,1 say '5723B'
@ln,8 say '1ML Amber Glass snamp-'
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
@ln,8 say 'oules USP TYPE -I Yellow snap'
LN=LN+1
@ln,1 say ee
ln=ln+2
do bot0_lin
LN=LN+1
