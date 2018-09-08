	.arch armv7-a


.text
	.align 2
	.global cleanBoard
cleanBoard:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #4
.L1:
	str r0, [sp, #0]
	ldr r0, [sp, #0]
	add r0, r0, #0
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0]
	add r0, r0, #4
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0]
	add r1, r0, #8
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r1, r0, #12
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r0, r0, #16
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0]
	add r1, r0, #20
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r1, r0, #24
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r1, r0, #28
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r0, r0, #32
	mov r1, #0
	str r1, [r0]
	b .L2
.L2:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size cleanBoard, .-cleanBoard


	.align 2
	.global printBoard
printBoard:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #4
.L4:
	str r0, [sp, #0]
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #12
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #16
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #20
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #28
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	ldr r0, [sp, #0]
	add r0, r0, #32
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L5
.L5:
	add sp, sp, #4
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size printBoard, .-printBoard


	.align 2
	.global printMoveBoard
printMoveBoard:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #0
.L7:
	mov r0, #123
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:456
	movt r0, #:upper16:456
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	movw r0, #:lower16:789
	movt r0, #:upper16:789
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L8
.L8:
	add sp, sp, #0
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size printMoveBoard, .-printMoveBoard


	.align 2
	.global placePiece
placePiece:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	mov r1, r1
	mov r2, r2
	sub sp, sp, #12
.L10:
	str r0, [sp, #0]
	str r1, [sp, #4]
	str r2, [sp, #8]
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L12
	b .L13
.L12:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #0
	str r0, [r1]
	b .L14
.L13:
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L15
	b .L16
.L14:
	b .L11
.L15:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #4
	str r0, [r1]
	b .L17
.L16:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #3
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L18
	b .L19
.L17:
	b .L14
.L18:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #8
	str r0, [r1]
	b .L20
.L19:
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #4
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L21
	b .L22
.L20:
	b .L17
.L21:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #12
	str r0, [r1]
	b .L23
.L22:
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #5
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L24
	b .L25
.L23:
	b .L20
.L24:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #16
	str r0, [r1]
	b .L26
.L25:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #6
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L27
	b .L28
.L26:
	b .L23
.L27:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #20
	str r0, [r1]
	b .L29
.L28:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #7
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L30
	b .L31
.L29:
	b .L26
.L30:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #24
	str r0, [r1]
	b .L32
.L31:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #8
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L33
	b .L34
.L32:
	b .L29
.L33:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #28
	str r0, [r1]
	b .L35
.L34:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #9
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L36
	b .L37
.L35:
	b .L32
.L36:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0]
	add r1, r1, #32
	str r0, [r1]
	b .L38
.L37:
	b .L38
.L38:
	b .L35
.L11:
	add sp, sp, #12
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size placePiece, .-placePiece


	.align 2
	.global checkWinner
checkWinner:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	mov r0, r0
	sub sp, sp, #8
.L40:
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L42
	b .L43
.L42:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L45
	b .L46
.L43:
	b .L44
.L44:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L51
	b .L52
.L45:
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L48
	b .L49
.L46:
	b .L47
.L47:
	b .L44
.L48:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L49:
	b .L50
.L50:
	b .L47
.L51:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L54
	b .L55
.L52:
	b .L53
.L53:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L60
	b .L61
.L54:
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L57
	b .L58
.L55:
	b .L56
.L56:
	b .L53
.L57:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L58:
	b .L59
.L59:
	b .L56
.L60:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L63
	b .L64
.L61:
	b .L62
.L62:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L69
	b .L70
.L63:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L66
	b .L67
.L64:
	b .L65
.L65:
	b .L62
.L66:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L67:
	b .L68
.L68:
	b .L65
.L69:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L72
	b .L73
.L70:
	b .L71
.L71:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L78
	b .L79
.L72:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L75
	b .L76
.L73:
	b .L74
.L74:
	b .L71
.L75:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L76:
	b .L77
.L77:
	b .L74
.L78:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L81
	b .L82
.L79:
	b .L80
.L80:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L87
	b .L88
.L81:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L84
	b .L85
.L82:
	b .L83
.L83:
	b .L80
.L84:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L85:
	b .L86
.L86:
	b .L83
.L87:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L90
	b .L91
.L88:
	b .L89
.L89:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L96
	b .L97
.L90:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L93
	b .L94
.L91:
	b .L92
.L92:
	b .L89
.L93:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L94:
	b .L95
.L95:
	b .L92
.L96:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L99
	b .L100
.L97:
	b .L98
.L98:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L105
	b .L106
.L99:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L102
	b .L103
.L100:
	b .L101
.L101:
	b .L98
.L102:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L103:
	b .L104
.L104:
	b .L101
.L105:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L108
	b .L109
.L106:
	b .L107
.L107:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L114
	b .L115
.L108:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L111
	b .L112
.L109:
	b .L110
.L110:
	b .L107
.L111:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L112:
	b .L113
.L113:
	b .L110
.L114:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L117
	b .L118
.L115:
	b .L116
.L116:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L123
	b .L124
.L117:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L120
	b .L121
.L118:
	b .L119
.L119:
	b .L116
.L120:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L121:
	b .L122
.L122:
	b .L119
.L123:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L126
	b .L127
.L124:
	b .L125
.L125:
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L132
	b .L133
.L126:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L129
	b .L130
.L127:
	b .L128
.L128:
	b .L125
.L129:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L130:
	b .L131
.L131:
	b .L128
.L132:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L135
	b .L136
.L133:
	b .L134
.L134:
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L141
	b .L142
.L135:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L138
	b .L139
.L136:
	b .L137
.L137:
	b .L134
.L138:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L139:
	b .L140
.L140:
	b .L137
.L141:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L144
	b .L145
.L142:
	b .L143
.L143:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #0]
	b .L41
.L144:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L147
	b .L148
.L145:
	b .L146
.L146:
	b .L143
.L147:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L148:
	b .L149
.L149:
	b .L146
.L41:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	sub fp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	pop {fp, pc}
	.size checkWinner, .-checkWinner


	.align 2
	.global main
main:
	push {fp, lr}
	push {r4, r5, r6, r7, r8, r9, r10}
	add fp, sp, #4
	sub sp, sp, #28
.L151:
	mov r0, #0
	str r0, [sp, #20]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #12]
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #16]
	mov r0, #36
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #24]
	ldr r1, [sp, #24]
	mov r0, r1
	bl cleanBoard
	ldr r1, [sp, #16]
	mov r2, #0
	cmp r1, #0
	movlt r2, #1
	mov r1, r2
	ldr r3, [sp, #20]
	mov r2, #0
	cmp r3, #8
	movne r2, #1
	mov r2, r2
	and r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L153
	b .L154
.L153:
	ldr r1, [sp, #24]
	mov r0, r1
	bl printBoard
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #0
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L155
	b .L156
.L155:
	ldr r0, [sp, #4]
	mov r1, #1
	add r0, r0, r1
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r4, #:lower16:.read_scratch
	movt r4, #:upper16:.read_scratch
	str r3, [r4, #0]
	ldr r3, [r4]
	str r3, [sp, #8]
	ldr r4, [sp, #24]
	ldr r3, [sp, #8]
	mov r0, r4
	mov r4, #1
	mov r1, r4
	mov r2, r3
	bl placePiece
	b .L157
.L156:
	ldr r0, [sp, #4]
	mov r1, #1
	sub r0, r0, r1
	str r0, [sp, #4]
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r4, #:lower16:.read_scratch
	movt r4, #:upper16:.read_scratch
	str r3, [r4, #0]
	ldr r3, [r4]
	str r3, [sp, #12]
	ldr r4, [sp, #24]
	ldr r3, [sp, #12]
	mov r0, r4
	mov r4, #2
	mov r1, r4
	mov r2, r3
	bl placePiece
	b .L157
.L157:
	ldr r1, [sp, #24]
	mov r0, r1
	bl checkWinner
	mov r1, r0
	str r1, [sp, #16]
	ldr r2, [sp, #20]
	mov r1, #1
	add r1, r2, r1
	str r1, [sp, #20]
	ldr r2, [sp, #16]
	mov r1, #0
	cmp r2, #0
	movlt r1, #1
	mov r1, r1
	ldr r2, [sp, #20]
	mov r3, #0
	cmp r2, #8
	movne r3, #1
	mov r2, r3
	and r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L153
	b .L154
.L154:
	ldr r0, [sp, #16]
	mov r1, #1
	add r0, r0, r1
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L152
.L152:
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