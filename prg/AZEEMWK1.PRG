***AZEE INJECTION  WORKS1
SET PROC TO ADIHEAD
*CLOSE DATABASES
DO HEADP1
LN=LN+1
@ln,1 say '2008A'
@ln,6 say '|'
@ln,7 say 'Azithromycin USP'
@ln,29 say '|'
@ln,30 say 'Kgs'
@ln,34 say rm1 pict '9999.999'
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
@ln,7 say '(As dihydrate).'
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
@ln,1 say ee1
ln=ln+1
@ln,1 say '7371A'
@ln,6 say '|'
@ln,7 say 'Citric Acid '
@ln,29 say '|'
@ln,30 say 'gms'
@ln,34 say rm2 pict '9999.99'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'

ln=ln+1
@ln,7 say 'monohydrate IP'
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
@ln,1 say ee1
ln=ln+1
@ln,0 say '1185A'
@ln,6 say '|'
@ln,7 say 'Sodium Hydroxide IP'
@ln,29 say '|'
@ln,30 say 'gms'
@ln,34 say 360.00 pict '9999.99'
@ln,42 say '|'
@ln,51 say '|'
@ln,57 say '|'
@ln,63 say '|'
@ln,71 say '|'
@ln,74 say '|'
@ln,80 say '|'
LN=LN+1
@ln,1 say '**'
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
@ln,1 say ee1
ln=ln+1
@ln,1 say '***'
@ln,6 say '|'
@ln,7 say 'Water for injection IP'
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
@ln,1 say 'Note: *   5 % overages included ,Quantity of Azithromycin USP is to be calculated'
ln=ln+1
@ln,1 say '           on the basis of assay on anhydrous basis'
ln=ln+1
@ln,1 say '           500 mg of Azithromycin as anhydrous=524 mg of Azithromycin as dihydrate '
ln=ln+1
@ln,1 say ' 	 **   Sodium Hydroxide AR is added to adjust pH to 6.50 ñ 0.30 as '		  
ln=ln+1
@ln,1 say ' 	     3.0N NaOH solution.'
ln=ln+1
@ln,1 say '     ***   Freshly collected  Water for injection  to be used'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say 'Calculation for   :- '
ln=ln+1
@ln,1 say '* Azithromycin  USP.(as dihydrate)-     ' +LTRIM(STR(RM1,7,2))+'  X  100 /  Assay value in %. =  ________ Kgs.' 
*@ln,40 say rm1 pict '9999.99'
*@ln,47 say 'X'
*@ln,50 say '100'
*@ln,55 say '/'
*@ln,57 say ' Assay value in %. = '
*@ln,98 say '________ Kgs.'
ln=ln+1
@ln,1 say ee1			  		  
ln=ln+1
@ln,1 say 'MATERIAL ISSUED BY :________Dt._______. RECEIVED  BY :_________ Dt______'
ln=ln+1
@LN,0 SAY CHR(27)+'E'
@ln,1 say ee
LN=LN+1
DO PACKWORK
LN=LN+1
@ln,1 say '0060D'
@ln,7 say '|'
@ln,8 say '10 ML flint glass  vials'
@ln,33 say '|'
@ln,34 say pm1 pict '99999'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,7 say '|'
@ln,8 say '(USP type-I) Tubular'
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
@ln,1 say '6913A'
@ln,7 say '|'
@ln,8 say '20 mm Bromobutyl slotted'
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
@ln,8 say '(Grey)FM257/2 rubber plugs'
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
@ln,1 say ee1
ln=ln+1
@ln,1 say '6907A'
@ln,7 say '|'
@ln,8 say '20 mm T/O Alu.Red Opaque'
@ln,33 say '|'
@ln,34 say pm3 pict '99999'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,7 say '|'
@ln,8 say 'flip off seals'
@ln,33 say '|'
@ln,41 say '|'
@ln,50 say '|'
@ln,57 say '|'
@ln,64 say '|'
@ln,72 say '|'
@ln,80 say '|'
ln=ln+1
@ln,1 say ee
ln=ln+1
@LN,1 SAY 'MATERIALS ISSUED BY:___________________.RECEIVED & CHECKED BY____________'
LN=LN+1
@LN,1 SAY '     DATE          :_______________             DATE:    ___________'
LN=LN+1
@LN,1 SAY EE
LN=LN+1
