* BPR 
@0,60 SAY 'PAGE : 2 OF 6'
DO PROC_1
LN=7
LN=LN+1
TEXT
 SECTION: II          OVER-PRINTING OF PACKAGING MATERIALS 
                               A. LINE CLEARANCE        
LABELS FOR AMPOULES      LABELS FOR RANDO BOX      LABELS FOR OUTER CARTONS

Over-printing M/c No:___ Over-printing M/c No:___  Over-printing Stamp :___
PREVIOUS PRODUCT :______ PREVIOUS PRODUCT :____    PREVIOUS PRODUCT :______
BATCH NO :______________ BATCH NO :________________BATCH NO :_____________
____________________________________________________________________________
|Certified & Ckd.by |     ||Certified & ckd.by|   || Certified & Ckd.by|   |
|-------------------|---- ||------------------|---||-------------------|---|
|Date:__________Time :____||Date:______Time :____ ||Date:_______Time:______|
|_________________________||______________________||_______________________|
============================================================================
                  B. OVER-PRINTING MACHINE SET UP & OPERATION
AMPOULES LABELS               RANDO BOX LABEL          OUTER CARTON LABEL
_____________________________________________________________________________  
|                  |UNITED||                  |    ||                  |     |
|                  |ENG.  ||                  |    ||                  |     |
|                  |M/C.  ||                  |    ||                  |     |
|__________________|______||__________________|____||__________________|_____|
|Stereo setting    |      ||Stereo setting    |    ||                  |     |
|Certified & Ckd.by|      ||Certified & ckd.by|    ||Certified & Ckd.by|     |
|------------------|----- ||------------------|----||-----------------|------|
|Date:____Time :__________||Date:_____Time :_______||Date:_______ Time :_____|
|_________________________||_______________________||_____________________ __|
| Operator :------>|      || Operator :-----> |    || Operator :------->|    |
|__________________|______||__________________|____||___________________|____|
| Started at :---->|      || Started at :---->|    || Started at :->    |    |
|__________________|______||__________________|____||___________________|____|
| Completed at :-->|      || Completed at :-->|    || Completed at:->   |    |
|__________________|______||__________________|____||___________________|____|

         C. OVER-PRINTING INSTRUCTIONS FOR LABELS/RANDO BOX LABELS/SHIPPERS

  NOTE :  Check specimen detail against o/p matter details. [ _/  ] Tick  
          mark after  checking   for correctness of overprinting matter.
          [ N.A ]  Over-printing  matter  not applicable 
ENDTEXT
LN=43
@LN,0 SAY '____________________________________________________________________________'
LN=LN+1
@LN,0 SAY '|   DETAILS           |OVERPRINTING MATTER|AMPOULES|RANDO  |OUTER  |SHIPPER|'
LN=LN+1
@LN,0 SAY '|                     |    INITIATION     |LABEL   |BOX    |CARTON |KLASS  |'
LN=LN+1
@LN,0 SAY '|                     |                   |        |LABEL  |LABEL  |MARK   |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
LN=LN+1
@ln,0 say '|Mfg.lic.no           |                   |        |       |       |       |'
IF SA_EX='E'
@LN,24 SAY vEmfg
ENDIF
IF SA_EX='S'
@LN,24 SAY vmfg
ENDIF
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Product  name        |                   |        |       |       |       |'
@LN,24 SAY PNAME
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Batch no.            |                   |        |       |       |       |'
@LN,24 SAY VBNO
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Manufacturing dt L/C |                   |        |       |       |       |'
@LN,24 SAY VCMFGDT
@LN,36 SAY VLMFGDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|----------------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Expiry date  L/C     |                   |                |       |       |'
@LN,24 SAY VCEXPDT
@LN,36 SAY VLEXPDT
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Max retail price Rs. |                   |        |       |       |       |'
IF SA_EX="S" 
   @LN,24 SAY VMRP PICT '999.99'
ENDIF
IF  SA_EX="E"  
   @LN,24 SAY '  N.A.'
ENDIF
LN=LN+1

@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
LN=LN+1
@LN,0 SAY '|Physicians sample    |                   |        |       |       |       |'
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
ln=ln+1
@LN,0 SAY '|_____  Logo & address|                   |        |       |       |       |'
@ln,2 say vlogo
LN=LN+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|-------|'
ln=ln+1
@ln,0 say '|Quantity to be Overprinted in numbers.   |        |       |       |        |'
ln=ln+1
@LN,0 SAY '|---------------------|-------------------|--------|-------|-------|--------|'
ln=ln+1
@ln,0 say ' INITIATED BY :_____________________    COUNTER-CHECKED BY:___________________'
@LN,1 SAY CHR(27)+CHR(80)
EJECT





