*optipres-s FFS
@0,60 SAY 'PAGE : 9 OF 14'
DO PROC_1
DO cidp13
if bsize > 550
  @0,60 SAY 'PAGE : 9A OF 14'
  DO PROC_1
  DO cidp13
  EJECT
  @0,60 SAY 'PAGE : 9B OF 14'
  DO PROC_1
  DO cidp13
endif
EJECT