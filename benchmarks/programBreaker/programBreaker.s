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
	mov r5, r0
	mov r4, r1
	sub sp, sp, #0
.L1:
	mov r2, #0
	cmp r5, #0
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L3
	b .L4
.L3:
	mov r0, r4
	b .L2
.L4:
	mov r2, #1
	sub r2, r5, r2
	mov r0, r2
	mov r1, r4
	bl fun2
	mov r0, r0
	mov r0, r0
	b .L2
.L2:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r5, r0
	mov r4, r1
	mov r6, r2
	sub sp, sp, #0
.L7:
	mov r0, #2
	mul r0, r5, r0
	mov r1, #11
	sub r7, r1, r0
	mov r0, #4
	mov r1, r4
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	add r2, r7, r2
	add r2, r2, r6
	mov r3, #0
	cmp r2, r4
	movgt r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L9
	b .L10
.L9:
	mov r0, r2
	mov r1, r5
	bl fun2
	mov r0, r0
	mov r0, r0
	b .L8
.L10:
	mov r3, #0
	cmp r2, r4
	movle r3, #1
	mov r3, r3
	mov r5, #1
	and r3, r5, r3
	mov r3, r3
	cmp r3, #1
	beq .L12
	b .L13
.L11:
	mov r0, r2
	b .L8
.L12:
	mov r0, r2
	mov r1, r4
	bl fun2
	mov r0, r0
	mov r0, r0
	b .L8
.L13:
	b .L14
.L14:
	b .L11
.L8:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	sub sp, sp, #0
.L16:
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
	movw r4, #:lower16:10000
	movt r4, #:upper16:10000
	mov r5, #0
	cmp r3, r4
	movlt r5, #1
	mov r4, r5
	mov r4, r4
	cmp r4, #1
	mov r3, r3
	beq .L18
	b .L19
.L18:
	mov r4, r3
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
	mov r3, #1
	add r3, r4, r3
	movw r5, #:lower16:10000
	movt r5, #:upper16:10000
	mov r4, #0
	cmp r3, r5
	movlt r4, #1
	mov r4, r4
	mov r4, r4
	cmp r4, #1
	mov r3, r3
	beq .L18
	b .L19
.L19:
	b .L17
.L17:
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