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
	%phi0 = phi %struct.gameBoard* [%phi1, %L47], [%board, %L43]
	%r78 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi0, i1 0, i32 0
	%r79 = load i32, i32* %r78
	%r80 = icmp eq i32 %r79, 2
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L51, label %L52

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
	%phi1 = phi %struct.gameBoard* [%board, %L50], [%board, %L46]
	br label %L44
L48:
	br label %L41
L49:
	br label %L50
L50:
	br label %L47
L51:
	%r83 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi0, i1 0, i32 1
	%r84 = load i32, i32* %r83
	%r85 = icmp eq i32 %r84, 2
	%r86 = zext i1 %r85 to i32
	%r87 = trunc i32 %r86 to i1
	br i1 %r87, label %L54, label %L55

L52:
	br label %L53
L53:
	%phi2 = phi %struct.gameBoard* [%phi3, %L56], [%phi0, %L52]
	%r93 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi2, i1 0, i32 3
	%r94 = load i32, i32* %r93
	%r95 = icmp eq i32 %r94, 1
	%r96 = zext i1 %r95 to i32
	%r97 = trunc i32 %r96 to i1
	br i1 %r97, label %L60, label %L61

L54:
	%r88 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi0, i1 0, i32 2
	%r89 = load i32, i32* %r88
	%r90 = icmp eq i32 %r89, 2
	%r91 = zext i1 %r90 to i32
	%r92 = trunc i32 %r91 to i1
	br i1 %r92, label %L57, label %L58

L55:
	br label %L56
L56:
	%phi3 = phi %struct.gameBoard* [%phi0, %L59], [%phi0, %L55]
	br label %L53
L57:
	br label %L41
L58:
	br label %L59
L59:
	br label %L56
L60:
	%r98 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi2, i1 0, i32 4
	%r99 = load i32, i32* %r98
	%r100 = icmp eq i32 %r99, 1
	%r101 = zext i1 %r100 to i32
	%r102 = trunc i32 %r101 to i1
	br i1 %r102, label %L63, label %L64

L61:
	br label %L62
L62:
	%phi4 = phi %struct.gameBoard* [%phi5, %L65], [%phi2, %L61]
	%r108 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi4, i1 0, i32 3
	%r109 = load i32, i32* %r108
	%r110 = icmp eq i32 %r109, 2
	%r111 = zext i1 %r110 to i32
	%r112 = trunc i32 %r111 to i1
	br i1 %r112, label %L69, label %L70

L63:
	%r103 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi2, i1 0, i32 5
	%r104 = load i32, i32* %r103
	%r105 = icmp eq i32 %r104, 1
	%r106 = zext i1 %r105 to i32
	%r107 = trunc i32 %r106 to i1
	br i1 %r107, label %L66, label %L67

L64:
	br label %L65
L65:
	%phi5 = phi %struct.gameBoard* [%phi2, %L68], [%phi2, %L64]
	br label %L62
L66:
	br label %L41
L67:
	br label %L68
L68:
	br label %L65
L69:
	%r113 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi4, i1 0, i32 4
	%r114 = load i32, i32* %r113
	%r115 = icmp eq i32 %r114, 2
	%r116 = zext i1 %r115 to i32
	%r117 = trunc i32 %r116 to i1
	br i1 %r117, label %L72, label %L73

L70:
	br label %L71
L71:
	%phi6 = phi %struct.gameBoard* [%phi7, %L74], [%phi4, %L70]
	%r123 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi6, i1 0, i32 6
	%r124 = load i32, i32* %r123
	%r125 = icmp eq i32 %r124, 1
	%r126 = zext i1 %r125 to i32
	%r127 = trunc i32 %r126 to i1
	br i1 %r127, label %L78, label %L79

L72:
	%r118 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi4, i1 0, i32 5
	%r119 = load i32, i32* %r118
	%r120 = icmp eq i32 %r119, 2
	%r121 = zext i1 %r120 to i32
	%r122 = trunc i32 %r121 to i1
	br i1 %r122, label %L75, label %L76

L73:
	br label %L74
L74:
	%phi7 = phi %struct.gameBoard* [%phi4, %L77], [%phi4, %L73]
	br label %L71
L75:
	br label %L41
L76:
	br label %L77
L77:
	br label %L74
L78:
	%r128 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi6, i1 0, i32 7
	%r129 = load i32, i32* %r128
	%r130 = icmp eq i32 %r129, 1
	%r131 = zext i1 %r130 to i32
	%r132 = trunc i32 %r131 to i1
	br i1 %r132, label %L81, label %L82

L79:
	br label %L80
L80:
	%phi8 = phi %struct.gameBoard* [%phi9, %L83], [%phi6, %L79]
	%r138 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi8, i1 0, i32 6
	%r139 = load i32, i32* %r138
	%r140 = icmp eq i32 %r139, 2
	%r141 = zext i1 %r140 to i32
	%r142 = trunc i32 %r141 to i1
	br i1 %r142, label %L87, label %L88

L81:
	%r133 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi6, i1 0, i32 8
	%r134 = load i32, i32* %r133
	%r135 = icmp eq i32 %r134, 1
	%r136 = zext i1 %r135 to i32
	%r137 = trunc i32 %r136 to i1
	br i1 %r137, label %L84, label %L85

L82:
	br label %L83
L83:
	%phi9 = phi %struct.gameBoard* [%phi6, %L86], [%phi6, %L82]
	br label %L80
L84:
	br label %L41
L85:
	br label %L86
L86:
	br label %L83
L87:
	%r143 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi8, i1 0, i32 7
	%r144 = load i32, i32* %r143
	%r145 = icmp eq i32 %r144, 2
	%r146 = zext i1 %r145 to i32
	%r147 = trunc i32 %r146 to i1
	br i1 %r147, label %L90, label %L91

L88:
	br label %L89
L89:
	%phi10 = phi %struct.gameBoard* [%phi11, %L92], [%phi8, %L88]
	%r153 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi10, i1 0, i32 0
	%r154 = load i32, i32* %r153
	%r155 = icmp eq i32 %r154, 1
	%r156 = zext i1 %r155 to i32
	%r157 = trunc i32 %r156 to i1
	br i1 %r157, label %L96, label %L97

L90:
	%r148 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi8, i1 0, i32 8
	%r149 = load i32, i32* %r148
	%r150 = icmp eq i32 %r149, 2
	%r151 = zext i1 %r150 to i32
	%r152 = trunc i32 %r151 to i1
	br i1 %r152, label %L93, label %L94

L91:
	br label %L92
L92:
	%phi11 = phi %struct.gameBoard* [%phi8, %L95], [%phi8, %L91]
	br label %L89
L93:
	br label %L41
L94:
	br label %L95
L95:
	br label %L92
L96:
	%r158 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi10, i1 0, i32 3
	%r159 = load i32, i32* %r158
	%r160 = icmp eq i32 %r159, 1
	%r161 = zext i1 %r160 to i32
	%r162 = trunc i32 %r161 to i1
	br i1 %r162, label %L99, label %L100

L97:
	br label %L98
L98:
	%phi12 = phi %struct.gameBoard* [%phi13, %L101], [%phi10, %L97]
	%r168 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi12, i1 0, i32 0
	%r169 = load i32, i32* %r168
	%r170 = icmp eq i32 %r169, 2
	%r171 = zext i1 %r170 to i32
	%r172 = trunc i32 %r171 to i1
	br i1 %r172, label %L105, label %L106

L99:
	%r163 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi10, i1 0, i32 6
	%r164 = load i32, i32* %r163
	%r165 = icmp eq i32 %r164, 1
	%r166 = zext i1 %r165 to i32
	%r167 = trunc i32 %r166 to i1
	br i1 %r167, label %L102, label %L103

L100:
	br label %L101
L101:
	%phi13 = phi %struct.gameBoard* [%phi10, %L104], [%phi10, %L100]
	br label %L98
L102:
	br label %L41
L103:
	br label %L104
L104:
	br label %L101
L105:
	%r173 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi12, i1 0, i32 3
	%r174 = load i32, i32* %r173
	%r175 = icmp eq i32 %r174, 2
	%r176 = zext i1 %r175 to i32
	%r177 = trunc i32 %r176 to i1
	br i1 %r177, label %L108, label %L109

L106:
	br label %L107
L107:
	%phi14 = phi %struct.gameBoard* [%phi15, %L110], [%phi12, %L106]
	%r183 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi14, i1 0, i32 1
	%r184 = load i32, i32* %r183
	%r185 = icmp eq i32 %r184, 1
	%r186 = zext i1 %r185 to i32
	%r187 = trunc i32 %r186 to i1
	br i1 %r187, label %L114, label %L115

L108:
	%r178 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi12, i1 0, i32 6
	%r179 = load i32, i32* %r178
	%r180 = icmp eq i32 %r179, 2
	%r181 = zext i1 %r180 to i32
	%r182 = trunc i32 %r181 to i1
	br i1 %r182, label %L111, label %L112

L109:
	br label %L110
L110:
	%phi15 = phi %struct.gameBoard* [%phi12, %L113], [%phi12, %L109]
	br label %L107
L111:
	br label %L41
L112:
	br label %L113
L113:
	br label %L110
L114:
	%r188 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi14, i1 0, i32 4
	%r189 = load i32, i32* %r188
	%r190 = icmp eq i32 %r189, 1
	%r191 = zext i1 %r190 to i32
	%r192 = trunc i32 %r191 to i1
	br i1 %r192, label %L117, label %L118

L115:
	br label %L116
L116:
	%phi16 = phi %struct.gameBoard* [%phi17, %L119], [%phi14, %L115]
	%r198 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi16, i1 0, i32 1
	%r199 = load i32, i32* %r198
	%r200 = icmp eq i32 %r199, 2
	%r201 = zext i1 %r200 to i32
	%r202 = trunc i32 %r201 to i1
	br i1 %r202, label %L123, label %L124

L117:
	%r193 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi14, i1 0, i32 7
	%r194 = load i32, i32* %r193
	%r195 = icmp eq i32 %r194, 1
	%r196 = zext i1 %r195 to i32
	%r197 = trunc i32 %r196 to i1
	br i1 %r197, label %L120, label %L121

L118:
	br label %L119
L119:
	%phi17 = phi %struct.gameBoard* [%phi14, %L122], [%phi14, %L118]
	br label %L116
L120:
	br label %L41
L121:
	br label %L122
L122:
	br label %L119
L123:
	%r203 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi16, i1 0, i32 4
	%r204 = load i32, i32* %r203
	%r205 = icmp eq i32 %r204, 2
	%r206 = zext i1 %r205 to i32
	%r207 = trunc i32 %r206 to i1
	br i1 %r207, label %L126, label %L127

L124:
	br label %L125
L125:
	%phi18 = phi %struct.gameBoard* [%phi19, %L128], [%phi16, %L124]
	%r213 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi18, i1 0, i32 2
	%r214 = load i32, i32* %r213
	%r215 = icmp eq i32 %r214, 1
	%r216 = zext i1 %r215 to i32
	%r217 = trunc i32 %r216 to i1
	br i1 %r217, label %L132, label %L133

L126:
	%r208 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi16, i1 0, i32 7
	%r209 = load i32, i32* %r208
	%r210 = icmp eq i32 %r209, 2
	%r211 = zext i1 %r210 to i32
	%r212 = trunc i32 %r211 to i1
	br i1 %r212, label %L129, label %L130

L127:
	br label %L128
L128:
	%phi19 = phi %struct.gameBoard* [%phi16, %L131], [%phi16, %L127]
	br label %L125
L129:
	br label %L41
L130:
	br label %L131
L131:
	br label %L128
L132:
	%r218 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi18, i1 0, i32 5
	%r219 = load i32, i32* %r218
	%r220 = icmp eq i32 %r219, 1
	%r221 = zext i1 %r220 to i32
	%r222 = trunc i32 %r221 to i1
	br i1 %r222, label %L135, label %L136

L133:
	br label %L134
L134:
	%phi20 = phi %struct.gameBoard* [%phi21, %L137], [%phi18, %L133]
	%r228 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi20, i1 0, i32 2
	%r229 = load i32, i32* %r228
	%r230 = icmp eq i32 %r229, 2
	%r231 = zext i1 %r230 to i32
	%r232 = trunc i32 %r231 to i1
	br i1 %r232, label %L141, label %L142

L135:
	%r223 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi18, i1 0, i32 8
	%r224 = load i32, i32* %r223
	%r225 = icmp eq i32 %r224, 1
	%r226 = zext i1 %r225 to i32
	%r227 = trunc i32 %r226 to i1
	br i1 %r227, label %L138, label %L139

L136:
	br label %L137
L137:
	%phi21 = phi %struct.gameBoard* [%phi18, %L140], [%phi18, %L136]
	br label %L134
L138:
	br label %L41
L139:
	br label %L140
L140:
	br label %L137
L141:
	%r233 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi20, i1 0, i32 5
	%r234 = load i32, i32* %r233
	%r235 = icmp eq i32 %r234, 2
	%r236 = zext i1 %r235 to i32
	%r237 = trunc i32 %r236 to i1
	br i1 %r237, label %L144, label %L145

L142:
	br label %L143
L143:
	%r243 = sub i32 0, 1
	br label %L41
L144:
	%r238 = getelementptr %struct.gameBoard , %struct.gameBoard* %phi20, i1 0, i32 8
	%r239 = load i32, i32* %r238
	%r240 = icmp eq i32 %r239, 2
	%r241 = zext i1 %r240 to i32
	%r242 = trunc i32 %r241 to i1
	br i1 %r242, label %L147, label %L148

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
	%phi22 = phi i32 [0, %L48], [1, %L57], [0, %L66], [1, %L75], [0, %L84], [1, %L93], [0, %L102], [1, %L111], [0, %L120], [1, %L129], [0, %L138], [1, %L147], [%r243, %L143]
	ret i32 %phi22
}

define i32 @main()
{

L151:
	%r244 = sub i32 0, 1
	%r245 = call i8* @malloc(i32 72)
	%r246 = bitcast i8* %r245 to %struct.gameBoard*
	call void @cleanBoard(%struct.gameBoard* %r246 )
	%r247 = icmp slt i32 %r244, 0
	%r248 = zext i1 %r247 to i32
	%r249 = icmp ne i32 0, 8
	%r250 = zext i1 %r249 to i32
	%r251 = and i32 %r248, %r250
	%r252 = trunc i32 %r251 to i1
	br i1 %r252, label %L153, label %L154

L153:
	%phi23 = phi %struct.gameBoard* [%r246, %L151], [%phi25, %L157]
	%phi24 = phi i32 [0, %L151], [%phi28, %L157]
	%phi27 = phi i32 [0, %L151], [%r261, %L157]
	call void @printBoard(%struct.gameBoard* %phi23 )
	%r253 = icmp eq i32 %phi24, 0
	%r254 = zext i1 %r253 to i32
	%r255 = trunc i32 %r254 to i1
	br i1 %r255, label %L155, label %L156

L155:
	%r256 = add i32 %phi24, 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r257 = load i32, i32* @.read_scratch
	call void @placePiece(%struct.gameBoard* %phi23, i32 1, i32 %r257 )
	br label %L157
L156:
	%r258 = sub i32 %phi24, 1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r259 = load i32, i32* @.read_scratch
	call void @placePiece(%struct.gameBoard* %phi23, i32 2, i32 %r259 )
	br label %L157
L157:
	%phi25 = phi %struct.gameBoard* [%phi23, %L155], [%phi23, %L156]
	%phi26 = phi i32 [%phi27, %L155], [%phi27, %L156]
	%phi28 = phi i32 [%r256, %L155], [%r258, %L156]
	%r260 = call i32 @checkWinner(%struct.gameBoard* %phi25 )
	%r261 = add i32 %phi26, 1
	%r262 = icmp slt i32 %r260, 0
	%r263 = zext i1 %r262 to i32
	%r264 = icmp ne i32 %r261, 8
	%r265 = zext i1 %r264 to i32
	%r266 = and i32 %r263, %r265
	%r267 = trunc i32 %r266 to i1
	br i1 %r267, label %L153, label %L154

L154:
	%phi29 = phi i32 [%r244, %L151], [%r260, %L157]
	%r268 = add i32 %phi29, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r268)
	br label %L152
L152:
	%phi30 = phi i32 [0, %L154]
	ret i32 %phi30
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8