	.arch armv7-a


.text
	.align 2
	.global buildList
buildList:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #36
.L1:
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #12]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #16]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #20]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #24]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #28]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #32]
	ldr r0, [sp, #12]
	add r0, r0, #4
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r0, [sp, #16]
	add r0, r0, #4
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r0, [sp, #20]
	add r0, r0, #4
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r0, [sp, #24]
	add r0, r0, #4
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r0, [sp, #28]
	add r0, r0, #4
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r0, [sp, #32]
	add r0, r0, #4
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	str r0, [sp, #0]
	ldr r0, [sp, #12]
	add r1, r0, #0
	ldr r0, [sp, #16]
	str r0, [r1]
	ldr r0, [sp, #16]
	add r0, r0, #0
	ldr r1, [sp, #20]
	str r1, [r0]
	ldr r0, [sp, #20]
	add r0, r0, #0
	ldr r1, [sp, #24]
	str r1, [r0]
	ldr r0, [sp, #24]
	add r1, r0, #0
	ldr r0, [sp, #28]
	str r0, [r1]
	ldr r0, [sp, #28]
	add r1, r0, #0
	ldr r0, [sp, #32]
	str r0, [r1]
	ldr r0, [sp, #32]
	add r1, r0, #0
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #36
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size buildList, .-buildList


	.align 2
	.global multiple
multiple:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r1, r0
	sub sp, sp, #20
.L4:
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #16]
	ldr r0, [sp, #16]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #12]
	ldr r0, [sp, #16]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #16]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #5
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L6:
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	add r1, r1, #4
	ldr r1, [r1]
	mul r0, r0, r1
	str r0, [sp, #12]
	ldr r0, [sp, #16]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #16]
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #5
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L7:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L5
.L5:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size multiple, .-multiple


	.align 2
	.global add
add:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r1, r0
	sub sp, sp, #20
.L9:
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #16]
	ldr r0, [sp, #16]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #12]
	ldr r0, [sp, #16]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #16]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #5
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L11
	b .L12
.L11:
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	add r1, r1, #4
	ldr r1, [r1]
	add r0, r0, r1
	str r0, [sp, #12]
	ldr r0, [sp, #16]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #16]
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #8]
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #5
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L11
	b .L12
.L12:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L10
.L10:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size add, .-add


	.align 2
	.global recurseList
recurseList:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r1, r0
	sub sp, sp, #8
.L14:
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	moveq r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L16
	b .L17
.L16:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #0]
	b .L15
.L17:
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r4, [r1]
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	mov r0, r1
	bl recurseList
	mov r0, r0
	mul r0, r4, r0
	str r0, [sp, #0]
	b .L15
.L18:
	b .L15
.L15:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size recurseList, .-recurseList


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #28
.L22:
	mov r0, #0
	str r0, [sp, #24]
	mov r0, #0
	str r0, [sp, #20]
	bl buildList
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl multiple
	mov r1, r0
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r1
	bl add
	mov r0, r0
	str r0, [sp, #12]
	ldr r4, [sp, #8]
	ldr r0, [sp, #12]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	sub r1, r4, r1
	str r1, [sp, #16]
	ldr r2, [sp, #24]
	mov r1, #0
	cmp r2, #2
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L24
	b .L25
.L24:
	ldr r4, [sp, #20]
	ldr r1, [sp, #4]
	mov r0, r1
	bl recurseList
	mov r1, r0
	add r1, r4, r1
	str r1, [sp, #20]
	ldr r1, [sp, #24]
	mov r2, #1
	add r1, r1, r2
	str r1, [sp, #24]
	ldr r2, [sp, #24]
	mov r1, #0
	cmp r2, #2
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L24
	b .L25
.L25:
	ldr r0, [sp, #20]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #20]
	mov r1, #0
	cmp r0, #0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L26
	b .L27
.L26:
	ldr r1, [sp, #20]
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #20]
	ldr r1, [sp, #20]
	mov r0, #0
	cmp r1, #0
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L26
	b .L27
.L27:
	ldr r0, [sp, #16]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #20]
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
	add sp, sp, #28
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