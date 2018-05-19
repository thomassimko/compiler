	.arch armv7-a
.comm	globalfoo,4,4


.text
	.align 2
	.global tailrecursive
tailrecursive:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r6, r0
	sub sp, sp, #0
.L1:
	mov r1, #0
	cmp r6, #0
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L3
	b .L4
.L3:
	b .L2
.L4:
	b .L5
.L5:
	mov r1, #1
	sub r1, r6, r1
	mov r0, r1
	bl tailrecursive
	b .L2
.L2:
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size tailrecursive, .-tailrecursive


	.align 2
	.global add
add:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	mov r1, r1
	sub sp, sp, #0
.L7:
	add r0, r0, r1
	mov r0, r0
	b .L8
.L8:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size add, .-add


	.align 2
	.global domath
domath:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r6, r0
	sub sp, sp, #0
.L10:
	mov r0, #12
	bl malloc
	mov r0, r0
	mov r5, r0
	mov r0, #4
	bl malloc
	mov r0, r0
	mov r1, r0
	add r0, r5, #8
	str r1, [r0]
	mov r0, #12
	bl malloc
	mov r0, r0
	mov r4, r0
	mov r0, #4
	bl malloc
	mov r1, r0
	mov r1, r1
	add r2, r4, #8
	str r1, [r2]
	add r1, r5, #0
	str r6, [r1]
	add r1, r4, #0
	mov r2, #3
	str r2, [r1]
	add r1, r5, #0
	ldr r1, [r1]
	add r2, r5, #8
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	add r1, r4, #0
	ldr r1, [r1]
	add r2, r4, #8
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	mov r1, #0
	cmp r6, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r5
	mov r2, r4
	mov r3, r6
	mov r5, r5
	mov r4, r4
	beq .L12
	b .L13
.L12:
	mov r5, r1
	mov r4, r2
	mov r6, r3
	add r0, r5, #0
	ldr r0, [r0]
	add r1, r4, #0
	ldr r1, [r1]
	mul r0, r0, r1
	add r1, r5, #8
	ldr r1, [r1]
	add r1, r1, #0
	ldr r1, [r1]
	mul r0, r0, r1
	add r1, r4, #0
	ldr r1, [r1]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	add r2, r4, #8
	ldr r2, [r2]
	add r2, r2, #0
	ldr r2, [r2]
	add r3, r5, #0
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl add
	mov r1, r0
	add r1, r4, #0
	ldr r1, [r1]
	add r2, r5, #0
	ldr r2, [r2]
	sub r1, r1, r2
	mov r1, #1
	sub r3, r6, r1
	mov r1, #0
	cmp r3, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r5
	mov r2, r4
	mov r3, r3
	mov r5, r5
	mov r4, r4
	beq .L12
	b .L13
.L13:
	mov r1, r5
	mov r4, r4
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, r4
	mov r0, r1
	bl free
	b .L11
.L11:
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size domath, .-domath


	.align 2
	.global objinstantiation
objinstantiation:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r6, r0
	sub sp, sp, #0
.L15:
	mov r0, #0
	cmp r6, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r6
	beq .L17
	b .L18
.L17:
	mov r4, r0
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	mov r1, r1
	mov r0, r1
	bl free
	mov r0, #1
	sub r0, r4, r0
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r0, r0
	beq .L17
	b .L18
.L18:
	b .L16
.L16:
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size objinstantiation, .-objinstantiation


	.align 2
	.global ackermann
ackermann:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r2, r0
	mov r3, r1
	sub sp, sp, #0
.L20:
	mov r4, #0
	cmp r2, #0
	moveq r4, #1
	mov r4, r4
	mov r4, r4
	cmp r4, #1
	beq .L22
	b .L23
.L22:
	mov r0, #1
	add r0, r3, r0
	mov r0, r0
	b .L21
.L23:
	b .L24
.L24:
	mov r4, #0
	cmp r3, #0
	moveq r4, #1
	mov r4, r4
	mov r4, r4
	cmp r4, #1
	beq .L25
	b .L26
.L25:
	mov r3, #1
	sub r2, r2, r3
	mov r0, r2
	mov r2, #1
	mov r1, r2
	bl ackermann
	mov r0, r0
	mov r0, r0
	b .L21
.L26:
	mov r4, #1
	sub r4, r2, r4
	mov r5, #1
	sub r3, r3, r5
	mov r0, r2
	mov r1, r3
	bl ackermann
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl ackermann
	mov r0, r0
	mov r0, r0
	b .L21
.L21:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size ackermann, .-ackermann


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #0
.L29:
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
	ldr r4, [r0]
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
	ldr r5, [r1]
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
	ldr r6, [r0]
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
	ldr r7, [r0]
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
	ldr r8, [r2]
	mov r0, r4
	bl tailrecursive
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	bl domath
	mov r1, r5
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r6
	bl objinstantiation
	mov r1, r6
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r7
	mov r1, r8
	bl ackermann
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	mov r1, #0
	mov r4, r1
	bl printf
	b .L30
.L30:
	mov r0, r4
	mov r0, r0
	add sp, sp, #0
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