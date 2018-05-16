	.arch armv7-a


.text
	.align 2
	.global cleanBoard
cleanBoard:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
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
	add r0, r0, #8
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0]
	add r1, r0, #12
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r0, r0, #16
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0]
	add r0, r0, #20
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0]
	add r1, r0, #24
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r1, r0, #28
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp, #0]
	add r1, r0, #32
	mov r0, #0
	str r0, [r1]
	b .L2
.L2:
	add sp, sp, #4
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size cleanBoard, .-cleanBoard


	.align 2
	.global printBoard
printBoard:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
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
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size printBoard, .-printBoard


	.align 2
	.global printMoveBoard
printMoveBoard:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
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
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size printMoveBoard, .-printMoveBoard


	.align 2
	.global placePiece
placePiece:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
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
	ldr r0, [sp, #0]
	add r0, r0, #0
	ldr r1, [sp, #4]
	str r1, [r0]
	b .L14
.L13:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L15
	b .L16
.L14:
	b .L11
.L15:
	ldr r0, [sp, #0]
	add r0, r0, #4
	ldr r1, [sp, #4]
	str r1, [r0]
	b .L17
.L16:
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #3
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L18
	b .L19
.L17:
	b .L14
.L18:
	ldr r0, [sp, #0]
	add r1, r0, #8
	ldr r0, [sp, #4]
	str r0, [r1]
	b .L20
.L19:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #4
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L21
	b .L22
.L20:
	b .L17
.L21:
	ldr r0, [sp, #0]
	add r0, r0, #12
	ldr r1, [sp, #4]
	str r1, [r0]
	b .L23
.L22:
	ldr r1, [sp, #8]
	mov r0, #0
	cmp r1, #5
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L24
	b .L25
.L23:
	b .L20
.L24:
	ldr r0, [sp, #0]
	add r1, r0, #16
	ldr r0, [sp, #4]
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
	ldr r0, [sp, #0]
	add r0, r0, #20
	ldr r1, [sp, #4]
	str r1, [r0]
	b .L29
.L28:
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #7
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L30
	b .L31
.L29:
	b .L26
.L30:
	ldr r0, [sp, #0]
	add r1, r0, #24
	ldr r0, [sp, #4]
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
	ldr r0, [sp, #0]
	add r1, r0, #28
	ldr r0, [sp, #4]
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
	ldr r0, [sp, #0]
	add r1, r0, #32
	ldr r0, [sp, #4]
	str r0, [r1]
	b .L38
.L37:
	b .L38
.L38:
	b .L35
.L11:
	add sp, sp, #12
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size placePiece, .-placePiece


	.align 2
	.global checkWinner
checkWinner:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	mov r0, r0
	sub sp, sp, #8
.L40:
	str r0, [sp, #4]
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L42
	b .L43
.L42:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
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
	beq .L52
	b .L53
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
.L52:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L55
	b .L56
.L53:
	b .L54
.L54:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L62
	b .L63
.L55:
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L58
	b .L59
.L56:
	b .L57
.L57:
	b .L54
.L58:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L59:
	b .L60
.L60:
	b .L57
.L62:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L65
	b .L66
.L63:
	b .L64
.L64:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L72
	b .L73
.L65:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L68
	b .L69
.L66:
	b .L67
.L67:
	b .L64
.L68:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L69:
	b .L70
.L70:
	b .L67
.L72:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L75
	b .L76
.L73:
	b .L74
.L74:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L82
	b .L83
.L75:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L78
	b .L79
.L76:
	b .L77
.L77:
	b .L74
.L78:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L79:
	b .L80
.L80:
	b .L77
.L82:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L85
	b .L86
.L83:
	b .L84
.L84:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L92
	b .L93
.L85:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L88
	b .L89
.L86:
	b .L87
.L87:
	b .L84
.L88:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L89:
	b .L90
.L90:
	b .L87
.L92:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L95
	b .L96
.L93:
	b .L94
.L94:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L102
	b .L103
.L95:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L98
	b .L99
.L96:
	b .L97
.L97:
	b .L94
.L98:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L99:
	b .L100
.L100:
	b .L97
.L102:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L105
	b .L106
.L103:
	b .L104
.L104:
	ldr r0, [sp, #4]
	add r0, r0, #0
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L112
	b .L113
.L105:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L108
	b .L109
.L106:
	b .L107
.L107:
	b .L104
.L108:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L109:
	b .L110
.L110:
	b .L107
.L112:
	ldr r0, [sp, #4]
	add r0, r0, #12
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L115
	b .L116
.L113:
	b .L114
.L114:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L122
	b .L123
.L115:
	ldr r0, [sp, #4]
	add r0, r0, #24
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L118
	b .L119
.L116:
	b .L117
.L117:
	b .L114
.L118:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L119:
	b .L120
.L120:
	b .L117
.L122:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L125
	b .L126
.L123:
	b .L124
.L124:
	ldr r0, [sp, #4]
	add r0, r0, #4
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L132
	b .L133
.L125:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L128
	b .L129
.L126:
	b .L127
.L127:
	b .L124
.L128:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L129:
	b .L130
.L130:
	b .L127
.L132:
	ldr r0, [sp, #4]
	add r0, r0, #16
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
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
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L142
	b .L143
.L135:
	ldr r0, [sp, #4]
	add r0, r0, #28
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
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
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L139:
	b .L140
.L140:
	b .L137
.L142:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #1
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L145
	b .L146
.L143:
	b .L144
.L144:
	ldr r0, [sp, #4]
	add r0, r0, #8
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L152
	b .L153
.L145:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #1
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L148
	b .L149
.L146:
	b .L147
.L147:
	b .L144
.L148:
	mov r0, #0
	str r0, [sp, #0]
	b .L41
.L149:
	b .L150
.L150:
	b .L147
.L152:
	ldr r0, [sp, #4]
	add r0, r0, #20
	ldr r0, [r0]
	mov r1, #0
	cmp r0, #2
	moveq r1, #1
	mov r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L155
	b .L156
.L153:
	b .L154
.L154:
	mov r1, #0
	mov r0, #1
	sub r0, r1, r0
	str r0, [sp, #0]
	b .L41
.L155:
	ldr r0, [sp, #4]
	add r0, r0, #32
	ldr r1, [r0]
	mov r0, #0
	cmp r1, #2
	moveq r0, #1
	mov r0, r0
	mov r0, r0
	cmp r0, #1
	beq .L158
	b .L159
.L156:
	b .L157
.L157:
	b .L154
.L158:
	mov r0, #1
	str r0, [sp, #0]
	b .L41
.L159:
	b .L160
.L160:
	b .L157
.L41:
	ldr r0, [sp, #0]
	mov r0, r0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, r9, r10}
	sub fp, sp, #4
	pop {fp, pc}
	.size checkWinner, .-checkWinner


	.align 2
	.global main
main:
	push {fp, lr}
	add fp, sp, #4
	push {r4, r5, r6, r7, r8, r9, r10}
	sub sp, sp, #28
.L163:
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
	movw r0, #:lower16:36
	movt r0, #:upper16:36
	bl malloc
	mov r1, r0
	mov r1, r1
	str r1, [sp, #24]
	ldr r1, [sp, #24]
	mov r0, r1
	bl cleanBoard
	mov r1, #0
	mov r1, r0
	ldr r2, [sp, #16]
	mov r1, #0
	cmp r2, #0
	movlt r1, #1
	mov r1, r1
	ldr r3, [sp, #20]
	mov r2, #0
	cmp r3, #8
	movne r2, #1
	mov r2, r2
	and r1, r1, r2
	mov r1, r1
	cmp r1, #1
	beq .L165
	b .L169
.L166:
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
	str r3, [sp, #8]
	ldr r4, [sp, #24]
	ldr r3, [sp, #8]
	mov r0, r4
	mov r4, #1
	mov r1, r4
	mov r2, r3
	bl placePiece
	mov r1, #0
	mov r1, r0
	b .L168
.L167:
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
	str r3, [sp, #12]
	ldr r4, [sp, #24]
	ldr r3, [sp, #12]
	mov r0, r4
	mov r4, #2
	mov r1, r4
	mov r2, r3
	bl placePiece
	mov r1, #0
	mov r1, r0
	b .L168
.L168:
	ldr r1, [sp, #24]
	mov r0, r1
	bl checkWinner
	mov r0, r0
	str r0, [sp, #16]
	ldr r1, [sp, #20]
	mov r0, #1
	add r0, r1, r0
	str r0, [sp, #20]
	ldr r0, [sp, #16]
	mov r1, #0
	cmp r0, #0
	movlt r1, #1
	mov r0, r1
	ldr r1, [sp, #20]
	mov r2, #0
	cmp r1, #8
	movne r2, #1
	mov r1, r2
	and r0, r0, r1
	mov r0, r0
	cmp r0, #1
	beq .L165
	b .L169
.L165:
	ldr r1, [sp, #24]
	mov r0, r1
	bl printBoard
	mov r1, #0
	mov r1, r0
	ldr r2, [sp, #4]
	mov r1, #0
	cmp r2, #0
	moveq r1, #1
	mov r1, r1
	mov r1, r1
	cmp r1, #1
	beq .L166
	b .L167
.L169:
	ldr r1, [sp, #16]
	mov r0, #1
	add r0, r1, r0
	mov r1, r0
	movw r0, #:lower16:.PRINTLN_FMT
	movt r0, #:upper16:.PRINTLN_FMT
	bl printf
	mov r0, #0
	str r0, [sp, #0]
	b .L164
.L164:
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