	.arch armv7-a


.text
	.align 2
	.global isqrt
isqrt:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #16
.L1:
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #12]
	ldr r2, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r2, r1
	movle r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	ldr r1, [sp, #8]
	ldr r0, [sp, #12]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r1, [sp, #12]
	mov r0, #2
	add r0, r1, r0
	str r0, [sp, #12]
	ldr r2, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r2, r1
	movle r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L4:
	ldr r0, [sp, #12]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
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
	mov r1, r0
	sub sp, sp, #20
.L6:
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #2
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L8
	b .L9
.L8:
	mov r0, #0
	mov r0, r0
	str r0, [sp, #0]
	b .L7
.L9:
	ldr r1, [sp, #4]
	mov r0, r1
	bl isqrt
	mov r0, r0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	ldr r2, [sp, #8]
	mov r1, #0
	cmp r0, r2
	movle r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L11
	b .L12
.L11:
	ldr r4, [sp, #4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #12]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	ldr r0, [sp, #12]
	mul r0, r1, r0
	sub r0, r4, r0
	str r0, [sp, #16]
	ldr r0, [sp, #16]
	mov r1, #0
	cmp r0, #0
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L13
	b .L14
.L13:
	mov r0, #0
	mov r0, r0
	str r0, [sp, #0]
	b .L7
.L14:
	b .L15
.L15:
	ldr r0, [sp, #12]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	ldr r2, [sp, #8]
	mov r1, #0
	cmp r0, r2
	movle r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L11
	b .L12
.L12:
	mov r0, #1
	mov r0, r0
	str r0, [sp, #0]
	b .L7
.L7:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
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
	sub sp, sp, #12
.L17:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	str r2, [r1, #0]
	ldr r1, [r1]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r1, r3
	movle r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L19
	b .L20
.L19:
	ldr r1, [sp, #8]
	mov r0, r1
	bl prime
	mov r1, r0
	mov r1, r1
	cmp r1, #1
	beq .L21
	b .L22
.L21:
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L23
.L22:
	b .L23
.L23:
	ldr r1, [sp, #8]
	mov r2, #1
	add r1, r1, r2
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	mov r3, #0
	cmp r1, r2
	movle r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L19
	b .L20
.L20:
	mov r0, #0
	str r0, [sp, #0]
	b .L18
.L18:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
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