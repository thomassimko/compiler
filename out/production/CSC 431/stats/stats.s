	.arch armv7-a


.text
	.align 2
	.global getRands
getRands:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r1, r1
	sub sp, sp, #28
.L1:
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0
	str r0, [sp, #20]
	ldr r1, [sp, #4]
	ldr r0, [sp, #4]
	mul r0, r1, r0
	str r0, [sp, #12]
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #24]
	ldr r0, [sp, #12]
	ldr r1, [sp, #24]
	add r1, r1, #4
	str r0, [r1]
	ldr r0, [sp, #24]
	add r0, r0, #0
	mov r1, #0
	str r1, [r0]
	ldr r1, [sp, #8]
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [sp, #12]
	str r0, [sp, #16]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #16]
	ldr r1, [sp, #16]
	mul r0, r0, r1
	ldr r1, [sp, #4]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r4, r0
	ldr r0, [sp, #4]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	mul r1, r4, r0
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #12]
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #20]
	ldr r0, [sp, #12]
	ldr r1, [sp, #20]
	add r1, r1, #4
	str r0, [r1]
	ldr r0, [sp, #24]
	ldr r1, [sp, #20]
	add r1, r1, #0
	str r0, [r1]
	ldr r0, [sp, #20]
	str r0, [sp, #24]
	ldr r0, [sp, #8]
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #12]
	str r0, [sp, #16]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L4:
	ldr r0, [sp, #20]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
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
	mov r1, r0
	sub sp, sp, #20
.L6:
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #12]
	mov r0, #0
	str r0, [sp, #16]
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r0, r1
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L8
	b .L9
.L8:
	ldr r1, [sp, #12]
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	mov r0, #0
	cmp r2, r1
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L8
	b .L9
.L9:
	ldr r0, [sp, #12]
	mov r1, #0
	cmp r0, #0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L10
	b .L11
.L10:
	ldr r0, [sp, #8]
	ldr r1, [sp, #12]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #16]
	b .L12
.L11:
	b .L12
.L12:
	ldr r0, [sp, #16]
	str r0, [sp, #0]
	b .L7
.L7:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
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
	mov r1, r0
	sub sp, sp, #20
.L14:
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	str r0, [sp, #16]
	mov r0, #0
	str r0, [sp, #12]
	ldr r1, [sp, #12]
	ldr r0, [sp, #4]
	mov r2, #0
	cmp r1, r0
	movlt r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L16
	b .L17
.L16:
	ldr r0, [sp, #8]
	ldr r1, [sp, #8]
	mul r0, r0, r1
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	str r0, [sp, #16]
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #12]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r0, r1
	movlt r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L16
	b .L17
.L17:
	ldr r0, [sp, #16]
	str r0, [sp, #0]
	b .L15
.L15:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
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
	mov r1, r0
	sub sp, sp, #4
.L19:
	str r1, [sp, #0]
	ldr r2, [sp, #0]
	mov r1, #0
	mov r3, #0
	cmp r2, r1
	movne r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L21
	b .L22
.L21:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl approxSqrt
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #0]
	add r1, r1, #0
	ldr r1, [r1]
	str r1, [sp, #0]
	ldr r3, [sp, #0]
	mov r2, #0
	mov r1, #0
	cmp r3, r2
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L21
	b .L22
.L22:
	b .L20
.L20:
	add sp, sp, #4
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
	mov r1, r0
	sub sp, sp, #16
.L24:
	str r1, [sp, #0]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #0]
	mov r1, #0
	mov r2, #0
	cmp r0, r1
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L26
	b .L27
.L26:
	ldr r0, [sp, #12]
	mov r0, r0
	cmp r0, #1
	beq .L28
	b .L29
.L28:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #8]
	mov r0, #0
	mov r0, r0
	str r0, [sp, #12]
	b .L30
.L29:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r1, [r0]
	ldr r2, [sp, #4]
	mov r0, #0
	cmp r1, r2
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L31
	b .L32
.L30:
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r2, [sp, #0]
	mov r1, #0
	mov r0, #0
	cmp r2, r1
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L26
	b .L27
.L31:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #4]
	b .L33
.L32:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	ldr r1, [sp, #8]
	mov r2, #0
	cmp r0, r1
	movgt r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L34
	b .L35
.L33:
	b .L30
.L34:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #8]
	b .L36
.L35:
	b .L36
.L36:
	b .L33
.L27:
	ldr r0, [sp, #4]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L25
.L25:
	add sp, sp, #16
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
	sub sp, sp, #20
.L38:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	str r1, [r0, #0]
	ldr r0, [r0]
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	str r2, [r3, #0]
	ldr r2, [r3]
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl getRands
	mov r1, r0
	str r1, [sp, #16]
	ldr r1, [sp, #16]
	mov r0, r1
	bl calcMean
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #16]
	mov r0, r1
	bl range
	ldr r1, [sp, #16]
	mov r0, r1
	bl approxSqrtAll
	mov r0, #0
	str r0, [sp, #0]
	b .L39
.L39:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
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