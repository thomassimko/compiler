	.arch armv7-a


.text
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
	sub sp, sp, #0
.L10:
	mov r3, #0
	cmp r2, #1
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L12
	b .L13
.L12:
	add r0, r0, #0
	str r1, [r0]
	b .L14
.L13:
	mov r3, #0
	cmp r2, #2
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L15
	b .L16
.L14:
	b .L11
.L15:
	add r0, r0, #4
	str r1, [r0]
	b .L17
.L16:
	mov r3, #0
	cmp r2, #3
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L18
	b .L19
.L17:
	b .L14
.L18:
	add r0, r0, #8
	str r1, [r0]
	b .L20
.L19:
	mov r3, #0
	cmp r2, #4
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L21
	b .L22
.L20:
	b .L17
.L21:
	add r0, r0, #12
	str r1, [r0]
	b .L23
.L22:
	mov r3, #0
	cmp r2, #5
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L24
	b .L25
.L23:
	b .L20
.L24:
	add r0, r0, #16
	str r1, [r0]
	b .L26
.L25:
	mov r3, #0
	cmp r2, #6
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L27
	b .L28
.L26:
	b .L23
.L27:
	add r0, r0, #20
	str r1, [r0]
	b .L29
.L28:
	mov r3, #0
	cmp r2, #7
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L30
	b .L31
.L29:
	b .L26
.L30:
	add r0, r0, #24
	str r1, [r0]
	b .L32
.L31:
	mov r3, #0
	cmp r2, #8
	moveq r3, #1
	mov r3, r3
	mov r3, r3
	cmp r3, #1
	beq .L33
	b .L34
.L32:
	b .L29
.L33:
	add r0, r0, #28
	str r1, [r0]
	b .L35
.L34:
	mov r3, #0
	cmp r2, #9
	moveq r3, #1
	mov r2, r3
	mov r2, r2
	cmp r2, #1
	beq .L36
	b .L37
.L35:
	b .L32
.L36:
	add r0, r0, #32
	str r1, [r0]
	b .L38
.L37:
	b .L38
.L38:
	b .L35
.L11:
	add sp, sp, #0
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
	sub sp, sp, #0
.L40:
	add r1, r0, #0
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L42
	b .L43
.L42:
	add r1, r0, #4
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L45
	b .L46
.L43:
	mov r0, r0
	b .L44
.L44:
	mov r0, r0
	add r1, r0, #0
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L51
	b .L52
.L45:
	add r1, r0, #8
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L48
	b .L49
.L46:
	mov r0, r0
	b .L47
.L47:
	mov r0, r0
	mov r0, r0
	b .L44
.L48:
	mov r0, #0
	mov r0, r0
	b .L41
.L49:
	b .L50
.L50:
	mov r0, r0
	b .L47
.L51:
	add r1, r0, #4
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L54
	b .L55
.L52:
	mov r0, r0
	b .L53
.L53:
	mov r0, r0
	add r1, r0, #12
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L60
	b .L61
.L54:
	add r1, r0, #8
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L57
	b .L58
.L55:
	mov r0, r0
	b .L56
.L56:
	mov r0, r0
	mov r0, r0
	b .L53
.L57:
	mov r0, #1
	mov r0, r0
	b .L41
.L58:
	b .L59
.L59:
	mov r0, r0
	b .L56
.L60:
	add r1, r0, #16
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L63
	b .L64
.L61:
	mov r0, r0
	b .L62
.L62:
	mov r0, r0
	add r1, r0, #12
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L69
	b .L70
.L63:
	add r1, r0, #20
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L66
	b .L67
.L64:
	mov r0, r0
	b .L65
.L65:
	mov r0, r0
	mov r0, r0
	b .L62
.L66:
	mov r0, #0
	mov r0, r0
	b .L41
.L67:
	b .L68
.L68:
	mov r0, r0
	b .L65
.L69:
	add r1, r0, #16
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L72
	b .L73
.L70:
	mov r0, r0
	b .L71
.L71:
	mov r0, r0
	add r1, r0, #24
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L78
	b .L79
.L72:
	add r1, r0, #20
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L75
	b .L76
.L73:
	mov r0, r0
	b .L74
.L74:
	mov r0, r0
	mov r0, r0
	b .L71
.L75:
	mov r0, #1
	mov r0, r0
	b .L41
.L76:
	b .L77
.L77:
	mov r0, r0
	b .L74
.L78:
	add r1, r0, #28
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L81
	b .L82
.L79:
	mov r0, r0
	b .L80
.L80:
	mov r0, r0
	add r1, r0, #24
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L87
	b .L88
.L81:
	add r1, r0, #32
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L84
	b .L85
.L82:
	mov r0, r0
	b .L83
.L83:
	mov r0, r0
	mov r0, r0
	b .L80
.L84:
	mov r0, #0
	mov r0, r0
	b .L41
.L85:
	b .L86
.L86:
	mov r0, r0
	b .L83
.L87:
	add r1, r0, #28
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L90
	b .L91
.L88:
	mov r0, r0
	b .L89
.L89:
	mov r0, r0
	add r1, r0, #0
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L96
	b .L97
.L90:
	add r1, r0, #32
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L93
	b .L94
.L91:
	mov r0, r0
	b .L92
.L92:
	mov r0, r0
	mov r0, r0
	b .L89
.L93:
	mov r0, #1
	mov r0, r0
	b .L41
.L94:
	b .L95
.L95:
	mov r0, r0
	b .L92
.L96:
	add r1, r0, #12
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L99
	b .L100
.L97:
	mov r0, r0
	b .L98
.L98:
	mov r0, r0
	add r1, r0, #0
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L105
	b .L106
.L99:
	add r1, r0, #24
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L102
	b .L103
.L100:
	mov r0, r0
	b .L101
.L101:
	mov r0, r0
	mov r0, r0
	b .L98
.L102:
	mov r0, #0
	mov r0, r0
	b .L41
.L103:
	b .L104
.L104:
	mov r0, r0
	b .L101
.L105:
	add r1, r0, #12
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L108
	b .L109
.L106:
	mov r0, r0
	b .L107
.L107:
	mov r0, r0
	add r1, r0, #4
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L114
	b .L115
.L108:
	add r1, r0, #24
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #2
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L111
	b .L112
.L109:
	mov r0, r0
	b .L110
.L110:
	mov r0, r0
	mov r0, r0
	b .L107
.L111:
	mov r0, #1
	mov r0, r0
	b .L41
.L112:
	b .L113
.L113:
	mov r0, r0
	b .L110
.L114:
	add r1, r0, #16
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L117
	b .L118
.L115:
	mov r0, r0
	b .L116
.L116:
	mov r0, r0
	add r1, r0, #4
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L123
	b .L124
.L117:
	add r1, r0, #28
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L120
	b .L121
.L118:
	mov r0, r0
	b .L119
.L119:
	mov r0, r0
	mov r0, r0
	b .L116
.L120:
	mov r0, #0
	mov r0, r0
	b .L41
.L121:
	b .L122
.L122:
	mov r0, r0
	b .L119
.L123:
	add r1, r0, #16
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L126
	b .L127
.L124:
	mov r0, r0
	b .L125
.L125:
	mov r0, r0
	add r1, r0, #8
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L132
	b .L133
.L126:
	add r1, r0, #28
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L129
	b .L130
.L127:
	mov r0, r0
	b .L128
.L128:
	mov r0, r0
	mov r0, r0
	b .L125
.L129:
	mov r0, #1
	mov r0, r0
	b .L41
.L130:
	b .L131
.L131:
	mov r0, r0
	b .L128
.L132:
	add r1, r0, #20
	ldr r2, [r1]
	mov r1, #0
	cmp r2, #1
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L135
	b .L136
.L133:
	mov r0, r0
	b .L134
.L134:
	mov r0, r0
	add r1, r0, #8
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L141
	b .L142
.L135:
	add r1, r0, #32
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #1
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L138
	b .L139
.L136:
	mov r0, r0
	b .L137
.L137:
	mov r0, r0
	mov r0, r0
	b .L134
.L138:
	mov r0, #0
	mov r0, r0
	b .L41
.L139:
	b .L140
.L140:
	mov r0, r0
	b .L137
.L141:
	add r1, r0, #20
	ldr r1, [r1]
	mov r2, #0
	cmp r1, #2
	moveq r2, #1
	mov r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L144
	b .L145
.L142:
	b .L143
.L143:
	mov r0, #0
	mov r1, #1
	sub r0, r0, r1
	mov r0, #-1
	mov r0, r0
	b .L41
.L144:
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
	mov r0, r0
	b .L41
.L148:
	b .L149
.L149:
	b .L146
.L41:
	mov r0, r0
	mov r0, r0
	add sp, sp, #0
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
	sub sp, sp, #0
.L151:
	mov r1, #0
	mov r0, #1
	sub r0, r1, r0
	mov r0, #36
	bl malloc
	mov r1, r0
	mov r1, r1
	add r2, r1, #0
	mov r3, #0
	str r3, [r2]
	add r3, r1, #4
	mov r2, #0
	str r2, [r3]
	add r3, r1, #8
	mov r2, #0
	str r2, [r3]
	add r3, r1, #12
	mov r2, #0
	str r2, [r3]
	add r2, r1, #16
	mov r3, #0
	str r3, [r2]
	add r3, r1, #20
	mov r2, #0
	str r2, [r3]
	add r2, r1, #24
	mov r3, #0
	str r3, [r2]
	add r2, r1, #28
	mov r3, #0
	str r3, [r2]
	add r3, r1, #32
	mov r2, #0
	str r2, [r3]
	mov r2, #1
	cmp r2, #1
	mov r3, r1
	mov r1, #0
	mov r5, r1
	mov r1, #0
	mov r2, r1
	mov r1, #-1
	mov r1, r1
	beq .L153
	b .L154
.L153:
	mov r4, r3
	mov r6, r5
	mov r5, r2
	add r0, r4, #0
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r4, #4
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r4, #8
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r0, r4, #12
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r4, #16
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r4, #20
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	add r0, r4, #24
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r4, #28
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINT_FMT
	movt r0, #:upper16:.PRINT_FMT
	bl printf
	add r0, r4, #32
	ldr r0, [r0]
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r1, #0
	cmp r6, #0
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L155
	b .L156
.L155:
	mov r0, #1
	add r6, r6, r0
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r7, #:lower16:.read_scratch
	movt r7, #:upper16:.read_scratch
	str r3, [r7, #0]
	ldr r7, [r7]
	mov r0, r4
	mov r3, #1
	mov r1, r3
	mov r2, r7
	bl placePiece
	mov r2, r4
	mov r1, r5
	mov r3, r6
	b .L157
.L156:
	mov r0, #1
	sub r6, r6, r0
	movw r1, #:lower16:.read_scratch
	movt r1, #:upper16:.read_scratch
	movw r0, #:lower16:.READ_FMT
	movt r0, #:upper16:.READ_FMT
	bl scanf
	movw r3, #:lower16:.read_scratch
	movt r3, #:upper16:.read_scratch
	ldr r3, [r3]
	movw r7, #:lower16:.read_scratch
	movt r7, #:upper16:.read_scratch
	str r3, [r7, #0]
	ldr r3, [r7]
	mov r0, r4
	mov r7, #2
	mov r1, r7
	mov r2, r3
	bl placePiece
	mov r2, r4
	mov r1, r5
	mov r3, r6
	b .L157
.L157:
	mov r5, r2
	mov r6, r1
	mov r4, r3
	mov r0, r5
	bl checkWinner
	mov r1, r0
	mov r2, #1
	add r2, r6, r2
	mov r3, #0
	cmp r1, #0
	movlt r3, #1
	mov r3, r3
	mov r6, #0
	cmp r2, #8
	movne r6, #1
	mov r6, r6
	and r3, r3, r6
	mov r3, r3
	cmp r3, #1
	mov r3, r5
	mov r5, r4
	mov r2, r2
	mov r1, r1
	beq .L153
	b .L154
.L154:
	mov r1, r1
	mov r0, #1
	add r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	b .L152
.L152:
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