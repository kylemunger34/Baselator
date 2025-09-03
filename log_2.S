	.file "func/log_2.S"
	.text
.global log_2
; this function calculates
; log base 2 of a value
;
; the value should be in r15
log_2:
	mov   #0, r12
	mov   r14, r11
.Lloop:
	cmp   #1, r11
	jz    .Lend

	rra   r11
	inc   r12

	jmp   .Lloop

.Lend:
	ret
