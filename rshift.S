	.file "func/rshift.S"
	.text
.global rshift
; this function should shift the
; a value a specified number of times
;
; the value to shift is in r15 and
; the number of times to right shift
; is specified in r12
rshift:
	mov   r12, r6
.Lloop:
	cmp   #0, r6
	jz    .Lend

	rra   r15

	sub   #1, r6

	jmp   .Lloop
.Lend:
	ret
