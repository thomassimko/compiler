	.arch armv7-a
.comm	intList,4,4


.text
	.align 2
	.global length
length:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L1:
	mov r2, #0
	mov r1, #0
	cmp r4, r2
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
	b .L5
.L5:
	add r1, r4, #4
	ldr r1, [r1]
	mov r0, r1
	bl length
	mov r1, r0
	mov r0, #1
	add r0, r0, r1
	mov r0, r0
	b .L2
.L2:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size length, .-length


	.align 2
	.global addToFront
addToFront:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	mov r5, r1
	sub sp, sp, #0
.L7:
	mov r1, #0
	mov r0, #0
	cmp r4, r1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L9
	b .L10
.L9:
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	add r1, r0, #0
	str r5, [r1]
	add r2, r0, #4
	mov r1, #0
	str r1, [r2]
	mov r0, r0
	b .L8
.L10:
	b .L11
.L11:
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	add r1, r0, #0
	str r5, [r1]
	add r1, r0, #4
	str r4, [r1]
	mov r0, r0
	b .L8
.L8:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size addToFront, .-addToFront


	.align 2
	.global deleteFirst
deleteFirst:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L13:
	mov r2, #0
	mov r1, #0
	cmp r4, r2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L15
	b .L16
.L15:
	mov r0, #0
	mov r0, r0
	b .L14
.L16:
	b .L17
.L17:
	add r1, r4, #4
	ldr r5, [r1]
	mov r1, r4
	mov r0, r1
	bl free
	mov r0, r5
	b .L14
.L14:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size deleteFirst, .-deleteFirst


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L19:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	str r2, [r3, #0]
	ldr r2, [r3]
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
	mov r4, #0
	mov r2, r4
	mov r5, #0
	mov r3, r5
	mov r4, r4
	mov r5, r5
	beq .L21
	b .L22
.L21:
	mov r2, r2
	mov r3, r3
	movw r3, #:lower16:intList
	movt r3, #:upper16:intList
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl addToFront
	mov r4, r0
	add r0, r4, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	movw r2, #:lower16:intList
	movt r2, #:upper16:intList
	ldr r3, [r2]
	mov r2, #1
	sub r3, r3, r2
	movw r2, #:lower16:intList
	movt r2, #:upper16:intList
	str r3, [r2]
	movw r2, #:lower16:intList
	movt r2, #:upper16:intList
	ldr r2, [r2]
	mov r3, #0
	cmp r2, #0
	movgt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	mov r2, r4
	mov r3, #0
	mov r3, r3
	mov r4, r4
	mov r5, #0
	mov r5, r5
	beq .L21
	b .L22
.L22:
	mov r4, r4
	mov r1, r5
	mov r0, r4
	bl length
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, r4
	bl length
	mov r1, r0
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	mov r1, #0
	mov r1, r1
	mov r2, r4
	mov r3, #0
	mov r3, r3
	beq .L23
	b .L24
.L23:
	mov r1, r1
	mov r5, r2
	add r2, r5, #0
	ldr r2, [r2]
	add r4, r1, r2
	mov r0, r5
	bl length
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, r5
	bl deleteFirst
	mov r5, r0
	mov r0, r5
	bl length
	mov r2, r0
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r4
	mov r2, r5
	mov r3, r4
	beq .L23
	b .L24
.L24:
	mov r0, r3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L20
.L20:
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