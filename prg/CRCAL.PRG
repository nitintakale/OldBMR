********norflox calculation
RM=BSIZE*1000/VOLVIAL
RM=RM-50
RM=ROUND(RM,-2)
rm1=20*bsize*1000/(1000*1000)
rm2=0.5*bsize*1000/1000
rm3=1*bsize*1000/1000
rm4=0.0002*bsize*1000
rm5=0.08*bsize*1000/1000
RM1=ROUND(RM1,3)
RM2=ROUND(RM2,2)
RM3=ROUND(RM3,2)
RM4=ROUND(RM4,2)
RM5=ROUND(RM5,2)
IF AT='F'
   pm1=BSIZE*2
else
pm1=RM
pm2=((RM*2)/100)+50
PM2=ROUND(PM2,-2)
PM2=PM2+RM
pm3=PM2
endif
