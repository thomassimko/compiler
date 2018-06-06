	.arch armv7-a


.text
	.align 2
	.global computeFib
computeFib:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L1:
	mov r1, #0
	cmp r4, #0
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L3
	b .L4
.L3:
	mov r0, #0
	mov r0, r0
	b .L2
.L4:
	mov r1, #0
	cmp r4, #2
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L6
	b .L7
.L6:
	mov r0, #1
	mov r0, r0
	b .L2
.L7:
	mov r1, #1
	sub r1, r4, r1
	mov r0, r1
	bl computeFib
	mov r5, r0
	mov r1, #2
	sub r1, r4, r1
	mov r0, r1
	bl computeFib
	mov r0, r0
	add r0, r5, r0
	mov r0, r0
	b .L2
.L2:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size computeFib, .-computeFib


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L10:
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
	bl computeFib
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L11
.L11:
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