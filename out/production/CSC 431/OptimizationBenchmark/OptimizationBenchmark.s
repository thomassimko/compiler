	.arch armv7-a
.comm	global1,4,4
.comm	global2,4,4
.comm	global3,4,4


.text
	.align 2
	.global constantFolding
constantFolding:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #8
.L1:
	mov r1, #8
	mov r0, #9
	mul r0, r1, r0
	mov r1, #4
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	mov r1, #2
	add r0, r0, r1
	mov r1, #5
	mov r2, #8
	mul r1, r1, r2
	sub r0, r0, r1
	mov r1, #9
	add r0, r0, r1
	mov r1, #12
	sub r0, r0, r1
	mov r1, #6
	add r0, r0, r1
	mov r1, #9
	sub r1, r0, r1
	mov r0, #18
	sub r4, r1, r0
	mov r1, #23
	mov r0, #3
	mul r0, r1, r0
	mov r1, #23
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	mov r1, #90
	mul r0, r0, r1
	add r0, r4, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size constantFolding, .-constantFolding


	.align 2
	.global constantPropagation
constantPropagation:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #108
.L4:
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #12]
	mov r0, #5
	str r0, [sp, #16]
	mov r0, #11
	str r0, [sp, #20]
	mov r0, #21
	str r0, [sp, #24]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #28]
	ldr r1, [sp, #12]
	ldr r0, [sp, #16]
	add r0, r1, r0
	str r0, [sp, #32]
	ldr r0, [sp, #20]
	ldr r1, [sp, #24]
	add r0, r0, r1
	str r0, [sp, #36]
	ldr r0, [sp, #28]
	ldr r1, [sp, #32]
	add r0, r0, r1
	str r0, [sp, #40]
	ldr r1, [sp, #36]
	ldr r0, [sp, #40]
	mul r0, r1, r0
	str r0, [sp, #44]
	ldr r0, [sp, #20]
	ldr r2, [sp, #32]
	ldr r1, [sp, #36]
	mul r1, r2, r1
	add r1, r0, r1
	ldr r0, [sp, #44]
	sub r0, r1, r0
	str r0, [sp, #48]
	ldr r0, [sp, #32]
	ldr r2, [sp, #36]
	ldr r1, [sp, #40]
	mul r1, r2, r1
	sub r4, r0, r1
	ldr r0, [sp, #44]
	ldr r1, [sp, #48]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	str r0, [sp, #52]
	ldr r1, [sp, #20]
	ldr r0, [sp, #24]
	add r1, r1, r0
	ldr r0, [sp, #28]
	add r0, r1, r0
	ldr r1, [sp, #32]
	add r0, r0, r1
	ldr r1, [sp, #36]
	add r0, r0, r1
	ldr r1, [sp, #40]
	sub r0, r0, r1
	str r0, [sp, #56]
	ldr r1, [sp, #56]
	ldr r0, [sp, #52]
	sub r0, r1, r0
	ldr r1, [sp, #32]
	add r1, r0, r1
	ldr r0, [sp, #4]
	sub r0, r1, r0
	ldr r1, [sp, #8]
	sub r0, r0, r1
	str r0, [sp, #60]
	ldr r0, [sp, #44]
	ldr r1, [sp, #48]
	add r0, r0, r1
	ldr r1, [sp, #28]
	sub r1, r0, r1
	ldr r0, [sp, #32]
	sub r0, r1, r0
	str r0, [sp, #64]
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	sub r1, r1, r0
	ldr r0, [sp, #16]
	mul r1, r1, r0
	ldr r0, [sp, #36]
	sub r0, r1, r0
	str r0, [sp, #68]
	ldr r1, [sp, #48]
	ldr r0, [sp, #12]
	mul r1, r1, r0
	ldr r0, [sp, #16]
	mul r0, r1, r0
	ldr r1, [sp, #60]
	add r0, r0, r1
	str r0, [sp, #72]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mul r0, r0, r1
	ldr r1, [sp, #12]
	mul r0, r0, r1
	ldr r1, [sp, #20]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	ldr r0, [sp, #60]
	sub r0, r1, r0
	str r0, [sp, #76]
	ldr r0, [sp, #36]
	ldr r1, [sp, #44]
	add r0, r0, r1
	ldr r1, [sp, #12]
	add r1, r0, r1
	ldr r0, [sp, #64]
	sub r0, r1, r0
	str r0, [sp, #80]
	ldr r1, [sp, #56]
	ldr r0, [sp, #60]
	add r0, r1, r0
	ldr r1, [sp, #24]
	ldr r2, [sp, #4]
	mul r1, r1, r2
	sub r0, r0, r1
	str r0, [sp, #84]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r1, r0, r1
	ldr r0, [sp, #44]
	sub r0, r1, r0
	ldr r1, [sp, #48]
	sub r0, r0, r1
	str r0, [sp, #88]
	ldr r1, [sp, #88]
	ldr r0, [sp, #76]
	sub r0, r1, r0
	ldr r2, [sp, #72]
	ldr r1, [sp, #16]
	mul r1, r2, r1
	sub r0, r0, r1
	str r0, [sp, #92]
	ldr r1, [sp, #60]
	ldr r0, [sp, #92]
	sub r0, r1, r0
	ldr r1, [sp, #88]
	sub r0, r0, r1
	ldr r1, [sp, #56]
	sub r0, r0, r1
	str r0, [sp, #96]
	ldr r0, [sp, #64]
	ldr r1, [sp, #96]
	mul r0, r0, r1
	ldr r1, [sp, #80]
	add r1, r0, r1
	ldr r0, [sp, #92]
	sub r0, r1, r0
	str r0, [sp, #100]
	ldr r1, [sp, #92]
	ldr r0, [sp, #96]
	sub r1, r1, r0
	ldr r0, [sp, #100]
	add r1, r1, r0
	ldr r0, [sp, #44]
	add r0, r1, r0
	str r0, [sp, #104]
	ldr r0, [sp, #104]
	str r0, [sp, #0]
	b .L5
.L5:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #108
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size constantPropagation, .-constantPropagation


	.align 2
	.global deadCodeElimination
deadCodeElimination:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #24
.L7:
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #12
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #10
	str r0, [sp, #12]
	mov r0, #13
	str r0, [sp, #12]
	mov r0, #9
	str r0, [sp, #12]
	mov r0, #45
	str r0, [sp, #16]
	mov r0, #12
	str r0, [sp, #16]
	mov r0, #3
	str r0, [sp, #16]
	mov r0, #23
	str r0, [sp, #20]
	mov r0, #10
	str r0, [sp, #20]
	movw r0, #:lower16:global1
	movt r0, #:upper16:global1
	mov r1, #11
	str r1, [r0]
	movw r0, #:lower16:global1
	movt r0, #:upper16:global1
	mov r1, #5
	str r1, [r0]
	movw r1, #:lower16:global1
	movt r1, #:upper16:global1
	mov r0, #9
	str r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r0, r1
	ldr r1, [sp, #12]
	add r1, r0, r1
	ldr r0, [sp, #16]
	add r1, r1, r0
	ldr r0, [sp, #20]
	add r0, r1, r0
	str r0, [sp, #0]
	b .L8
.L8:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #24
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size deadCodeElimination, .-deadCodeElimination


	.align 2
	.global sum
sum:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #12
.L10:
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, #0
	cmp r0, #0
	movgt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L12
	b .L13
.L12:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #8]
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
	beq .L12
	b .L13
.L13:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L11
.L11:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
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
	sub sp, sp, #12
.L15:
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r0, r1
	str r0, [sp, #0]
	b .L16
.L16:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
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
	sub sp, sp, #8
.L18:
	movw r2, #:lower16:global1
	movt r2, #:upper16:global1
	mov r1, #1
	str r1, [r2]
	movw r1, #:lower16:global2
	movt r1, #:upper16:global2
	mov r2, #0
	str r2, [r1]
	movw r2, #:lower16:global3
	movt r2, #:upper16:global3
	mov r1, #0
	str r1, [r2]
	mov r1, #100
	mov r0, r1
	bl sum
	mov r1, r0
	str r1, [sp, #4]
	movw r1, #:lower16:global1
	movt r1, #:upper16:global1
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L20
	b .L21
.L20:
	movw r1, #:lower16:10000
	movt r1, #:upper16:10000
	mov r0, r1
	bl sum
	mov r0, r0
	str r0, [sp, #4]
	b .L22
.L21:
	movw r1, #:lower16:global2
	movt r1, #:upper16:global2
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L23
	b .L24
.L22:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L19
.L23:
	movw r1, #:lower16:20000
	movt r1, #:upper16:20000
	mov r0, r1
	bl sum
	mov r1, r0
	str r1, [sp, #4]
	b .L25
.L24:
	b .L25
.L25:
	movw r1, #:lower16:global3
	movt r1, #:upper16:global3
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #3
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L26
	b .L27
.L26:
	movw r1, #:lower16:30000
	movt r1, #:upper16:30000
	mov r0, r1
	bl sum
	mov r0, r0
	str r0, [sp, #4]
	b .L28
.L27:
	b .L28
.L28:
	b .L22
.L19:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size interProceduralOptimization, .-interProceduralOptimization


	.align 2
	.global commonSubexpressionElimination
commonSubexpressionElimination:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #108
.L30:
	mov r0, #11
	str r0, [sp, #4]
	mov r0, #22
	str r0, [sp, #8]
	mov r0, #33
	str r0, [sp, #12]
	mov r0, #44
	str r0, [sp, #16]
	mov r0, #55
	str r0, [sp, #20]
	mov r0, #66
	str r0, [sp, #24]
	mov r0, #77
	str r0, [sp, #28]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r0, r1, r0
	str r0, [sp, #32]
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #36]
	ldr r1, [sp, #20]
	ldr r0, [sp, #24]
	mul r0, r1, r0
	str r0, [sp, #40]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	str r0, [sp, #44]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #20]
	ldr r1, [sp, #24]
	mul r1, r2, r1
	sub r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	str r0, [sp, #48]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #20]
	ldr r1, [sp, #24]
	mul r1, r2, r1
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #52]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #20]
	ldr r1, [sp, #24]
	mul r1, r2, r1
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #56]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #20]
	ldr r1, [sp, #24]
	mul r1, r2, r1
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #60]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #64]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #20]
	ldr r1, [sp, #24]
	mul r1, r2, r1
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #68]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #72]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #76]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	str r0, [sp, #80]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #20]
	ldr r1, [sp, #24]
	mul r1, r2, r1
	sub r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	str r0, [sp, #84]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #88]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	mul r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r2, [sp, #24]
	ldr r1, [sp, #20]
	mul r1, r2, r1
	sub r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	str r0, [sp, #92]
	ldr r0, [sp, #28]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	mul r1, r1, r2
	add r4, r0, r1
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r0, r0, r1
	str r0, [sp, #96]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	mul r4, r1, r0
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	add r0, r4, r0
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r1, r0, r1
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #100]
	ldr r0, [sp, #12]
	ldr r1, [sp, #16]
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	mul r1, r2, r1
	add r0, r0, r1
	ldr r1, [sp, #20]
	ldr r2, [sp, #24]
	mul r1, r1, r2
	sub r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	str r0, [sp, #104]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r0, r1, r0
	ldr r1, [sp, #12]
	add r1, r0, r1
	ldr r0, [sp, #16]
	add r0, r1, r0
	ldr r1, [sp, #20]
	add r0, r0, r1
	ldr r1, [sp, #24]
	add r0, r0, r1
	ldr r1, [sp, #28]
	add r0, r0, r1
	ldr r1, [sp, #32]
	add r1, r0, r1
	ldr r0, [sp, #36]
	add r0, r1, r0
	ldr r1, [sp, #40]
	add r1, r0, r1
	ldr r0, [sp, #44]
	add r1, r1, r0
	ldr r0, [sp, #48]
	add r1, r1, r0
	ldr r0, [sp, #52]
	add r1, r1, r0
	ldr r0, [sp, #56]
	add r1, r1, r0
	ldr r0, [sp, #60]
	add r1, r1, r0
	ldr r0, [sp, #64]
	add r0, r1, r0
	ldr r1, [sp, #68]
	add r0, r0, r1
	ldr r1, [sp, #72]
	add r1, r0, r1
	ldr r0, [sp, #76]
	add r0, r1, r0
	ldr r1, [sp, #80]
	add r0, r0, r1
	ldr r1, [sp, #84]
	add r0, r0, r1
	ldr r1, [sp, #88]
	add r0, r0, r1
	ldr r1, [sp, #92]
	add r1, r0, r1
	ldr r0, [sp, #96]
	add r0, r1, r0
	ldr r1, [sp, #100]
	add r0, r0, r1
	ldr r1, [sp, #104]
	add r0, r0, r1
	str r0, [sp, #0]
	b .L31
.L31:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #108
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size commonSubexpressionElimination, .-commonSubexpressionElimination


	.align 2
	.global hoisting
hoisting:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #40
.L33:
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #12]
	mov r0, #4
	str r0, [sp, #16]
	mov r0, #0
	str r0, [sp, #36]
	ldr r2, [sp, #36]
	movw r0, #:lower16:1000000
	movt r0, #:upper16:1000000
	mov r1, #0
	cmp r2, r0
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L35
	b .L36
.L35:
	mov r0, #5
	str r0, [sp, #20]
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r1, r1, r0
	ldr r0, [sp, #12]
	add r0, r1, r0
	str r0, [sp, #28]
	ldr r1, [sp, #12]
	ldr r0, [sp, #16]
	add r1, r1, r0
	ldr r0, [sp, #28]
	add r0, r1, r0
	str r0, [sp, #32]
	ldr r1, [sp, #36]
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #36]
	ldr r2, [sp, #36]
	movw r0, #:lower16:1000000
	movt r0, #:upper16:1000000
	mov r1, #0
	cmp r2, r0
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L35
	b .L36
.L36:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L34
.L34:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #40
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
	sub sp, sp, #20
.L38:
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #12]
	mov r0, #0
	str r0, [sp, #16]
	ldr r0, [sp, #4]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L40
	b .L41
.L40:
	mov r0, #20
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L43
	b .L44
.L41:
	b .L42
.L42:
	ldr r0, [sp, #16]
	str r0, [sp, #0]
	b .L39
.L43:
	movw r0, #:lower16:200
	movt r0, #:upper16:200
	str r0, [sp, #8]
	movw r0, #:lower16:300
	movt r0, #:upper16:300
	str r0, [sp, #12]
	b .L45
.L44:
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #12]
	b .L45
.L45:
	mov r0, #50
	str r0, [sp, #16]
	b .L42
.L39:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #20
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size doubleIf, .-doubleIf


	.align 2
	.global integerDivide
integerDivide:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #8
.L47:
	movw r0, #:lower16:3000
	movt r0, #:upper16:3000
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #4
	mul r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #8
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #16
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #32
	mul r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #64
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	movw r1, #:lower16:128
	movt r1, #:upper16:128
	mul r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #4
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L48
.L48:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size integerDivide, .-integerDivide


	.align 2
	.global association
association:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #8
.L50:
	mov r0, #10
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #2
	mul r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #3
	mul r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #3
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #4
	mul r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #4
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #4
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #4
	sub r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #50
	mul r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #50
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L51
.L51:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size association, .-association


	.align 2
	.global tailRecursionHelper
tailRecursionHelper:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	mov r3, r1
	sub sp, sp, #12
.L53:
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r3, [sp, #4]
	mov r2, #0
	cmp r3, #0
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L55
	b .L56
.L55:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L54
.L56:
	ldr r3, [sp, #4]
	mov r2, #1
	sub r2, r3, r2
	ldr r4, [sp, #8]
	ldr r3, [sp, #4]
	add r3, r4, r3
	mov r0, r2
	mov r1, r3
	bl tailRecursionHelper
	mov r0, r0
	str r0, [sp, #0]
	b .L54
.L54:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size tailRecursionHelper, .-tailRecursionHelper


	.align 2
	.global tailRecursion
tailRecursion:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #8
.L59:
	str r2, [sp, #4]
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #0
	mov r1, r2
	bl tailRecursionHelper
	mov r0, r0
	str r0, [sp, #0]
	b .L60
.L60:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size tailRecursion, .-tailRecursion


	.align 2
	.global unswitching
unswitching:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #12
.L62:
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	movw r2, #:lower16:1000000
	movt r2, #:upper16:1000000
	mov r1, #0
	cmp r0, r2
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L64
	b .L65
.L64:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L66
	b .L67
.L66:
	ldr r1, [sp, #4]
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #4]
	b .L68
.L67:
	ldr r0, [sp, #4]
	mov r1, #2
	add r0, r0, r1
	str r0, [sp, #4]
	b .L68
.L68:
	ldr r0, [sp, #4]
	movw r2, #:lower16:1000000
	movt r2, #:upper16:1000000
	mov r1, #0
	cmp r0, r2
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L64
	b .L65
.L65:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L63
.L63:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
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
	mov r1, r0
	sub sp, sp, #36
.L70:
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #28]
	mov r0, #0
	str r0, [sp, #32]
	ldr r1, [sp, #28]
	ldr r0, [sp, #4]
	mov r2, #0
	cmp r1, r0
	movlt r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L72
	b .L73
.L72:
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #7
	str r0, [sp, #12]
	mov r0, #8
	str r0, [sp, #16]
	ldr r0, [sp, #8]
	ldr r1, [sp, #12]
	add r0, r0, r1
	str r0, [sp, #20]
	ldr r0, [sp, #20]
	ldr r1, [sp, #16]
	add r0, r0, r1
	str r0, [sp, #24]
	ldr r0, [sp, #32]
	ldr r1, [sp, #24]
	add r0, r0, r1
	str r0, [sp, #32]
	ldr r1, [sp, #28]
	mov r0, #2
	mul r0, r1, r0
	str r0, [sp, #28]
	ldr r0, [sp, #28]
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #28]
	ldr r1, [sp, #28]
	mov r0, #3
	mul r0, r0, r1
	str r0, [sp, #28]
	ldr r0, [sp, #28]
	mov r1, #3
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #28]
	ldr r1, [sp, #28]
	mov r0, #4
	mul r0, r1, r0
	str r0, [sp, #28]
	ldr r0, [sp, #28]
	mov r1, #4
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r0, r0
	str r0, [sp, #28]
	ldr r0, [sp, #28]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #28]
	ldr r2, [sp, #28]
	ldr r0, [sp, #4]
	mov r1, #0
	cmp r2, r0
	movlt r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L72
	b .L73
.L73:
	ldr r0, [sp, #32]
	str r0, [sp, #0]
	b .L71
.L71:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #36
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
	mov r1, r0
	sub sp, sp, #28
.L75:
	str r1, [sp, #4]
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #12]
	mov r0, #0
	str r0, [sp, #20]
	ldr r1, [sp, #20]
	ldr r2, [sp, #4]
	mov r0, #0
	cmp r1, r2
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L77
	b .L78
.L77:
	ldr r1, [sp, #12]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #24]
	ldr r0, [sp, #12]
	str r0, [sp, #8]
	ldr r0, [sp, #24]
	str r0, [sp, #12]
	ldr r0, [sp, #20]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #20]
	ldr r0, [sp, #20]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r0, r1
	movlt r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L77
	b .L78
.L78:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L76
.L76:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
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
	mov r1, r0
	sub sp, sp, #8
.L80:
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #0
	movle r1, #1
	mov r1, r1
	ldr r2, [sp, #4]
	mov r3, #0
	cmp r2, #1
	moveq r3, #1
	mov r2, r3
	orr r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L82
	b .L83
.L82:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L81
.L83:
	ldr r1, [sp, #4]
	mov r2, #1
	sub r1, r1, r2
	mov r0, r1
	bl recursiveFibonacci
	mov r4, r0
	ldr r2, [sp, #4]
	mov r1, #2
	sub r1, r2, r1
	mov r0, r1
	bl recursiveFibonacci
	mov r0, r0
	add r0, r4, r0
	str r0, [sp, #0]
	b .L81
.L81:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
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
	sub sp, sp, #16
.L86:
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
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #12]
	ldr r1, [sp, #12]
	ldr r2, [sp, #4]
	mov r0, #0
	cmp r1, r2
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L88
	b .L89
.L88:
	bl constantFolding
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl constantPropagation
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl deadCodeElimination
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl interProceduralOptimization
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl commonSubexpressionElimination
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl hoisting
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl doubleIf
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl integerDivide
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl association
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #4]
	movw r1, #:lower16:1000
	movt r1, #:upper16:1000
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, r1
	bl tailRecursion
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	bl unswitching
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl randomCalculation
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #4]
	mov r1, #5
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, r1
	bl iterativeFibonacci
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #4]
	movw r1, #:lower16:1000
	movt r1, #:upper16:1000
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r1, r0
	mov r0, r1
	bl recursiveFibonacci
	mov r0, r0
	str r0, [sp, #8]
	ldr r0, [sp, #8]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #12]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #12]
	ldr r2, [sp, #12]
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r2, r1
	movlt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L88
	b .L89
.L89:
	movw r0, #:lower16:9999
	movt r0, #:upper16:9999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L87
.L87:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
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