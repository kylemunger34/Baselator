	.file "func/power2_base.S"
	.text
.global	power2_base
; this function uses mask and
; shift to convert the decimal
; value to the specified base
;
; the value to convert is in r15,
; the base is specified in r14 and
; the current index is given in r13
power2_base:
	call  #log_2

	cmp   #0, r12
	jz    .Lend

	dec   r14
.Lshift:
	mov   r15, r8
	and   r14, r8  ;anding the mask

	mov   #buf, r10	;add bit to buffer and dec to next index
	mov   #ASCII, r11
	add   r13, r10
	add   r8, r11

	mov.b 0(r11), r9
	mov.b r9, 0(r10)

	call  #rshift

	cmp   #0, r15
	jz    .Lend

	dec   r13

	jmp .Lshift
.Lend:
	ret
