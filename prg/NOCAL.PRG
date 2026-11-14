********NORFLOX calculation
RM=BSIZE*1000/VOLVIAL
RM=RM-50
RM=ROUND(RM,-2)
rm1=3*bsize*1000/1000
rm2=7.420*bsize*1000/1000
rm3=0.500*bsize*1000/1000
rm4=2.720*bsize*1000/1000
rm5=0.0002*bsize*1000
rm6=1.017*bsize
RM1=ROUND(RM1,2)
RM2=ROUND(RM2,2)
RM3=ROUND(RM3,2)
RM4=ROUND(RM4,2)
RM5=ROUND(RM5,2)
*RM6=ROUND(RM6,2)
*if mopt=4 .AND. AT='T' && for NORFLOX terminal
IF AT#'F'
   pm1=RM
   pm2=((RM*2)/100)+50
   PM2=ROUND(PM2,-2)
   PM2=PM2+RM
   pm3=PM2
ENDIF
IF AT='F'
   pm1=BSIZE*2
ENDIF
*endif
*if mopt=4 .AND. AT='A'&& for NORFLOX aseptic
*   pm1=RM
*   pm2=((RM*2)/100)+50
*   PM2=ROUND(PM2,-2)
*   PM2=PM2+RM
*   pm3=PM2
*   pm2=pm2+500
*	pm2=round(pm2,-3)
*endif
