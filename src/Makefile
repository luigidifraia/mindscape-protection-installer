all: mindscape-protection-installer.d64

clean:
	rm -f *.d64 *.prg *.bin mindscape-protection-basic.bas

mindscape-protection-installer.d64: mindscape-protection-installer.prg mindscape-protection-installer.seq
	makedisk mindscape-protection-installer.d64 mindscape-protection-installer.seq "MINDSCAPE-FIXER!  -TCE-" 10

mindscape-protection-installer.prg: mindscape-protection-basic.bas
	petcat -w2 -o mindscape-protection-installer.prg -- mindscape-protection-basic.bas

mindscape-protection-basic.bas: mindscape-protection-basic-head.bas mindscape-protection-drivecode.bin
	cp mindscape-protection-basic-head.bas mindscape-protection-basic.bas
	file2data 700 mindscape-protection-drivecode.bin >> mindscape-protection-basic.bas

mindscape-protection-drivecode.bin: mindscape-protection-drivecode.asm
	64tass -a -b mindscape-protection-drivecode.asm -o mindscape-protection-drivecode.bin
