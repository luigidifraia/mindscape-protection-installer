100 rem mindscape protection installer v1.0.1 by luigi di fraia
110 rem based on inside commodore dos - pages 129-133
120 gosub 700:ll=lines-1:dim d$(ll)
130 print "{clr}mindscape protection installer v1.0"
140 print "{down}writes illegal gcr data to t/s 1/0"
150 print "that causes weak bits at read time"
160 print "{down}insert a zaxxon clone in drive"
170 t=1:s=0
180 input "{down}are you sure  y{left}{left}{left}";q$
190 if q$<>"y" then end
200 open 15,8,15
210 print#15,"i0"
220 input#15,en$,em$,et$,es$
230 if en$="00" goto 280
240 print "{down}",en$", "em$","et$","es$
250 close 15
260 end
270 rem seek
280 job=176
290 gosub 550
300 rem read
310 job=128
320 gosub 550
330 for j=0 to ll
340 for i=0 to 7
350 read d
360 d$(j)=d$(j)+chr$(d)
370 next i
380 next j
390 i=0
400 for j=0 to ll
410 print#15,"m-w"chr$(i)chr$(5)chr$(8)d$(j)
420 i=i+8
430 next j
440 rem execute
450 print#15,"m-w"chr$(2)chr$(0)chr$(1)chr$(224)
460 print#15,"m-r"chr$(2)chr$(0)
470 get#15,e$
480 if e$="" then e$=chr$(0)
490 e=asc(e$)
500 if e>127 goto 460
510 close 15
520 print "{down}done!"
530 end
540 rem job queue
550 try=0
560 print#15,"m-w"chr$(8)chr$(0)chr$(4)chr$(t)chr$(s)chr$(t)chr$(s)
570 print#15,"m-w"chr$(1)chr$(0)chr$(1)chr$(job)
580 try=try+1
590 print#15,"m-r"chr$(1)chr$(0)
600 get#15,e$
610 if e$="" then e$=chr$(0)
620 e=asc(e$)
630 if try=500 goto 660
640 if e>127 goto 580
650 return
660 close 15
670 print "{down}{rvon}failed{rvof}"
680 end
690 rem mindscape protection installer
