	.arch armv7-a


.text
	.align 2
	.global sum
sum:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	mov r1, r1
	sub sp, sp, #12
.L1:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r0, r1
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size sum, .-sum


	.align 2
	.global fact
fact:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r1, r0
	sub sp, sp, #12
.L4:
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	ldr r2, [sp, #4]
	mov r3, #0
	cmp r2, #0
	moveq r3, #1
	mov r2, r3
	orr r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L6
	b .L7
.L6:
	mov r0, #1
	str r0, [sp, #0]
	b .L5
.L7:
	b .L8
.L8:
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #1
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L10
	b .L11
.L10:
	mov r2, #0
	mov r1, #1
	sub r2, r2, r1
	ldr r1, [sp, #4]
	mul r1, r2, r1
	mov r0, r1
	bl fact
	mov r0, r0
	str r0, [sp, #0]
	b .L5
.L11:
	b .L12
.L12:
	ldr r4, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #1
	sub r1, r1, r2
	mov r0, r1
	bl fact
	mov r0, r0
	mul r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L5
.L5:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size fact, .-fact


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #16
.L15:
	mov r0, #0
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	mov r2, #0
	mov r1, #1
	sub r2, r2, r1
	mov r1, #0
	cmp r0, r2
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L17
	b .L18
.L17:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r1
	bl fact
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, r1
	bl fact
	mov r2, r0
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl sum
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	mov r2, #0
	mov r1, #1
	sub r2, r2, r1
	mov r1, #0
	cmp r0, r2
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L17
	b .L18
.L18:
	mov r0, #0
	str r0, [sp, #0]
	b .L16
.L16:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
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