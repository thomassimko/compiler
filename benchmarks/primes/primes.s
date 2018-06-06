	.arch armv7-a


.text
	.align 2
	.global isqrt
isqrt:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L1:
	mov r0, #1
	mov r1, #0
	cmp r0, r4
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r0
	mov r2, #3
	mov r0, r2
	mov r3, r4
	mov r2, r2
	beq .L3
	b .L4
.L3:
	mov r1, r1
	mov r0, r0
	mov r3, r3
	add r1, r1, r0
	mov r2, #2
	add r2, r0, r2
	mov r0, #0
	cmp r1, r3
	movle r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r1, r1
	mov r0, r2
	mov r3, r3
	mov r2, r2
	beq .L3
	b .L4
.L4:
	mov r0, r2
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, #1
	sub r0, r1, r0
	b .L2
.L2:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size isqrt, .-isqrt


	.align 2
	.global prime
prime:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L6:
	mov r1, #0
	cmp r4, #2
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L8
	b .L9
.L8:
	mov r0, #0
	mov r0, r0
	mov r0, #0
	mov r0, r0
	b .L7
.L9:
	mov r0, r4
	bl isqrt
	mov r1, r0
	mov r0, #2
	mov r2, #0
	cmp r0, r1
	movle r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r4
	mov r0, r0
	mov r1, r1
	beq .L11
	b .L12
.L11:
	mov r4, r2
	mov r6, r0
	mov r5, r1
	mov r1, r6
	mov r0, r4
	bl __aeabi_idiv
	mov r0, r0
	mul r0, r0, r6
	sub r1, r4, r0
	mov r0, #0
	cmp r1, #0
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L13
	b .L14
.L13:
	mov r0, #0
	mov r0, r0
	mov r0, #0
	mov r0, r0
	b .L7
.L14:
	b .L15
.L15:
	mov r0, #1
	add r0, r6, r0
	mov r1, #0
	cmp r0, r5
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r2, r4
	mov r0, r0
	mov r1, r5
	beq .L11
	b .L12
.L12:
	mov r0, #1
	mov r0, r0
	mov r0, #1
	mov r0, r0
	b .L7
.L7:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size prime, .-prime


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L17:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	str r1, [r2, #0]
	ldr r1, [r2]
	mov r2, #0
	mov r3, #0
	cmp r2, r1
	movle r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	mov r2, r2
	mov r1, r1
	beq .L19
	b .L20
.L19:
	mov r4, r2
	mov r5, r1
	mov r0, r4
	bl prime
	mov r1, r0
	mov r1, r1
	cmp r1, #1
	beq .L21
	b .L22
.L21:
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r4
	mov r3, r5
	b .L23
.L22:
	mov r1, r4
	mov r3, r5
	b .L23
.L23:
	mov r2, r1
	mov r1, r3
	mov r3, #1
	add r2, r2, r3
	mov r3, #0
	cmp r2, r1
	movle r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	mov r2, r2
	mov r1, r1
	beq .L19
	b .L20
.L20:
	b .L18
.L18:
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