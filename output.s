	.arch armv7-a


.text
	.align 2
	.global function
function:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r1, r0
	sub sp, sp, #0
.L1:
	mov r2, #0
	cmp r1, #0
	movle r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L3
	b .L4
.L3:
	b .L2
.L4:
	b .L5
.L5:
	mul r3, r1, r1
	mov r1, #0
	mov r2, #0
	cmp r1, r3
	movlt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L6
	b .L7
.L6:
	add r0, r4, r4
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, #1
	add r1, r4, r1
	mul r3, r4, r4
	mov r2, #0
	cmp r1, r3
	movlt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L6
	b .L7
.L7:
	mov r1, #1
	sub r1, r4, r1
	mov r0, r1
	bl function
	mov r0, r0
	b .L2
.L2:
	mov r0, r4
	add sp, sp, #0
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
	sub sp, sp, #0
.L9:
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
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	mov r0, r1
	bl function
	mov r1, #0
	mov r1, r0
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L10
.L10:
	mov r0, r4
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