	.file "func/base_256.S"
	.text
.global	base_256
; this function uses both approaches
; (possibly calling other_base)
;
; the value to convert is in r15,
; the base is specified in r14 and
; the current index is given in r13
base_256:
	mov   #8, r12
.Lloop:
	mov   r15, r5
	and   #255, r15

	mov   #10, r14
	call  #other_base
	dec   r13

	mov   r5, r15
	call  #rshift

	cmp   #0, r15
	jz    .Lend

	cmp   #65535, r15
	jz    .Lend

	mov   #buf, r10
	add   r13, r10
	mov.b #'.', 0(r10)
	dec   r13

	jmp   .Lloop
.Lend:
	inc    r13
	ret
