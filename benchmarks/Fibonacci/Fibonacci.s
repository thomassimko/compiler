	.arch armv7-a


.text
	.align 2
	.global computeFib
computeFib:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r1
	sub sp, sp, #8
.L1:
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r2, #0
	cmp r0, #0
	moveq r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	mov r0, #0
	str r0, [sp, #0]
	b .L2
.L4:
	ldr r0, [sp, #4]
	mov r2, #0
	cmp r0, #2
	movle r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L7
	b .L8
.L5:
	b .L2
.L7:
	mov r0, #1
	str r0, [sp, #0]
	b .L2
.L8:
	ldr r2, [sp, #4]
	mov r0, #1
	sub r0, r2, r0
	mov r1, r0
	bl computeFib
	mov r0, r1
	ldr r2, [sp, #4]
	mov r3, #2
	sub r2, r2, r3
	mov r1, r2
	bl computeFib
	mov r1, r1
	add r0, r0, r1
	str r0, [sp, #0]
	b .L2
.L9:
	b .L5
.L2:
	ldr r0, [sp, #0]
	mov r1, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size computeFib, .-computeFib


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #8
.L13:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r1, #:lower16:.READ_FMT
	movt r1, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, r0
	bl computeFib
	mov r0, r1
	mov r1, r0
	movw r1, #:lower16:.PRINTLN_FMT
	movt r1, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L14
.L14:
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