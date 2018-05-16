	.arch armv7-a
.comm	peg1,4,4
.comm	peg2,4,4
.comm	peg3,4,4
.comm	numMoves,4,4


.text
	.align 2
	.global move
move:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r7, r0
	mov r5, r1
	sub sp, sp, #12
.L1:
	str r7, [sp, #0]
	str r5, [sp, #4]
	ldr r1, [sp, #0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	movw r0, #:lower16:peg1
	movt r0, #:upper16:peg1
	ldr r0, [r0]
	str r0, [sp, #8]
	movw r0, #:lower16:peg1
	movt r0, #:upper16:peg1
	ldr r0, [r0]
	add r0, r0, #0
	ldr r1, [r0]
	movw r0, #:lower16:peg1
	movt r0, #:upper16:peg1
	str r1, [r0]
	b .L5
.L4:
	ldr r1, [sp, #0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L5:
	ldr r0, [sp, #4]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L9
	b .L10
.L6:
	movw r0, #:lower16:peg2
	movt r0, #:upper16:peg2
	ldr r0, [r0]
	str r0, [sp, #8]
	movw r0, #:lower16:peg2
	movt r0, #:upper16:peg2
	ldr r0, [r0]
	add r0, r0, #0
	ldr r0, [r0]
	movw r1, #:lower16:peg2
	movt r1, #:upper16:peg2
	str r0, [r1]
	b .L8
.L7:
	movw r0, #:lower16:peg3
	movt r0, #:upper16:peg3
	ldr r0, [r0]
	str r0, [sp, #8]
	movw r0, #:lower16:peg3
	movt r0, #:upper16:peg3
	ldr r0, [r0]
	add r0, r0, #0
	ldr r1, [r0]
	movw r0, #:lower16:peg3
	movt r0, #:upper16:peg3
	str r1, [r0]
	b .L8
.L8:
	b .L5
.L9:
	ldr r0, [sp, #8]
	add r0, r0, #0
	movw r1, #:lower16:peg1
	movt r1, #:upper16:peg1
	ldr r1, [r1]
	str r1, [r0]
	ldr r1, [sp, #8]
	movw r0, #:lower16:peg1
	movt r0, #:upper16:peg1
	str r1, [r0]
	b .L11
.L10:
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L12
	b .L13
.L11:
	movw r0, #:lower16:numMoves
	movt r0, #:upper16:numMoves
	ldr r0, [r0]
	mov r1, #1
	add r0, r0, r1
	movw r1, #:lower16:numMoves
	movt r1, #:upper16:numMoves
	str r0, [r1]
	b .L2
.L12:
	ldr r0, [sp, #8]
	add r0, r0, #0
	movw r1, #:lower16:peg2
	movt r1, #:upper16:peg2
	ldr r1, [r1]
	str r1, [r0]
	ldr r0, [sp, #8]
	movw r1, #:lower16:peg2
	movt r1, #:upper16:peg2
	str r0, [r1]
	b .L14
.L13:
	ldr r0, [sp, #8]
	add r0, r0, #0
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	str r1, [r0]
	ldr r0, [sp, #8]
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	str r0, [r1]
	b .L14
.L14:
	b .L11
.L2:
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size move, .-move


	.align 2
	.global hanoi
hanoi:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r6, r0
	mov r7, r1
	mov r5, r3
	mov r4, r2
	sub sp, sp, #16
.L16:
	str r6, [sp, #0]
	str r7, [sp, #4]
	str r5, [sp, #8]
	str r4, [sp, #12]
	ldr r4, [sp, #0]
	mov r5, #0
	cmp r4, #1
	moveq r5, #1
	mov r4, r5
	mov r4, r4
	cmp r4, #1
	beq .L18
	b .L19
.L18:
	ldr r3, [sp, #4]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl move
	mov r1, #0
	mov r1, r0
	b .L20
.L19:
	ldr r5, [sp, #0]
	mov r4, #1
	sub r7, r5, r4
	ldr r6, [sp, #4]
	ldr r5, [sp, #12]
	ldr r4, [sp, #8]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, r4
	bl hanoi
	mov r2, #0
	mov r2, r0
	ldr r3, [sp, #4]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl move
	mov r4, #0
	mov r4, r0
	ldr r5, [sp, #0]
	mov r4, #1
	sub r7, r5, r4
	ldr r6, [sp, #12]
	ldr r5, [sp, #8]
	ldr r4, [sp, #4]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	mov r2, r4
	bl hanoi
	mov r1, #0
	mov r1, r0
	b .L20
.L20:
	b .L17
.L17:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size hanoi, .-hanoi


	.align 2
	.global printPeg
printPeg:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	sub sp, sp, #8
.L22:
	str r0, [sp, #0]
	ldr r0, [sp, #0]
	str r0, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	mov r0, #0
	cmp r2, r1
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L24
	b .L25
.L24:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r0, r1
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L24
	b .L25
.L25:
	b .L23
.L23:
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size printPeg, .-printPeg


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #16
.L27:
	movw r1, #:lower16:peg1
	movt r1, #:upper16:peg1
	mov r0, #0
	str r0, [r1]
	movw r1, #:lower16:peg2
	movt r1, #:upper16:peg2
	mov r0, #0
	str r0, [r1]
	movw r0, #:lower16:peg3
	movt r0, #:upper16:peg3
	mov r1, #0
	str r1, [r0]
	movw r1, #:lower16:numMoves
	movt r1, #:upper16:numMoves
	mov r0, #0
	str r0, [r1]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	ldr r1, [r1]
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	mov r2, #0
	cmp r1, #1
	movge r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L29
	b .L30
.L29:
	ldr r1, [sp, #8]
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #0
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L32
	b .L33
.L30:
	b .L31
.L31:
	mov r0, #0
	str r0, [sp, #0]
	b .L28
.L32:
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #12]
	ldr r1, [sp, #12]
	add r1, r1, #4
	ldr r2, [sp, #4]
	str r2, [r1]
	ldr r1, [sp, #12]
	add r1, r1, #0
	movw r2, #:lower16:peg1
	movt r2, #:upper16:peg1
	ldr r2, [r2]
	str r2, [r1]
	ldr r1, [sp, #12]
	movw r2, #:lower16:peg1
	movt r2, #:upper16:peg1
	str r1, [r2]
	ldr r2, [sp, #4]
	mov r1, #1
	sub r1, r2, r1
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r1, #0
	movne r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L32
	b .L33
.L33:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg1
	movt r1, #:upper16:peg1
	ldr r1, [r1]
	mov r0, r1
	bl printPeg
	mov r1, #0
	mov r1, r0
	mov r0, #2
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg2
	movt r1, #:upper16:peg2
	ldr r1, [r1]
	mov r0, r1
	bl printPeg
	mov r1, #0
	mov r1, r0
	mov r0, #3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	mov r0, r1
	bl printPeg
	mov r4, #0
	mov r4, r0
	ldr r4, [sp, #8]
	mov r0, r4
	mov r4, #1
	mov r1, r4
	mov r4, #3
	mov r3, r4
	mov r4, #2
	mov r2, r4
	bl hanoi
	mov r1, #0
	mov r1, r0
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg1
	movt r1, #:upper16:peg1
	ldr r1, [r1]
	mov r0, r1
	bl printPeg
	mov r1, #0
	mov r1, r0
	mov r0, #2
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg2
	movt r1, #:upper16:peg2
	ldr r1, [r1]
	mov r0, r1
	bl printPeg
	mov r1, #0
	mov r1, r0
	mov r0, #3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	mov r0, r1
	bl printPeg
	mov r1, #0
	mov r1, r0
	movw r0, #:lower16:numMoves
	movt r0, #:upper16:numMoves
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	mov r3, #0
	mov r2, #0
	cmp r1, r3
	movne r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L34
	b .L35
.L34:
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	str r1, [sp, #12]
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	add r1, r1, #0
	ldr r1, [r1]
	movw r2, #:lower16:peg3
	movt r2, #:upper16:peg3
	str r1, [r2]
	ldr r1, [sp, #12]
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, #0
	mov r1, r0
	movw r1, #:lower16:peg3
	movt r1, #:upper16:peg3
	ldr r1, [r1]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	movne r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L34
	b .L35
.L35:
	b .L31
.L28:
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