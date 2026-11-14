********ciplox calculation
RM=BSIZE*1000/VOLVIAL
RM=RM-50
RM=ROUND(RM,-2)
rm1=3.490*bsize*1000/1000
rm2=9.000*bsize*1000/1000
rm3=0.500*bsize*1000/1000
rm4=0.0002*bsize*1000
RM1=ROUND(RM1,2)
RM2=ROUND(RM2,2)
RM3=ROUND(RM3,2)
RM4=ROUND(RM4,2)
*if mopt=1 .AND. AT='T' && for NORFLOX terminal
IF AT#'F'
   pm1=RM
   pm2=((RM*2)/100)+50
   PM2=ROUND(PM2,-2)
   PM2=PM2+RM
   pm3=PM2
endif
IF AT='F'
   pm1=BSIZE*2
ENDIF

