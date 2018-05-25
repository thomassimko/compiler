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
	mov r4, r1
	sub sp, sp, #0
.L1:
	mov r2, #0
	mov r1, #0
	cmp r0, r2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L3
	b .L4
.L3:
	mov r0, r4
	b .L2
.L4:
	b .L5
.L5:
	add r1, r0, #4
	ldr r1, [r1]
	mov r3, #0
	mov r2, #0
	cmp r1, r3
	movne r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	mov r3, r0
	mov r2, r4
	mov r1, r0
	mov r4, r4
	mov r5, r0
	mov r0, r0
	beq .L6
	b .L7
.L6:
	mov r3, r3
	mov r4, r2
	mov r0, r1
	add r1, r3, #4
	ldr r5, [r1]
	add r1, r5, #4
	ldr r3, [r1]
	mov r2, #0
	mov r1, #0
	cmp r3, r2
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	mov r3, r5
	mov r2, r4
	mov r1, r0
	mov r4, r4
	mov r5, r5
	mov r0, r0
	beq .L6
	b .L7
.L7:
	mov r1, r4
	mov r2, r5
	mov r0, r0
	add r2, r2, #4
	str r1, [r2]
	mov r0, r0
	b .L2
.L2:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	mov r4, r1
	sub sp, sp, #0
.L9:
	mov r0, #8
	bl malloc
	mov r0, r0
	mov r0, r0
	add r1, r0, #0
	str r4, [r1]
	add r1, r0, #4
	str r6, [r1]
	mov r0, r0
	b .L10
.L10:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L12:
	mov r2, #0
	mov r1, #0
	cmp r6, r2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L14
	b .L15
.L14:
	mov r0, #0
	mov r0, r0
	b .L13
.L15:
	b .L16
.L16:
	add r1, r6, #4
	ldr r1, [r1]
	mov r0, r1
	bl size
	mov r0, r0
	mov r1, #1
	add r0, r1, r0
	mov r0, r0
	b .L13
.L13:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	mov r2, r1
	sub sp, sp, #0
.L18:
	mov r3, #0
	cmp r2, #0
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L20
	b .L21
.L20:
	add r0, r6, #0
	ldr r0, [r0]
	mov r0, r0
	b .L19
.L21:
	b .L22
.L22:
	add r3, r6, #4
	ldr r3, [r3]
	mov r4, #1
	sub r2, r2, r4
	mov r0, r3
	mov r1, r2
	bl get
	mov r0, r0
	mov r0, r0
	b .L19
.L19:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L24:
	add r0, r6, #4
	ldr r0, [r0]
	mov r0, r0
	b .L25
.L25:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L27:
	mov r1, #0
	mov r0, #0
	cmp r6, r1
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L29
	b .L30
.L29:
	add r0, r6, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r1, r6, #4
	ldr r1, [r1]
	mov r0, r1
	bl printList
	b .L31
.L30:
	b .L31
.L31:
	b .L28
.L28:
	add sp, sp, #0
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
	mov r5, r0
	sub sp, sp, #0
.L33:
	mov r2, #0
	mov r1, #0
	cmp r5, r2
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L35
	b .L36
.L35:
	add r1, r5, #4
	ldr r1, [r1]
	mov r0, r1
	bl treeprint
	add r0, r5, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r1, r5, #8
	ldr r1, [r1]
	mov r0, r1
	bl treeprint
	b .L37
.L36:
	b .L37
.L37:
	b .L34
.L34:
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L39:
	mov r2, #0
	mov r1, #0
	cmp r6, r2
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L41
	b .L42
.L41:
	add r1, r6, #4
	ldr r1, [r1]
	mov r0, r1
	bl freeList
	mov r1, r6
	mov r0, r1
	bl free
	b .L43
.L42:
	b .L43
.L43:
	b .L40
.L40:
	add sp, sp, #0
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
	mov r5, r0
	sub sp, sp, #0
.L45:
	mov r1, #0
	mov r2, #0
	cmp r5, r1
	moveq r2, #1
	mov r2, r2
	mov r1, #1
	eor r1, r2, r1
	mov r1, r1
	cmp r1, #1
	beq .L47
	b .L48
.L47:
	add r1, r5, #4
	ldr r1, [r1]
	mov r0, r1
	bl freeTree
	add r1, r5, #8
	ldr r1, [r1]
	mov r0, r1
	bl freeTree
	mov r1, r5
	mov r0, r1
	bl free
	b .L49
.L48:
	b .L49
.L49:
	b .L46
.L46:
	add sp, sp, #0
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
	mov r5, r0
	sub sp, sp, #0
.L51:
	mov r0, #0
	mov r1, #0
	cmp r5, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L53
	b .L54
.L53:
	mov r0, #8
	bl malloc
	mov r1, r0
	mov r4, r1
	add r1, r5, #0
	ldr r1, [r1]
	add r2, r4, #0
	str r1, [r2]
	add r1, r4, #4
	mov r2, #0
	str r2, [r1]
	add r1, r5, #4
	ldr r1, [r1]
	mov r0, r1
	bl postOrder
	mov r6, r0
	add r1, r5, #8
	ldr r1, [r1]
	mov r0, r1
	bl postOrder
	mov r2, r0
	mov r0, r6
	mov r1, r2
	bl concatLists
	mov r2, r0
	mov r0, r2
	mov r1, r4
	bl concatLists
	mov r0, r0
	mov r0, r0
	b .L52
.L54:
	b .L55
.L55:
	mov r0, #0
	mov r0, r0
	b .L52
.L52:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r5, r0
	mov r4, r1
	sub sp, sp, #0
.L57:
	mov r3, #0
	mov r2, #0
	cmp r5, r3
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L59
	b .L60
.L59:
	mov r0, #12
	bl malloc
	mov r0, r0
	mov r0, r0
	add r1, r0, #0
	str r4, [r1]
	add r2, r0, #4
	mov r1, #0
	str r1, [r2]
	add r1, r0, #8
	mov r2, #0
	str r2, [r1]
	mov r0, r0
	b .L58
.L60:
	b .L61
.L61:
	add r2, r5, #0
	ldr r3, [r2]
	mov r2, #0
	cmp r4, r3
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L62
	b .L63
.L62:
	add r2, r5, #4
	ldr r2, [r2]
	mov r0, r2
	mov r1, r4
	bl treeadd
	mov r0, r0
	add r1, r5, #4
	str r0, [r1]
	mov r0, r5
	b .L64
.L63:
	add r2, r5, #8
	ldr r2, [r2]
	mov r0, r2
	mov r1, r4
	bl treeadd
	mov r0, r0
	add r1, r5, #8
	str r0, [r1]
	mov r0, r5
	b .L64
.L64:
	mov r0, r0
	mov r0, r0
	b .L58
.L58:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L66:
	mov r0, r6
	bl size
	mov r3, r0
	mov r2, #0
	cmp r3, #1
	movle r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L68
	b .L69
.L68:
	mov r0, r6
	b .L67
.L69:
	b .L70
.L70:
	mov r0, r6
	mov r2, #0
	mov r1, r2
	bl get
	mov r4, r0
	mov r0, r6
	bl size
	mov r3, r0
	mov r2, #1
	sub r2, r3, r2
	mov r0, r6
	mov r1, r2
	bl get
	mov r0, r0
	add r0, r4, r0
	mov r1, #2
	mov r1, r1
	mov r0, r0
	bl __aeabi_idiv
	mov r2, r0
	mov r3, #0
	mov r4, #0
	cmp r6, r3
	movne r4, #1
	mov r3, r4
	mov r3, r3
	cmp r3, #1
	mov r9, r6
	mov r3, #0
	mov r5, r3
	mov r4, r2
	mov r7, #0
	mov r3, r7
	mov r8, #0
	mov r2, r8
	mov r10, r6
	mov r6, r6
	mov r8, r8
	mov r7, r7
	beq .L71
	b .L72
.L71:
	mov r6, r9
	mov r5, r5
	mov r4, r4
	mov r7, r3
	mov r8, r2
	mov r9, r10
	mov r0, r6
	mov r1, r5
	bl get
	mov r2, r0
	mov r3, #0
	cmp r2, r4
	movgt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L73
	b .L74
.L73:
	mov r0, r6
	mov r1, r5
	bl get
	mov r2, r0
	mov r0, r7
	mov r1, r2
	bl add
	mov r7, r0
	mov r2, r9
	mov r3, r5
	mov r5, r6
	mov r4, r4
	mov r7, r7
	mov r8, r8
	b .L75
.L74:
	mov r0, r6
	mov r1, r5
	bl get
	mov r2, r0
	mov r0, r8
	mov r1, r2
	bl add
	mov r8, r0
	mov r2, r9
	mov r3, r5
	mov r5, r6
	mov r4, r4
	mov r7, r7
	mov r8, r8
	b .L75
.L75:
	mov r9, r2
	mov r3, r3
	mov r6, r5
	mov r2, r4
	mov r7, r7
	mov r8, r8
	add r4, r9, #4
	ldr r10, [r4]
	mov r4, #1
	add r3, r3, r4
	mov r4, #0
	mov r5, #0
	cmp r10, r4
	movne r5, #1
	mov r4, r5
	mov r4, r4
	cmp r4, #1
	mov r9, r6
	mov r5, r3
	mov r4, r2
	mov r3, r7
	mov r2, r8
	mov r10, r10
	mov r6, r6
	mov r8, r8
	mov r7, r7
	beq .L71
	b .L72
.L72:
	mov r1, r6
	mov r4, r8
	mov r5, r7
	mov r0, r1
	bl freeList
	mov r0, r4
	bl quickSort
	mov r4, r0
	mov r0, r5
	bl quickSort
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl concatLists
	mov r0, r0
	mov r0, r0
	b .L67
.L67:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L77:
	mov r0, r6
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r6
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r6
	bl printList
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	mov r0, r0
	b .L78
.L78:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r5, r0
	mov r4, r1
	sub sp, sp, #0
.L80:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r0, #-1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r3, #0
	mov r2, #0
	cmp r5, r3
	movne r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L82
	b .L83
.L82:
	add r2, r5, #0
	ldr r2, [r2]
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
	mov r0, r0
	b .L81
.L85:
	mov r0, #1
	mov r0, r0
	b .L81
.L86:
	b .L87
.L87:
	add r2, r5, #4
	ldr r2, [r2]
	mov r0, r2
	mov r1, r4
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
	mov r0, r0
	b .L81
.L89:
	b .L90
.L90:
	add r2, r5, #8
	ldr r2, [r2]
	mov r0, r2
	mov r1, r4
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
	mov r0, r0
	b .L81
.L92:
	mov r0, #0
	mov r0, r0
	b .L81
.L81:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r5, r0
	sub sp, sp, #0
.L95:
	mov r1, #0
	mov r0, #0
	cmp r5, r1
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
	mov r4, r1
	add r1, r5, #0
	ldr r2, [r1]
	add r1, r4, #0
	str r2, [r1]
	add r2, r4, #4
	mov r1, #0
	str r1, [r2]
	add r1, r5, #4
	ldr r1, [r1]
	mov r0, r1
	bl inOrder
	mov r6, r0
	add r1, r5, #8
	ldr r1, [r1]
	mov r0, r1
	bl inOrder
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl concatLists
	mov r2, r0
	mov r0, r6
	mov r1, r2
	bl concatLists
	mov r0, r0
	mov r0, r0
	b .L96
.L98:
	mov r0, #0
	mov r0, r0
	b .L96
.L96:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r5, r0
	mov r4, r1
	sub sp, sp, #0
.L101:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r0, #-1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r2, #0
	mov r3, #0
	cmp r5, r2
	movne r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L103
	b .L104
.L103:
	add r2, r5, #0
	ldr r3, [r2]
	mov r2, #0
	cmp r3, r4
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L106
	b .L107
.L104:
	b .L105
.L105:
	mov r0, #0
	mov r0, r0
	b .L102
.L106:
	mov r0, #1
	mov r0, r0
	b .L102
.L107:
	b .L108
.L108:
	add r2, r5, #0
	ldr r3, [r2]
	mov r2, #0
	cmp r4, r3
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L109
	b .L110
.L109:
	add r2, r5, #4
	ldr r2, [r2]
	mov r0, r2
	mov r1, r4
	bl bintreesearch
	mov r0, r0
	mov r0, r0
	b .L102
.L110:
	add r2, r5, #8
	ldr r2, [r2]
	mov r0, r2
	mov r1, r4
	bl bintreesearch
	mov r0, r0
	mov r0, r0
	b .L102
.L102:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L113:
	mov r0, r6
	bl size
	mov r2, r0
	mov r5, #0
	mov r3, #0
	cmp r5, r2
	movlt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	mov r4, #0
	mov r2, r4
	mov r3, r6
	mov r6, r5
	mov r4, r4
	beq .L115
	b .L116
.L115:
	mov r5, r2
	mov r4, r3
	mov r6, r6
	mov r0, r4
	mov r1, r6
	bl get
	mov r2, r0
	mov r0, r5
	mov r1, r2
	bl treeadd
	mov r5, r0
	mov r1, #1
	add r6, r6, r1
	mov r0, r4
	bl size
	mov r3, r0
	mov r2, #0
	cmp r6, r3
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r5
	mov r3, r4
	mov r6, r6
	mov r4, r5
	beq .L115
	b .L116
.L116:
	mov r0, r4
	mov r0, r0
	b .L114
.L114:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	mov r6, r0
	sub sp, sp, #0
.L118:
	mov r0, r6
	bl buildTree
	mov r4, r0
	mov r0, r4
	bl treeprint
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl inOrder
	mov r5, r0
	mov r0, r5
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	bl freeList
	mov r0, r4
	bl postOrder
	mov r5, r0
	mov r0, r5
	bl printList
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	bl freeList
	mov r0, r4
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r2, #0
	mov r3, #2
	sub r2, r2, r3
	mov r0, r4
	mov r2, #-2
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #2
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #3
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #1
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #0
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #10
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r3, #0
	mov r2, #2
	sub r2, r3, r2
	mov r0, r4
	mov r2, #-2
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #9
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	mov r2, #1
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
	movw r0, #:lower16:-999
	movt r0, #:upper16:-999
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	bl freeTree
	b .L119
.L119:
	add sp, sp, #0
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
	mov r4, r0
	sub sp, sp, #0
.L121:
	mov r2, #0
	mov r3, #0
	cmp r4, r2
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L123
	b .L124
.L123:
	mov r0, #0
	mov r0, r0
	b .L122
.L124:
	b .L125
.L125:
	add r2, r4, #0
	ldr r3, [r2]
	mov r2, #0
	mov r0, r2
	mov r1, r3
	bl add
	mov r5, r0
	add r1, r4, #4
	ldr r1, [r1]
	mov r0, r1
	bl myCopy
	mov r2, r0
	mov r0, r5
	mov r1, r2
	bl concatLists
	mov r0, r0
	mov r0, r0
	b .L122
.L122:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	sub sp, sp, #0
.L127:
	mov r1, #0
	mov r2, #0
	cmp r1, #10
	movlt r2, #1
	mov r2, #1
	mov r2, r2
	mov r2, #1
	mov r2, r2
	mov r2, #1
	cmp r2, #1
	mov r3, #0
	mov r2, r3
	mov r1, r1
	mov r3, r3
	mov r4, #0
	mov r4, r4
	mov r5, #0
	mov r5, r5
	beq .L129
	b .L130
.L129:
	mov r5, r2
	mov r4, r1
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	str r2, [r3, #0]
	ldr r2, [r3]
	mov r0, r5
	mov r1, r2
	bl add
	mov r7, r0
	mov r0, r7
	bl myCopy
	mov r6, r0
	mov r0, r7
	bl myCopy
	mov r5, r0
	mov r0, r6
	bl quickSortMain
	mov r1, r0
	mov r0, r1
	bl freeList
	mov r0, r5
	bl treeMain
	mov r1, #1
	add r1, r4, r1
	mov r2, #0
	cmp r1, #10
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r7
	mov r1, r1
	mov r3, r7
	mov r4, r6
	mov r5, r5
	beq .L129
	b .L130
.L130:
	mov r1, r3
	mov r4, r4
	mov r5, r5
	mov r0, r1
	bl freeList
	mov r0, r4
	bl freeList
	mov r0, r5
	bl freeList
	mov r0, #0
	mov r0, r0
	b .L128
.L128:
	mov r0, r0
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