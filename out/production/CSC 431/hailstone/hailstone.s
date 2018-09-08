	.arch armv7-a


.text
	.align 2
	.global mod
mod:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
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
	mov r1, r0
	ldr r0, [sp, #8]
	mul r0, r1, r0
	sub r0, r4, r0
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size mod, .-mod


	.align 2
	.global hailstone
hailstone:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #4
.L4:
	str r0, [sp, #0]
	mov r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
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
	beq .L8
	b .L9
.L8:
	ldr r0, [sp, #0]
	mov r1, #3
	mul r1, r1, r0
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #0]
	b .L10
.L9:
	ldr r0, [sp, #0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #0]
	b .L10
.L10:
	ldr r0, [sp, #0]
	mov r1, #0
	cmp r0, #1
	movle r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L11
	b .L12
.L11:
	ldr r0, [sp, #0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L5
.L12:
	b .L13
.L13:
	mov r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L7:
	b .L5
.L5:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size hailstone, .-hailstone


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #8
.L15:
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
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl hailstone
	mov r0, #0
	str r0, [sp, #0]
	b .L16
.L16:
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