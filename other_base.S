	.file "func/other_base.S"
        .text
.global other_base
; this function uses modulo and
; divide to convert the decimal
; value to the specified base
;
; the value to convert is in r15,
; the base is specified in r14 and
; the current index is given in r13
other_base:
.Lloop:
	call  #mod		;modulus and store to buffer
	mov   #ASCII, r11
	mov   #buf, r10
	add   r9, r11
	add   r13, r10

	mov.b 0(r11), r9
	mov.b r9, 0(r10)

	call  #div
	mov   r7, r15

	cmp   #0, r15
	jz    .Lend

	dec   r13

	jmp   .Lloop

.Lend:
	ret


mod:
	mov   r15, r9
.Lmodloop:
	cmp   r14, r9
	jl    .Lmodend

	sub   r14, r9
	jmp   .Lmodloop
.Lmodend:
	ret


div:
	mov   #0, r7
        mov   r15, r8
.Ldivloop:
        cmp   r14, r8
        jl    .Ldivend

        sub   r14, r8
	inc   r7

        jmp   .Ldivloop
.Ldivend:
        ret
