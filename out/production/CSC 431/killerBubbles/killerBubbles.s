	.arch armv7-a
.comm	swapped,4,4


.text
	.align 2
	.global compare
compare:
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
	add r0, r0, #8
	ldr r0, [r0]
	ldr r1, [sp, #8]
	add r1, r1, #8
	ldr r1, [r1]
	sub r0, r0, r1
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size compare, .-compare


	.align 2
	.global deathSort
deathSort:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #16
.L4:
	str r2, [sp, #0]
	mov r2, #1
	str r2, [sp, #4]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #1
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L6
	b .L7
.L6:
	mov r2, #0
	str r2, [sp, #4]
	ldr r2, [sp, #0]
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	add r2, r2, #0
	ldr r2, [r2]
	ldr r3, [sp, #0]
	mov r4, #0
	cmp r2, r3
	movne r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L8
	b .L9
.L8:
	ldr r2, [sp, #12]
	ldr r3, [sp, #12]
	add r3, r3, #0
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl compare
	mov r2, r0
	mov r3, #0
	cmp r2, #0
	movgt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L10
	b .L11
.L10:
	ldr r2, [sp, #12]
	add r2, r2, #8
	ldr r2, [r2]
	str r2, [sp, #8]
	ldr r2, [sp, #12]
	add r2, r2, #0
	ldr r2, [r2]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r3, [sp, #12]
	add r3, r3, #8
	str r2, [r3]
	ldr r2, [sp, #8]
	ldr r3, [sp, #12]
	add r3, r3, #0
	ldr r3, [r3]
	add r3, r3, #8
	str r2, [r3]
	mov r2, #1
	str r2, [sp, #4]
	b .L12
.L11:
	b .L12
.L12:
	ldr r2, [sp, #12]
	add r2, r2, #0
	ldr r2, [r2]
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	add r2, r2, #0
	ldr r4, [r2]
	ldr r2, [sp, #0]
	mov r3, #0
	cmp r4, r2
	movne r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L8
	b .L9
.L9:
	ldr r2, [sp, #4]
	mov r3, #0
	cmp r2, #1
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L6
	b .L7
.L7:
	b .L5
.L5:
	add sp, sp, #16
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
	mov r2, r0
	sub sp, sp, #12
.L14:
	str r2, [sp, #0]
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, [sp, #0]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #0]
	mov r1, r1
	mov r0, r1
	bl free
	ldr r1, [sp, #4]
	ldr r0, [sp, #0]
	mov r2, #0
	cmp r1, r0
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L16
	b .L17
.L16:
	ldr r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	mov r1, r1
	mov r0, r1
	bl free
	ldr r2, [sp, #4]
	ldr r0, [sp, #0]
	mov r1, #0
	cmp r2, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L16
	b .L17
.L17:
	b .L15
.L15:
	add sp, sp, #12
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
	sub sp, sp, #24
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
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	str r2, [r1, #0]
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #0
	movle r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L21
	b .L22
.L21:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #0]
	b .L20
.L22:
	b .L23
.L23:
	ldr r1, [sp, #4]
	movw r0, #:lower16:1000
	movt r0, #:upper16:1000
	mul r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #16]
	ldr r1, [sp, #8]
	ldr r2, [sp, #16]
	add r2, r2, #8
	str r1, [r2]
	ldr r1, [sp, #16]
	ldr r2, [sp, #16]
	add r2, r2, #4
	str r1, [r2]
	ldr r1, [sp, #16]
	ldr r2, [sp, #16]
	add r2, r2, #0
	str r1, [r2]
	ldr r2, [sp, #8]
	mov r1, #1
	sub r1, r2, r1
	str r1, [sp, #8]
	ldr r1, [sp, #16]
	str r1, [sp, #20]
	ldr r2, [sp, #8]
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L24
	b .L25
.L24:
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #12]
	ldr r1, [sp, #8]
	ldr r2, [sp, #12]
	add r2, r2, #8
	str r1, [r2]
	ldr r1, [sp, #20]
	ldr r2, [sp, #12]
	add r2, r2, #4
	str r1, [r2]
	ldr r1, [sp, #16]
	ldr r2, [sp, #12]
	add r2, r2, #0
	str r1, [r2]
	ldr r1, [sp, #12]
	ldr r2, [sp, #20]
	add r2, r2, #0
	str r1, [r2]
	ldr r1, [sp, #12]
	str r1, [sp, #20]
	ldr r2, [sp, #8]
	mov r1, #1
	sub r1, r2, r1
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L24
	b .L25
.L25:
	ldr r1, [sp, #16]
	mov r0, r1
	bl deathSort
	ldr r1, [sp, #16]
	mov r0, r1
	bl printEVILList
	mov r0, #0
	str r0, [sp, #0]
	b .L20
.L20:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #24
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