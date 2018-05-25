target triple="i686"

%struct.gameBoard = type {i32, i32, i32, i32, i32, i32, i32, i32, i32}

define void @cleanBoard(%struct.gameBoard* %board)
{

L1:
	%r0 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 0
	store i32 0, i32* %r0
	%r1 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 1
	store i32 0, i32* %r1
	%r2 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 2
	store i32 0, i32* %r2
	%r3 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 3
	store i32 0, i32* %r3
	%r4 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 4
	store i32 0, i32* %r4
	%r5 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 5
	store i32 0, i32* %r5
	%r6 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 6
	store i32 0, i32* %r6
	%r7 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 7
	store i32 0, i32* %r7
	%r8 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 8
	store i32 0, i32* %r8
	br label %L2
L2:
	ret void
}

define void @printBoard(%struct.gameBoard* %board)
{

L4:
	%r9 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 0
	%r10 = load i32, i32* %r9
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r10)
	%r11 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 1
	%r12 = load i32, i32* %r11
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r12)
	%r13 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 2
	%r14 = load i32, i32* %r13
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r14)
	%r15 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 3
	%r16 = load i32, i32* %r15
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r16)
	%r17 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 4
	%r18 = load i32, i32* %r17
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r18)
	%r19 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 5
	%r20 = load i32, i32* %r19
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r20)
	%r21 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 6
	%r22 = load i32, i32* %r21
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r22)
	%r23 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 7
	%r24 = load i32, i32* %r23
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r24)
	%r25 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 8
	%r26 = load i32, i32* %r25
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r26)
	br label %L5
L5:
	ret void
}

define void @printMoveBoard()
{

L7:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 123)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 456)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 789)
	br label %L8
L8:
	ret void
}

define void @placePiece(%struct.gameBoard* %board, i32 %turn, i32 %placement)
{

L10:
	%r27 = icmp eq i32 %placement, 1
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L12, label %L13

L12:
	%r30 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 0
	store i32 %turn, i32* %r30
	br label %L14
L13:
	%r31 = icmp eq i32 %placement, 2
	%r32 = zext i1 %r31 to i32
	%r33 = trunc i32 %r32 to i1
	br i1 %r33, label %L15, label %L16

L14:
	br label %L11
L15:
	%r34 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 1
	store i32 %turn, i32* %r34
	br label %L17
L16:
	%r35 = icmp eq i32 %placement, 3
	%r36 = zext i1 %r35 to i32
	%r37 = trunc i32 %r36 to i1
	br i1 %r37, label %L18, label %L19

L17:
	br label %L14
L18:
	%r38 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 2
	store i32 %turn, i32* %r38
	br label %L20
L19:
	%r39 = icmp eq i32 %placement, 4
	%r40 = zext i1 %r39 to i32
	%r41 = trunc i32 %r40 to i1
	br i1 %r41, label %L21, label %L22

L20:
	br label %L17
L21:
	%r42 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 3
	store i32 %turn, i32* %r42
	br label %L23
L22:
	%r43 = icmp eq i32 %placement, 5
	%r44 = zext i1 %r43 to i32
	%r45 = trunc i32 %r44 to i1
	br i1 %r45, label %L24, label %L25

L23:
	br label %L20
L24:
	%r46 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 4
	store i32 %turn, i32* %r46
	br label %L26
L25:
	%r47 = icmp eq i32 %placement, 6
	%r48 = zext i1 %r47 to i32
	%r49 = trunc i32 %r48 to i1
	br i1 %r49, label %L27, label %L28

L26:
	br label %L23
L27:
	%r50 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 5
	store i32 %turn, i32* %r50
	br label %L29
L28:
	%r51 = icmp eq i32 %placement, 7
	%r52 = zext i1 %r51 to i32
	%r53 = trunc i32 %r52 to i1
	br i1 %r53, label %L30, label %L31

L29:
	br label %L26
L30:
	%r54 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 6
	store i32 %turn, i32* %r54
	br label %L32
L31:
	%r55 = icmp eq i32 %placement, 8
	%r56 = zext i1 %r55 to i32
	%r57 = trunc i32 %r56 to i1
	br i1 %r57, label %L33, label %L34

L32:
	br label %L29
L33:
	%r58 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 7
	store i32 %turn, i32* %r58
	br label %L35
L34:
	%r59 = icmp eq i32 %placement, 9
	%r60 = zext i1 %r59 to i32
	%r61 = trunc i32 %r60 to i1
	br i1 %r61, label %L36, label %L37

L35:
	br label %L32
L36:
	%r62 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 8
	store i32 %turn, i32* %r62
	br label %L38
L37:
	br label %L38
L38:
	br label %L35
L11:
	ret void
}

define i32 @checkWinner(%struct.gameBoard* %board)
{

L40:
	%r63 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 0
	%r64 = load i32, i32* %r63
	%r65 = icmp eq i32 %r64, 1
	%r66 = zext i1 %r65 to i32
	%r67 = trunc i32 %r66 to i1
	br i1 %r67, label %L42, label %L43

L42:
	%r68 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 1
	%r69 = load i32, i32* %r68
	%r70 = icmp eq i32 %r69, 1
	%r71 = zext i1 %r70 to i32
	%r72 = trunc i32 %r71 to i1
	br i1 %r72, label %L45, label %L46

L43:
	br label %L44
L44:
	%r78 = phi %struct.gameBoard* [%r79, %L47], [%board, %L43]
	%r80 = getelementptr %struct.gameBoard , %struct.gameBoard* %r78, i1 0, i32 0
	%r81 = load i32, i32* %r80
	%r82 = icmp eq i32 %r81, 2
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L51, label %L52

L45:
	%r73 = getelementptr %struct.gameBoard , %struct.gameBoard* %board, i1 0, i32 2
	%r74 = load i32, i32* %r73
	%r75 = icmp eq i32 %r74, 1
	%r76 = zext i1 %r75 to i32
	%r77 = trunc i32 %r76 to i1
	br i1 %r77, label %L48, label %L49

L46:
	br label %L47
L47:
	%r79 = phi %struct.gameBoard* [%board, %L50], [%board, %L46]
	br label %L44
L48:
	br label %L41
L49:
	br label %L50
L50:
	br label %L47
L51:
	%r85 = getelementptr %struct.gameBoard , %struct.gameBoard* %r78, i1 0, i32 1
	%r86 = load i32, i32* %r85
	%r87 = icmp eq i32 %r86, 2
	%r88 = zext i1 %r87 to i32
	%r89 = trunc i32 %r88 to i1
	br i1 %r89, label %L54, label %L55

L52:
	br label %L53
L53:
	%r95 = phi %struct.gameBoard* [%r96, %L56], [%r78, %L52]
	%r97 = getelementptr %struct.gameBoard , %struct.gameBoard* %r95, i1 0, i32 3
	%r98 = load i32, i32* %r97
	%r99 = icmp eq i32 %r98, 1
	%r100 = zext i1 %r99 to i32
	%r101 = trunc i32 %r100 to i1
	br i1 %r101, label %L60, label %L61

L54:
	%r90 = getelementptr %struct.gameBoard , %struct.gameBoard* %r78, i1 0, i32 2
	%r91 = load i32, i32* %r90
	%r92 = icmp eq i32 %r91, 2
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L57, label %L58

L55:
	br label %L56
L56:
	%r96 = phi %struct.gameBoard* [%r78, %L59], [%r78, %L55]
	br label %L53
L57:
	br label %L41
L58:
	br label %L59
L59:
	br label %L56
L60:
	%r102 = getelementptr %struct.gameBoard , %struct.gameBoard* %r95, i1 0, i32 4
	%r103 = load i32, i32* %r102
	%r104 = icmp eq i32 %r103, 1
	%r105 = zext i1 %r104 to i32
	%r106 = trunc i32 %r105 to i1
	br i1 %r106, label %L63, label %L64

L61:
	br label %L62
L62:
	%r112 = phi %struct.gameBoard* [%r113, %L65], [%r95, %L61]
	%r114 = getelementptr %struct.gameBoard , %struct.gameBoard* %r112, i1 0, i32 3
	%r115 = load i32, i32* %r114
	%r116 = icmp eq i32 %r115, 2
	%r117 = zext i1 %r116 to i32
	%r118 = trunc i32 %r117 to i1
	br i1 %r118, label %L69, label %L70

L63:
	%r107 = getelementptr %struct.gameBoard , %struct.gameBoard* %r95, i1 0, i32 5
	%r108 = load i32, i32* %r107
	%r109 = icmp eq i32 %r108, 1
	%r110 = zext i1 %r109 to i32
	%r111 = trunc i32 %r110 to i1
	br i1 %r111, label %L66, label %L67

L64:
	br label %L65
L65:
	%r113 = phi %struct.gameBoard* [%r95, %L68], [%r95, %L64]
	br label %L62
L66:
	br label %L41
L67:
	br label %L68
L68:
	br label %L65
L69:
	%r119 = getelementptr %struct.gameBoard , %struct.gameBoard* %r112, i1 0, i32 4
	%r120 = load i32, i32* %r119
	%r121 = icmp eq i32 %r120, 2
	%r122 = zext i1 %r121 to i32
	%r123 = trunc i32 %r122 to i1
	br i1 %r123, label %L72, label %L73

L70:
	br label %L71
L71:
	%r129 = phi %struct.gameBoard* [%r130, %L74], [%r112, %L70]
	%r131 = getelementptr %struct.gameBoard , %struct.gameBoard* %r129, i1 0, i32 6
	%r132 = load i32, i32* %r131
	%r133 = icmp eq i32 %r132, 1
	%r134 = zext i1 %r133 to i32
	%r135 = trunc i32 %r134 to i1
	br i1 %r135, label %L78, label %L79

L72:
	%r124 = getelementptr %struct.gameBoard , %struct.gameBoard* %r112, i1 0, i32 5
	%r125 = load i32, i32* %r124
	%r126 = icmp eq i32 %r125, 2
	%r127 = zext i1 %r126 to i32
	%r128 = trunc i32 %r127 to i1
	br i1 %r128, label %L75, label %L76

L73:
	br label %L74
L74:
	%r130 = phi %struct.gameBoard* [%r112, %L77], [%r112, %L73]
	br label %L71
L75:
	br label %L41
L76:
	br label %L77
L77:
	br label %L74
L78:
	%r136 = getelementptr %struct.gameBoard , %struct.gameBoard* %r129, i1 0, i32 7
	%r137 = load i32, i32* %r136
	%r138 = icmp eq i32 %r137, 1
	%r139 = zext i1 %r138 to i32
	%r140 = trunc i32 %r139 to i1
	br i1 %r140, label %L81, label %L82

L79:
	br label %L80
L80:
	%r146 = phi %struct.gameBoard* [%r147, %L83], [%r129, %L79]
	%r148 = getelementptr %struct.gameBoard , %struct.gameBoard* %r146, i1 0, i32 6
	%r149 = load i32, i32* %r148
	%r150 = icmp eq i32 %r149, 2
	%r151 = zext i1 %r150 to i32
	%r152 = trunc i32 %r151 to i1
	br i1 %r152, label %L87, label %L88

L81:
	%r141 = getelementptr %struct.gameBoard , %struct.gameBoard* %r129, i1 0, i32 8
	%r142 = load i32, i32* %r141
	%r143 = icmp eq i32 %r142, 1
	%r144 = zext i1 %r143 to i32
	%r145 = trunc i32 %r144 to i1
	br i1 %r145, label %L84, label %L85

L82:
	br label %L83
L83:
	%r147 = phi %struct.gameBoard* [%r129, %L86], [%r129, %L82]
	br label %L80
L84:
	br label %L41
L85:
	br label %L86
L86:
	br label %L83
L87:
	%r153 = getelementptr %struct.gameBoard , %struct.gameBoard* %r146, i1 0, i32 7
	%r154 = load i32, i32* %r153
	%r155 = icmp eq i32 %r154, 2
	%r156 = zext i1 %r155 to i32
	%r157 = trunc i32 %r156 to i1
	br i1 %r157, label %L90, label %L91

L88:
	br label %L89
L89:
	%r163 = phi %struct.gameBoard* [%r164, %L92], [%r146, %L88]
	%r165 = getelementptr %struct.gameBoard , %struct.gameBoard* %r163, i1 0, i32 0
	%r166 = load i32, i32* %r165
	%r167 = icmp eq i32 %r166, 1
	%r168 = zext i1 %r167 to i32
	%r169 = trunc i32 %r168 to i1
	br i1 %r169, label %L96, label %L97

L90:
	%r158 = getelementptr %struct.gameBoard , %struct.gameBoard* %r146, i1 0, i32 8
	%r159 = load i32, i32* %r158
	%r160 = icmp eq i32 %r159, 2
	%r161 = zext i1 %r160 to i32
	%r162 = trunc i32 %r161 to i1
	br i1 %r162, label %L93, label %L94

L91:
	br label %L92
L92:
	%r164 = phi %struct.gameBoard* [%r146, %L95], [%r146, %L91]
	br label %L89
L93:
	br label %L41
L94:
	br label %L95
L95:
	br label %L92
L96:
	%r170 = getelementptr %struct.gameBoard , %struct.gameBoard* %r163, i1 0, i32 3
	%r171 = load i32, i32* %r170
	%r172 = icmp eq i32 %r171, 1
	%r173 = zext i1 %r172 to i32
	%r174 = trunc i32 %r173 to i1
	br i1 %r174, label %L99, label %L100

L97:
	br label %L98
L98:
	%r180 = phi %struct.gameBoard* [%r181, %L101], [%r163, %L97]
	%r182 = getelementptr %struct.gameBoard , %struct.gameBoard* %r180, i1 0, i32 0
	%r183 = load i32, i32* %r182
	%r184 = icmp eq i32 %r183, 2
	%r185 = zext i1 %r184 to i32
	%r186 = trunc i32 %r185 to i1
	br i1 %r186, label %L105, label %L106

L99:
	%r175 = getelementptr %struct.gameBoard , %struct.gameBoard* %r163, i1 0, i32 6
	%r176 = load i32, i32* %r175
	%r177 = icmp eq i32 %r176, 1
	%r178 = zext i1 %r177 to i32
	%r179 = trunc i32 %r178 to i1
	br i1 %r179, label %L102, label %L103

L100:
	br label %L101
L101:
	%r181 = phi %struct.gameBoard* [%r163, %L104], [%r163, %L100]
	br label %L98
L102:
	br label %L41
L103:
	br label %L104
L104:
	br label %L101
L105:
	%r187 = getelementptr %struct.gameBoard , %struct.gameBoard* %r180, i1 0, i32 3
	%r188 = load i32, i32* %r187
	%r189 = icmp eq i32 %r188, 2
	%r190 = zext i1 %r189 to i32
	%r191 = trunc i32 %r190 to i1
	br i1 %r191, label %L108, label %L109

L106:
	br label %L107
L107:
	%r197 = phi %struct.gameBoard* [%r198, %L110], [%r180, %L106]
	%r199 = getelementptr %struct.gameBoard , %struct.gameBoard* %r197, i1 0, i32 1
	%r200 = load i32, i32* %r199
	%r201 = icmp eq i32 %r200, 1
	%r202 = zext i1 %r201 to i32
	%r203 = trunc i32 %r202 to i1
	br i1 %r203, label %L114, label %L115

L108:
	%r192 = getelementptr %struct.gameBoard , %struct.gameBoard* %r180, i1 0, i32 6
	%r193 = load i32, i32* %r192
	%r194 = icmp eq i32 %r193, 2
	%r195 = zext i1 %r194 to i32
	%r196 = trunc i32 %r195 to i1
	br i1 %r196, label %L111, label %L112

L109:
	br label %L110
L110:
	%r198 = phi %struct.gameBoard* [%r180, %L113], [%r180, %L109]
	br label %L107
L111:
	br label %L41
L112:
	br label %L113
L113:
	br label %L110
L114:
	%r204 = getelementptr %struct.gameBoard , %struct.gameBoard* %r197, i1 0, i32 4
	%r205 = load i32, i32* %r204
	%r206 = icmp eq i32 %r205, 1
	%r207 = zext i1 %r206 to i32
	%r208 = trunc i32 %r207 to i1
	br i1 %r208, label %L117, label %L118

L115:
	br label %L116
L116:
	%r214 = phi %struct.gameBoard* [%r215, %L119], [%r197, %L115]
	%r216 = getelementptr %struct.gameBoard , %struct.gameBoard* %r214, i1 0, i32 1
	%r217 = load i32, i32* %r216
	%r218 = icmp eq i32 %r217, 2
	%r219 = zext i1 %r218 to i32
	%r220 = trunc i32 %r219 to i1
	br i1 %r220, label %L123, label %L124

L117:
	%r209 = getelementptr %struct.gameBoard , %struct.gameBoard* %r197, i1 0, i32 7
	%r210 = load i32, i32* %r209
	%r211 = icmp eq i32 %r210, 1
	%r212 = zext i1 %r211 to i32
	%r213 = trunc i32 %r212 to i1
	br i1 %r213, label %L120, label %L121

L118:
	br label %L119
L119:
	%r215 = phi %struct.gameBoard* [%r197, %L122], [%r197, %L118]
	br label %L116
L120:
	br label %L41
L121:
	br label %L122
L122:
	br label %L119
L123:
	%r221 = getelementptr %struct.gameBoard , %struct.gameBoard* %r214, i1 0, i32 4
	%r222 = load i32, i32* %r221
	%r223 = icmp eq i32 %r222, 2
	%r224 = zext i1 %r223 to i32
	%r225 = trunc i32 %r224 to i1
	br i1 %r225, label %L126, label %L127

L124:
	br label %L125
L125:
	%r231 = phi %struct.gameBoard* [%r232, %L128], [%r214, %L124]
	%r233 = getelementptr %struct.gameBoard , %struct.gameBoard* %r231, i1 0, i32 2
	%r234 = load i32, i32* %r233
	%r235 = icmp eq i32 %r234, 1
	%r236 = zext i1 %r235 to i32
	%r237 = trunc i32 %r236 to i1
	br i1 %r237, label %L132, label %L133

L126:
	%r226 = getelementptr %struct.gameBoard , %struct.gameBoard* %r214, i1 0, i32 7
	%r227 = load i32, i32* %r226
	%r228 = icmp eq i32 %r227, 2
	%r229 = zext i1 %r228 to i32
	%r230 = trunc i32 %r229 to i1
	br i1 %r230, label %L129, label %L130

L127:
	br label %L128
L128:
	%r232 = phi %struct.gameBoard* [%r214, %L131], [%r214, %L127]
	br label %L125
L129:
	br label %L41
L130:
	br label %L131
L131:
	br label %L128
L132:
	%r238 = getelementptr %struct.gameBoard , %struct.gameBoard* %r231, i1 0, i32 5
	%r239 = load i32, i32* %r238
	%r240 = icmp eq i32 %r239, 1
	%r241 = zext i1 %r240 to i32
	%r242 = trunc i32 %r241 to i1
	br i1 %r242, label %L135, label %L136

L133:
	br label %L134
L134:
	%r248 = phi %struct.gameBoard* [%r249, %L137], [%r231, %L133]
	%r250 = getelementptr %struct.gameBoard , %struct.gameBoard* %r248, i1 0, i32 2
	%r251 = load i32, i32* %r250
	%r252 = icmp eq i32 %r251, 2
	%r253 = zext i1 %r252 to i32
	%r254 = trunc i32 %r253 to i1
	br i1 %r254, label %L141, label %L142

L135:
	%r243 = getelementptr %struct.gameBoard , %struct.gameBoard* %r231, i1 0, i32 8
	%r244 = load i32, i32* %r243
	%r245 = icmp eq i32 %r244, 1
	%r246 = zext i1 %r245 to i32
	%r247 = trunc i32 %r246 to i1
	br i1 %r247, label %L138, label %L139

L136:
	br label %L137
L137:
	%r249 = phi %struct.gameBoard* [%r231, %L140], [%r231, %L136]
	br label %L134
L138:
	br label %L41
L139:
	br label %L140
L140:
	br label %L137
L141:
	%r255 = getelementptr %struct.gameBoard , %struct.gameBoard* %r248, i1 0, i32 5
	%r256 = load i32, i32* %r255
	%r257 = icmp eq i32 %r256, 2
	%r258 = zext i1 %r257 to i32
	%r259 = trunc i32 %r258 to i1
	br i1 %r259, label %L144, label %L145

L142:
	br label %L143
L143:
	%r265 = sub i32 0, 1
	br label %L41
L144:
	%r260 = getelementptr %struct.gameBoard , %struct.gameBoard* %r248, i1 0, i32 8
	%r261 = load i32, i32* %r260
	%r262 = icmp eq i32 %r261, 2
	%r263 = zext i1 %r262 to i32
	%r264 = trunc i32 %r263 to i1
	br i1 %r264, label %L147, label %L148

L145:
	br label %L146
L146:
	br label %L143
L147:
	br label %L41
L148:
	br label %L149
L149:
	br label %L146
L41:
	%r266 = phi i32 [0, %L48], [1, %L57], [0, %L66], [1, %L75], [0, %L84], [1, %L93], [0, %L102], [1, %L111], [0, %L120], [1, %L129], [0, %L138], [1, %L147], [%r265, %L143]
	ret i32 %r266
}

define i32 @main()
{

L151:
	%r267 = sub i32 0, 1
	%r268 = call i8* @malloc(i32 72)
	%r269 = bitcast i8* %r268 to %struct.gameBoard*
	call void @cleanBoard(%struct.gameBoard* %r269 )
	%r270 = icmp slt i32 %r267, 0
	%r271 = zext i1 %r270 to i32
	%r272 = icmp ne i32 0, 8
	%r273 = zext i1 %r272 to i32
	%r274 = and i32 %r271, %r273
	%r275 = trunc i32 %r274 to i1
	br i1 %r275, label %L153, label %L154

L153:
	%r276 = phi %struct.gameBoard* [%r269, %L151], [%r285, %L157]
	%r277 = phi i32 [0, %L151], [%r296, %L157]
	%r288 = phi i32 [0, %L151], [%r289, %L157]
	call void @printBoard(%struct.gameBoard* %r276 )
	%r278 = icmp eq i32 %r277, 0
	%r279 = zext i1 %r278 to i32
	%r280 = trunc i32 %r279 to i1
	br i1 %r280, label %L155, label %L156

L155:
	%r281 = add i32 %r277, 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r282 = load i32, i32* @.read_scratch
	call void @placePiece(%struct.gameBoard* %r276, i32 1, i32 %r282 )
	br label %L157
L156:
	%r283 = sub i32 %r277, 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r284 = load i32, i32* @.read_scratch
	call void @placePiece(%struct.gameBoard* %r276, i32 2, i32 %r284 )
	br label %L157
L157:
	%r285 = phi %struct.gameBoard* [%r276, %L155], [%r276, %L156]
	%r287 = phi i32 [%r288, %L155], [%r288, %L156]
	%r296 = phi i32 [%r281, %L155], [%r283, %L156]
	%r286 = call i32 @checkWinner(%struct.gameBoard* %r285 )
	%r289 = add i32 %r287, 1
	%r290 = icmp slt i32 %r286, 0
	%r291 = zext i1 %r290 to i32
	%r292 = icmp ne i32 %r289, 8
	%r293 = zext i1 %r292 to i32
	%r294 = and i32 %r291, %r293
	%r295 = trunc i32 %r294 to i1
	br i1 %r295, label %L153, label %L154

L154:
	%r297 = phi i32 [%r267, %L151], [%r286, %L157]
	%r298 = add i32 %r297, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r298)
	br label %L152
L152:
	%r299 = phi i32 [0, %L154]
	ret i32 %r299
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8