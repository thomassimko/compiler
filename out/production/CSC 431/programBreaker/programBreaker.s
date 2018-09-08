	.arch armv7-a
.comm	GLOBAL,4,4
.comm	count,4,4


.text
	.align 2
	.global fun2
fun2:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r4, r1
	sub sp, sp, #12
.L1:
	str r3, [sp, #4]
	str r4, [sp, #8]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #0
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L2
.L4:
	ldr r3, [sp, #4]
	mov r2, #1
	sub r3, r3, r2
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl fun2
	mov r0, r0
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size fun2, .-fun2


	.align 2
	.global fun1
fun1:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r4, r1
	mov r2, r2
	sub sp, sp, #20
.L7:
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r2, [sp, #12]
	mov r0, #5
	mov r1, #6
	add r0, r0, r1
	ldr r1, [sp, #4]
	mov r2, #2
	mul r1, r1, r2
	sub r4, r0, r1
	ldr r1, [sp, #8]
	mov r0, #4
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	add r2, r4, r2
	ldr r3, [sp, #12]
	add r2, r2, r3
	str r2, [sp, #16]
	ldr r2, [sp, #16]
	ldr r4, [sp, #8]
	mov r3, #0
	cmp r2, r4
	movgt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L9
	b .L10
.L9:
	ldr r2, [sp, #16]
	ldr r3, [sp, #4]
	mov r0, r2
	mov r1, r3
	bl fun2
	mov r0, r0
	str r0, [sp, #0]
	b .L8
.L10:
	mov r2, #5
	mov r3, #0
	cmp r2, #6
	movlt r3, #1
	mov r2, r3
	ldr r3, [sp, #16]
	ldr r4, [sp, #8]
	mov r5, #0
	cmp r3, r4
	movle r5, #1
	mov r3, r5
	and r2, r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L12
	b .L13
.L11:
	ldr r0, [sp, #16]
	str r0, [sp, #0]
	b .L8
.L12:
	ldr r2, [sp, #16]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl fun2
	mov r0, r0
	str r0, [sp, #0]
	b .L8
.L13:
	b .L14
.L14:
	b .L11
.L8:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size fun1, .-fun1


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #8
.L16:
	mov r0, #0
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r4, #:lower16:.read_scratch
	movt r4, #:upper16:.read_scratch
	str r3, [r4, #0]
	ldr r3, [r4]
	str r3, [sp, #4]
	ldr r4, [sp, #4]
	movw r3, #:lower16:10000
	movt r3, #:upper16:10000
	mov r5, #0
	cmp r4, r3
	movlt r5, #1
	mov r3, r5
	mov r3, r3
	cmp r3, #1
	beq .L18
	b .L19
.L18:
	ldr r4, [sp, #4]
	mov r3, #3
	mov r0, r3
	mov r1, r4
	mov r3, #5
	mov r2, r3
	bl fun1
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r4, [sp, #4]
	mov r3, #1
	add r3, r4, r3
	str r3, [sp, #4]
	ldr r3, [sp, #4]
	movw r4, #:lower16:10000
	movt r4, #:upper16:10000
	mov r5, #0
	cmp r3, r4
	movlt r5, #1
	mov r3, r5
	mov r3, r3
	cmp r3, #1
	beq .L18
	b .L19
.L19:
	mov r0, #0
	str r0, [sp, #0]
	b .L17
.L17:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
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