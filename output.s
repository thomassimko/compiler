	.arch armv7-a
.comm	y,4,4


.text
	.align 2
	.global foo
foo:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #0
.L1:
	mov r0, #96
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r4, #4
	mov r1, r4
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #7
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #28
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #0
	mov r1, r0
	mov r0, r4
	bl __aeabi_idiv
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
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
	mov r1, #1
	add r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	b .L2
.L2:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size foo, .-foo


	.align 2
	.global bar
bar:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	mov r1, r1
	sub sp, sp, #0
.L4:
	mov r0, #0
	cmp r2, r1
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L6:
	b .L8
.L7:
	b .L8
.L8:
	b .L5
.L5:
	mov r0, #5
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size bar, .-bar


	.align 2
	.global baz
baz:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	mov r1, r1
	sub sp, sp, #0
.L10:
	mov r0, #0
	cmp r2, r1
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L12
	b .L13
.L12:
	b .L14
.L13:
	b .L14
.L14:
	mov r0, #1
	cmp r0, #1
	beq .L15
	b .L16
.L15:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L17
.L16:
	mov r0, #2
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L17
.L17:
	mov r0, #0
	cmp r0, #1
	beq .L18
	b .L19
.L18:
	mov r0, #3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L20
.L19:
	mov r0, #4
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L20
.L20:
	b .L11
.L11:
	mov r0, #0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size baz, .-baz


	.align 2
	.global fbool
fbool:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #0
.L22:
	b .L23
.L23:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size fbool, .-fbool


	.align 2
	.global quux
quux:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	mov r1, r1
	sub sp, sp, #0
.L25:
	mov r3, #0
	cmp r2, r1
	movgt r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L27
	b .L28
.L27:
	b .L29
.L28:
	b .L29
.L29:
	mov r1, #0
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #0
	mov r0, r1
	bl fbool
	mov r1, #0
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	b .L26
.L26:
	mov r0, #0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size quux, .-quux


	.align 2
	.global quux2
quux2:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	mov r1, r1
	sub sp, sp, #0
.L31:
	mov r3, #0
	cmp r2, r1
	movgt r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L33
	b .L34
.L33:
	b .L35
.L34:
	b .L35
.L35:
	mov r1, #0
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #0
	mov r0, r1
	bl fbool
	mov r1, #0
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	mov r1, #1
	mov r0, r1
	bl fbool
	b .L32
.L32:
	mov r0, #0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size quux2, .-quux2


	.align 2
	.global flrgrl
flrgrl:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	mov r1, r1
	sub sp, sp, #0
.L37:
	mov r0, #0
	cmp r2, r1
	movgt r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L39
	b .L40
.L39:
	b .L41
.L40:
	b .L41
.L41:
	b .L38
.L38:
	mov r0, #4
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size flrgrl, .-flrgrl


	.align 2
	.global blergh
blergh:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L43:
	mov r0, #1
	cmp r0, #1
	beq .L45
	b .L46
.L45:
	mov r0, #3
	mov r0, r0
	b .L47
.L46:
	mov r0, #1
	mov r0, r0
	b .L47
.L47:
	mov r0, r0
	mov r0, r0
	b .L44
.L44:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size blergh, .-blergh


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L49:
	b .L50
.L50:
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