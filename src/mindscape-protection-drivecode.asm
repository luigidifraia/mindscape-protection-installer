; Zaxxon [Mindscape] illegal GCR masterer
; (C)2022 Luigi Di Fraia
; Based on: Inside Commodore DOS - pages 129-133

; Assemble with: 64tass

; Pre: The BASIC program that executes the below code would have loaded the DOS track/sector 1/0 to the disk drive's RAM

*=$0500

; Drive code start

	lda #$04	; Set indirect buffer pointer to buffer #1
	sta $31

	jsr $f78f	; Convert CBM data to GCR and store the results in the overflow
			; buffer (starting at $01bb) and buffer 1 ($0400)

	lda #$00	; Corrupt the GCR sequence between sentinels to cause weak bits upon reading data
	sta $01bb+3
	sta $01bb+4
	sta $01bb+5

	lda #$d5	; Set sentinels in case they were not properly cloned from the original,
	sta $01bb+1	; as the protection checks for them explicitly
	lda #$aa
	sta $01bb+6
	lda #$d4
	sta $01bb+7

	jsr $f510	; Find header

	ldx #$08
_wgap	bvc _wgap	; Wait out gap
	clv
	dex
	bne _wgap

	lda #$ff	; Enable write
	sta $1c03

	lda $1c0c
	and #$1f
	ora #$c0
	sta $1c0c

	lda #$ff	; Write 5 $FF bytes (block-sync)
	ldx #$05
	sta $1c01
	clv
_wrsync	bvc _wrsync
	clv
	dex
	bne _wrsync

	ldy #$bb
_ovflow	lda $0100,y	; Write out overflow buffer
_wait1	bvc _wait1
	clv
	sta $1c01
	iny
	bne _ovflow

_buff	lda $0400,y	; Write out buffer
_wait2	bvc _wait2
	clv
	sta $1c01
	iny
	bne _buff

_wait3	bvc _wait3

	jsr $fe00	; Enable read

	inc $31		; Restore indirect buffer pointer to buffer #2

	lda #$01	; Report success
	jmp $f969	; Exit through the error handler

