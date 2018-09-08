	.arch armv7-a
.comm	a,4,4
.comm	b,4,4
.comm	i,4,4


.text
	.align 2
	.global concatLists
concatLists:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r1, r1
	sub sp, sp, #16
.L1:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #12]
	ldr r2, [sp, #4]
	mov r0, #0
	mov r1, #0
	cmp r2, r0
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L3
	b .L4
.L3:
	ldr r0, [sp, #8]
	str r0, [sp, #0]
	b .L2
.L4:
	b .L5
.L5:
	ldr r0, [sp, #12]
	add r0, r0, #4
	ldr r0, [r0]
	mov r2, #0
	mov r1, #0
	cmp r0, r2
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L6:
	ldr r0, [sp, #12]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	add r0, r0, #4
	ldr r2, [r0]
	mov r0, #0
	mov r1, #0
	cmp r2, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L6
	b .L7
.L7:
	ldr r0, [sp, #8]
	ldr r1, [sp, #12]
	add r1, r1, #4
	str r0, [r1]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size concatLists, .-concatLists


	.align 2
	.global add
add:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #16
.L9:
	str r3, [sp, #4]
	str r2, [sp, #8]
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	ldr r1, [sp, #12]
	add r1, r1, #0
	str r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp, #12]
	add r1, r1, #4
	str r0, [r1]
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L10
.L10:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size add, .-add


	.align 2
	.global size
size:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #8
.L12:
	str r3, [sp, #4]
	ldr r3, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r3, r1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L14
	b .L15
.L14:
	mov r0, #0
	str r0, [sp, #0]
	b .L13
.L15:
	b .L16
.L16:
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl size
	mov r0, r0
	mov r1, #1
	add r0, r1, r0
	str r0, [sp, #0]
	b .L13
.L13:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size size, .-size


	.align 2
	.global get
get:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L18:
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #8]
	mov r2, #0
	cmp r3, #0
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L20
	b .L21
.L20:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #0]
	b .L19
.L21:
	b .L22
.L22:
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r4, #1
	sub r3, r3, r4
	mov r0, r2
	mov r1, r3
	bl get
	mov r0, r0
	str r0, [sp, #0]
	b .L19
.L19:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size get, .-get


	.align 2
	.global pop
pop:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #8
.L24:
	str r3, [sp, #4]
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L25
.L25:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size pop, .-pop


	.align 2
	.global printList
printList:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #4
.L27:
	str r3, [sp, #0]
	ldr r2, [sp, #0]
	mov r0, #0
	mov r1, #0
	cmp r2, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L29
	b .L30
.L29:
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl printList
	b .L31
.L30:
	b .L31
.L31:
	b .L28
.L28:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size printList, .-printList


	.align 2
	.global treeprint
treeprint:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #4
.L33:
	str r3, [sp, #0]
	ldr r1, [sp, #0]
	mov r3, #0
	mov r2, #0
	cmp r1, r3
	movne r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L35
	b .L36
.L35:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl treeprint
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #0]
	add r1, r1, #8
	ldr r1, [r1]
	mov r0, r1
	bl treeprint
	b .L37
.L36:
	b .L37
.L37:
	b .L34
.L34:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size treeprint, .-treeprint


	.align 2
	.global freeList
freeList:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #4
.L39:
	str r3, [sp, #0]
	ldr r3, [sp, #0]
	mov r2, #0
	mov r1, #0
	cmp r3, r2
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L41
	b .L42
.L41:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl freeList
	ldr r1, [sp, #0]
	mov r1, r1
	mov r0, r1
	bl free
	b .L43
.L42:
	b .L43
.L43:
	b .L40
.L40:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size freeList, .-freeList


	.align 2
	.global freeTree
freeTree:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #4
.L45:
	str r3, [sp, #0]
	ldr r2, [sp, #0]
	mov r1, #0
	mov r3, #0
	cmp r2, r1
	moveq r3, #1
	mov r2, r3
	mov r1, #1
	eor r1, r2, r1
	mov r1, r1
	cmp r1, #1
	beq .L47
	b .L48
.L47:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl freeTree
	ldr r1, [sp, #0]
	add r1, r1, #8
	ldr r1, [r1]
	mov r0, r1
	bl freeTree
	ldr r1, [sp, #0]
	mov r1, r1
	mov r0, r1
	bl free
	b .L49
.L48:
	b .L49
.L49:
	b .L46
.L46:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size freeTree, .-freeTree


	.align 2
	.global postOrder
postOrder:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #12
.L51:
	str r3, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #0
	mov r2, #0
	cmp r1, r0
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L53
	b .L54
.L53:
	mov r0, #8
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	ldr r2, [sp, #8]
	add r2, r2, #0
	str r1, [r2]
	ldr r1, [sp, #8]
	add r1, r1, #4
	mov r2, #0
	str r2, [r1]
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl postOrder
	mov r4, r0
	ldr r1, [sp, #4]
	add r1, r1, #8
	ldr r1, [r1]
	mov r0, r1
	bl postOrder
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl concatLists
	mov r3, r0
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl concatLists
	mov r0, r0
	str r0, [sp, #0]
	b .L52
.L54:
	b .L55
.L55:
	mov r0, #0
	str r0, [sp, #0]
	b .L52
.L52:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size postOrder, .-postOrder


	.align 2
	.global treeadd
treeadd:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #16
.L57:
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	mov r2, #0
	mov r4, #0
	cmp r3, r2
	moveq r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L59
	b .L60
.L59:
	mov r0, #12
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #8]
	ldr r1, [sp, #12]
	add r1, r1, #0
	str r0, [r1]
	ldr r0, [sp, #12]
	add r1, r0, #4
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #12]
	add r1, r0, #8
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L58
.L60:
	b .L61
.L61:
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r3, r3, #0
	ldr r3, [r3]
	mov r4, #0
	cmp r2, r3
	movlt r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L62
	b .L63
.L62:
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r3, [r2]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl treeadd
	mov r0, r0
	ldr r1, [sp, #4]
	add r1, r1, #4
	str r0, [r1]
	b .L64
.L63:
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl treeadd
	mov r0, r0
	ldr r1, [sp, #4]
	add r1, r1, #8
	str r0, [r1]
	b .L64
.L64:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L58
.L58:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size treeadd, .-treeadd


	.align 2
	.global quickSort
quickSort:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #28
.L66:
	str r3, [sp, #4]
	mov r1, #0
	str r1, [sp, #16]
	mov r1, #0
	str r1, [sp, #20]
	ldr r1, [sp, #4]
	mov r0, r1
	bl size
	mov r2, r0
	mov r3, #0
	cmp r2, #1
	movle r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L68
	b .L69
.L68:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L67
.L69:
	b .L70
.L70:
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #0
	mov r1, r2
	bl get
	mov r4, r0
	ldr r5, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl size
	mov r3, r0
	mov r2, #1
	sub r2, r3, r2
	mov r0, r5
	mov r1, r2
	bl get
	mov r0, r0
	add r0, r4, r0
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	str r2, [sp, #8]
	ldr r2, [sp, #4]
	str r2, [sp, #24]
	mov r2, #0
	str r2, [sp, #12]
	ldr r3, [sp, #24]
	mov r2, #0
	mov r4, #0
	cmp r3, r2
	movne r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L71
	b .L72
.L71:
	ldr r2, [sp, #4]
	ldr r3, [sp, #12]
	mov r0, r2
	mov r1, r3
	bl get
	mov r3, r0
	ldr r4, [sp, #8]
	mov r2, #0
	cmp r3, r4
	movgt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L73
	b .L74
.L73:
	ldr r4, [sp, #20]
	ldr r3, [sp, #4]
	ldr r2, [sp, #12]
	mov r0, r3
	mov r1, r2
	bl get
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl add
	mov r2, r0
	str r2, [sp, #20]
	b .L75
.L74:
	ldr r4, [sp, #16]
	ldr r2, [sp, #4]
	ldr r3, [sp, #12]
	mov r0, r2
	mov r1, r3
	bl get
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl add
	mov r2, r0
	str r2, [sp, #16]
	b .L75
.L75:
	ldr r2, [sp, #24]
	add r2, r2, #4
	ldr r2, [r2]
	str r2, [sp, #24]
	ldr r2, [sp, #12]
	mov r3, #1
	add r2, r2, r3
	str r2, [sp, #12]
	ldr r4, [sp, #24]
	mov r3, #0
	mov r2, #0
	cmp r4, r3
	movne r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L71
	b .L72
.L72:
	ldr r1, [sp, #4]
	mov r0, r1
	bl freeList
	ldr r1, [sp, #16]
	mov r0, r1
	bl quickSort
	mov r4, r0
	ldr r1, [sp, #20]
	mov r0, r1
	bl quickSort
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl concatLists
	mov r0, r0
	str r0, [sp, #0]
	b .L67
.L67:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size quickSort, .-quickSort


	.align 2
	.global quickSortMain
quickSortMain:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #8
.L77:
	str r3, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl printList
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl printList
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L78
.L78:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size quickSortMain, .-quickSortMain


	.align 2
	.global treesearch
treesearch:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L80:
	str r3, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r3, [sp, #4]
	mov r4, #0
	mov r2, #0
	cmp r3, r4
	movne r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L82
	b .L83
.L82:
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	ldr r4, [sp, #8]
	mov r3, #0
	cmp r2, r4
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L85
	b .L86
.L83:
	b .L84
.L84:
	mov r0, #0
	str r0, [sp, #0]
	b .L81
.L85:
	mov r0, #1
	str r0, [sp, #0]
	b .L81
.L86:
	b .L87
.L87:
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl treesearch
	mov r3, r0
	mov r2, #0
	cmp r3, #1
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L88
	b .L89
.L88:
	mov r0, #1
	str r0, [sp, #0]
	b .L81
.L89:
	b .L90
.L90:
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl treesearch
	mov r1, r0
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L91
	b .L92
.L91:
	mov r0, #1
	str r0, [sp, #0]
	b .L81
.L92:
	mov r0, #0
	str r0, [sp, #0]
	b .L81
.L81:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size treesearch, .-treesearch


	.align 2
	.global inOrder
inOrder:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #12
.L95:
	str r3, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	mov r0, #0
	cmp r1, r2
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L97
	b .L98
.L97:
	mov r0, #8
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #0
	ldr r1, [r1]
	ldr r2, [sp, #8]
	add r2, r2, #0
	str r1, [r2]
	ldr r1, [sp, #8]
	add r1, r1, #4
	mov r2, #0
	str r2, [r1]
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl inOrder
	mov r4, r0
	ldr r5, [sp, #8]
	ldr r1, [sp, #4]
	add r1, r1, #8
	ldr r1, [r1]
	mov r0, r1
	bl inOrder
	mov r2, r0
	mov r0, r5
	mov r1, r2
	bl concatLists
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl concatLists
	mov r0, r0
	str r0, [sp, #0]
	b .L96
.L98:
	mov r0, #0
	str r0, [sp, #0]
	b .L96
.L96:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size inOrder, .-inOrder


	.align 2
	.global bintreesearch
bintreesearch:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L101:
	str r3, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r3, #0
	mov r4, #0
	cmp r2, r3
	movne r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L103
	b .L104
.L103:
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r4, [r2]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r4, r2
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L106
	b .L107
.L104:
	b .L105
.L105:
	mov r0, #0
	str r0, [sp, #0]
	b .L102
.L106:
	mov r0, #1
	str r0, [sp, #0]
	b .L102
.L107:
	b .L108
.L108:
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r3, r3, #0
	ldr r3, [r3]
	mov r4, #0
	cmp r2, r3
	movlt r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L109
	b .L110
.L109:
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r3, [r2]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	str r0, [sp, #0]
	b .L102
.L110:
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl bintreesearch
	mov r0, r0
	str r0, [sp, #0]
	b .L102
.L102:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size bintreesearch, .-bintreesearch


	.align 2
	.global buildTree
buildTree:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #16
.L113:
	str r3, [sp, #4]
	mov r1, #0
	str r1, [sp, #12]
	mov r1, #0
	str r1, [sp, #8]
	ldr r4, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r1
	bl size
	mov r3, r0
	mov r2, #0
	cmp r4, r3
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L115
	b .L116
.L115:
	ldr r4, [sp, #12]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl get
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl treeadd
	mov r1, r0
	str r1, [sp, #12]
	ldr r2, [sp, #8]
	mov r1, #1
	add r1, r2, r1
	str r1, [sp, #8]
	ldr r4, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, r1
	bl size
	mov r2, r0
	mov r3, #0
	cmp r4, r2
	movlt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L115
	b .L116
.L116:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L114
.L114:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size buildTree, .-buildTree


	.align 2
	.global treeMain
treeMain:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r3, r0
	sub sp, sp, #16
.L118:
	str r3, [sp, #0]
	ldr r1, [sp, #0]
	mov r0, r1
	bl buildTree
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl treeprint
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl inOrder
	mov r1, r0
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	mov r0, r1
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #8]
	mov r0, r1
	bl freeList
	ldr r1, [sp, #4]
	mov r0, r1
	bl postOrder
	mov r1, r0
	str r1, [sp, #12]
	ldr r1, [sp, #12]
	mov r0, r1
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #12]
	mov r0, r1
	bl freeList
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #0
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #10
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r3, #0
	mov r4, #2
	sub r3, r3, r4
	mov r0, r2
	mov r1, r3
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #2
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #3
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #9
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #1
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #0
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #10
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r3, #0
	mov r4, #2
	sub r3, r3, r4
	mov r0, r2
	mov r1, r3
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #2
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #3
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #9
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r2, [sp, #4]
	mov r0, r2
	mov r2, #1
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #4]
	mov r0, r1
	bl freeTree
	b .L119
.L119:
	add sp, sp, #16
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size treeMain, .-treeMain


	.align 2
	.global myCopy
myCopy:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r2, r0
	sub sp, sp, #8
.L121:
	str r2, [sp, #4]
	ldr r4, [sp, #4]
	mov r3, #0
	mov r2, #0
	cmp r4, r3
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L123
	b .L124
.L123:
	mov r0, #0
	str r0, [sp, #0]
	b .L122
.L124:
	b .L125
.L125:
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r3, [r2]
	mov r2, #0
	mov r0, r2
	mov r1, r3
	bl add
	mov r4, r0
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl myCopy
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl concatLists
	mov r0, r0
	str r0, [sp, #0]
	b .L122
.L122:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size myCopy, .-myCopy


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #28
.L127:
	mov r1, #0
	str r1, [sp, #12]
	mov r1, #0
	str r1, [sp, #16]
	mov r1, #0
	str r1, [sp, #20]
	mov r1, #0
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #10
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L129
	b .L130
.L129:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	str r3, [r2, #0]
	ldr r2, [r2]
	str r2, [sp, #8]
	ldr r2, [sp, #12]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl add
	mov r1, r0
	str r1, [sp, #12]
	ldr r1, [sp, #12]
	mov r0, r1
	bl myCopy
	mov r1, r0
	str r1, [sp, #16]
	ldr r1, [sp, #12]
	mov r0, r1
	bl myCopy
	mov r1, r0
	str r1, [sp, #20]
	ldr r1, [sp, #16]
	mov r0, r1
	bl quickSortMain
	mov r1, r0
	str r1, [sp, #24]
	ldr r1, [sp, #24]
	mov r0, r1
	bl freeList
	ldr r1, [sp, #20]
	mov r0, r1
	bl treeMain
	ldr r2, [sp, #4]
	mov r1, #1
	add r1, r2, r1
	str r1, [sp, #4]
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #10
	movlt r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L129
	b .L130
.L130:
	ldr r1, [sp, #12]
	mov r0, r1
	bl freeList
	ldr r1, [sp, #16]
	mov r0, r1
	bl freeList
	ldr r1, [sp, #20]
	mov r0, r1
	bl freeList
	mov r0, #0
	str r0, [sp, #0]
	b .L128
.L128:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
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