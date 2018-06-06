	.arch armv7-a


.text
	.align 2
	.global multiple
multiple:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #0
.L4:
	add r0, r1, #4
	ldr r3, [r0]
	add r0, r1, #0
	ldr r1, [r0]
	mov r0, #1
	cmp r0, #1
	mov r0, r3
	mov r2, r1
	mov r1, #0
	mov r1, r1
	mov r3, r3
	beq .L6
	b .L7
.L6:
	mov r3, r0
	mov r0, r2
	mov r6, r1
	add r1, r0, #4
	ldr r1, [r1]
	mul r4, r3, r1
	add r0, r0, #0
	ldr r5, [r0]
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #1
	add r1, r6, r0
	mov r0, #0
	cmp r1, #5
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r4
	mov r2, r5
	mov r1, r1
	mov r3, r4
	beq .L6
	b .L7
.L7:
	mov r0, r3
	b .L5
.L5:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size multiple, .-multiple


	.align 2
	.global add
add:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #0
.L9:
	add r0, r1, #4
	ldr r3, [r0]
	add r0, r1, #0
	ldr r1, [r0]
	mov r0, #1
	cmp r0, #1
	mov r0, r3
	mov r2, r1
	mov r1, #0
	mov r1, r1
	mov r3, r3
	beq .L11
	b .L12
.L11:
	mov r3, r0
	mov r0, r2
	mov r6, r1
	add r1, r0, #4
	ldr r1, [r1]
	add r4, r3, r1
	add r0, r0, #0
	ldr r5, [r0]
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #1
	add r1, r6, r0
	mov r0, #0
	cmp r1, #5
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r4
	mov r2, r5
	mov r1, r1
	mov r3, r4
	beq .L11
	b .L12
.L12:
	mov r0, r3
	b .L10
.L10:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size add, .-add


	.align 2
	.global recurseList
recurseList:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #0
.L14:
	add r2, r1, #0
	ldr r2, [r2]
	mov r3, #0
	mov r4, #0
	cmp r2, r3
	moveq r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L16
	b .L17
.L16:
	add r0, r1, #4
	ldr r0, [r0]
	mov r0, r0
	b .L15
.L17:
	add r2, r1, #4
	ldr r4, [r2]
	add r1, r1, #0
	ldr r1, [r1]
	mov r0, r1
	bl recurseList
	mov r0, r0
	mul r0, r4, r0
	mov r0, r0
	b .L15
.L15:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size recurseList, .-recurseList


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L20:
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r4, r0
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r9, r0
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r7, r0
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r5, r0
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r6, r0
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r8, r0
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
	add r1, r4, #4
	str r0, [r1]
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
	add r1, r9, #4
	str r0, [r1]
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
	add r1, r7, #4
	str r0, [r1]
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
	add r1, r5, #4
	str r0, [r1]
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
	ldr r1, [r0]
	add r0, r6, #4
	str r1, [r0]
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
	add r2, r8, #4
	str r1, [r2]
	add r1, r4, #0
	str r9, [r1]
	add r1, r9, #0
	str r7, [r1]
	add r1, r7, #0
	str r5, [r1]
	add r1, r5, #0
	str r6, [r1]
	add r1, r6, #0
	str r8, [r1]
	add r2, r8, #0
	mov r1, #0
	str r1, [r2]
	mov r0, r4
	bl multiple
	mov r5, r0
	mov r0, r4
	bl add
	mov r0, r0
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	sub r6, r5, r1
	mov r1, #1
	cmp r1, #1
	mov r7, #0
	mov r2, r7
	mov r5, r4
	mov r1, #0
	mov r3, r1
	mov r1, r6
	mov r7, r7
	mov r4, r6
	beq .L22
	b .L23
.L22:
	mov r6, r2
	mov r5, r5
	mov r7, r3
	mov r4, r1
	mov r0, r5
	bl recurseList
	mov r1, r0
	add r6, r6, r1
	mov r1, #1
	add r1, r7, r1
	mov r2, #0
	cmp r1, #2
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r6
	mov r5, r5
	mov r3, r1
	mov r1, r4
	mov r7, r6
	mov r4, r4
	beq .L22
	b .L23
.L23:
	mov r5, r7
	mov r4, r4
	mov r1, r5
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	cmp r5, #0
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r1, r5
	mov r0, r4
	mov r2, r4
	mov r3, r5
	beq .L24
	b .L25
.L24:
	mov r1, r1
	mov r2, r0
	mov r0, #1
	sub r3, r1, r0
	mov r0, #0
	cmp r3, #0
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r1, r3
	mov r0, r2
	mov r2, r2
	mov r3, r3
	beq .L24
	b .L25
.L25:
	mov r0, r2
	mov r4, r3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L21
.L21:
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