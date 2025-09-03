        .file "func/convert.S"
        .text
.global convert
; this function has to figure
; out which conversion function
; to call
;
; it receives the decimal value
; in r15 and the base to convert
; to in r14
convert:
	mov   #40, r13  ;set index

	cmp   #2, r14
	jl    .Lbad

	cmp   #65, r14
	jge   .Lcheck_256

	mov   r14, r12   ;Check pwr of 2
	dec   r12
	and   r14, r12
	cmp   #0, r12
	jz    .Lpower_of_2
	call  #other_base
	mov   r13, r15
	ret

.Lpower_of_2:
	call  #power2_base
        mov   r13, r15

	ret

.Lcheck_256:
	cmp   #256, R14
	jnz   .Lbad
	call  #base_256
	mov   r13, r15
	ret

.Lbad:
	mov   #buf, r10
	add   r13, r10
	mov.b #'0', 0(r10)

	mov   r13, r15
	ret
