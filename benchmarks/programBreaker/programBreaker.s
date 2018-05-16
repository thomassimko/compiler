	.arch armv7-a
.comm	GLOBAL,4,4
.comm	count,4,4


.text
	.align 2
	.global fun2
fun2:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r4, r1
	mov r3, r0
	sub sp, sp, #12
.L1:
	str r4, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [sp, #4]
	mov r3, #0
	cmp r2, #0
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L2
.L4:
	ldr r2, [sp, #4]
	mov r3, #1
	sub r3, r2, r3
	ldr r2, [sp, #8]
	mov r1, r3
	mov r0, r2
	bl fun2
	mov r0, r1
	str r0, [sp, #0]
	b .L2
.L5:
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r1, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size fun2, .-fun2


	.align 2
	.global fun1
fun1:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r4, r1
	mov r3, r0
	mov r2, r2
	sub sp, sp, #20
.L9:
	str r4, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #12]
	mov r1, #5
	mov r0, #6
	add r0, r1, r0
	ldr r1, [sp, #4]
	mov r2, #2
	mul r1, r1, r2
	sub r4, r0, r1
	ldr r0, [sp, #8]
	mov r1, #4
	mov r0, r0
	mov r1, r1
	bl __aeabi_idiv
	mov r2, r1
	add r3, r4, r2
	ldr r2, [sp, #12]
	add r2, r3, r2
	str r2, [sp, #16]
	ldr r4, [sp, #16]
	ldr r3, [sp, #8]
	mov r2, #0
	cmp r4, r3
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L11
	b .L12
.L11:
	ldr r2, [sp, #16]
	ldr r3, [sp, #4]
	mov r1, r2
	mov r0, r3
	bl fun2
	mov r0, r1
	str r0, [sp, #0]
	b .L10
.L12:
	mov r2, #5
	mov r3, #0
	cmp r2, #6
	movlt r3, #1
	mov r2, r3
	ldr r5, [sp, #16]
	ldr r3, [sp, #8]
	mov r4, #0
	cmp r5, r3
	movle r4, #1
	mov r3, r4
	and r2, r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L15
	b .L16
.L13:
	ldr r0, [sp, #16]
	str r0, [sp, #0]
	b .L10
.L15:
	ldr r3, [sp, #16]
	ldr r2, [sp, #8]
	mov r1, r3
	mov r0, r2
	bl fun2
	mov r0, r1
	str r0, [sp, #0]
	b .L10
.L16:
	b .L17
.L17:
	b .L13
.L10:
	ldr r0, [sp, #0]
	mov r1, r0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size fun1, .-fun1


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #8
.L20:
	mov r0, #0
	str r0, [sp, #4]
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	movw r1, #:lower16:.READ_FMT
	movt r1, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	str r3, [sp, #4]
	ldr r3, [sp, #4]
	mov r4, #0
	cmp r3, #10000
	movlt r4, #1
	mov r3, r4
	mov r3, r3
	cmp r3, #1
	beq .L22
	b .L23
.L22:
	ldr r4, [sp, #4]
	mov r3, #3
	mov r1, r3
	mov r0, r4
	mov r3, #5
	mov r2, r3
	bl fun1
	mov r0, r1
	mov r0, r0
	movw r1, #:lower16:.PRINTLN_FMT
	movt r1, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r3, [sp, #4]
	mov r4, #1
	add r3, r3, r4
	str r3, [sp, #4]
	ldr r3, [sp, #4]
	mov r4, #0
	cmp r3, #10000
	movlt r4, #1
	mov r3, r4
	mov r3, r3
	cmp r3, #1
	beq .L22
	b .L23
.L23:
	mov r0, #0
	str r0, [sp, #0]
	b .L21
.L21:
	ldr r0, [sp, #0]
	mov r1, r0
	add sp, sp, #8
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