target triple="i686"

%struct.gameBoard = type {i32, i32, i32, i32, i32, i32, i32, i32, i32}

define void @cleanBoard(%struct.gameBoard* %_P_board)
{

L1:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%r0 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r1 = getelementptr %struct.gameBoard , %struct.gameBoard* %r0, i1 0, i32 0
	store i32 0, i32* %r1
	%r2 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r3 = getelementptr %struct.gameBoard , %struct.gameBoard* %r2, i1 0, i32 1
	store i32 0, i32* %r3
	%r4 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r5 = getelementptr %struct.gameBoard , %struct.gameBoard* %r4, i1 0, i32 2
	store i32 0, i32* %r5
	%r6 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r7 = getelementptr %struct.gameBoard , %struct.gameBoard* %r6, i1 0, i32 3
	store i32 0, i32* %r7
	%r8 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r9 = getelementptr %struct.gameBoard , %struct.gameBoard* %r8, i1 0, i32 4
	store i32 0, i32* %r9
	%r10 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r11 = getelementptr %struct.gameBoard , %struct.gameBoard* %r10, i1 0, i32 5
	store i32 0, i32* %r11
	%r12 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r13 = getelementptr %struct.gameBoard , %struct.gameBoard* %r12, i1 0, i32 6
	store i32 0, i32* %r13
	%r14 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r15 = getelementptr %struct.gameBoard , %struct.gameBoard* %r14, i1 0, i32 7
	store i32 0, i32* %r15
	%r16 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r17 = getelementptr %struct.gameBoard , %struct.gameBoard* %r16, i1 0, i32 8
	store i32 0, i32* %r17
	br label %L2
L2:
	ret void
}

define void @printBoard(%struct.gameBoard* %_P_board)
{

L4:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%r18 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r19 = getelementptr %struct.gameBoard , %struct.gameBoard* %r18, i1 0, i32 0
	%r20 = load i32, i32* %r19
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r20)
	%r21 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r22 = getelementptr %struct.gameBoard , %struct.gameBoard* %r21, i1 0, i32 1
	%r23 = load i32, i32* %r22
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r23)
	%r24 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r25 = getelementptr %struct.gameBoard , %struct.gameBoard* %r24, i1 0, i32 2
	%r26 = load i32, i32* %r25
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r26)
	%r27 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r28 = getelementptr %struct.gameBoard , %struct.gameBoard* %r27, i1 0, i32 3
	%r29 = load i32, i32* %r28
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r29)
	%r30 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r31 = getelementptr %struct.gameBoard , %struct.gameBoard* %r30, i1 0, i32 4
	%r32 = load i32, i32* %r31
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r32)
	%r33 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r34 = getelementptr %struct.gameBoard , %struct.gameBoard* %r33, i1 0, i32 5
	%r35 = load i32, i32* %r34
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r35)
	%r36 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r37 = getelementptr %struct.gameBoard , %struct.gameBoard* %r36, i1 0, i32 6
	%r38 = load i32, i32* %r37
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r38)
	%r39 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r40 = getelementptr %struct.gameBoard , %struct.gameBoard* %r39, i1 0, i32 7
	%r41 = load i32, i32* %r40
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r41)
	%r42 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r43 = getelementptr %struct.gameBoard , %struct.gameBoard* %r42, i1 0, i32 8
	%r44 = load i32, i32* %r43
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r44)
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

define void @placePiece(%struct.gameBoard* %_P_board, i32 %_P_turn, i32 %_P_placement)
{

L10:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%turn = alloca i32
	store i32 %_P_turn, i32* %turn
	%placement = alloca i32
	store i32 %_P_placement, i32* %placement
	%r45 = load i32, i32* %placement
	%r46 = icmp eq i32 %r45, 1
	%r47 = zext i1 %r46 to i32
	%r48 = trunc i32 %r47 to i1
	br i1 %r48, label %L12, label %L13

L12:
	%r49 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r50 = getelementptr %struct.gameBoard , %struct.gameBoard* %r49, i1 0, i32 0
	%r51 = load i32, i32* %turn
	store i32 %r51, i32* %r50
	br label %L14
L13:
	%r52 = load i32, i32* %placement
	%r53 = icmp eq i32 %r52, 2
	%r54 = zext i1 %r53 to i32
	%r55 = trunc i32 %r54 to i1
	br i1 %r55, label %L15, label %L16

L14:
	br label %L11
L15:
	%r56 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r57 = getelementptr %struct.gameBoard , %struct.gameBoard* %r56, i1 0, i32 1
	%r58 = load i32, i32* %turn
	store i32 %r58, i32* %r57
	br label %L17
L16:
	%r59 = load i32, i32* %placement
	%r60 = icmp eq i32 %r59, 3
	%r61 = zext i1 %r60 to i32
	%r62 = trunc i32 %r61 to i1
	br i1 %r62, label %L18, label %L19

L17:
	br label %L14
L18:
	%r63 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r64 = getelementptr %struct.gameBoard , %struct.gameBoard* %r63, i1 0, i32 2
	%r65 = load i32, i32* %turn
	store i32 %r65, i32* %r64
	br label %L20
L19:
	%r66 = load i32, i32* %placement
	%r67 = icmp eq i32 %r66, 4
	%r68 = zext i1 %r67 to i32
	%r69 = trunc i32 %r68 to i1
	br i1 %r69, label %L21, label %L22

L20:
	br label %L17
L21:
	%r70 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r71 = getelementptr %struct.gameBoard , %struct.gameBoard* %r70, i1 0, i32 3
	%r72 = load i32, i32* %turn
	store i32 %r72, i32* %r71
	br label %L23
L22:
	%r73 = load i32, i32* %placement
	%r74 = icmp eq i32 %r73, 5
	%r75 = zext i1 %r74 to i32
	%r76 = trunc i32 %r75 to i1
	br i1 %r76, label %L24, label %L25

L23:
	br label %L20
L24:
	%r77 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r78 = getelementptr %struct.gameBoard , %struct.gameBoard* %r77, i1 0, i32 4
	%r79 = load i32, i32* %turn
	store i32 %r79, i32* %r78
	br label %L26
L25:
	%r80 = load i32, i32* %placement
	%r81 = icmp eq i32 %r80, 6
	%r82 = zext i1 %r81 to i32
	%r83 = trunc i32 %r82 to i1
	br i1 %r83, label %L27, label %L28

L26:
	br label %L23
L27:
	%r84 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r85 = getelementptr %struct.gameBoard , %struct.gameBoard* %r84, i1 0, i32 5
	%r86 = load i32, i32* %turn
	store i32 %r86, i32* %r85
	br label %L29
L28:
	%r87 = load i32, i32* %placement
	%r88 = icmp eq i32 %r87, 7
	%r89 = zext i1 %r88 to i32
	%r90 = trunc i32 %r89 to i1
	br i1 %r90, label %L30, label %L31

L29:
	br label %L26
L30:
	%r91 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r92 = getelementptr %struct.gameBoard , %struct.gameBoard* %r91, i1 0, i32 6
	%r93 = load i32, i32* %turn
	store i32 %r93, i32* %r92
	br label %L32
L31:
	%r94 = load i32, i32* %placement
	%r95 = icmp eq i32 %r94, 8
	%r96 = zext i1 %r95 to i32
	%r97 = trunc i32 %r96 to i1
	br i1 %r97, label %L33, label %L34

L32:
	br label %L29
L33:
	%r98 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r99 = getelementptr %struct.gameBoard , %struct.gameBoard* %r98, i1 0, i32 7
	%r100 = load i32, i32* %turn
	store i32 %r100, i32* %r99
	br label %L35
L34:
	%r101 = load i32, i32* %placement
	%r102 = icmp eq i32 %r101, 9
	%r103 = zext i1 %r102 to i32
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L36, label %L37

L35:
	br label %L32
L36:
	%r105 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r106 = getelementptr %struct.gameBoard , %struct.gameBoard* %r105, i1 0, i32 8
	%r107 = load i32, i32* %turn
	store i32 %r107, i32* %r106
	br label %L38
L37:
	br label %L38
L38:
	br label %L35
L11:
	ret void
}

define i32 @checkWinner(%struct.gameBoard* %_P_board)
{

L40:
	%_retval_ = alloca i32
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %_P_board, %struct.gameBoard** %board
	%r108 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r109 = getelementptr %struct.gameBoard , %struct.gameBoard* %r108, i1 0, i32 0
	%r110 = load i32, i32* %r109
	%r111 = icmp eq i32 %r110, 1
	%r112 = zext i1 %r111 to i32
	%r113 = trunc i32 %r112 to i1
	br i1 %r113, label %L42, label %L43

L42:
	%r114 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r115 = getelementptr %struct.gameBoard , %struct.gameBoard* %r114, i1 0, i32 1
	%r116 = load i32, i32* %r115
	%r117 = icmp eq i32 %r116, 1
	%r118 = zext i1 %r117 to i32
	%r119 = trunc i32 %r118 to i1
	br i1 %r119, label %L45, label %L46

L43:
	br label %L44
L44:
	%r127 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r128 = getelementptr %struct.gameBoard , %struct.gameBoard* %r127, i1 0, i32 0
	%r129 = load i32, i32* %r128
	%r130 = icmp eq i32 %r129, 2
	%r131 = zext i1 %r130 to i32
	%r132 = trunc i32 %r131 to i1
	br i1 %r132, label %L52, label %L53

L45:
	%r120 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r121 = getelementptr %struct.gameBoard , %struct.gameBoard* %r120, i1 0, i32 2
	%r122 = load i32, i32* %r121
	%r123 = icmp eq i32 %r122, 1
	%r124 = zext i1 %r123 to i32
	%r125 = trunc i32 %r124 to i1
	br i1 %r125, label %L48, label %L49

L46:
	br label %L47
L47:
	br label %L44
L48:
	store i32 0, i32* %_retval_
	br label %L41
L49:
	br label %L50
L50:
	br label %L47
L52:
	%r133 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r134 = getelementptr %struct.gameBoard , %struct.gameBoard* %r133, i1 0, i32 1
	%r135 = load i32, i32* %r134
	%r136 = icmp eq i32 %r135, 2
	%r137 = zext i1 %r136 to i32
	%r138 = trunc i32 %r137 to i1
	br i1 %r138, label %L55, label %L56

L53:
	br label %L54
L54:
	%r146 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r147 = getelementptr %struct.gameBoard , %struct.gameBoard* %r146, i1 0, i32 3
	%r148 = load i32, i32* %r147
	%r149 = icmp eq i32 %r148, 1
	%r150 = zext i1 %r149 to i32
	%r151 = trunc i32 %r150 to i1
	br i1 %r151, label %L62, label %L63

L55:
	%r139 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r140 = getelementptr %struct.gameBoard , %struct.gameBoard* %r139, i1 0, i32 2
	%r141 = load i32, i32* %r140
	%r142 = icmp eq i32 %r141, 2
	%r143 = zext i1 %r142 to i32
	%r144 = trunc i32 %r143 to i1
	br i1 %r144, label %L58, label %L59

L56:
	br label %L57
L57:
	br label %L54
L58:
	store i32 1, i32* %_retval_
	br label %L41
L59:
	br label %L60
L60:
	br label %L57
L62:
	%r152 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r153 = getelementptr %struct.gameBoard , %struct.gameBoard* %r152, i1 0, i32 4
	%r154 = load i32, i32* %r153
	%r155 = icmp eq i32 %r154, 1
	%r156 = zext i1 %r155 to i32
	%r157 = trunc i32 %r156 to i1
	br i1 %r157, label %L65, label %L66

L63:
	br label %L64
L64:
	%r165 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r166 = getelementptr %struct.gameBoard , %struct.gameBoard* %r165, i1 0, i32 3
	%r167 = load i32, i32* %r166
	%r168 = icmp eq i32 %r167, 2
	%r169 = zext i1 %r168 to i32
	%r170 = trunc i32 %r169 to i1
	br i1 %r170, label %L72, label %L73

L65:
	%r158 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r159 = getelementptr %struct.gameBoard , %struct.gameBoard* %r158, i1 0, i32 5
	%r160 = load i32, i32* %r159
	%r161 = icmp eq i32 %r160, 1
	%r162 = zext i1 %r161 to i32
	%r163 = trunc i32 %r162 to i1
	br i1 %r163, label %L68, label %L69

L66:
	br label %L67
L67:
	br label %L64
L68:
	store i32 0, i32* %_retval_
	br label %L41
L69:
	br label %L70
L70:
	br label %L67
L72:
	%r171 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r172 = getelementptr %struct.gameBoard , %struct.gameBoard* %r171, i1 0, i32 4
	%r173 = load i32, i32* %r172
	%r174 = icmp eq i32 %r173, 2
	%r175 = zext i1 %r174 to i32
	%r176 = trunc i32 %r175 to i1
	br i1 %r176, label %L75, label %L76

L73:
	br label %L74
L74:
	%r184 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r185 = getelementptr %struct.gameBoard , %struct.gameBoard* %r184, i1 0, i32 6
	%r186 = load i32, i32* %r185
	%r187 = icmp eq i32 %r186, 1
	%r188 = zext i1 %r187 to i32
	%r189 = trunc i32 %r188 to i1
	br i1 %r189, label %L82, label %L83

L75:
	%r177 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r178 = getelementptr %struct.gameBoard , %struct.gameBoard* %r177, i1 0, i32 5
	%r179 = load i32, i32* %r178
	%r180 = icmp eq i32 %r179, 2
	%r181 = zext i1 %r180 to i32
	%r182 = trunc i32 %r181 to i1
	br i1 %r182, label %L78, label %L79

L76:
	br label %L77
L77:
	br label %L74
L78:
	store i32 1, i32* %_retval_
	br label %L41
L79:
	br label %L80
L80:
	br label %L77
L82:
	%r190 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r191 = getelementptr %struct.gameBoard , %struct.gameBoard* %r190, i1 0, i32 7
	%r192 = load i32, i32* %r191
	%r193 = icmp eq i32 %r192, 1
	%r194 = zext i1 %r193 to i32
	%r195 = trunc i32 %r194 to i1
	br i1 %r195, label %L85, label %L86

L83:
	br label %L84
L84:
	%r203 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r204 = getelementptr %struct.gameBoard , %struct.gameBoard* %r203, i1 0, i32 6
	%r205 = load i32, i32* %r204
	%r206 = icmp eq i32 %r205, 2
	%r207 = zext i1 %r206 to i32
	%r208 = trunc i32 %r207 to i1
	br i1 %r208, label %L92, label %L93

L85:
	%r196 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r197 = getelementptr %struct.gameBoard , %struct.gameBoard* %r196, i1 0, i32 8
	%r198 = load i32, i32* %r197
	%r199 = icmp eq i32 %r198, 1
	%r200 = zext i1 %r199 to i32
	%r201 = trunc i32 %r200 to i1
	br i1 %r201, label %L88, label %L89

L86:
	br label %L87
L87:
	br label %L84
L88:
	store i32 0, i32* %_retval_
	br label %L41
L89:
	br label %L90
L90:
	br label %L87
L92:
	%r209 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r210 = getelementptr %struct.gameBoard , %struct.gameBoard* %r209, i1 0, i32 7
	%r211 = load i32, i32* %r210
	%r212 = icmp eq i32 %r211, 2
	%r213 = zext i1 %r212 to i32
	%r214 = trunc i32 %r213 to i1
	br i1 %r214, label %L95, label %L96

L93:
	br label %L94
L94:
	%r222 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r223 = getelementptr %struct.gameBoard , %struct.gameBoard* %r222, i1 0, i32 0
	%r224 = load i32, i32* %r223
	%r225 = icmp eq i32 %r224, 1
	%r226 = zext i1 %r225 to i32
	%r227 = trunc i32 %r226 to i1
	br i1 %r227, label %L102, label %L103

L95:
	%r215 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r216 = getelementptr %struct.gameBoard , %struct.gameBoard* %r215, i1 0, i32 8
	%r217 = load i32, i32* %r216
	%r218 = icmp eq i32 %r217, 2
	%r219 = zext i1 %r218 to i32
	%r220 = trunc i32 %r219 to i1
	br i1 %r220, label %L98, label %L99

L96:
	br label %L97
L97:
	br label %L94
L98:
	store i32 1, i32* %_retval_
	br label %L41
L99:
	br label %L100
L100:
	br label %L97
L102:
	%r228 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r229 = getelementptr %struct.gameBoard , %struct.gameBoard* %r228, i1 0, i32 3
	%r230 = load i32, i32* %r229
	%r231 = icmp eq i32 %r230, 1
	%r232 = zext i1 %r231 to i32
	%r233 = trunc i32 %r232 to i1
	br i1 %r233, label %L105, label %L106

L103:
	br label %L104
L104:
	%r241 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r242 = getelementptr %struct.gameBoard , %struct.gameBoard* %r241, i1 0, i32 0
	%r243 = load i32, i32* %r242
	%r244 = icmp eq i32 %r243, 2
	%r245 = zext i1 %r244 to i32
	%r246 = trunc i32 %r245 to i1
	br i1 %r246, label %L112, label %L113

L105:
	%r234 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r235 = getelementptr %struct.gameBoard , %struct.gameBoard* %r234, i1 0, i32 6
	%r236 = load i32, i32* %r235
	%r237 = icmp eq i32 %r236, 1
	%r238 = zext i1 %r237 to i32
	%r239 = trunc i32 %r238 to i1
	br i1 %r239, label %L108, label %L109

L106:
	br label %L107
L107:
	br label %L104
L108:
	store i32 0, i32* %_retval_
	br label %L41
L109:
	br label %L110
L110:
	br label %L107
L112:
	%r247 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r248 = getelementptr %struct.gameBoard , %struct.gameBoard* %r247, i1 0, i32 3
	%r249 = load i32, i32* %r248
	%r250 = icmp eq i32 %r249, 2
	%r251 = zext i1 %r250 to i32
	%r252 = trunc i32 %r251 to i1
	br i1 %r252, label %L115, label %L116

L113:
	br label %L114
L114:
	%r260 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r261 = getelementptr %struct.gameBoard , %struct.gameBoard* %r260, i1 0, i32 1
	%r262 = load i32, i32* %r261
	%r263 = icmp eq i32 %r262, 1
	%r264 = zext i1 %r263 to i32
	%r265 = trunc i32 %r264 to i1
	br i1 %r265, label %L122, label %L123

L115:
	%r253 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r254 = getelementptr %struct.gameBoard , %struct.gameBoard* %r253, i1 0, i32 6
	%r255 = load i32, i32* %r254
	%r256 = icmp eq i32 %r255, 2
	%r257 = zext i1 %r256 to i32
	%r258 = trunc i32 %r257 to i1
	br i1 %r258, label %L118, label %L119

L116:
	br label %L117
L117:
	br label %L114
L118:
	store i32 1, i32* %_retval_
	br label %L41
L119:
	br label %L120
L120:
	br label %L117
L122:
	%r266 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r267 = getelementptr %struct.gameBoard , %struct.gameBoard* %r266, i1 0, i32 4
	%r268 = load i32, i32* %r267
	%r269 = icmp eq i32 %r268, 1
	%r270 = zext i1 %r269 to i32
	%r271 = trunc i32 %r270 to i1
	br i1 %r271, label %L125, label %L126

L123:
	br label %L124
L124:
	%r279 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r280 = getelementptr %struct.gameBoard , %struct.gameBoard* %r279, i1 0, i32 1
	%r281 = load i32, i32* %r280
	%r282 = icmp eq i32 %r281, 2
	%r283 = zext i1 %r282 to i32
	%r284 = trunc i32 %r283 to i1
	br i1 %r284, label %L132, label %L133

L125:
	%r272 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r273 = getelementptr %struct.gameBoard , %struct.gameBoard* %r272, i1 0, i32 7
	%r274 = load i32, i32* %r273
	%r275 = icmp eq i32 %r274, 1
	%r276 = zext i1 %r275 to i32
	%r277 = trunc i32 %r276 to i1
	br i1 %r277, label %L128, label %L129

L126:
	br label %L127
L127:
	br label %L124
L128:
	store i32 0, i32* %_retval_
	br label %L41
L129:
	br label %L130
L130:
	br label %L127
L132:
	%r285 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r286 = getelementptr %struct.gameBoard , %struct.gameBoard* %r285, i1 0, i32 4
	%r287 = load i32, i32* %r286
	%r288 = icmp eq i32 %r287, 2
	%r289 = zext i1 %r288 to i32
	%r290 = trunc i32 %r289 to i1
	br i1 %r290, label %L135, label %L136

L133:
	br label %L134
L134:
	%r298 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r299 = getelementptr %struct.gameBoard , %struct.gameBoard* %r298, i1 0, i32 2
	%r300 = load i32, i32* %r299
	%r301 = icmp eq i32 %r300, 1
	%r302 = zext i1 %r301 to i32
	%r303 = trunc i32 %r302 to i1
	br i1 %r303, label %L142, label %L143

L135:
	%r291 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r292 = getelementptr %struct.gameBoard , %struct.gameBoard* %r291, i1 0, i32 7
	%r293 = load i32, i32* %r292
	%r294 = icmp eq i32 %r293, 2
	%r295 = zext i1 %r294 to i32
	%r296 = trunc i32 %r295 to i1
	br i1 %r296, label %L138, label %L139

L136:
	br label %L137
L137:
	br label %L134
L138:
	store i32 1, i32* %_retval_
	br label %L41
L139:
	br label %L140
L140:
	br label %L137
L142:
	%r304 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r305 = getelementptr %struct.gameBoard , %struct.gameBoard* %r304, i1 0, i32 5
	%r306 = load i32, i32* %r305
	%r307 = icmp eq i32 %r306, 1
	%r308 = zext i1 %r307 to i32
	%r309 = trunc i32 %r308 to i1
	br i1 %r309, label %L145, label %L146

L143:
	br label %L144
L144:
	%r317 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r318 = getelementptr %struct.gameBoard , %struct.gameBoard* %r317, i1 0, i32 2
	%r319 = load i32, i32* %r318
	%r320 = icmp eq i32 %r319, 2
	%r321 = zext i1 %r320 to i32
	%r322 = trunc i32 %r321 to i1
	br i1 %r322, label %L152, label %L153

L145:
	%r310 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r311 = getelementptr %struct.gameBoard , %struct.gameBoard* %r310, i1 0, i32 8
	%r312 = load i32, i32* %r311
	%r313 = icmp eq i32 %r312, 1
	%r314 = zext i1 %r313 to i32
	%r315 = trunc i32 %r314 to i1
	br i1 %r315, label %L148, label %L149

L146:
	br label %L147
L147:
	br label %L144
L148:
	store i32 0, i32* %_retval_
	br label %L41
L149:
	br label %L150
L150:
	br label %L147
L152:
	%r323 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r324 = getelementptr %struct.gameBoard , %struct.gameBoard* %r323, i1 0, i32 5
	%r325 = load i32, i32* %r324
	%r326 = icmp eq i32 %r325, 2
	%r327 = zext i1 %r326 to i32
	%r328 = trunc i32 %r327 to i1
	br i1 %r328, label %L155, label %L156

L153:
	br label %L154
L154:
	%r336 = sub i32 0, 1
	store i32 %r336, i32* %_retval_
	br label %L41
L155:
	%r329 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r330 = getelementptr %struct.gameBoard , %struct.gameBoard* %r329, i1 0, i32 8
	%r331 = load i32, i32* %r330
	%r332 = icmp eq i32 %r331, 2
	%r333 = zext i1 %r332 to i32
	%r334 = trunc i32 %r333 to i1
	br i1 %r334, label %L158, label %L159

L156:
	br label %L157
L157:
	br label %L154
L158:
	store i32 1, i32* %_retval_
	br label %L41
L159:
	br label %L160
L160:
	br label %L157
L41:
	%r126 = load i32, i32* %_retval_
	ret i32 %r126
}

define i32 @main()
{

L163:
	%_retval_ = alloca i32
	%turn = alloca i32
	%space1 = alloca i32
	%space2 = alloca i32
	%winner = alloca i32
	%i = alloca i32
	%board = alloca %struct.gameBoard*
	store i32 0, i32* %i
	store i32 0, i32* %turn
	store i32 0, i32* %space1
	store i32 0, i32* %space2
	%r338 = sub i32 0, 1
	store i32 %r338, i32* %winner
	%r339 = call i8* @malloc(i32 72)
	%r340 = bitcast i8* %r339 to %struct.gameBoard*
	store %struct.gameBoard* %r340, %struct.gameBoard** %board
	%r341 = load %struct.gameBoard*, %struct.gameBoard** %board
	call void @cleanBoard(%struct.gameBoard* %r341 )
	%r359 = load i32, i32* %winner
	%r360 = icmp slt i32 %r359, 0
	%r361 = zext i1 %r360 to i32
	%r362 = load i32, i32* %i
	%r363 = icmp ne i32 %r362, 8
	%r364 = zext i1 %r363 to i32
	%r365 = and i32 %r361, %r364
	%r366 = trunc i32 %r365 to i1
	br i1 %r366, label %L165, label %L169

L166:
	%r347 = load i32, i32* %turn
	%r348 = add i32 %r347, 1
	store i32 %r348, i32* %turn
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %space1)
	%r349 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r350 = load i32, i32* %space1
	call void @placePiece(%struct.gameBoard* %r349, i32 1, i32 %r350 )
	br label %L168
L167:
	%r351 = load i32, i32* %turn
	%r352 = sub i32 %r351, 1
	store i32 %r352, i32* %turn
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %space2)
	%r353 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r354 = load i32, i32* %space2
	call void @placePiece(%struct.gameBoard* %r353, i32 2, i32 %r354 )
	br label %L168
L168:
	%r355 = load %struct.gameBoard*, %struct.gameBoard** %board
	%r356 = call i32 @checkWinner(%struct.gameBoard* %r355 )
	store i32 %r356, i32* %winner
	%r357 = load i32, i32* %i
	%r358 = add i32 %r357, 1
	store i32 %r358, i32* %i
	%r367 = load i32, i32* %winner
	%r368 = icmp slt i32 %r367, 0
	%r369 = zext i1 %r368 to i32
	%r370 = load i32, i32* %i
	%r371 = icmp ne i32 %r370, 8
	%r372 = zext i1 %r371 to i32
	%r373 = and i32 %r369, %r372
	%r374 = trunc i32 %r373 to i1
	br i1 %r374, label %L165, label %L169

L165:
	%r342 = load %struct.gameBoard*, %struct.gameBoard** %board
	call void @printBoard(%struct.gameBoard* %r342 )
	%r343 = load i32, i32* %turn
	%r344 = icmp eq i32 %r343, 0
	%r345 = zext i1 %r344 to i32
	%r346 = trunc i32 %r345 to i1
	br i1 %r346, label %L166, label %L167

L169:
	%r375 = load i32, i32* %winner
	%r376 = add i32 %r375, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r376)
	store i32 0, i32* %_retval_
	br label %L164
L164:
	%r377 = load i32, i32* %_retval_
	ret i32 %r377
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8