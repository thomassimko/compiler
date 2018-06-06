	.arch armv7-a
.comm	global1,4,4
.comm	global2,4,4
.comm	global3,4,4


.text
	.align 2
	.global sum
sum:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L10:
	mov r0, #0
	cmp r4, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r1, #0
	mov r0, r1
	mov r2, r4
	mov r1, r1
	beq .L12
	b .L13
.L12:
	mov r1, r0
	mov r0, r2
	add r1, r1, r0
	mov r2, #1
	sub r2, r0, r2
	mov r0, #0
	cmp r2, #0
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r1
	mov r2, r2
	mov r1, r1
	beq .L12
	b .L13
.L13:
	mov r0, r1
	b .L11
.L11:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size sum, .-sum


	.align 2
	.global doesntModifyGlobals
doesntModifyGlobals:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L15:
	b .L16
.L16:
	mov r0, #3
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size doesntModifyGlobals, .-doesntModifyGlobals


	.align 2
	.global interProceduralOptimization
interProceduralOptimization:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L18:
	movw r1, #:lower16:global1
	movt r1, #:upper16:global1
	mov r2, #1
	str r2, [r1]
	movw r1, #:lower16:global2
	movt r1, #:upper16:global2
	mov r2, #0
	str r2, [r1]
	movw r1, #:lower16:global3
	movt r1, #:upper16:global3
	mov r2, #0
	str r2, [r1]
	mov r1, #100
	mov r0, r1
	bl sum
	mov r1, r0
	movw r2, #:lower16:global1
	movt r2, #:upper16:global1
	ldr r2, [r2]
	mov r3, #0
	cmp r2, #1
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L20
	b .L21
.L20:
	movw r1, #:lower16:10000
	movt r1, #:upper16:10000
	mov r0, r1
	bl sum
	mov r0, r0
	mov r0, r0
	b .L22
.L21:
	movw r2, #:lower16:global2
	movt r2, #:upper16:global2
	ldr r2, [r2]
	mov r3, #0
	cmp r2, #2
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L23
	b .L24
.L22:
	mov r0, r0
	b .L19
.L23:
	movw r1, #:lower16:20000
	movt r1, #:upper16:20000
	mov r0, r1
	bl sum
	mov r1, r0
	mov r1, r1
	b .L25
.L24:
	mov r1, r1
	b .L25
.L25:
	mov r1, r1
	movw r2, #:lower16:global3
	movt r2, #:upper16:global3
	ldr r3, [r2]
	mov r2, #0
	cmp r3, #3
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L26
	b .L27
.L26:
	movw r1, #:lower16:30000
	movt r1, #:upper16:30000
	mov r0, r1
	bl sum
	mov r0, r0
	mov r0, r0
	b .L28
.L27:
	mov r0, r1
	b .L28
.L28:
	mov r0, r0
	mov r0, r0
	b .L22
.L19:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size interProceduralOptimization, .-interProceduralOptimization


	.align 2
	.global hoisting
hoisting:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L33:
	mov r0, #1
	cmp r0, #1
	mov r0, #0
	mov r0, r0
	beq .L35
	b .L36
.L35:
	mov r1, r0
	mov r0, #1
	add r0, r1, r0
	movw r2, #:lower16:1000000
	movt r2, #:upper16:1000000
	mov r1, #0
	cmp r0, r2
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r0, r0
	beq .L35
	b .L36
.L36:
	b .L34
.L34:
	mov r0, #2
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size hoisting, .-hoisting


	.align 2
	.global doubleIf
doubleIf:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L38:
	mov r0, #1
	cmp r0, #1
	beq .L40
	b .L41
.L40:
	mov r0, #1
	cmp r0, #1
	beq .L43
	b .L44
.L41:
	mov r0, #0
	mov r0, r0
	b .L42
.L42:
	mov r0, r0
	b .L39
.L43:
	b .L45
.L44:
	b .L45
.L45:
	mov r0, #50
	mov r0, r0
	b .L42
.L39:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size doubleIf, .-doubleIf


	.align 2
	.global tailRecursionHelper
tailRecursionHelper:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #0
.L53:
	mov r4, #0
	cmp r3, #0
	moveq r4, #1
	mov r4, r4
	mov r4, r4
	cmp r4, #1
	beq .L55
	b .L56
.L55:
	mov r0, r2
	b .L54
.L56:
	mov r4, #1
	sub r4, r3, r4
	add r2, r2, r3
	mov r0, r4
	mov r1, r2
	bl tailRecursionHelper
	mov r0, r0
	mov r0, r0
	b .L54
.L54:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size tailRecursionHelper, .-tailRecursionHelper


	.align 2
	.global unswitching
unswitching:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L62:
	mov r0, #1
	cmp r0, #1
	mov r0, #1
	mov r1, r0
	mov r0, r0
	beq .L64
	b .L65
.L64:
	mov r0, r1
	mov r1, #1
	cmp r1, #1
	beq .L66
	b .L67
.L66:
	mov r1, #1
	add r0, r0, r1
	mov r0, r0
	b .L68
.L67:
	mov r1, #2
	add r0, r0, r1
	mov r0, r0
	b .L68
.L68:
	mov r0, r0
	movw r2, #:lower16:1000000
	movt r2, #:upper16:1000000
	mov r1, #0
	cmp r0, r2
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r0
	mov r0, r0
	beq .L64
	b .L65
.L65:
	mov r0, r0
	b .L63
.L63:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size unswitching, .-unswitching


	.align 2
	.global randomCalculation
randomCalculation:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L70:
	mov r0, #0
	mov r1, #0
	cmp r0, r4
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r3, #0
	mov r1, r3
	mov r0, r0
	mov r2, r4
	mov r3, r3
	beq .L72
	b .L73
.L72:
	mov r1, r1
	mov r0, r0
	mov r5, r2
	mov r2, #19
	add r4, r1, r2
	mov r1, #2
	mul r0, r0, r1
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, #3
	mul r0, r0, r1
	mov r1, #3
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, #4
	mul r0, r1, r0
	mov r1, #4
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, #1
	add r0, r1, r0
	mov r1, #0
	cmp r0, r5
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r4
	mov r0, r0
	mov r2, r5
	mov r3, r4
	beq .L72
	b .L73
.L73:
	mov r0, r3
	b .L71
.L71:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size randomCalculation, .-randomCalculation


	.align 2
	.global iterativeFibonacci
iterativeFibonacci:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L75:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r2, #0
	mov r0, #0
	cmp r2, r4
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r3, #1
	mov r0, r3
	mov r1, #-1
	mov r1, r1
	mov r2, r2
	mov r5, r4
	mov r3, r3
	beq .L77
	b .L78
.L77:
	mov r3, r0
	mov r1, r1
	mov r0, r2
	mov r5, r5
	add r4, r3, r1
	mov r1, #1
	add r2, r0, r1
	mov r0, #0
	cmp r2, r5
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	mov r0, r4
	mov r1, r3
	mov r2, r2
	mov r5, r5
	mov r3, r4
	beq .L77
	b .L78
.L78:
	mov r0, r3
	b .L76
.L76:
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size iterativeFibonacci, .-iterativeFibonacci


	.align 2
	.global recursiveFibonacci
recursiveFibonacci:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L80:
	mov r1, #0
	cmp r4, #0
	movle r1, #1
	mov r1, r1
	mov r2, #0
	cmp r4, #1
	moveq r2, #1
	mov r2, r2
	orr r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L82
	b .L83
.L82:
	mov r0, r4
	b .L81
.L83:
	mov r1, #1
	sub r1, r4, r1
	mov r0, r1
	bl recursiveFibonacci
	mov r5, r0
	mov r1, #2
	sub r1, r4, r1
	mov r0, r1
	bl recursiveFibonacci
	mov r0, r0
	add r0, r5, r0
	mov r0, r0
	b .L81
.L81:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size recursiveFibonacci, .-recursiveFibonacci


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L86:
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
	ldr r1, [r1]
	mov r0, #1
	mov r2, #0
	cmp r0, r1
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r1, r1
	mov r0, r0
	beq .L88
	b .L89
.L88:
	mov r4, r1
	mov r5, r0
	movw r0, #:lower16:226
	movt r0, #:upper16:226
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:-25457889
	movt r0, #:upper16:-25457889
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:global1
	movt r0, #:upper16:global1
	mov r1, #11
	str r1, [r0]
	movw r1, #:lower16:global1
	movt r1, #:upper16:global1
	mov r0, #5
	str r0, [r1]
	movw r0, #:lower16:global1
	movt r0, #:upper16:global1
	mov r1, #9
	str r1, [r0]
	mov r0, #38
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl interProceduralOptimization
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:-48796
	movt r0, #:upper16:-48796
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl hoisting
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl doubleIf
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:736
	movt r0, #:upper16:736
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #10
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:1000
	movt r0, #:upper16:1000
	mov r1, r0
	mov r0, r4
	bl __aeabi_idiv
	mov r2, r0
	mov r0, r2
	mov r2, #0
	mov r1, r2
	bl tailRecursionHelper
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl unswitching
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl randomCalculation
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #5
	mov r1, r0
	mov r0, r4
	bl __aeabi_idiv
	mov r1, r0
	mov r0, r1
	bl iterativeFibonacci
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:1000
	movt r0, #:upper16:1000
	mov r1, r0
	mov r0, r4
	bl __aeabi_idiv
	mov r1, r0
	mov r0, r1
	bl recursiveFibonacci
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #1
	add r0, r5, r0
	mov r1, #0
	cmp r0, r4
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r1, r4
	mov r0, r0
	beq .L88
	b .L89
.L89:
	movw r0, #:lower16:9999
	movt r0, #:upper16:9999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L87
.L87:
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