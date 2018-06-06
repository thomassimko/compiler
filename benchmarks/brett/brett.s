	.arch armv7-a
.comm	gi1,4,4
.comm	gb1,4,4
.comm	gs1,4,4
.comm	counter,4,4


.text
	.align 2
	.global printgroup
printgroup:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r4, r0
	sub sp, sp, #0
.L1:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L2
.L2:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size printgroup, .-printgroup


	.align 2
	.global setcounter
setcounter:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r1, r0
	sub sp, sp, #0
.L4:
	movw r0, #:lower16:counter
	movt r0, #:upper16:counter
	str r1, [r0]
	b .L5
.L5:
	mov r0, #1
	mov r0, r0
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size setcounter, .-setcounter


	.align 2
	.global takealltypes
takealltypes:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r5, r1
	mov r4, r2
	sub sp, sp, #0
.L7:
	mov r1, #0
	cmp r0, #3
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L9
	b .L10
.L9:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	mov r1, r4
	b .L11
.L10:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	mov r1, r4
	b .L11
.L11:
	mov r0, r0
	mov r4, r1
	mov r0, r0
	cmp r0, #1
	beq .L12
	b .L13
.L12:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	b .L14
.L13:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r4
	b .L14
.L14:
	mov r0, r0
	add r0, r0, #0
	ldr r0, [r0]
	mov r0, r0
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
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L17
.L17:
	b .L8
.L8:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size takealltypes, .-takealltypes


	.align 2
	.global tonofargs
tonofargs:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r0, r1
	mov r0, r2
	mov r0, r3
	ldr r7, [fp, #32]
	ldr r6, [fp, #36]
	ldr r5, [fp, #40]
	ldr r4, [fp, #44]
	sub sp, sp, #0
.L19:
	mov r0, #0
	cmp r7, #5
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L21
	b .L22
.L21:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r2, r6
	mov r0, r5
	mov r1, r4
	b .L23
.L22:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, r7
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r2, r6
	mov r0, r5
	mov r1, r4
	b .L23
.L23:
	mov r4, r2
	mov r5, r0
	mov r6, r1
	mov r0, #0
	cmp r4, #6
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L24
	b .L25
.L24:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	mov r1, r6
	b .L26
.L25:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	mov r1, r6
	b .L26
.L26:
	mov r4, r0
	mov r5, r1
	mov r0, #0
	cmp r4, #7
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L27
	b .L28
.L27:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	b .L29
.L28:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, r5
	b .L29
.L29:
	mov r4, r0
	mov r0, #0
	cmp r4, #8
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L30
	b .L31
.L30:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L32
.L31:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, r4
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L32
.L32:
	b .L20
.L20:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size tonofargs, .-tonofargs


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #16
.L43:
	movw r1, #:lower16:counter
	movt r1, #:upper16:counter
	mov r2, #0
	str r2, [r1]
	mov r1, #1
	mov r0, r1
	bl printgroup
	mov r1, #0
	cmp r1, #1
	beq .L45
	b .L46
.L45:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L47
.L46:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L47
.L47:
	mov r1, #0
	cmp r1, #1
	beq .L48
	b .L49
.L48:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L50
.L49:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L50
.L50:
	mov r1, #0
	cmp r1, #1
	beq .L51
	b .L52
.L51:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L53
.L52:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L53
.L53:
	mov r1, #1
	cmp r1, #1
	beq .L54
	b .L55
.L54:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L56
.L55:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L56
.L56:
	movw r1, #:lower16:counter
	movt r1, #:upper16:counter
	mov r2, #0
	str r2, [r1]
	mov r1, #2
	mov r0, r1
	bl printgroup
	mov r1, #1
	cmp r1, #1
	beq .L57
	b .L58
.L57:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L59
.L58:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L59
.L59:
	mov r1, #1
	cmp r1, #1
	beq .L60
	b .L61
.L60:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L62
.L61:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L62
.L62:
	mov r1, #1
	cmp r1, #1
	beq .L63
	b .L64
.L63:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L65
.L64:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L65
.L65:
	mov r1, #0
	cmp r1, #1
	beq .L66
	b .L67
.L66:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L68
.L67:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L68
.L68:
	mov r1, #3
	mov r0, r1
	bl printgroup
	mov r1, #1
	cmp r1, #1
	beq .L69
	b .L70
.L69:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L71
.L70:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L71
.L71:
	mov r1, #1
	cmp r1, #1
	beq .L72
	b .L73
.L72:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L74
.L73:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L74
.L74:
	mov r1, #0
	cmp r1, #1
	beq .L75
	b .L76
.L75:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L77
.L76:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L77
.L77:
	mov r1, #0
	cmp r1, #1
	beq .L78
	b .L79
.L78:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L80
.L79:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L80
.L80:
	mov r1, #0
	cmp r1, #1
	beq .L81
	b .L82
.L81:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L83
.L82:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L83
.L83:
	mov r1, #1
	cmp r1, #1
	beq .L84
	b .L85
.L84:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L86
.L85:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L86
.L86:
	mov r1, #1
	cmp r1, #1
	beq .L87
	b .L88
.L87:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L89
.L88:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L89
.L89:
	mov r1, #0
	cmp r1, #1
	beq .L90
	b .L91
.L90:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L92
.L91:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L92
.L92:
	mov r1, #0
	cmp r1, #1
	beq .L93
	b .L94
.L93:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L95
.L94:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L95
.L95:
	mov r1, #1
	cmp r1, #1
	beq .L96
	b .L97
.L96:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L98
.L97:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L98
.L98:
	mov r1, #1
	cmp r1, #1
	beq .L99
	b .L100
.L99:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L101
.L100:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L101
.L101:
	mov r1, #4
	mov r0, r1
	bl printgroup
	mov r1, #1
	cmp r1, #1
	beq .L102
	b .L103
.L102:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L104
.L103:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #5
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L104
.L104:
	mov r1, #1
	cmp r1, #1
	beq .L105
	b .L106
.L105:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L107
.L106:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #6
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L107
.L107:
	mov r1, #1
	cmp r1, #1
	beq .L108
	b .L109
.L108:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L110
.L109:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L110
.L110:
	mov r1, #1
	cmp r1, #1
	beq .L111
	b .L112
.L111:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L113
.L112:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #2
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L113
.L113:
	mov r1, #1
	cmp r1, #1
	beq .L114
	b .L115
.L114:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L116
.L115:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L116
.L116:
	mov r1, #5
	mov r0, r1
	bl printgroup
	mov r1, #1
	cmp r1, #1
	beq .L117
	b .L118
.L117:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L119
.L118:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L119
.L119:
	mov r1, #1
	cmp r1, #1
	beq .L120
	b .L121
.L120:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L122
.L121:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L122
.L122:
	mov r1, #1
	cmp r1, #1
	beq .L123
	b .L124
.L123:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L125
.L124:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L125
.L125:
	mov r1, #0
	cmp r1, #1
	beq .L126
	b .L127
.L126:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L128
.L127:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L128
.L128:
	mov r1, #0
	cmp r1, #1
	beq .L129
	b .L130
.L129:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L131
.L130:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L131
.L131:
	mov r1, #1
	cmp r1, #1
	beq .L132
	b .L133
.L132:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L134
.L133:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L134
.L134:
	mov r1, #0
	cmp r1, #1
	beq .L135
	b .L136
.L135:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L137
.L136:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L137
.L137:
	mov r1, #6
	mov r0, r1
	bl printgroup
	mov r1, #1
	cmp r1, #1
	mov r1, #0
	mov r2, r1
	mov r1, r1
	beq .L138
	b .L139
.L138:
	mov r5, r2
	mov r1, #0
	cmp r5, #5
	movge r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L140
	b .L141
.L140:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L142
.L141:
	mov r1, r5
	b .L142
.L142:
	mov r2, r1
	mov r1, #5
	add r1, r2, r1
	mov r2, #0
	cmp r1, #5
	movlt r2, #1
	mov r2, r2
	mov r2, r2
	cmp r2, #1
	mov r2, r1
	mov r1, r1
	beq .L138
	b .L139
.L139:
	mov r5, r1
	mov r1, #0
	cmp r5, #5
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L143
	b .L144
.L143:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L145
.L144:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r1, r5
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L145
.L145:
	mov r1, #7
	mov r0, r1
	bl printgroup
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r5, r1
	add r2, r5, #4
	mov r1, #42
	str r1, [r2]
	mov r1, #1
	mov r1, r1
	add r2, r5, #0
	str r1, [r2]
	add r1, r5, #4
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #42
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L146
	b .L147
.L146:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L148
.L147:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r5, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L148
.L148:
	mov r5, r1
	add r1, r5, #0
	ldr r1, [r1]
	mov r1, r1
	cmp r1, #1
	beq .L149
	b .L150
.L149:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L151
.L150:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L151
.L151:
	mov r5, r1
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	add r2, r5, #8
	str r1, [r2]
	add r1, r5, #8
	ldr r1, [r1]
	add r1, r1, #4
	mov r2, #13
	str r2, [r1]
	mov r1, #0
	mov r1, r1
	add r2, r5, #8
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	add r1, r5, #8
	ldr r1, [r1]
	add r1, r1, #4
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #13
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L152
	b .L153
.L152:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L154
.L153:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r5, #8
	ldr r0, [r0]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L154
.L154:
	mov r5, r1
	add r1, r5, #8
	ldr r1, [r1]
	add r1, r1, #0
	ldr r2, [r1]
	mov r1, #1
	eor r1, r2, r1
	mov r1, r1
	cmp r1, #1
	beq .L155
	b .L156
.L155:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L157
.L156:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L157
.L157:
	mov r5, r1
	mov r1, #0
	cmp r5, r5
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L158
	b .L159
.L158:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L160
.L159:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L160
.L160:
	mov r5, r1
	add r1, r5, #8
	ldr r2, [r1]
	mov r1, #0
	cmp r5, r2
	movne r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L161
	b .L162
.L161:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L163
.L162:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, r5
	b .L163
.L163:
	mov r5, r1
	add r1, r5, #8
	ldr r1, [r1]
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, r5
	mov r0, r1
	bl free
	mov r1, #8
	mov r0, r1
	bl printgroup
	movw r1, #:lower16:gi1
	movt r1, #:upper16:gi1
	mov r2, #7
	str r2, [r1]
	movw r1, #:lower16:gi1
	movt r1, #:upper16:gi1
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #7
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L164
	b .L165
.L164:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L166
.L165:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	movw r0, #:lower16:gi1
	movt r0, #:upper16:gi1
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L166
.L166:
	mov r1, #1
	mov r2, r1
	movw r1, #:lower16:gb1
	movt r1, #:upper16:gb1
	str r2, [r1]
	movw r1, #:lower16:gb1
	movt r1, #:upper16:gb1
	ldr r1, [r1]
	mov r1, r1
	cmp r1, #1
	beq .L167
	b .L168
.L167:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L169
.L168:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L169
.L169:
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r2, r1
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	str r2, [r1]
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #4
	mov r2, #34
	str r2, [r1]
	mov r1, #0
	mov r1, r1
	movw r2, #:lower16:gs1
	movt r2, #:upper16:gs1
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #4
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #34
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L170
	b .L171
.L170:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L172
.L171:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	movw r0, #:lower16:gs1
	movt r0, #:upper16:gs1
	ldr r0, [r0]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L172
.L172:
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #0
	ldr r2, [r1]
	mov r1, #1
	eor r1, r2, r1
	mov r1, r1
	cmp r1, #1
	beq .L173
	b .L174
.L173:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L175
.L174:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L175
.L175:
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	movw r2, #:lower16:gs1
	movt r2, #:upper16:gs1
	ldr r2, [r2]
	add r2, r2, #8
	str r1, [r2]
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #8
	ldr r1, [r1]
	add r2, r1, #4
	mov r1, #16
	str r1, [r2]
	mov r1, #1
	mov r1, r1
	movw r2, #:lower16:gs1
	movt r2, #:upper16:gs1
	ldr r2, [r2]
	add r2, r2, #8
	ldr r2, [r2]
	add r2, r2, #0
	str r1, [r2]
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #8
	ldr r1, [r1]
	add r1, r1, #4
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #16
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L176
	b .L177
.L176:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L178
.L177:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	movw r0, #:lower16:gs1
	movt r0, #:upper16:gs1
	ldr r0, [r0]
	add r0, r0, #8
	ldr r0, [r0]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L178
.L178:
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #8
	ldr r1, [r1]
	add r1, r1, #0
	ldr r1, [r1]
	mov r1, r1
	cmp r1, #1
	beq .L179
	b .L180
.L179:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L181
.L180:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L181
.L181:
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	add r1, r1, #8
	ldr r1, [r1]
	mov r1, r1
	mov r0, r1
	bl free
	movw r1, #:lower16:gs1
	movt r1, #:upper16:gs1
	ldr r1, [r1]
	mov r1, r1
	mov r0, r1
	bl free
	mov r1, #9
	mov r0, r1
	bl printgroup
	mov r0, #12
	bl malloc
	mov r3, r0
	mov r3, r3
	mov r5, #1
	mov r5, r5
	add r6, r3, #0
	str r5, [r6]
	mov r5, #3
	mov r0, r5
	mov r5, #1
	mov r1, r5
	mov r2, r3
	bl takealltypes
	mov r0, #2
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r5, #1
	mov r0, r5
	mov r5, #2
	mov r1, r5
	mov r5, #3
	mov r2, r5
	mov r5, #4
	mov r3, r5
	mov r5, #5
	str r5, [sp, #0]
	mov r5, #6
	str r5, [sp, #4]
	mov r5, #7
	str r5, [sp, #8]
	mov r5, #8
	str r5, [sp, #12]
	bl tonofargs
	mov r0, #3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #1
	cmp r1, #1
	beq .L182
	b .L183
.L182:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L184
.L183:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	mov r0, #3
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L184
.L184:
	mov r1, #1
	cmp r1, #1
	beq .L185
	b .L186
.L185:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L187
.L186:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L187
.L187:
	mov r0, #12
	bl malloc
	mov r1, r0
	mov r1, r1
	mov r2, #0
	cmp r1, r1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L188
	b .L189
.L188:
	mov r0, #1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L190
.L189:
	mov r0, #0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L190
.L190:
	mov r1, #10
	mov r0, r1
	bl printgroup
	b .L44
.L44:
	mov r0, #0
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