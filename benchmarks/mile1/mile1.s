	.arch armv7-a


.text
	.align 2
	.global calcPower
calcPower:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	mov r1, r1
	sub sp, sp, #16
.L1:
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #1
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	ldr r1, [sp, #12]
	ldr r0, [sp, #4]
	mul r0, r1, r0
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L4:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size calcPower, .-calcPower


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #24
.L6:
	mov r0, #0
	str r0, [sp, #12]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r1, [sp, #8]
	str r1, [r0]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	str r2, [sp, #8]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #0
	movlt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L8
	b .L9
.L8:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #0]
	b .L7
.L9:
	b .L10
.L10:
	ldr r2, [sp, #4]
	add r3, r2, #4
	ldr r2, [sp, #8]
	str r2, [r3]
	mov r2, #0
	str r2, [sp, #20]
	ldr r3, [sp, #20]
	mov r2, #0
	cmp r3, #1000000
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L12
	b .L13
.L12:
	ldr r2, [sp, #20]
	mov r3, #1
	add r2, r2, r3
	str r2, [sp, #20]
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	ldr r3, [sp, #4]
	add r3, r3, #4
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl calcPower
	mov r2, r0
	str r2, [sp, #12]
	ldr r3, [sp, #20]
	mov r2, #0
	cmp r3, #1000000
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L12
	b .L13
.L13:
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #1
	str r0, [sp, #0]
	b .L7
.L7:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #24
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
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