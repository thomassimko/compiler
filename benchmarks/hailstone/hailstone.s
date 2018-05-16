	.arch armv7-a


.text
	.align 2
	.global mod
mod:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	mov r1, r1
	sub sp, sp, #12
.L1:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r4, [sp, #4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	ldr r1, [sp, #8]
	mul r0, r0, r1
	sub r0, r4, r0
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size mod, .-mod


	.align 2
	.global hailstone
hailstone:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	sub sp, sp, #4
.L4:
	str r0, [sp, #0]
	mov r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L14
.L7:
	ldr r0, [sp, #0]
	mov r1, #3
	mul r0, r1, r0
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #0]
	b .L9
.L8:
	ldr r0, [sp, #0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #0]
	b .L9
.L9:
	ldr r1, [sp, #0]
	mov r0, #0
	cmp r1, #1
	movle r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L10
	b .L11
.L10:
	ldr r0, [sp, #0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L5
.L11:
	b .L12
.L12:
	mov r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L14
.L6:
	ldr r0, [sp, #0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r2, [sp, #0]
	mov r0, r2
	mov r2, #2
	mov r1, r2
	bl mod
	mov r0, r0
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L7
	b .L8
.L14:
	b .L5
.L5:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size hailstone, .-hailstone


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #8
.L16:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl hailstone
	mov r1, #0
	mov r1, r0
	mov r0, #0
	str r0, [sp, #0]
	b .L17
.L17:
	ldr r0, [sp, #0]
	mov r0, r0
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