target triple="i686"

@global1 = common global i32 0, align 8
@global2 = common global i32 0, align 8
@global3 = common global i32 0, align 8

define i32 @constantFolding()
{

L1:
	%r0 = mul i32 8, 9
	%r1 = sdiv i32 %r0, 4
	%r2 = add i32 %r1, 2
	%r3 = mul i32 5, 8
	%r4 = sub i32 %r2, %r3
	%r5 = add i32 %r4, 9
	%r6 = sub i32 %r5, 12
	%r7 = add i32 %r6, 6
	%r8 = sub i32 %r7, 9
	%r9 = sub i32 %r8, 18
	%r10 = mul i32 23, 3
	%r11 = sdiv i32 %r10, 23
	%r12 = mul i32 %r11, 90
	%r13 = add i32 %r9, %r12
	br label %L2
L2:
	%phi0 = phi i32 [%r13, %L1]
	ret i32 %phi0
}

define i32 @constantPropagation()
{

L4:
	%r14 = add i32 4, 7
	%r15 = add i32 8, 5
	%r16 = add i32 11, 21
	%r17 = add i32 %r14, %r15
	%r18 = mul i32 %r16, %r17
	%r19 = mul i32 %r15, %r16
	%r20 = add i32 11, %r19
	%r21 = sub i32 %r20, %r18
	%r22 = mul i32 %r16, %r17
	%r23 = sub i32 %r15, %r22
	%r24 = sdiv i32 %r18, %r21
	%r25 = add i32 %r23, %r24
	%r26 = add i32 11, 21
	%r27 = add i32 %r26, %r14
	%r28 = add i32 %r27, %r15
	%r29 = add i32 %r28, %r16
	%r30 = sub i32 %r29, %r17
	%r31 = sub i32 %r30, %r25
	%r32 = add i32 %r31, %r15
	%r33 = sub i32 %r32, 4
	%r34 = sub i32 %r33, 7
	%r35 = add i32 %r18, %r21
	%r36 = sub i32 %r35, %r14
	%r37 = sub i32 %r36, %r15
	%r38 = sub i32 7, 4
	%r39 = mul i32 %r38, 5
	%r40 = sub i32 %r39, %r16
	%r41 = mul i32 %r21, 8
	%r42 = mul i32 %r41, 5
	%r43 = add i32 %r42, %r34
	%r44 = mul i32 7, 4
	%r45 = mul i32 %r44, 8
	%r46 = sdiv i32 %r45, 11
	%r47 = sub i32 %r46, %r34
	%r48 = add i32 %r16, %r18
	%r49 = add i32 %r48, 8
	%r50 = sub i32 %r49, %r37
	%r51 = add i32 %r30, %r34
	%r52 = mul i32 21, 4
	%r53 = sub i32 %r51, %r52
	%r54 = mul i32 4, 7
	%r55 = sub i32 %r54, %r18
	%r56 = sub i32 %r55, %r21
	%r57 = sub i32 %r56, %r47
	%r58 = mul i32 %r43, 5
	%r59 = sub i32 %r57, %r58
	%r60 = sub i32 %r34, %r59
	%r61 = sub i32 %r60, %r56
	%r62 = sub i32 %r61, %r30
	%r63 = mul i32 %r37, %r62
	%r64 = add i32 %r63, %r50
	%r65 = sub i32 %r64, %r59
	%r66 = sub i32 %r59, %r62
	%r67 = add i32 %r66, %r65
	%r68 = add i32 %r67, %r18
	br label %L5
L5:
	%phi1 = phi i32 [%r68, %L4]
	ret i32 %phi1
}

define i32 @deadCodeElimination()
{

L7:
	store i32 11, i32* @global1
	store i32 5, i32* @global1
	store i32 9, i32* @global1
	%r69 = add i32 8, 8
	%r70 = add i32 %r69, 9
	%r71 = add i32 %r70, 3
	%r72 = add i32 %r71, 10
	br label %L8
L8:
	%phi2 = phi i32 [%r72, %L7]
	ret i32 %phi2
}

define i32 @sum(i32 %number)
{

L10:
	%r73 = icmp sgt i32 %number, 0
	%r74 = zext i1 %r73 to i32
	%r75 = trunc i32 %r74 to i1
	br i1 %r75, label %L12, label %L13

L12:
	%phi3 = phi i32 [0, %L10], [%r76, %L12]
	%phi4 = phi i32 [%number, %L10], [%r77, %L12]
	%r76 = add i32 %phi3, %phi4
	%r77 = sub i32 %phi4, 1
	%r78 = icmp sgt i32 %r77, 0
	%r79 = zext i1 %r78 to i32
	%r80 = trunc i32 %r79 to i1
	br i1 %r80, label %L12, label %L13

L13:
	%phi5 = phi i32 [0, %L10], [%r76, %L12]
	br label %L11
L11:
	%phi6 = phi i32 [%phi5, %L13]
	ret i32 %phi6
}

define i32 @doesntModifyGlobals()
{

L15:
	%r81 = add i32 1, 2
	br label %L16
L16:
	%phi7 = phi i32 [%r81, %L15]
	ret i32 %phi7
}

define i32 @interProceduralOptimization()
{

L18:
	store i32 1, i32* @global1
	store i32 0, i32* @global2
	store i32 0, i32* @global3
	%r82 = call i32 @sum(i32 100 )
	%r83 = load i32, i32* @global1
	%r84 = icmp eq i32 %r83, 1
	%r85 = zext i1 %r84 to i32
	%r86 = trunc i32 %r85 to i1
	br i1 %r86, label %L20, label %L21

L20:
	%r87 = call i32 @sum(i32 10000 )
	br label %L22
L21:
	%r88 = load i32, i32* @global2
	%r89 = icmp eq i32 %r88, 2
	%r90 = zext i1 %r89 to i32
	%r91 = trunc i32 %r90 to i1
	br i1 %r91, label %L23, label %L24

L22:
	%phi8 = phi i32 [%r87, %L20], [%phi9, %L28]
	br label %L19
L23:
	%r92 = call i32 @sum(i32 20000 )
	br label %L25
L24:
	br label %L25
L25:
	%phi10 = phi i32 [%r92, %L23], [%r82, %L24]
	%r93 = load i32, i32* @global3
	%r94 = icmp eq i32 %r93, 3
	%r95 = zext i1 %r94 to i32
	%r96 = trunc i32 %r95 to i1
	br i1 %r96, label %L26, label %L27

L26:
	%r97 = call i32 @sum(i32 30000 )
	br label %L28
L27:
	br label %L28
L28:
	%phi9 = phi i32 [%r97, %L26], [%phi10, %L27]
	br label %L22
L19:
	%phi11 = phi i32 [%phi8, %L22]
	ret i32 %phi11
}

define i32 @commonSubexpressionElimination()
{

L30:
	%r98 = mul i32 11, 22
	%r99 = sdiv i32 33, 44
	%r100 = mul i32 55, 66
	%r101 = mul i32 11, 22
	%r102 = sdiv i32 33, 44
	%r103 = add i32 %r101, %r102
	%r104 = mul i32 55, 66
	%r105 = sub i32 %r103, %r104
	%r106 = add i32 %r105, 77
	%r107 = mul i32 11, 22
	%r108 = sdiv i32 33, 44
	%r109 = add i32 %r107, %r108
	%r110 = mul i32 55, 66
	%r111 = sub i32 %r109, %r110
	%r112 = add i32 %r111, 77
	%r113 = mul i32 11, 22
	%r114 = sdiv i32 33, 44
	%r115 = add i32 %r113, %r114
	%r116 = mul i32 55, 66
	%r117 = sub i32 %r115, %r116
	%r118 = add i32 %r117, 77
	%r119 = mul i32 11, 22
	%r120 = sdiv i32 33, 44
	%r121 = add i32 %r119, %r120
	%r122 = mul i32 55, 66
	%r123 = sub i32 %r121, %r122
	%r124 = add i32 %r123, 77
	%r125 = mul i32 11, 22
	%r126 = sdiv i32 33, 44
	%r127 = add i32 %r125, %r126
	%r128 = mul i32 55, 66
	%r129 = sub i32 %r127, %r128
	%r130 = add i32 %r129, 77
	%r131 = mul i32 11, 22
	%r132 = sdiv i32 33, 44
	%r133 = add i32 %r131, %r132
	%r134 = mul i32 55, 66
	%r135 = sub i32 %r133, %r134
	%r136 = add i32 %r135, 77
	%r137 = mul i32 11, 22
	%r138 = sdiv i32 33, 44
	%r139 = add i32 %r137, %r138
	%r140 = mul i32 55, 66
	%r141 = sub i32 %r139, %r140
	%r142 = add i32 %r141, 77
	%r143 = mul i32 11, 22
	%r144 = sdiv i32 33, 44
	%r145 = add i32 %r143, %r144
	%r146 = mul i32 55, 66
	%r147 = sub i32 %r145, %r146
	%r148 = add i32 %r147, 77
	%r149 = mul i32 11, 22
	%r150 = sdiv i32 33, 44
	%r151 = add i32 %r149, %r150
	%r152 = mul i32 55, 66
	%r153 = sub i32 %r151, %r152
	%r154 = add i32 %r153, 77
	%r155 = mul i32 11, 22
	%r156 = sdiv i32 33, 44
	%r157 = add i32 %r155, %r156
	%r158 = mul i32 55, 66
	%r159 = sub i32 %r157, %r158
	%r160 = add i32 %r159, 77
	%r161 = mul i32 11, 22
	%r162 = sdiv i32 33, 44
	%r163 = add i32 %r161, %r162
	%r164 = mul i32 55, 66
	%r165 = sub i32 %r163, %r164
	%r166 = add i32 %r165, 77
	%r167 = mul i32 22, 11
	%r168 = sdiv i32 33, 44
	%r169 = add i32 %r167, %r168
	%r170 = mul i32 55, 66
	%r171 = sub i32 %r169, %r170
	%r172 = add i32 %r171, 77
	%r173 = mul i32 11, 22
	%r174 = sdiv i32 33, 44
	%r175 = add i32 %r173, %r174
	%r176 = mul i32 66, 55
	%r177 = sub i32 %r175, %r176
	%r178 = add i32 %r177, 77
	%r179 = mul i32 11, 22
	%r180 = add i32 77, %r179
	%r181 = sdiv i32 33, 44
	%r182 = add i32 %r180, %r181
	%r183 = mul i32 55, 66
	%r184 = sub i32 %r182, %r183
	%r185 = mul i32 11, 22
	%r186 = sdiv i32 33, 44
	%r187 = add i32 %r185, %r186
	%r188 = mul i32 55, 66
	%r189 = sub i32 %r187, %r188
	%r190 = add i32 %r189, 77
	%r191 = sdiv i32 33, 44
	%r192 = mul i32 11, 22
	%r193 = add i32 %r191, %r192
	%r194 = mul i32 55, 66
	%r195 = sub i32 %r193, %r194
	%r196 = add i32 %r195, 77
	%r197 = add i32 11, 22
	%r198 = add i32 %r197, 33
	%r199 = add i32 %r198, 44
	%r200 = add i32 %r199, 55
	%r201 = add i32 %r200, 66
	%r202 = add i32 %r201, 77
	%r203 = add i32 %r202, %r98
	%r204 = add i32 %r203, %r99
	%r205 = add i32 %r204, %r100
	%r206 = add i32 %r205, %r106
	%r207 = add i32 %r206, %r112
	%r208 = add i32 %r207, %r118
	%r209 = add i32 %r208, %r124
	%r210 = add i32 %r209, %r130
	%r211 = add i32 %r210, %r136
	%r212 = add i32 %r211, %r142
	%r213 = add i32 %r212, %r148
	%r214 = add i32 %r213, %r154
	%r215 = add i32 %r214, %r160
	%r216 = add i32 %r215, %r166
	%r217 = add i32 %r216, %r172
	%r218 = add i32 %r217, %r178
	%r219 = add i32 %r218, %r184
	%r220 = add i32 %r219, %r190
	%r221 = add i32 %r220, %r196
	br label %L31
L31:
	%phi12 = phi i32 [%r221, %L30]
	ret i32 %phi12
}

define i32 @hoisting()
{

L33:
	%r222 = icmp slt i32 0, 1000000
	%r223 = zext i1 %r222 to i32
	%r224 = trunc i32 %r223 to i1
	br i1 %r224, label %L35, label %L36

L35:
	%phi13 = phi i32 [1, %L33], [%phi13, %L35]
	%phi14 = phi i32 [2, %L33], [%phi14, %L35]
	%phi15 = phi i32 [3, %L33], [%phi15, %L35]
	%phi16 = phi i32 [4, %L33], [%phi16, %L35]
	%phi17 = phi i32 [0, %L33], [%r229, %L35]
	%r225 = add i32 %phi13, %phi14
	%r226 = add i32 %r225, %phi15
	%r227 = add i32 %phi15, %phi16
	%r228 = add i32 %r227, %r226
	%r229 = add i32 %phi17, 1
	%r230 = icmp slt i32 %r229, 1000000
	%r231 = zext i1 %r230 to i32
	%r232 = trunc i32 %r231 to i1
	br i1 %r232, label %L35, label %L36

L36:
	%phi18 = phi i32 [2, %L33], [%phi14, %L35]
	br label %L34
L34:
	%phi19 = phi i32 [%phi18, %L36]
	ret i32 %phi19
}

define i32 @doubleIf()
{

L38:
	%r233 = icmp eq i32 1, 1
	%r234 = zext i1 %r233 to i32
	%r235 = trunc i32 %r234 to i1
	br i1 %r235, label %L40, label %L41

L40:
	%r236 = icmp eq i32 1, 1
	%r237 = zext i1 %r236 to i32
	%r238 = trunc i32 %r237 to i1
	br i1 %r238, label %L43, label %L44

L41:
	br label %L42
L42:
	%phi20 = phi i32 [50, %L45], [0, %L41]
	br label %L39
L43:
	br label %L45
L44:
	br label %L45
L45:
	br label %L42
L39:
	%phi21 = phi i32 [%phi20, %L42]
	ret i32 %phi21
}

define i32 @integerDivide()
{

L47:
	%r239 = sdiv i32 3000, 2
	%r240 = mul i32 %r239, 4
	%r241 = sdiv i32 %r240, 8
	%r242 = sdiv i32 %r241, 16
	%r243 = mul i32 %r242, 32
	%r244 = sdiv i32 %r243, 64
	%r245 = mul i32 %r244, 128
	%r246 = sdiv i32 %r245, 4
	br label %L48
L48:
	%phi22 = phi i32 [%r246, %L47]
	ret i32 %phi22
}

define i32 @association()
{

L50:
	%r247 = mul i32 10, 2
	%r248 = sdiv i32 %r247, 2
	%r249 = mul i32 3, %r248
	%r250 = sdiv i32 %r249, 3
	%r251 = mul i32 %r250, 4
	%r252 = sdiv i32 %r251, 4
	%r253 = add i32 %r252, 4
	%r254 = sub i32 %r253, 4
	%r255 = mul i32 %r254, 50
	%r256 = sdiv i32 %r255, 50
	br label %L51
L51:
	%phi23 = phi i32 [%r256, %L50]
	ret i32 %phi23
}

define i32 @tailRecursionHelper(i32 %value, i32 %sum)
{

L53:
	%r257 = icmp eq i32 %value, 0
	%r258 = zext i1 %r257 to i32
	%r259 = trunc i32 %r258 to i1
	br i1 %r259, label %L55, label %L56

L55:
	br label %L54
L56:
	%r260 = sub i32 %value, 1
	%r261 = add i32 %sum, %value
	%r262 = call i32 @tailRecursionHelper(i32 %r260, i32 %r261 )
	br label %L54
L54:
	%phi24 = phi i32 [%sum, %L55], [%r262, %L56]
	ret i32 %phi24
}

define i32 @tailRecursion(i32 %value)
{

L59:
	%r263 = call i32 @tailRecursionHelper(i32 %value, i32 0 )
	br label %L60
L60:
	%phi25 = phi i32 [%r263, %L59]
	ret i32 %phi25
}

define i32 @unswitching()
{

L62:
	%r264 = icmp slt i32 1, 1000000
	%r265 = zext i1 %r264 to i32
	%r266 = trunc i32 %r265 to i1
	br i1 %r266, label %L64, label %L65

L64:
	%phi26 = phi i32 [2, %L62], [%phi29, %L68]
	%phi27 = phi i32 [1, %L62], [%phi28, %L68]
	%r267 = icmp eq i32 %phi26, 2
	%r268 = zext i1 %r267 to i32
	%r269 = trunc i32 %r268 to i1
	br i1 %r269, label %L66, label %L67

L66:
	%r270 = add i32 %phi27, 1
	br label %L68
L67:
	%r271 = add i32 %phi27, 2
	br label %L68
L68:
	%phi28 = phi i32 [%r270, %L66], [%r271, %L67]
	%phi29 = phi i32 [%phi26, %L66], [%phi26, %L67]
	%r272 = icmp slt i32 %phi28, 1000000
	%r273 = zext i1 %r272 to i32
	%r274 = trunc i32 %r273 to i1
	br i1 %r274, label %L64, label %L65

L65:
	%phi30 = phi i32 [1, %L62], [%phi28, %L68]
	br label %L63
L63:
	%phi31 = phi i32 [%phi30, %L65]
	ret i32 %phi31
}

define i32 @randomCalculation(i32 %number)
{

L70:
	%r275 = icmp slt i32 0, %number
	%r276 = zext i1 %r275 to i32
	%r277 = trunc i32 %r276 to i1
	br i1 %r277, label %L72, label %L73

L72:
	%phi32 = phi i32 [0, %L70], [%r280, %L72]
	%phi33 = phi i32 [0, %L70], [%r287, %L72]
	%phi34 = phi i32 [%number, %L70], [%phi34, %L72]
	%r278 = add i32 4, 7
	%r279 = add i32 %r278, 8
	%r280 = add i32 %phi32, %r279
	%r281 = mul i32 %phi33, 2
	%r282 = sdiv i32 %r281, 2
	%r283 = mul i32 3, %r282
	%r284 = sdiv i32 %r283, 3
	%r285 = mul i32 %r284, 4
	%r286 = sdiv i32 %r285, 4
	%r287 = add i32 %r286, 1
	%r288 = icmp slt i32 %r287, %phi34
	%r289 = zext i1 %r288 to i32
	%r290 = trunc i32 %r289 to i1
	br i1 %r290, label %L72, label %L73

L73:
	%phi35 = phi i32 [0, %L70], [%r280, %L72]
	br label %L71
L71:
	%phi36 = phi i32 [%phi35, %L73]
	ret i32 %phi36
}

define i32 @iterativeFibonacci(i32 %number)
{

L75:
	%r291 = sub i32 0, 1
	%r292 = icmp slt i32 0, %number
	%r293 = zext i1 %r292 to i32
	%r294 = trunc i32 %r293 to i1
	br i1 %r294, label %L77, label %L78

L77:
	%phi37 = phi i32 [1, %L75], [%r295, %L77]
	%phi38 = phi i32 [%r291, %L75], [%phi37, %L77]
	%phi39 = phi i32 [0, %L75], [%r296, %L77]
	%phi40 = phi i32 [%number, %L75], [%phi40, %L77]
	%r295 = add i32 %phi37, %phi38
	%r296 = add i32 %phi39, 1
	%r297 = icmp slt i32 %r296, %phi40
	%r298 = zext i1 %r297 to i32
	%r299 = trunc i32 %r298 to i1
	br i1 %r299, label %L77, label %L78

L78:
	%phi41 = phi i32 [1, %L75], [%r295, %L77]
	br label %L76
L76:
	%phi42 = phi i32 [%phi41, %L78]
	ret i32 %phi42
}

define i32 @recursiveFibonacci(i32 %number)
{

L80:
	%r300 = icmp sle i32 %number, 0
	%r301 = zext i1 %r300 to i32
	%r302 = icmp eq i32 %number, 1
	%r303 = zext i1 %r302 to i32
	%r304 = or i32 %r301, %r303
	%r305 = trunc i32 %r304 to i1
	br i1 %r305, label %L82, label %L83

L82:
	br label %L81
L83:
	%r306 = sub i32 %number, 1
	%r307 = call i32 @recursiveFibonacci(i32 %r306 )
	%r308 = sub i32 %number, 2
	%r309 = call i32 @recursiveFibonacci(i32 %r308 )
	%r310 = add i32 %r307, %r309
	br label %L81
L81:
	%phi43 = phi i32 [%number, %L82], [%r310, %L83]
	ret i32 %phi43
}

define i32 @main()
{

L86:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r311 = load i32, i32* @.read_scratch
	%r312 = icmp slt i32 1, %r311
	%r313 = zext i1 %r312 to i32
	%r314 = trunc i32 %r313 to i1
	br i1 %r314, label %L88, label %L89

L88:
	%phi44 = phi i32 [%r311, %L86], [%phi44, %L88]
	%phi45 = phi i32 [1, %L86], [%r332, %L88]
	%r315 = call i32 @constantFolding()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r315)
	%r316 = call i32 @constantPropagation()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r316)
	%r317 = call i32 @deadCodeElimination()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r317)
	%r318 = call i32 @interProceduralOptimization()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r318)
	%r319 = call i32 @commonSubexpressionElimination()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r319)
	%r320 = call i32 @hoisting()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r320)
	%r321 = call i32 @doubleIf()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r321)
	%r322 = call i32 @integerDivide()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r322)
	%r323 = call i32 @association()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r323)
	%r324 = sdiv i32 %phi44, 1000
	%r325 = call i32 @tailRecursion(i32 %r324 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r325)
	%r326 = call i32 @unswitching()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r326)
	%r327 = call i32 @randomCalculation(i32 %phi44 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r327)
	%r328 = sdiv i32 %phi44, 5
	%r329 = call i32 @iterativeFibonacci(i32 %r328 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r329)
	%r330 = sdiv i32 %phi44, 1000
	%r331 = call i32 @recursiveFibonacci(i32 %r330 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r331)
	%r332 = add i32 %phi45, 1
	%r333 = icmp slt i32 %r332, %phi44
	%r334 = zext i1 %r333 to i32
	%r335 = trunc i32 %r334 to i1
	br i1 %r335, label %L88, label %L89

L89:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 9999)
	br label %L87
L87:
	%phi46 = phi i32 [0, %L89]
	ret i32 %phi46
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8