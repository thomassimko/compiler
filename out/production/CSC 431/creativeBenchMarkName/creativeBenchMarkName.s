	.arch armv7-a


.text
	.align 2
	.global wait
wait:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #8
.L1:
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #4]
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L4:
	mov r0, #0
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size wait, .-wait


	.align 2
	.global power
power:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r1, r1
	sub sp, sp, #16
.L6:
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #1
	str r0, [sp, #12]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L8
	b .L9
.L8:
	ldr r0, [sp, #12]
	ldr r1, [sp, #4]
	mul r0, r0, r1
	str r0, [sp, #12]
	ldr r1, [sp, #8]
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L8
	b .L9
.L9:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L7
.L7:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size power, .-power


	.align 2
	.global recursiveDecimalSum
recursiveDecimalSum:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	mov r3, r1
	mov r2, r2
	sub sp, sp, #28
.L11:
	str r4, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #12]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #0
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L13
	b .L14
.L13:
	mov r0, #2
	str r0, [sp, #20]
	ldr r0, [sp, #4]
	mov r1, #10
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	str r2, [sp, #16]
	ldr r2, [sp, #16]
	mov r3, #10
	mul r2, r2, r3
	str r2, [sp, #16]
	ldr r3, [sp, #4]
	ldr r2, [sp, #16]
	sub r2, r3, r2
	str r2, [sp, #16]
	ldr r3, [sp, #16]
	mov r2, #0
	cmp r3, #1
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L16
	b .L17
.L14:
	b .L15
.L15:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L12
.L16:
	ldr r4, [sp, #8]
	ldr r2, [sp, #20]
	ldr r3, [sp, #12]
	mov r0, r2
	mov r1, r3
	bl power
	mov r0, r0
	add r0, r4, r0
	str r0, [sp, #8]
	b .L18
.L17:
	b .L18
.L18:
	ldr r0, [sp, #4]
	mov r1, #10
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r4, r0
	ldr r3, [sp, #8]
	ldr r5, [sp, #12]
	mov r6, #1
	add r5, r5, r6
	mov r0, r4
	mov r1, r3
	mov r2, r5
	bl recursiveDecimalSum
	mov r0, r0
	str r0, [sp, #0]
	b .L12
.L12:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size recursiveDecimalSum, .-recursiveDecimalSum


	.align 2
	.global convertToDecimal
convertToDecimal:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #16
.L20:
	str r4, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #12]
	ldr r3, [sp, #4]
	ldr r5, [sp, #12]
	ldr r4, [sp, #8]
	mov r0, r3
	mov r1, r5
	mov r2, r4
	bl recursiveDecimalSum
	mov r0, r0
	str r0, [sp, #0]
	b .L21
.L21:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size convertToDecimal, .-convertToDecimal


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #12
.L23:
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
	ldr r1, [sp, #4]
	mov r0, r1
	bl convertToDecimal
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	ldr r2, [sp, #4]
	mul r1, r1, r2
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L25
	b .L26
.L25:
	ldr r1, [sp, #8]
	mov r0, r1
	bl wait
	ldr r2, [sp, #8]
	mov r1, #1
	sub r1, r2, r1
	str r1, [sp, #8]
	ldr r2, [sp, #8]
	mov r1, #0
	cmp r2, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L25
	b .L26
.L26:
	ldr r0, [sp, #4]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L24
.L24:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
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