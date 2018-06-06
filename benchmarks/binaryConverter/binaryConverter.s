	.arch armv7-a


.text
	.align 2
	.global wait
wait:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #0
.L1:
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r0, r0
	beq .L3
	b .L4
.L3:
	mov r0, r0
	mov r1, #1
	sub r0, r0, r1
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r0, r0
	beq .L3
	b .L4
.L4:
	b .L2
.L2:
	mov r0, #0
	mov r0, r0
	add sp, sp, #0
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
	mov r2, r0
	mov r4, r1
	sub sp, sp, #0
.L6:
	mov r0, #0
	cmp r4, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r1, #1
	mov r0, r1
	mov r3, r2
	mov r2, r4
	mov r1, r1
	beq .L8
	b .L9
.L8:
	mov r0, r0
	mov r3, r3
	mov r2, r2
	mul r1, r0, r3
	mov r0, #1
	sub r2, r2, r0
	mov r0, #0
	cmp r2, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r1
	mov r3, r3
	mov r2, r2
	mov r1, r1
	beq .L8
	b .L9
.L9:
	mov r0, r1
	b .L7
.L7:
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	mov r5, r1
	mov r4, r2
	sub sp, sp, #0
.L11:
	mov r2, #0
	cmp r6, #0
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L13
	b .L14
.L13:
	mov r0, #10
	mov r1, r0
	mov r0, r6
	bl __aeabi_idiv
	mov r2, r0
	mov r3, #10
	mul r2, r2, r3
	sub r3, r6, r2
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
	mov r0, r5
	b .L12
.L16:
	mov r2, #2
	mov r0, r2
	mov r1, r4
	bl power
	mov r0, r0
	add r1, r5, r0
	mov r0, r6
	mov r1, r1
	mov r2, r4
	b .L18
.L17:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	b .L18
.L18:
	mov r0, r0
	mov r4, r1
	mov r5, r2
	mov r1, #10
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r3, r0
	mov r6, #1
	add r5, r5, r6
	mov r0, r3
	mov r1, r4
	mov r2, r5
	bl recursiveDecimalSum
	mov r0, r0
	mov r0, r0
	b .L12
.L12:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size recursiveDecimalSum, .-recursiveDecimalSum


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L23:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r4, #:lower16:.read_scratch
	movt r4, #:upper16:.read_scratch
	ldr r4, [r4]
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	str r4, [r3, #0]
	ldr r3, [r3]
	mov r0, r3
	mov r3, #0
	mov r1, r3
	mov r3, #0
	mov r2, r3
	bl recursiveDecimalSum
	mov r3, r0
	mul r1, r3, r3
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r1
	mov r1, r3
	mov r3, r3
	beq .L25
	b .L26
.L25:
	mov r5, r2
	mov r4, r1
	mov r0, r5
	bl wait
	mov r1, #1
	sub r1, r5, r1
	mov r2, #0
	cmp r1, #0
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r1
	mov r1, r4
	mov r3, r4
	beq .L25
	b .L26
.L26:
	mov r0, r3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L24
.L24:
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