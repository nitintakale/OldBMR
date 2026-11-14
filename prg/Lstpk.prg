** ----------- bpr st pk lyophilised
  SELE A
  SELE CPKG_MST
  STORE SPACE(1) TO SWI,SOLRE,NADPT,ICEPK
  SET ORDER TO SRPKG
  SEEK 'STWATERIN'

  IF FOUND()
    SWI="Y"
  ENDIF  
  SELE  CPKG_MST
  SEEK 'SOLVFORRE'
  IF FOUND()
     SOLRE="Y"
  ENDIF
  SELE  CPKG_MST
  SEEK 'N_ADAPTOR'
  IF FOUND()
    NADPT="Y"
  ENDIF
  SELE  CPKG_MST
  SEEK 'ICE PACKS'
  IF FOUND()
     ICEPK="Y"
  ENDIF
IF SWI="Y"
  @ln,1 say  'Inner carton   = 1 Plastic tray with 1 filled vial,'
  Ln=ln+1 
  @ln,1 say  '                 1 ffs vial  containing sterile WFI & 1 enclosure.'
  ln=ln+1
  @LN,1 SAY  ' Outer carton  ='+ LTRIM(STR(VOUTCART))
  LN=LN+1
  @LN,1 SAY  '  Shipper      ='+ VUNITPACK              
ENDIF
IF SOLRE="Y"
	@ln,1 say  'Inner carton   = 1 Plastic tray with 1 filled vial,1 ampoule of solvent'
	Ln=ln+1 
	@ln,1 say   '                 for reconstitution & 1 enclosure'
	ln=ln+1
	@LN,1 SAY  ' Outer carton  = '+ LTRIM(STR(VOUTCART))
	LN=LN+1
	@LN,1 SAY  '  Shipper      = '+ VUNITPACK              
ENDIF
IF NADPT="Y"   && CALTONASE
    @ln,1 say  'Inner carton   = 1 Labelled vial, 1 Nasal adaptor & cap, 1 enclosure.'
	ln=ln+1
  	@LN,1 SAY  ' Outer carton  = ' +voutcart +'  inner cartons in SS polybag with 2 Nos. Ice packs.'
    ln=ln+1
    @LN,1 SAY  '  Shipper      = ' +vunitpack+'  in  Thermocol boxes. '
        
ENDIF
IF  NADPT # 'Y' .AND. ICEPK="Y" && PHOTERECIN
   @ln,1 say  'Inner carton   = 1 LABELLED VIAL + 1 ENCLOSURE'
   ln=ln+1
   @LN,1 SAY  ' Outer carton  = ' +LTRIM(STR(voutcart)) +' INNER CARTONS IN S.S.BAG 3 ICE PACKS'
   ln=ln+1
   @LN,1 SAY  '  Shipper      = ' +vunitpack+' in   Thermocol boxes. '
  ENDIF
RETU