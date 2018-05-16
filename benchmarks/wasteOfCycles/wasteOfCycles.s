	.arch armv7-a


.text
	.align 2
	.global function
function:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r1, r0
	sub sp, sp, #16
.L1:
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #0
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L3
	b .L4
.L3:
	mov r0, #0
	str r0, [sp, #0]
	b .L2
.L4:
	b .L5
.L5:
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	ldr r3, [sp, #4]
	mul r2, r2, r3
	mov r3, #0
	cmp r1, r2
	movlt r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L7
	b .L8
.L7:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r2, [sp, #8]
	mov r1, #1
	add r1, r2, r1
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	ldr r3, [sp, #4]
	mul r2, r2, r3
	mov r3, #0
	cmp r1, r2
	movlt r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L7
	b .L8
.L8:
	ldr r1, [sp, #4]
	mov r2, #1
	sub r1, r1, r2
	mov r0, r1
	bl function
	mov r0, r0
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size function, .-function


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #8
.L10:
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
	bl function
	mov r1, #0
	mov r1, r0
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L11
.L11:
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