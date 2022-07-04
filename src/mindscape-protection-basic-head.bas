  100 rem mindscape protection installer v1.0 by luigi di fraia
  110 gosub700:l=lines-1:dimd$(l)
  120 print"{clr}mindscape protection installer v1.0"
  130 print"{down}writes illegal gcr data to t/s 1/0"
  140 print"that causes weak bits at read time"
  150 print"{down}insert a zaxxon clone in drive"
  160 t=1:s=0
  170 ns=20+2*(t>17)+(t>24)+(t>30)
  180 input"{down}are you sure  y{left}{left}{left}";q$
  190 ifq$<>"y"thenend
  200 open15,8,15
  210 print#15,"i0"
  220 input#15,en$,em$,et$,es$
  230 ifen$="00"goto280
  240 print"{down}",en$", "em$","et$","es$
  250 close15
  260 end
  270 rem seek
  280 job=176
  290 gosub550
  300 rem read
  310 job=128
  320 gosub550
  330 forj=0tol
  340 fori=0to7
  350 readd
  360 d$(j)=d$(j)+chr$(d)
  370 nexti
  380 nextj
  390 i=0
  400 forj=0tol
  410 print#15,"m-w"chr$(i)chr$(5)chr$(8)d$(j)
  420 i=i+8
  430 nextj
  440 rem execute
  450 print#15,"m-w"chr$(2)chr$(0)chr$(1)chr$(224)
  460 print#15,"m-r"chr$(2)chr$(0)
  470 get#15,e$
  480 ife$=""thene$=e$+chr$(0)
  490 e=asc(e$)
  500 ife>127goto460
  510 close15
  520 print"{down}done!"
  530 end
  540 rem job queue
  550 try=0
  560 print#15,"m-w"chr$(8)chr$(0)chr$(4)chr$(t)chr$(s)chr$(t)chr$(s)
  570 print#15,"m-w"chr$(1)chr$(0)chr$(1)chr$(job)
  580 try=try+1
  590 print#15,"m-r"chr$(1)chr$(0)
  600 get#15,e$
  610 ife$=""thene$=chr$(0)
  620 e=asc(e$)
  630 iftry=500goto660
  640 ife>127goto580
  650 return
  660 close15
  670 print"{down}{rvon}failed{rvof}"
  680 end
  690 rem mindscape protection installer
