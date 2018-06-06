	.arch armv7-a
.comm	swapped,4,4


.text
	.align 2
	.global deathSort
deathSort:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L4:
	mov r0, #1
	cmp r0, #1
	mov r0, r4
	beq .L6
	b .L7
.L6:
	mov r3, r0
	add r0, r3, #0
	ldr r0, [r0]
	mov r1, #0
	cmp r0, r3
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	mov r2, r3
	mov r1, r3
	mov r4, #0
	mov r0, r4
	mov r4, r4
	mov r3, r3
	beq .L8
	b .L9
.L8:
	mov r2, r2
	mov r1, r1
	mov r0, r0
	add r3, r2, #0
	ldr r4, [r3]
	add r3, r2, #8
	ldr r3, [r3]
	add r4, r4, #8
	ldr r4, [r4]
	sub r3, r3, r4
	mov r4, #0
	cmp r3, #0
	movgt r4, #1
	mov r3, r4
	mov r3, r3
	cmp r3, #1
	beq .L10
	b .L11
.L10:
	add r0, r2, #8
	ldr r0, [r0]
	add r3, r2, #0
	ldr r3, [r3]
	add r3, r3, #8
	ldr r4, [r3]
	add r3, r2, #8
	str r4, [r3]
	add r3, r2, #0
	ldr r3, [r3]
	add r3, r3, #8
	str r0, [r3]
	mov r2, r2
	mov r1, r1
	mov r0, #1
	mov r0, r0
	b .L12
.L11:
	mov r2, r2
	mov r1, r1
	mov r0, r0
	b .L12
.L12:
	mov r2, r2
	mov r3, r1
	mov r4, r0
	add r0, r2, #0
	ldr r0, [r0]
	add r1, r0, #0
	ldr r2, [r1]
	mov r1, #0
	cmp r2, r3
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r2, r0
	mov r1, r3
	mov r0, r4
	mov r4, r4
	mov r3, r3
	beq .L8
	b .L9
.L9:
	mov r0, r4
	mov r1, r3
	mov r2, #0
	cmp r0, #1
	moveq r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	mov r0, r1
	beq .L6
	b .L7
.L7:
	b .L5
.L5:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size deathSort, .-deathSort


	.align 2
	.global printEVILList
printEVILList:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L14:
	add r0, r4, #0
	ldr r5, [r0]
	add r0, r4, #8
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r4
	mov r0, r1
	bl free
	mov r0, #0
	cmp r5, r4
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r5
	mov r1, r4
	beq .L16
	b .L17
.L16:
	mov r5, r0
	mov r4, r1
	add r0, r5, #8
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r1, r5, #0
	ldr r6, [r1]
	mov r1, r5
	mov r0, r1
	bl free
	mov r0, #0
	cmp r6, r4
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r6
	mov r1, r4
	beq .L16
	b .L17
.L17:
	b .L15
.L15:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size printEVILList, .-printEVILList


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L19:
	movw r1, #:lower16:swapped
	movt r1, #:upper16:swapped
	movw r0, #:lower16:666
	movt r0, #:upper16:666
	str r0, [r1]
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
	mov r2, #0
	cmp r1, #0
	movle r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L21
	b .L22
.L21:
	mov r0, #-1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	mov r0, #1
	sub r0, r1, r0
	mov r0, #-1
	mov r0, r0
	b .L20
.L22:
	b .L23
.L23:
	movw r0, #:lower16:1000
	movt r0, #:upper16:1000
	mul r5, r1, r0
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r4, r1
	add r1, r4, #8
	str r5, [r1]
	add r1, r4, #4
	str r4, [r1]
	add r1, r4, #0
	str r4, [r1]
	mov r1, #1
	sub r1, r5, r1
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r3, r1
	mov r2, r4
	mov r1, r4
	mov r4, r4
	beq .L24
	b .L25
.L24:
	mov r5, r3
	mov r6, r2
	mov r4, r1
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	add r2, r1, #8
	str r5, [r2]
	add r2, r1, #4
	str r6, [r2]
	add r2, r1, #0
	str r4, [r2]
	add r2, r6, #0
	str r1, [r2]
	mov r2, #1
	sub r2, r5, r2
	mov r3, #0
	cmp r2, #0
	movgt r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	mov r3, r2
	mov r2, r1
	mov r1, r4
	mov r4, r4
	beq .L24
	b .L25
.L25:
	mov r4, r4
	mov r0, r4
	bl deathSort
	mov r0, r4
	bl printEVILList
	mov r0, #0
	mov r0, r0
	b .L20
.L20:
	mov r0, r0
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