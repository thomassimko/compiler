	.arch armv7-a
.comm	globalfoo,4,4


.text
	.align 2
	.global tailrecursive
tailrecursive:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #4
.L1:
	str r1, [sp, #0]
	ldr r1, [sp, #0]
	mov r2, #0
	cmp r1, #0
	movle r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L3
	b .L4
.L3:
	b .L2
.L4:
	b .L5
.L5:
	ldr r2, [sp, #0]
	mov r1, #1
	sub r1, r2, r1
	mov r0, r1
	bl tailrecursive
	b .L2
.L2:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size tailrecursive, .-tailrecursive


	.align 2
	.global add
add:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r1, r1
	sub sp, sp, #12
.L7:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #0]
	b .L8
.L8:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size add, .-add


	.align 2
	.global domath
domath:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #16
.L10:
	str r1, [sp, #0]
	mov r0, #12
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #4]
	mov r0, #4
	bl malloc
	mov r0, r0
	mov r0, r0
	ldr r1, [sp, #4]
	add r1, r1, #8
	str r0, [r1]
	mov r0, #12
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #8]
	mov r0, #4
	bl malloc
	mov r1, r0
	mov r1, r1
	ldr r2, [sp, #8]
	add r2, r2, #8
	str r1, [r2]
	ldr r1, [sp, #0]
	ldr r2, [sp, #4]
	add r2, r2, #0
	str r1, [r2]
	ldr r1, [sp, #8]
	add r2, r1, #0
	mov r1, #3
	str r1, [r2]
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r1, [r1]
	ldr r2, [sp, #8]
	add r2, r2, #8
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	ldr r2, [sp, #0]
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L12
	b .L13
.L12:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r1, [r1]
	mul r0, r0, r1
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	ldr r1, [sp, #4]
	add r1, r1, #8
	ldr r1, [r1]
	add r1, r1, #0
	ldr r1, [r1]
	mul r0, r0, r1
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r1, [r1]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	str r2, [sp, #12]
	ldr r2, [sp, #8]
	add r2, r2, #8
	ldr r2, [r2]
	add r2, r2, #0
	ldr r2, [r2]
	ldr r3, [sp, #4]
	add r3, r3, #0
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl add
	mov r1, r0
	str r1, [sp, #12]
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r1, [r1]
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	sub r1, r1, r2
	str r1, [sp, #12]
	ldr r1, [sp, #0]
	mov r2, #1
	sub r1, r1, r2
	str r1, [sp, #0]
	ldr r1, [sp, #0]
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L12
	b .L13
.L13:
	ldr r1, [sp, #4]
	mov r1, r1
	mov r0, r1
	bl free
	ldr r1, [sp, #8]
	mov r1, r1
	mov r0, r1
	bl free
	b .L11
.L11:
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size domath, .-domath


	.align 2
	.global objinstantiation
objinstantiation:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #8
.L15:
	str r1, [sp, #0]
	ldr r1, [sp, #0]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L17
	b .L18
.L17:
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r1, r1
	mov r0, r1
	bl free
	ldr r1, [sp, #0]
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #0]
	ldr r1, [sp, #0]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L17
	b .L18
.L18:
	b .L16
.L16:
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size objinstantiation, .-objinstantiation


	.align 2
	.global ackermann
ackermann:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L20:
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #0
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L22
	b .L23
.L22:
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #0]
	b .L21
.L23:
	b .L24
.L24:
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #0
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L25
	b .L26
.L25:
	ldr r3, [sp, #4]
	mov r2, #1
	sub r2, r3, r2
	mov r0, r2
	mov r2, #1
	mov r1, r2
	bl ackermann
	mov r0, r0
	str r0, [sp, #0]
	b .L21
.L26:
	ldr r2, [sp, #4]
	mov r3, #1
	sub r4, r2, r3
	ldr r2, [sp, #4]
	ldr r5, [sp, #8]
	mov r3, #1
	sub r3, r5, r3
	mov r0, r2
	mov r1, r3
	bl ackermann
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl ackermann
	mov r0, r0
	str r0, [sp, #0]
	b .L21
.L21:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size ackermann, .-ackermann


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #24
.L29:
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
	ldr r0, [r1]
	str r0, [sp, #4]
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
	ldr r0, [r1]
	str r0, [sp, #8]
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
	ldr r0, [r1]
	str r0, [sp, #12]
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
	ldr r0, [r1]
	str r0, [sp, #16]
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
	str r1, [sp, #20]
	ldr r1, [sp, #4]
	mov r0, r1
	bl tailrecursive
	ldr r0, [sp, #4]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #8]
	mov r0, r1
	bl domath
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #12]
	mov r0, r1
	bl objinstantiation
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #16]
	ldr r3, [sp, #20]
	mov r0, r2
	mov r1, r3
	bl ackermann
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L30
.L30:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #24
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