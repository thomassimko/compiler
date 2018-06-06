	.arch armv7-a


.text
	.align 2
	.global getRands
getRands:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	mov r6, r1
	sub sp, sp, #0
.L1:
	mul r5, r4, r4
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	add r1, r0, #4
	str r5, [r1]
	add r1, r0, #0
	mov r2, #0
	str r2, [r1]
	mov r1, #1
	sub r2, r6, r1
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r5
	mov r4, r4
	mov r3, r0
	mov r2, r2
	mov r0, #0
	mov r0, r0
	beq .L3
	b .L4
.L3:
	mov r0, r1
	mov r4, r4
	mov r5, r3
	mov r6, r2
	mul r0, r0, r0
	mov r1, r4
	mov r0, r0
	bl __aeabi_idiv
	mov r7, r0
	mov r0, #2
	mov r1, r0
	mov r0, r4
	bl __aeabi_idiv
	mov r0, r0
	mul r0, r7, r0
	mov r1, #1
	add r7, r0, r1
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	add r1, r0, #4
	str r7, [r1]
	add r1, r0, #0
	str r5, [r1]
	mov r1, #1
	sub r2, r6, r1
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r7
	mov r4, r4
	mov r3, r0
	mov r2, r2
	mov r0, r0
	beq .L3
	b .L4
.L4:
	mov r0, r0
	b .L2
.L2:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size getRands, .-getRands


	.align 2
	.global calcMean
calcMean:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #0
.L6:
	mov r0, #0
	mov r1, #0
	cmp r2, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	mov r5, #0
	mov r1, r5
	mov r6, #0
	mov r0, r6
	mov r3, r2
	mov r4, #0
	mov r2, r4
	mov r5, r5
	mov r6, r6
	mov r4, r4
	beq .L8
	b .L9
.L8:
	mov r4, r1
	mov r1, r0
	mov r0, r3
	mov r2, r2
	mov r2, #1
	add r5, r4, r2
	add r2, r0, #4
	ldr r2, [r2]
	add r4, r1, r2
	add r0, r0, #0
	ldr r2, [r0]
	mov r1, #0
	mov r0, #0
	cmp r2, r1
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r1, r5
	mov r0, r4
	mov r3, r2
	mov r2, #0
	mov r2, r2
	mov r5, r5
	mov r6, r4
	mov r4, #0
	mov r4, r4
	beq .L8
	b .L9
.L9:
	mov r1, r5
	mov r0, r6
	mov r2, r4
	mov r2, #0
	cmp r1, #0
	movne r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L10
	b .L11
.L10:
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	mov r0, r0
	b .L12
.L11:
	mov r0, #0
	mov r0, r0
	b .L12
.L12:
	mov r0, r0
	b .L7
.L7:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size calcMean, .-calcMean


	.align 2
	.global approxSqrt
approxSqrt:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r6, r0
	sub sp, sp, #0
.L14:
	mov r0, #0
	mov r1, #0
	cmp r0, r6
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	mov r0, #1
	mov r2, r0
	mov r1, r6
	mov r0, r0
	beq .L16
	b .L17
.L16:
	mov r0, r2
	mov r1, r1
	mul r3, r0, r0
	mov r2, #1
	add r2, r0, r2
	mov r4, #0
	cmp r3, r1
	movlt r4, #1
	mov r3, r4
	mov r3, r3
	cmp r3, #1
	mov r2, r2
	mov r1, r1
	mov r0, r0
	beq .L16
	b .L17
.L17:
	mov r0, r0
	b .L15
.L15:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size approxSqrt, .-approxSqrt


	.align 2
	.global approxSqrtAll
approxSqrtAll:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #0
.L19:
	mov r1, #0
	mov r3, #0
	cmp r2, r1
	movne r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	mov r1, r2
	beq .L21
	b .L22
.L21:
	mov r4, r1
	add r1, r4, #4
	ldr r1, [r1]
	mov r0, r1
	bl approxSqrt
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r1, r4, #0
	ldr r1, [r1]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	movne r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	mov r1, r1
	beq .L21
	b .L22
.L22:
	b .L20
.L20:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size approxSqrtAll, .-approxSqrtAll


	.align 2
	.global range
range:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #0
.L24:
	mov r0, #1
	mov r0, r0
	mov r0, #0
	mov r1, #0
	cmp r2, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	mov r0, #1
	mov r0, r0
	mov r3, r2
	mov r4, #0
	mov r2, r4
	mov r5, #0
	mov r1, r5
	mov r4, r4
	mov r5, r5
	beq .L26
	b .L27
.L26:
	mov r0, r0
	mov r3, r3
	mov r2, r2
	mov r1, r1
	mov r4, r0
	cmp r4, #1
	beq .L28
	b .L29
.L28:
	add r0, r3, #4
	ldr r4, [r0]
	add r0, r3, #4
	ldr r1, [r0]
	mov r0, #0
	mov r0, r0
	mov r2, r3
	mov r0, #0
	mov r0, r0
	mov r3, r4
	mov r5, r1
	b .L30
.L29:
	add r4, r3, #4
	ldr r5, [r4]
	mov r4, #0
	cmp r5, r2
	movlt r4, #1
	mov r4, r4
	mov r4, r4
	cmp r4, #1
	beq .L31
	b .L32
.L30:
	mov r1, r2
	mov r0, r0
	mov r4, r3
	mov r5, r5
	add r1, r1, #0
	ldr r1, [r1]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	movne r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	mov r0, r0
	mov r3, r1
	mov r2, r4
	mov r1, r5
	mov r4, r4
	mov r5, r5
	beq .L26
	b .L27
.L31:
	add r2, r3, #4
	ldr r4, [r2]
	mov r2, r3
	mov r0, r0
	mov r3, r4
	mov r1, r1
	b .L33
.L32:
	add r4, r3, #4
	ldr r5, [r4]
	mov r4, #0
	cmp r5, r1
	movgt r4, #1
	mov r4, r4
	mov r4, r4
	cmp r4, #1
	beq .L34
	b .L35
.L33:
	mov r2, r2
	mov r0, r0
	mov r3, r3
	mov r1, r1
	mov r2, r2
	mov r0, r0
	mov r3, r3
	mov r5, r1
	b .L30
.L34:
	add r1, r3, #4
	ldr r1, [r1]
	mov r3, r3
	mov r0, r0
	mov r2, r2
	mov r1, r1
	b .L36
.L35:
	mov r3, r3
	mov r0, r0
	mov r2, r2
	mov r1, r1
	b .L36
.L36:
	mov r3, r3
	mov r0, r0
	mov r4, r2
	mov r1, r1
	mov r2, r3
	mov r0, r0
	mov r3, r4
	mov r1, r1
	b .L33
.L27:
	mov r0, r4
	mov r4, r5
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L25
.L25:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size range, .-range


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L38:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	str r0, [r1, #0]
	ldr r4, [r1]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	str r3, [r2, #0]
	ldr r2, [r2]
	mov r0, r4
	mov r1, r2
	bl getRands
	mov r4, r0
	mov r0, r4
	bl calcMean
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl range
	mov r0, r4
	bl approxSqrtAll
	b .L39
.L39:
	mov r0, #0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size main, .-main


	.section	.rodata
	.align	2
.PRINTLN_FMT:
	.asciz	"%ld\n"
	.align	2
.PRINT_FMT:
	.asciz	"%ld "
	.align	2
.READ_FMT:
	.asciz	"%ld"
	.comm	.read_scratch,4,4
	.global	__aeabi_idiv