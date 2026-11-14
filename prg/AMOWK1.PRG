***AMOSS INJECTION  WORKS1
SET PROC TO ADIHEAD
*CLOSE DATABASES
DO HEADP1
LN=LN+1
@ln,1 say '221UA'
@ln,6 say '|'
@ln,7 say 'Omeprazole Sodium BP'
@ln,29 say '|'
@ln,30 say 'Gms'
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
@ln,7 say 'Ph.Eur.'
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
@ln,1 say '1185A'
@ln,6 say '|'
@ln,7 say 'Sodium Hydroxide BP '
@ln,29 say '|'
@ln,30 say 'Gms'
@ln,34 say '  5.00' 
*@ln,34 say rm2 pict '9999.99'
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
@ln,7 say 'Water for injection BP'
@ln,29 say '|'
@ln,30 say 'Lts'
@ln,34 say '|'
@ln,35 say 'q.s...'
@ln,42 say '|'
@ln,51 say '|'
@ln,54 say 'to..'
@ln,57 say '|'
@ln,58 say bsize pict '9999.99'
@ln,63 say '|'
@ln,66 say 'litres'
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
@ln,1 say 'Note: *   5 % overages included ,Quantity of Omeprazole Sodium BP/Ph.Eur. to'
ln=ln+1
@ln,1 say '  to be calculated on the basis of assay on as such basis'
ln=ln+1
@ln,1 say '  44.632 mg of Omeprazole Sodium BP/Ph.Eur is equivalent to 40 mg of  '
ln=ln+1
@ln,1 say '  Omeprazole BP/Ph.E.ur'
ln=ln+1
@ln,1 say ' 	 **   Sodium Hydroxide BP is added to adjust pH to 12.00 ñ 0.20 as '		  
ln=ln+1
@ln,1 say ' 	     0.5 N NaOH solution.'
ln=ln+1
@ln,1 say '     ***   Freshly collected  Water for injection  to be used'
ln=ln+1
@ln,1 say ee1
ln=ln+1
@ln,1 say 'Calculation for   :- '
ln=ln+1
@ln,1 say '* Omeprazole Sodium BP/Ph.Eur in gms ' +LTRIM(STR(RM1,7,3))+'  X  100 X 100 '
ln=ln+1
@ln,1 say '                               ---------------------------------------------------------'
ln=ln+1
@ln,1 say '                     100-(ACTUAL WATER CONTENT-4.70) X Assay on anhydrous basis' 
ln=ln+1
@ln,1 say 'THEOROTICAL WATER CONTENT = 4.70'
LN=LN+1
@ln,1 say ee1			  		  
ln=ln+1
@ln,1 say 'MATERIAL ISSUED BY :________Dt._______. RECEIVED  BY :_________ Dt______'
ln=ln+1
@LN,0 SAY CHR(27)+'E'
*@ln,1 say ee
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
@ln,1 say '6000C'
@ln,7 say '|'
@ln,8 say '20 mm T/O Alu.Taxim blue'
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