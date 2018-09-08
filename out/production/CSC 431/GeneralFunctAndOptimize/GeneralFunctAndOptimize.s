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
	mov r2, r0
	mov r3, r1
	sub sp, sp, #12
.L1:
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #0
	movle r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #0]
	b .L2
.L4:
	b .L5
.L5:
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r3, [r2]
	mov r2, #4
	mul r2, r2, r3
	ldr r3, [sp, #4]
	add r3, r3, #0
	str r2, [r3]
	ldr r2, [sp, #4]
	ldr r4, [sp, #8]
	mov r3, #1
	sub r3, r4, r3
	mov r0, r2
	mov r1, r3
	bl multBy4xTimes
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size multBy4xTimes, .-multBy4xTimes


	.align 2
	.global divideBy8
divideBy8:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #4
.L7:
	str r2, [sp, #0]
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	ldr r1, [sp, #0]
	add r1, r1, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	ldr r1, [sp, #0]
	add r1, r1, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	ldr r1, [sp, #0]
	add r1, r1, #0
	str r0, [r1]
	b .L8
.L8:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size divideBy8, .-divideBy8


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #40
.L10:
	mov r0, #4
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #28]
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
	movw r0, #:lower16:.read_scratch
	movt r0, #:upper16:.read_scratch
	ldr r0, [r0]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	str r0, [r1, #0]
	ldr r0, [r1]
	movw r1, #:lower16:interval
	movt r1, #:upper16:interval
	str r0, [r1]
	ldr r0, [sp, #4]
	mov r1, r0
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
	mov r2, #0
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #12]
	mov r2, #0
	str r2, [sp, #16]
	ldr r3, [sp, #8]
	mov r2, #0
	cmp r3, #50
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L12
	b .L13
.L12:
	mov r2, #0
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	movw r3, #:lower16:end
	movt r3, #:upper16:end
	ldr r3, [r3]
	mov r4, #0
	cmp r2, r3
	movle r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L14
	b .L15
.L14:
	mov r3, #1
	mov r2, #2
	mul r3, r3, r2
	mov r2, #3
	mul r3, r3, r2
	mov r2, #4
	mul r2, r3, r2
	mov r3, #5
	mul r2, r2, r3
	mov r3, #6
	mul r2, r2, r3
	mov r3, #7
	mul r2, r2, r3
	mov r3, #8
	mul r2, r2, r3
	mov r3, #9
	mul r3, r2, r3
	mov r2, #10
	mul r3, r3, r2
	mov r2, #11
	mul r2, r3, r2
	str r2, [sp, #16]
	ldr r3, [sp, #12]
	mov r2, #1
	add r2, r3, r2
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	ldr r3, [sp, #28]
	add r3, r3, #0
	str r2, [r3]
	ldr r2, [sp, #28]
	add r2, r2, #0
	ldr r2, [r2]
	str r2, [sp, #20]
	ldr r2, [sp, #28]
	mov r0, r2
	mov r2, #2
	mov r1, r2
	bl multBy4xTimes
	ldr r1, [sp, #28]
	mov r0, r1
	bl divideBy8
	movw r2, #:lower16:interval
	movt r2, #:upper16:interval
	ldr r3, [r2]
	mov r2, #1
	sub r2, r3, r2
	str r2, [sp, #24]
	ldr r3, [sp, #24]
	mov r2, #0
	cmp r3, #0
	movle r2, #1
	mov r2, r2
	str r2, [sp, #32]
	ldr r3, [sp, #24]
	mov r2, #0
	cmp r3, #0
	movle r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L16
	b .L17
.L16:
	mov r2, #1
	str r2, [sp, #24]
	b .L18
.L17:
	b .L18
.L18:
	ldr r3, [sp, #12]
	ldr r2, [sp, #24]
	add r2, r3, r2
	str r2, [sp, #12]
	ldr r2, [sp, #12]
	movw r3, #:lower16:end
	movt r3, #:upper16:end
	ldr r3, [r3]
	mov r4, #0
	cmp r2, r3
	movle r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L14
	b .L15
.L15:
	ldr r2, [sp, #8]
	mov r3, #1
	add r2, r2, r3
	str r2, [sp, #8]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #50
	movlt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L12
	b .L13
.L13:
	ldr r0, [sp, #12]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #16]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L11
.L11:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #40
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