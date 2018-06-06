	.arch armv7-a


.text
	.align 2
	.global hailstone
hailstone:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #0
.L4:
	mov r0, #1
	cmp r0, #1
	mov r0, r1
	beq .L6
	b .L7
.L6:
	mov r4, r0
	mov r1, r4
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r5, #2
	mov r1, r5
	mov r0, r4
	bl __aeabi_idiv
	mov r0, r0
	mul r0, r0, r5
	sub r0, r4, r0
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L8
	b .L9
.L8:
	mov r0, #3
	mul r0, r0, r4
	mov r1, #1
	add r0, r0, r1
	mov r0, r0
	b .L10
.L9:
	mov r0, #2
	mov r1, r0
	mov r0, r4
	bl __aeabi_idiv
	mov r0, r0
	mov r0, r0
	b .L10
.L10:
	mov r0, r0
	mov r1, #0
	cmp r0, #1
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L11
	b .L12
.L11:
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L5
.L12:
	b .L13
.L13:
	mov r1, #1
	cmp r1, #1
	mov r0, r0
	beq .L6
	b .L7
.L7:
	b .L5
.L5:
	add sp, sp, #0
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
	sub sp, sp, #0
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
	mov r0, r1
	bl hailstone
	b .L16
.L16:
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