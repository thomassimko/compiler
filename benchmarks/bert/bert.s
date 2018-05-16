	.arch armv7-a
.comm	a,4,4
.comm	b,4,4
.comm	i,4,4


.text
	.align 2
	.global concatLists
concatLists:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	mov r1, r1
	sub sp, sp, #16
.L1:
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #12]
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r0, r1
	moveq r2, #1
	mov r0, r2
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
	ldr r1, [r0]
	mov r2, #0
	mov r0, #0
	cmp r1, r2
	movne r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L7
	b .L8
.L7:
	ldr r0, [sp, #12]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	add r0, r0, #4
	ldr r1, [r0]
	mov r0, #0
	mov r2, #0
	cmp r1, r0
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L7
	b .L8
.L8:
	ldr r0, [sp, #12]
	add r0, r0, #4
	ldr r1, [sp, #8]
	str r1, [r0]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L2
.L2:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size concatLists, .-concatLists


	.align 2
	.global add
add:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	mov r2, r1
	sub sp, sp, #16
.L10:
	str r3, [sp, #4]
	str r2, [sp, #8]
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	add r0, r0, #0
	ldr r1, [sp, #8]
	str r1, [r0]
	ldr r0, [sp, #12]
	add r1, r0, #4
	ldr r0, [sp, #4]
	str r0, [r1]
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L11
.L11:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size add, .-add


	.align 2
	.global size
size:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #8
.L13:
	str r3, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	moveq r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L15
	b .L16
.L15:
	mov r0, #0
	str r0, [sp, #0]
	b .L14
.L16:
	b .L17
.L17:
	ldr r1, [sp, #4]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl size
	mov r1, r0
	mov r0, #1
	add r0, r0, r1
	str r0, [sp, #0]
	b .L14
.L14:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size size, .-size


	.align 2
	.global get
get:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L20:
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r2, [sp, #8]
	mov r3, #0
	cmp r2, #0
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L22
	b .L23
.L22:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	str r0, [sp, #0]
	b .L21
.L23:
	b .L24
.L24:
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r2, [r2]
	ldr r4, [sp, #8]
	mov r3, #1
	sub r3, r4, r3
	mov r0, r2
	mov r1, r3
	bl get
	mov r0, r0
	str r0, [sp, #0]
	b .L21
.L21:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size get, .-get


	.align 2
	.global pop
pop:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #8
.L27:
	str r3, [sp, #4]
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L28
.L28:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size pop, .-pop


	.align 2
	.global printList
printList:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #4
.L30:
	str r3, [sp, #0]
	ldr r2, [sp, #0]
	mov r0, #0
	mov r1, #0
	cmp r2, r0
	movne r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L32
	b .L33
.L32:
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
	mov r1, #0
	mov r1, r0
	b .L34
.L33:
	b .L34
.L34:
	b .L31
.L31:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size printList, .-printList


	.align 2
	.global treeprint
treeprint:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #4
.L36:
	str r3, [sp, #0]
	ldr r3, [sp, #0]
	mov r1, #0
	mov r2, #0
	cmp r3, r1
	movne r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L38
	b .L39
.L38:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl treeprint
	mov r1, #0
	mov r1, r0
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
	mov r1, #0
	mov r1, r0
	b .L40
.L39:
	b .L40
.L40:
	b .L37
.L37:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size treeprint, .-treeprint


	.align 2
	.global freeList
freeList:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #4
.L42:
	str r3, [sp, #0]
	ldr r3, [sp, #0]
	mov r1, #0
	mov r2, #0
	cmp r3, r1
	movne r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L44
	b .L45
.L44:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl freeList
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #0]
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, #0
	mov r1, r0
	b .L46
.L45:
	b .L46
.L46:
	b .L43
.L43:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size freeList, .-freeList


	.align 2
	.global freeTree
freeTree:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #4
.L48:
	str r3, [sp, #0]
	ldr r1, [sp, #0]
	mov r3, #0
	mov r2, #0
	cmp r1, r3
	moveq r2, #1
	mov r1, r2
	mov r2, #1
	eor r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L50
	b .L51
.L50:
	ldr r1, [sp, #0]
	add r1, r1, #4
	ldr r1, [r1]
	mov r0, r1
	bl freeTree
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #0]
	add r1, r1, #8
	ldr r1, [r1]
	mov r0, r1
	bl freeTree
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #0]
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, #0
	mov r1, r0
	b .L52
.L51:
	b .L52
.L52:
	b .L49
.L49:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size freeTree, .-freeTree


	.align 2
	.global postOrder
postOrder:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #12
.L54:
	str r3, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #0
	mov r2, #0
	cmp r1, r0
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L56
	b .L57
.L56:
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	str r2, [r1]
	ldr r1, [sp, #8]
	add r2, r1, #4
	mov r1, #0
	str r1, [r2]
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
	b .L55
.L57:
	b .L58
.L58:
	mov r0, #0
	str r0, [sp, #0]
	b .L55
.L55:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size postOrder, .-postOrder


	.align 2
	.global treeadd
treeadd:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	mov r2, r1
	sub sp, sp, #16
.L61:
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r4, [sp, #4]
	mov r3, #0
	mov r2, #0
	cmp r4, r3
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L63
	b .L64
.L63:
	movw r0, #:lower16:12
	movt r0, #:upper16:12
	bl malloc
	mov r0, r0
	mov r0, r0
	str r0, [sp, #12]
	ldr r0, [sp, #12]
	add r1, r0, #0
	ldr r0, [sp, #8]
	str r0, [r1]
	ldr r0, [sp, #12]
	add r0, r0, #4
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #12]
	add r1, r0, #8
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L62
.L64:
	b .L65
.L65:
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
	beq .L67
	b .L68
.L67:
	ldr r2, [sp, #4]
	add r4, r2, #4
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r0, r2
	mov r1, r3
	bl treeadd
	mov r0, r0
	str r0, [r4]
	b .L69
.L68:
	ldr r2, [sp, #4]
	add r4, r2, #8
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r3, [r2]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl treeadd
	mov r0, r0
	str r0, [r4]
	b .L69
.L69:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L62
.L62:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size treeadd, .-treeadd


	.align 2
	.global quickSort
quickSort:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #28
.L71:
	str r3, [sp, #4]
	mov r1, #0
	str r1, [sp, #16]
	mov r1, #0
	str r1, [sp, #20]
	ldr r1, [sp, #4]
	mov r0, r1
	bl size
	mov r3, r0
	mov r2, #0
	cmp r3, #1
	movle r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L73
	b .L74
.L73:
	ldr r0, [sp, #4]
	str r0, [sp, #0]
	b .L72
.L74:
	b .L75
.L75:
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
	mov r2, r0
	mov r3, #1
	sub r2, r2, r3
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
	mov r4, #0
	mov r2, #0
	cmp r3, r4
	movne r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L77
	b .L81
.L78:
	ldr r4, [sp, #20]
	ldr r2, [sp, #4]
	ldr r3, [sp, #12]
	mov r0, r2
	mov r1, r3
	bl get
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl add
	mov r1, r0
	str r1, [sp, #20]
	b .L80
.L79:
	ldr r4, [sp, #16]
	ldr r3, [sp, #4]
	ldr r2, [sp, #12]
	mov r0, r3
	mov r1, r2
	bl get
	mov r2, r0
	mov r0, r4
	mov r1, r2
	bl add
	mov r1, r0
	str r1, [sp, #16]
	b .L80
.L80:
	ldr r1, [sp, #24]
	add r1, r1, #4
	ldr r1, [r1]
	str r1, [sp, #24]
	ldr r2, [sp, #12]
	mov r1, #1
	add r1, r2, r1
	str r1, [sp, #12]
	ldr r1, [sp, #24]
	mov r2, #0
	mov r3, #0
	cmp r1, r2
	movne r3, #1
	mov r1, r3
	mov r1, r1
	cmp r1, #1
	beq .L77
	b .L81
.L77:
	ldr r2, [sp, #4]
	ldr r3, [sp, #12]
	mov r0, r2
	mov r1, r3
	bl get
	mov r2, r0
	ldr r4, [sp, #8]
	mov r3, #0
	cmp r2, r4
	movgt r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L78
	b .L79
.L81:
	ldr r1, [sp, #4]
	mov r0, r1
	bl freeList
	mov r1, #0
	mov r1, r0
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
	b .L72
.L72:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size quickSort, .-quickSort


	.align 2
	.global quickSortMain
quickSortMain:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #8
.L83:
	str r3, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl printList
	mov r1, #0
	mov r1, r0
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
	bl printList
	mov r1, #0
	mov r1, r0
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
	bl printList
	mov r1, #0
	mov r1, r0
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L84
.L84:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size quickSortMain, .-quickSortMain


	.align 2
	.global treesearch
treesearch:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L86:
	str r3, [sp, #4]
	str r2, [sp, #8]
	mov r1, #0
	mov r0, #1
	sub r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r4, [sp, #4]
	mov r3, #0
	mov r2, #0
	cmp r4, r3
	movne r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L88
	b .L89
.L88:
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
	beq .L91
	b .L92
.L89:
	b .L90
.L90:
	mov r0, #0
	str r0, [sp, #0]
	b .L87
.L91:
	mov r0, #1
	str r0, [sp, #0]
	b .L87
.L92:
	b .L93
.L93:
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
	beq .L95
	b .L96
.L95:
	mov r0, #1
	str r0, [sp, #0]
	b .L87
.L96:
	b .L97
.L97:
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r3, [r2]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl treesearch
	mov r0, r0
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L99
	b .L100
.L99:
	mov r0, #1
	str r0, [sp, #0]
	b .L87
.L100:
	mov r0, #0
	str r0, [sp, #0]
	b .L87
.L101:
	b .L90
.L87:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size treesearch, .-treesearch


	.align 2
	.global inOrder
inOrder:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #12
.L105:
	str r3, [sp, #4]
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0
	cmp r0, r1
	movne r2, #1
	mov r0, r2
	mov r0, r0
	cmp r0, #1
	beq .L107
	b .L108
.L107:
	movw r0, #:lower16:8
	movt r0, #:upper16:8
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	add r1, r1, #0
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	str r2, [r1]
	ldr r1, [sp, #8]
	add r2, r1, #4
	mov r1, #0
	str r1, [r2]
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
	b .L106
.L108:
	mov r0, #0
	str r0, [sp, #0]
	b .L106
.L109:
	b .L106
.L106:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size inOrder, .-inOrder


	.align 2
	.global bintreesearch
bintreesearch:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	mov r2, r1
	sub sp, sp, #12
.L113:
	str r3, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r4, [sp, #4]
	mov r2, #0
	mov r3, #0
	cmp r4, r2
	movne r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L115
	b .L116
.L115:
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	ldr r3, [sp, #8]
	mov r4, #0
	cmp r2, r3
	moveq r4, #1
	mov r2, r4
	mov r2, r2
	cmp r2, #1
	beq .L118
	b .L119
.L116:
	b .L117
.L117:
	mov r0, #0
	str r0, [sp, #0]
	b .L114
.L118:
	mov r0, #1
	str r0, [sp, #0]
	b .L114
.L119:
	b .L120
.L120:
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
	beq .L122
	b .L123
.L122:
	ldr r2, [sp, #4]
	add r2, r2, #4
	ldr r3, [r2]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	str r0, [sp, #0]
	b .L114
.L123:
	ldr r2, [sp, #4]
	add r2, r2, #8
	ldr r3, [r2]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
	bl bintreesearch
	mov r0, r0
	str r0, [sp, #0]
	b .L114
.L124:
	b .L117
.L114:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size bintreesearch, .-bintreesearch


	.align 2
	.global buildTree
buildTree:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #16
.L128:
	str r3, [sp, #4]
	mov r1, #0
	str r1, [sp, #12]
	mov r1, #0
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
	beq .L130
	b .L131
.L130:
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
	ldr r1, [sp, #8]
	mov r2, #1
	add r1, r1, r2
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
	beq .L130
	b .L131
.L131:
	ldr r0, [sp, #12]
	str r0, [sp, #0]
	b .L129
.L129:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size buildTree, .-buildTree


	.align 2
	.global treeMain
treeMain:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r3, r0
	sub sp, sp, #16
.L133:
	str r3, [sp, #0]
	ldr r1, [sp, #0]
	mov r0, r1
	bl buildTree
	mov r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, r1
	bl treeprint
	mov r1, #0
	mov r1, r0
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
	bl inOrder
	mov r1, r0
	str r1, [sp, #8]
	ldr r1, [sp, #8]
	mov r0, r1
	bl printList
	mov r1, #0
	mov r1, r0
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
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #4]
	mov r0, r1
	bl postOrder
	mov r1, r0
	str r1, [sp, #12]
	ldr r1, [sp, #12]
	mov r0, r1
	bl printList
	mov r1, #0
	mov r1, r0
	mov r0, #0
	movw r1, #:lower16:999
	movt r1, #:upper16:999
	sub r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r1, [sp, #12]
	mov r0, r1
	bl freeList
	mov r2, #0
	mov r2, r0
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
	mov r4, #0
	mov r3, #2
	sub r3, r4, r3
	mov r0, r2
	mov r1, r3
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
	mov r1, #0
	movw r0, #:lower16:999
	movt r0, #:upper16:999
	sub r0, r1, r0
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
	mov r1, #0
	mov r1, r0
	b .L134
.L134:
	add sp, sp, #16
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size treeMain, .-treeMain


	.align 2
	.global myCopy
myCopy:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r2, r0
	sub sp, sp, #8
.L136:
	str r2, [sp, #4]
	ldr r3, [sp, #4]
	mov r4, #0
	mov r2, #0
	cmp r3, r4
	moveq r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	beq .L138
	b .L139
.L138:
	mov r0, #0
	str r0, [sp, #0]
	b .L137
.L139:
	b .L140
.L140:
	ldr r2, [sp, #4]
	add r2, r2, #0
	ldr r2, [r2]
	mov r3, #0
	mov r0, r3
	mov r1, r2
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
	b .L137
.L137:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size myCopy, .-myCopy


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #28
.L143:
	mov r1, #0
	str r1, [sp, #12]
	mov r1, #0
	str r1, [sp, #16]
	mov r1, #0
	str r1, [sp, #20]
	mov r1, #0
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r1, #10
	movlt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L145
	b .L146
.L145:
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r2, #:lower16:.read_scratch
	movt r2, #:upper16:.read_scratch
	ldr r2, [r2]
	str r2, [sp, #8]
	ldr r3, [sp, #12]
	ldr r2, [sp, #8]
	mov r0, r3
	mov r1, r2
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
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #20]
	mov r0, r1
	bl treeMain
	mov r1, #0
	mov r1, r0
	ldr r2, [sp, #4]
	mov r1, #1
	add r1, r2, r1
	str r1, [sp, #4]
	ldr r1, [sp, #4]
	mov r2, #0
	cmp r1, #10
	movlt r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L145
	b .L146
.L146:
	ldr r1, [sp, #12]
	mov r0, r1
	bl freeList
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #16]
	mov r0, r1
	bl freeList
	mov r1, #0
	mov r1, r0
	ldr r1, [sp, #20]
	mov r0, r1
	bl freeList
	mov r1, #0
	mov r1, r0
	mov r0, #0
	str r0, [sp, #0]
	b .L144
.L144:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #28
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
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