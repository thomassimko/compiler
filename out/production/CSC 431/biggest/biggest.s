	.arch armv7-a


.text
	.align 2
	.global getIntList
getIntList:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #12
.L1:
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #4]
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
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, #0
	mov r2, #1
	sub r2, r1, r2
	mov r1, #0
	cmp r0, r2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0
	str r0, [r1]
	ldr r0, [sp, #4]
	add r1, r0, #4
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L2
.L4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0
	str r0, [r1]
	bl getIntList
	mov r0, r0
	ldr r1, [sp, #4]
	add r1, r1, #4
	str r0, [r1]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size getIntList, .-getIntList


	.align 2
	.global biggest
biggest:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r1, r1
	sub sp, sp, #12
.L7:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r2, r1
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L9
	b .L10
.L9:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L8
.L10:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L8
.L8:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size biggest, .-biggest


	.align 2
	.global biggestInList
biggestInList:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #12
.L13:
	str r2, [sp, #4]
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r3, [r2]
	mov r2, #0
	mov r4, #0
	cmp r3, r2
	movne r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L15
	b .L16
.L15:
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r3, r3, #0
	ldr r3, [r3]
	mov r0, r2
	mov r1, r3
	bl biggest
	mov r2, r0
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r2, [r2]
	str r2, [sp, #4]
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r2, [r2]
	mov r4, #0
	mov r3, #0
	cmp r2, r4
	movne r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L15
	b .L16
.L16:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L14
.L14:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size biggestInList, .-biggestInList


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #8
.L18:
	bl getIntList
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl biggestInList
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L19
.L19:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
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