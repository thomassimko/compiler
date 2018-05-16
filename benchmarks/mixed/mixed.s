	.arch armv7-a
.comm	globalfoo,4,4


.text
	.align 2
	.global tailrecursive
tailrecursive:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r2
	sub sp, sp, #4
.L1:
	str r0, [sp, #0]
	ldr r0, [sp, #0]
	mov r1, #0
	cmp r0, #0
	movle r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	b .L2
.L4:
	b .L5
.L5:
	ldr r0, [sp, #0]
	mov r1, #1
	sub r0, r0, r1
	mov r2, r0
	bl tailrecursive
	mov r0, #0
	mov r0, r2
	b .L2
.L2:
	add sp, sp, #4
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
	mov r0, r2
	mov r1, r1
	sub sp, sp, #12
.L8:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r0, r1
	str r0, [sp, #0]
	b .L9
.L9:
	ldr r0, [sp, #0]
	mov r2, r0
	add sp, sp, #12
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
	mov r0, r2
	sub sp, sp, #16
.L11:
	str r0, [sp, #0]
	movw r2, #:lower16:12
	movt r2, #:upper16:12
	bl malloc
	mov r0, r2
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	add r0, r0, #8
	movw r2, #:lower16:4
	movt r2, #:upper16:4
	bl malloc
	mov r1, r2
	mov r1, r1
	str r1, [r0]
	movw r2, #:lower16:12
	movt r2, #:upper16:12
	bl malloc
	mov r0, r2
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	add r0, r0, #8
	movw r2, #:lower16:4
	movt r2, #:upper16:4
	bl malloc
	mov r1, r2
	mov r1, r1
	str r1, [r0]
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r1, [sp, #0]
	str r1, [r0]
	ldr r0, [sp, #8]
	add r1, r0, #0
	mov r0, #3
	str r0, [r1]
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r0, [r0]
	add r0, r0, #0
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	str r1, [r0]
	ldr r0, [sp, #8]
	add r0, r0, #8
	ldr r0, [r0]
	add r0, r0, #0
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r1, [r1]
	str r1, [r0]
	ldr r0, [sp, #0]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L13
	b .L14
.L13:
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
	mov r2, r0
	bl __aeabi_idiv
	mov r0, r2
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	add r0, r0, #8
	ldr r0, [r0]
	add r0, r0, #0
	ldr r0, [r0]
	ldr r3, [sp, #4]
	add r3, r3, #0
	ldr r3, [r3]
	mov r2, r0
	mov r1, r3
	bl add
	mov r0, r2
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	add r0, r0, #0
	ldr r0, [r0]
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	sub r0, r0, r1
	str r0, [sp, #12]
	ldr r1, [sp, #0]
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #0]
	ldr r0, [sp, #0]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L13
	b .L14
.L14:
	ldr r0, [sp, #4]
	mov r0, r0
	mov r2, r0
	bl free
	mov r0, #0
	mov r0, r2
	ldr r0, [sp, #8]
	mov r0, r0
	mov r2, r0
	bl free
	mov r0, #0
	mov r0, r2
	b .L12
.L12:
	add sp, sp, #16
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
	mov r0, r2
	sub sp, sp, #8
.L16:
	str r0, [sp, #0]
	ldr r1, [sp, #0]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L18
	b .L19
.L18:
	movw r2, #:lower16:12
	movt r2, #:upper16:12
	bl malloc
	mov r0, r2
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r0, r0
	mov r2, r0
	bl free
	mov r0, #0
	mov r0, r2
	ldr r1, [sp, #0]
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #0]
	ldr r0, [sp, #0]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L18
	b .L19
.L19:
	b .L17
.L17:
	add sp, sp, #8
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
	mov r3, r2
	mov r0, r1
	sub sp, sp, #12
.L21:
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r3, #0
	cmp r0, #0
	moveq r3, #1
	mov r0, r3
	mov r0, r0
	cmp r0, #1
	beq .L23
	b .L24
.L23:
	ldr r1, [sp, #8]
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #0]
	b .L22
.L24:
	b .L25
.L25:
	ldr r3, [sp, #8]
	mov r0, #0
	cmp r3, #0
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L27
	b .L28
.L27:
	ldr r0, [sp, #4]
	mov r3, #1
	sub r0, r0, r3
	mov r2, r0
	mov r0, #1
	mov r1, r0
	bl ackermann
	mov r0, r2
	str r0, [sp, #0]
	b .L22
.L28:
	ldr r0, [sp, #4]
	mov r3, #1
	sub r0, r0, r3
	ldr r3, [sp, #4]
	ldr r5, [sp, #8]
	mov r4, #1
	sub r4, r5, r4
	mov r2, r3
	mov r1, r4
	bl ackermann
	mov r3, r2
	mov r2, r0
	mov r1, r3
	bl ackermann
	mov r0, r2
	str r0, [sp, #0]
	b .L22
.L29:
	b .L22
.L22:
	ldr r0, [sp, #0]
	mov r2, r0
	add sp, sp, #12
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
	sub sp, sp, #24
.L33:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r2, #:lower16:.READ_FMT
	movt r2, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r2, #:lower16:.READ_FMT
	movt r2, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #8]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r2, #:lower16:.READ_FMT
	movt r2, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #12]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r2, #:lower16:.READ_FMT
	movt r2, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #16]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r2, #:lower16:.READ_FMT
	movt r2, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #20]
	ldr r0, [sp, #4]
	mov r2, r0
	bl tailrecursive
	mov r0, #0
	mov r0, r2
	ldr r0, [sp, #4]
	mov r1, r0
	movw r2, #:lower16:.PRINTLN_FMT
	movt r2, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #8]
	mov r2, r0
	bl domath
	mov r0, #0
	mov r0, r2
	ldr r0, [sp, #8]
	mov r1, r0
	movw r2, #:lower16:.PRINTLN_FMT
	movt r2, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #12]
	mov r2, r0
	bl objinstantiation
	mov r0, #0
	mov r0, r2
	ldr r0, [sp, #12]
	mov r1, r0
	movw r2, #:lower16:.PRINTLN_FMT
	movt r2, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r3, [sp, #16]
	ldr r0, [sp, #20]
	mov r2, r3
	mov r1, r0
	bl ackermann
	mov r0, r2
	mov r1, r0
	movw r2, #:lower16:.PRINTLN_FMT
	movt r2, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L34
.L34:
	ldr r0, [sp, #0]
	mov r2, r0
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