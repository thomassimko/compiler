	.arch armv7-a
.comm	interval,4,4
.comm	end,4,4


.text
	.align 2
	.global multBy4xTimes
multBy4xTimes:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	mov r2, r1
	sub sp, sp, #0
.L1:
	mov r3, #0
	cmp r2, #0
	movle r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L3
	b .L4
.L3:
	add r0, r4, #0
	ldr r0, [r0]
	mov r0, r0
	b .L2
.L4:
	b .L5
.L5:
	add r3, r4, #0
	ldr r5, [r3]
	mov r3, #4
	mul r5, r3, r5
	add r3, r4, #0
	str r5, [r3]
	mov r3, #1
	sub r2, r2, r3
	mov r0, r4
	mov r1, r2
	bl multBy4xTimes
	add r0, r4, #0
	ldr r0, [r0]
	mov r0, r0
	b .L2
.L2:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size multBy4xTimes, .-multBy4xTimes


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L10:
	mov r0, #4
	bl malloc
	mov r0, r0
	mov r4, r0
	movw r1, #:lower16:end
	movt r1, #:upper16:end
	movw r0, #:lower16:1000000
	movt r0, #:upper16:1000000
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
	ldr r5, [r0]
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
	movw r1, #:lower16:interval
	movt r1, #:upper16:interval
	str r0, [r1]
	mov r1, r5
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:interval
	movt r0, #:upper16:interval
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r2, #1
	cmp r2, #1
	mov r6, r4
	mov r2, #0
	mov r3, r2
	mov r5, #0
	mov r2, r5
	mov r4, #0
	mov r4, r4
	mov r5, r5
	beq .L12
	b .L13
.L12:
	mov r8, r6
	mov r6, r3
	mov r5, r2
	movw r2, #:lower16:end
	movt r2, #:upper16:end
	ldr r2, [r2]
	mov r7, #0
	mov r3, #0
	cmp r7, r2
	movle r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	mov r4, r7
	mov r3, r8
	mov r2, r6
	mov r6, r6
	mov r8, r8
	mov r7, r7
	mov r5, r5
	beq .L14
	b .L15
.L14:
	mov r5, r4
	mov r6, r3
	mov r4, r2
	movw r2, #:lower16:3628800
	movt r2, #:upper16:3628800
	mov r3, #11
	mul r2, r2, r3
	mov r2, #1
	add r5, r5, r2
	add r2, r6, #0
	str r5, [r2]
	mov r0, r6
	mov r2, #2
	mov r1, r2
	bl multBy4xTimes
	add r0, r6, #0
	ldr r0, [r0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	add r0, r6, #0
	str r1, [r0]
	add r0, r6, #0
	ldr r0, [r0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	add r0, r6, #0
	str r1, [r0]
	add r0, r6, #0
	ldr r0, [r0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	add r3, r6, #0
	str r2, [r3]
	movw r2, #:lower16:interval
	movt r2, #:upper16:interval
	ldr r2, [r2]
	mov r3, #1
	sub r2, r2, r3
	mov r3, #0
	cmp r2, #0
	movle r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L16
	b .L17
.L16:
	mov r3, r5
	mov r2, #1
	mov r5, r2
	mov r6, r6
	mov r4, r4
	movw r2, #:lower16:39916800
	movt r2, #:upper16:39916800
	mov r2, r2
	b .L18
.L17:
	mov r3, r5
	mov r5, r2
	mov r6, r6
	mov r4, r4
	movw r2, #:lower16:39916800
	movt r2, #:upper16:39916800
	mov r2, r2
	b .L18
.L18:
	mov r3, r3
	mov r5, r5
	mov r7, r6
	mov r6, r4
	mov r2, r2
	add r5, r3, r5
	movw r2, #:lower16:end
	movt r2, #:upper16:end
	ldr r2, [r2]
	mov r3, #0
	cmp r5, r2
	movle r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	mov r4, r5
	mov r3, r7
	mov r2, r6
	mov r6, r6
	mov r8, r7
	mov r7, r5
	movw r5, #:lower16:39916800
	movt r5, #:upper16:39916800
	mov r5, r5
	beq .L14
	b .L15
.L15:
	mov r2, r6
	mov r3, r8
	mov r4, r7
	mov r5, r5
	mov r6, #1
	add r2, r2, r6
	mov r6, #0
	cmp r2, #50
	movlt r6, #1
	mov r6, r6
	mov r6, r6
	cmp r6, #1
	mov r6, r3
	mov r3, r2
	mov r2, r5
	mov r4, r4
	mov r5, r5
	beq .L12
	b .L13
.L13:
	mov r0, r4
	mov r4, r5
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L11
.L11:
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