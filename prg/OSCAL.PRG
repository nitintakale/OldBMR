********optipres-s calculation
RM=BSIZE*1000/VOLVIAL
RM=RM-50
RM=ROUND(RM,-2)
rm1=2.94*bsize
rm2=2.5*bsize
rm3=2.2*bsize
rm4=50*bsize/1000
rm5=0.266*bsize
rm6=0.50*bsize
rm7=0.20*bsize
RM1=ROUND(RM1,2)
RM2=ROUND(RM2,2)
*RM3=ROUND(RM3,-1)
*RM4=ROUND(RM4,2)
RM5=ROUND(RM5,-1)
RM6=ROUND(RM6,2)
RM7=ROUND(RM7,2)
*******
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



******

*pm1=RM
*pm2=((RM*2)/100)+50
*PM2=ROUND(PM2,-2)
*PM2=PM2+RM
*pm3=PM2
