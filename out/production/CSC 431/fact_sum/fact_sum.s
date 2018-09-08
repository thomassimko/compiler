	.arch armv7-a


.text
	.align 2
	.global sum
sum:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
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
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size sum, .-sum


	.align 2
	.global fact
fact:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #12
.L4:
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #0
	moveq r2, #1
	mov r2, r2
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
	beq .L9
	b .L10
.L9:
	mov r2, #0
	mov r1, #1
	sub r1, r2, r1
	ldr r2, [sp, #4]
	mul r1, r1, r2
	mov r0, r1
	bl fact
	mov r0, r0
	str r0, [sp, #0]
	b .L5
.L10:
	b .L11
.L11:
	ldr r4, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #1
	sub r1, r2, r1
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
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size fact, .-fact


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #16
.L13:
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
	beq .L15
	b .L16
.L15:
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
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	str r1, [r2, #0]
	ldr r1, [r2]
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
	ldr r3, [sp, #4]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
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
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	str r1, [r0, #0]
	ldr r0, [r0]
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	mov r1, #0
	mov r2, #1
	sub r2, r1, r2
	mov r1, #0
	cmp r0, r2
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L15
	b .L16
.L16:
	mov r0, #0
	str r0, [sp, #0]
	b .L14
.L14:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
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