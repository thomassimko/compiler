	.arch armv7-a
.comm	intList,4,4


.text
	.align 2
	.global length
length:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r2, r0
	sub sp, sp, #8
.L1:
	str r2, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	moveq r3, #1
	mov r1, r3
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
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl length
	mov r1, r0
	mov r0, #1
	add r0, r0, r1
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size length, .-length


	.align 2
	.global addToFront
addToFront:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r2, r0
	mov r0, r1
	sub sp, sp, #16
.L8:
	str r2, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r0, r1
	moveq r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L10
	b .L11
.L10:
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	add r1, r0, #0
	ldr r0, [sp, #8]
	str r0, [r1]
	ldr r0, [sp, #4]
	add r0, r0, #4
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L9
.L11:
	b .L12
.L12:
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	add r0, r0, #0
	ldr r1, [sp, #8]
	str r1, [r0]
	ldr r0, [sp, #12]
	add r1, r0, #4
	ldr r0, [sp, #4]
	str r0, [r1]
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L9
.L9:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size addToFront, .-addToFront


	.align 2
	.global deleteFirst
deleteFirst:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r2, r0
	sub sp, sp, #12
.L15:
	str r2, [sp, #4]
	ldr r3, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r3, r1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L17
	b .L18
.L17:
	mov r0, #0
	str r0, [sp, #0]
	b .L16
.L18:
	b .L19
.L19:
	ldr r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, #0
	mov r1, r0
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L16
.L16:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size deleteFirst, .-deleteFirst


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #12
.L22:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	str r2, [sp, #0]
	mov r2, #0
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #4]
	movw r2, #:lower16:intList
	movt r2, #:upper16:intList
	ldr r3, [r2]
	mov r2, #0
	cmp r3, #0
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L24
	b .L25
.L24:
	ldr r2, [sp, #4]
	movw r3, #:lower16:intList
	movt r3, #:upper16:intList
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl addToFront
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	movw r2, #:lower16:intList
	movt r2, #:upper16:intList
	ldr r2, [r2]
	mov r3, #1
	sub r2, r2, r3
	movw r3, #:lower16:intList
	movt r3, #:upper16:intList
	str r2, [r3]
	movw r2, #:lower16:intList
	movt r2, #:upper16:intList
	ldr r2, [r2]
	mov r3, #0
	cmp r2, #0
	movgt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L24
	b .L25
.L25:
	ldr r1, [sp, #4]
	mov r0, r1
	bl length
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl length
	mov r1, r0
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L26
	b .L27
.L26:
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	add r1, r1, r2
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r1
	bl length
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl deleteFirst
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl length
	mov r2, r0
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L26
	b .L27
.L27:
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L23
.L23:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
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