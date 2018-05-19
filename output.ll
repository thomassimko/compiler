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
	%r14 = phi i32 [%r13, %L1]
	ret i32 %r14
}

define i32 @constantPropagation()
{

L4:
	%r15 = add i32 4, 7
	%r16 = add i32 8, 5
	%r17 = add i32 11, 21
	%r18 = add i32 %r15, %r16
	%r19 = mul i32 %r17, %r18
	%r20 = mul i32 %r16, %r17
	%r21 = add i32 11, %r20
	%r22 = sub i32 %r21, %r19
	%r23 = mul i32 %r17, %r18
	%r24 = sub i32 %r16, %r23
	%r25 = sdiv i32 %r19, %r22
	%r26 = add i32 %r24, %r25
	%r27 = add i32 11, 21
	%r28 = add i32 %r27, %r15
	%r29 = add i32 %r28, %r16
	%r30 = add i32 %r29, %r17
	%r31 = sub i32 %r30, %r18
	%r32 = sub i32 %r31, %r26
	%r33 = add i32 %r32, %r16
	%r34 = sub i32 %r33, 4
	%r35 = sub i32 %r34, 7
	%r36 = add i32 %r19, %r22
	%r37 = sub i32 %r36, %r15
	%r38 = sub i32 %r37, %r16
	%r39 = sub i32 7, 4
	%r40 = mul i32 %r39, 5
	%r41 = sub i32 %r40, %r17
	%r42 = mul i32 %r22, 8
	%r43 = mul i32 %r42, 5
	%r44 = add i32 %r43, %r35
	%r45 = mul i32 7, 4
	%r46 = mul i32 %r45, 8
	%r47 = sdiv i32 %r46, 11
	%r48 = sub i32 %r47, %r35
	%r49 = add i32 %r17, %r19
	%r50 = add i32 %r49, 8
	%r51 = sub i32 %r50, %r38
	%r52 = add i32 %r31, %r35
	%r53 = mul i32 21, 4
	%r54 = sub i32 %r52, %r53
	%r55 = mul i32 4, 7
	%r56 = sub i32 %r55, %r19
	%r57 = sub i32 %r56, %r22
	%r58 = sub i32 %r57, %r48
	%r59 = mul i32 %r44, 5
	%r60 = sub i32 %r58, %r59
	%r61 = sub i32 %r35, %r60
	%r62 = sub i32 %r61, %r57
	%r63 = sub i32 %r62, %r31
	%r64 = mul i32 %r38, %r63
	%r65 = add i32 %r64, %r51
	%r66 = sub i32 %r65, %r60
	%r67 = sub i32 %r60, %r63
	%r68 = add i32 %r67, %r66
	%r69 = add i32 %r68, %r19
	br label %L5
L5:
	%r70 = phi i32 [%r69, %L4]
	ret i32 %r70
}

define i32 @deadCodeElimination()
{

L7:
	store i32 11, i32* @global1
	store i32 5, i32* @global1
	store i32 9, i32* @global1
	%r71 = add i32 8, 8
	%r72 = add i32 %r71, 9
	%r73 = add i32 %r72, 3
	%r74 = add i32 %r73, 10
	br label %L8
L8:
	%r75 = phi i32 [%r74, %L7]
	ret i32 %r75
}

define i32 @sum(i32 %number)
{

L10:
	%r76 = icmp sgt i32 %number, 0
	%r77 = zext i1 %r76 to i32
	%r78 = trunc i32 %r77 to i1
	br i1 %r78, label %L12, label %L13

L12:
	%r79 = phi i32 [0, %L10], [%r81, %L12]
	%r80 = phi i32 [%number, %L10], [%r82, %L12]
	%r81 = add i32 %r79, %r80
	%r82 = sub i32 %r80, 1
	%r83 = icmp sgt i32 %r82, 0
	%r84 = zext i1 %r83 to i32
	%r85 = trunc i32 %r84 to i1
	br i1 %r85, label %L12, label %L13

L13:
	%r86 = phi i32 [0, %L10], [%r81, %L12]
	br label %L11
L11:
	%r87 = phi i32 [%r86, %L13]
	ret i32 %r87
}

define i32 @doesntModifyGlobals()
{

L15:
	%r88 = add i32 1, 2
	br label %L16
L16:
	%r89 = phi i32 [%r88, %L15]
	ret i32 %r89
}

define i32 @interProceduralOptimization()
{

L18:
	store i32 1, i32* @global1
	store i32 0, i32* @global2
	store i32 0, i32* @global3
	%r90 = call i32 @sum(i32 100 )
	%r91 = load i32, i32* @global1
	%r92 = icmp eq i32 %r91, 1
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L20, label %L21

L20:
	%r95 = call i32 @sum(i32 10000 )
	br label %L22
L21:
	%r96 = load i32, i32* @global2
	%r97 = icmp eq i32 %r96, 2
	%r98 = zext i1 %r97 to i32
	%r99 = trunc i32 %r98 to i1
	br i1 %r99, label %L23, label %L24

L22:
	%r106 = phi i32 [%r95, %L20], [%r107, %L28]
	br label %L19
L23:
	%r100 = call i32 @sum(i32 20000 )
	br label %L25
L24:
	br label %L25
L25:
	%r108 = phi i32 [%r100, %L23], [%r90, %L24]
	%r101 = load i32, i32* @global3
	%r102 = icmp eq i32 %r101, 3
	%r103 = zext i1 %r102 to i32
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L26, label %L27

L26:
	%r105 = call i32 @sum(i32 30000 )
	br label %L28
L27:
	br label %L28
L28:
	%r107 = phi i32 [%r105, %L26], [%r108, %L27]
	br label %L22
L19:
	%r109 = phi i32 [%r106, %L22]
	ret i32 %r109
}

define i32 @commonSubexpressionElimination()
{

L30:
	%r110 = mul i32 11, 22
	%r111 = sdiv i32 33, 44
	%r112 = mul i32 55, 66
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
	%r167 = mul i32 11, 22
	%r168 = sdiv i32 33, 44
	%r169 = add i32 %r167, %r168
	%r170 = mul i32 55, 66
	%r171 = sub i32 %r169, %r170
	%r172 = add i32 %r171, 77
	%r173 = mul i32 11, 22
	%r174 = sdiv i32 33, 44
	%r175 = add i32 %r173, %r174
	%r176 = mul i32 55, 66
	%r177 = sub i32 %r175, %r176
	%r178 = add i32 %r177, 77
	%r179 = mul i32 22, 11
	%r180 = sdiv i32 33, 44
	%r181 = add i32 %r179, %r180
	%r182 = mul i32 55, 66
	%r183 = sub i32 %r181, %r182
	%r184 = add i32 %r183, 77
	%r185 = mul i32 11, 22
	%r186 = sdiv i32 33, 44
	%r187 = add i32 %r185, %r186
	%r188 = mul i32 66, 55
	%r189 = sub i32 %r187, %r188
	%r190 = add i32 %r189, 77
	%r191 = mul i32 11, 22
	%r192 = add i32 77, %r191
	%r193 = sdiv i32 33, 44
	%r194 = add i32 %r192, %r193
	%r195 = mul i32 55, 66
	%r196 = sub i32 %r194, %r195
	%r197 = mul i32 11, 22
	%r198 = sdiv i32 33, 44
	%r199 = add i32 %r197, %r198
	%r200 = mul i32 55, 66
	%r201 = sub i32 %r199, %r200
	%r202 = add i32 %r201, 77
	%r203 = sdiv i32 33, 44
	%r204 = mul i32 11, 22
	%r205 = add i32 %r203, %r204
	%r206 = mul i32 55, 66
	%r207 = sub i32 %r205, %r206
	%r208 = add i32 %r207, 77
	%r209 = add i32 11, 22
	%r210 = add i32 %r209, 33
	%r211 = add i32 %r210, 44
	%r212 = add i32 %r211, 55
	%r213 = add i32 %r212, 66
	%r214 = add i32 %r213, 77
	%r215 = add i32 %r214, %r110
	%r216 = add i32 %r215, %r111
	%r217 = add i32 %r216, %r112
	%r218 = add i32 %r217, %r118
	%r219 = add i32 %r218, %r124
	%r220 = add i32 %r219, %r130
	%r221 = add i32 %r220, %r136
	%r222 = add i32 %r221, %r142
	%r223 = add i32 %r222, %r148
	%r224 = add i32 %r223, %r154
	%r225 = add i32 %r224, %r160
	%r226 = add i32 %r225, %r166
	%r227 = add i32 %r226, %r172
	%r228 = add i32 %r227, %r178
	%r229 = add i32 %r228, %r184
	%r230 = add i32 %r229, %r190
	%r231 = add i32 %r230, %r196
	%r232 = add i32 %r231, %r202
	%r233 = add i32 %r232, %r208
	br label %L31
L31:
	%r234 = phi i32 [%r233, %L30]
	ret i32 %r234
}

define i32 @hoisting()
{

L33:
	%r235 = icmp slt i32 0, 1000000
	%r236 = zext i1 %r235 to i32
	%r237 = trunc i32 %r236 to i1
	br i1 %r237, label %L35, label %L36

L35:
	%r238 = phi i32 [1, %L33], [%r238, %L35]
	%r239 = phi i32 [2, %L33], [%r239, %L35]
	%r241 = phi i32 [3, %L33], [%r241, %L35]
	%r243 = phi i32 [4, %L33], [%r243, %L35]
	%r246 = phi i32 [0, %L33], [%r247, %L35]
	%r240 = add i32 %r238, %r239
	%r242 = add i32 %r240, %r241
	%r244 = add i32 %r241, %r243
	%r245 = add i32 %r244, %r242
	%r247 = add i32 %r246, 1
	%r248 = icmp slt i32 %r247, 1000000
	%r249 = zext i1 %r248 to i32
	%r250 = trunc i32 %r249 to i1
	br i1 %r250, label %L35, label %L36

L36:
	%r251 = phi i32 [2, %L33], [%r239, %L35]
	br label %L34
L34:
	%r252 = phi i32 [%r251, %L36]
	ret i32 %r252
}

define i32 @doubleIf()
{

L38:
	%r253 = icmp eq i32 1, 1
	%r254 = zext i1 %r253 to i32
	%r255 = trunc i32 %r254 to i1
	br i1 %r255, label %L40, label %L41

L40:
	%r256 = icmp eq i32 1, 1
	%r257 = zext i1 %r256 to i32
	%r258 = trunc i32 %r257 to i1
	br i1 %r258, label %L43, label %L44

L41:
	br label %L42
L42:
	%r259 = phi i32 [50, %L45], [0, %L41]
	br label %L39
L43:
	br label %L45
L44:
	br label %L45
L45:
	br label %L42
L39:
	%r260 = phi i32 [%r259, %L42]
	ret i32 %r260
}

define i32 @integerDivide()
{

L47:
	%r261 = sdiv i32 3000, 2
	%r262 = mul i32 %r261, 4
	%r263 = sdiv i32 %r262, 8
	%r264 = sdiv i32 %r263, 16
	%r265 = mul i32 %r264, 32
	%r266 = sdiv i32 %r265, 64
	%r267 = mul i32 %r266, 128
	%r268 = sdiv i32 %r267, 4
	br label %L48
L48:
	%r269 = phi i32 [%r268, %L47]
	ret i32 %r269
}

define i32 @association()
{

L50:
	%r270 = mul i32 10, 2
	%r271 = sdiv i32 %r270, 2
	%r272 = mul i32 3, %r271
	%r273 = sdiv i32 %r272, 3
	%r274 = mul i32 %r273, 4
	%r275 = sdiv i32 %r274, 4
	%r276 = add i32 %r275, 4
	%r277 = sub i32 %r276, 4
	%r278 = mul i32 %r277, 50
	%r279 = sdiv i32 %r278, 50
	br label %L51
L51:
	%r280 = phi i32 [%r279, %L50]
	ret i32 %r280
}

define i32 @tailRecursionHelper(i32 %value, i32 %sum)
{

L53:
	%r281 = icmp eq i32 %value, 0
	%r282 = zext i1 %r281 to i32
	%r283 = trunc i32 %r282 to i1
	br i1 %r283, label %L55, label %L56

L55:
	br label %L54
L56:
	%r284 = sub i32 %value, 1
	%r285 = add i32 %sum, %value
	%r286 = call i32 @tailRecursionHelper(i32 %r284, i32 %r285 )
	br label %L54
L54:
	%r287 = phi i32 [%sum, %L55], [%r286, %L56]
	ret i32 %r287
}

define i32 @tailRecursion(i32 %value)
{

L59:
	%r288 = call i32 @tailRecursionHelper(i32 %value, i32 0 )
	br label %L60
L60:
	%r289 = phi i32 [%r288, %L59]
	ret i32 %r289
}

define i32 @unswitching()
{

L62:
	%r290 = icmp slt i32 1, 1000000
	%r291 = zext i1 %r290 to i32
	%r292 = trunc i32 %r291 to i1
	br i1 %r292, label %L64, label %L65

L64:
	%r293 = phi i32 [2, %L62], [%r304, %L68]
	%r297 = phi i32 [1, %L62], [%r300, %L68]
	%r294 = icmp eq i32 %r293, 2
	%r295 = zext i1 %r294 to i32
	%r296 = trunc i32 %r295 to i1
	br i1 %r296, label %L66, label %L67

L66:
	%r298 = add i32 %r297, 1
	br label %L68
L67:
	%r299 = add i32 %r297, 2
	br label %L68
L68:
	%r300 = phi i32 [%r298, %L66], [%r299, %L67]
	%r304 = phi i32 [%r293, %L66], [%r293, %L67]
	%r301 = icmp slt i32 %r300, 1000000
	%r302 = zext i1 %r301 to i32
	%r303 = trunc i32 %r302 to i1
	br i1 %r303, label %L64, label %L65

L65:
	%r305 = phi i32 [1, %L62], [%r300, %L68]
	br label %L63
L63:
	%r306 = phi i32 [%r305, %L65]
	ret i32 %r306
}

define i32 @randomCalculation(i32 %number)
{

L70:
	%r307 = icmp slt i32 0, %number
	%r308 = zext i1 %r307 to i32
	%r309 = trunc i32 %r308 to i1
	br i1 %r309, label %L72, label %L73

L72:
	%r312 = phi i32 [0, %L70], [%r313, %L72]
	%r314 = phi i32 [0, %L70], [%r321, %L72]
	%r322 = phi i32 [%number, %L70], [%r322, %L72]
	%r310 = add i32 4, 7
	%r311 = add i32 %r310, 8
	%r313 = add i32 %r312, %r311
	%r315 = mul i32 %r314, 2
	%r316 = sdiv i32 %r315, 2
	%r317 = mul i32 3, %r316
	%r318 = sdiv i32 %r317, 3
	%r319 = mul i32 %r318, 4
	%r320 = sdiv i32 %r319, 4
	%r321 = add i32 %r320, 1
	%r323 = icmp slt i32 %r321, %r322
	%r324 = zext i1 %r323 to i32
	%r325 = trunc i32 %r324 to i1
	br i1 %r325, label %L72, label %L73

L73:
	%r326 = phi i32 [0, %L70], [%r313, %L72]
	br label %L71
L71:
	%r327 = phi i32 [%r326, %L73]
	ret i32 %r327
}

define i32 @iterativeFibonacci(i32 %number)
{

L75:
	%r328 = sub i32 0, 1
	%r329 = icmp slt i32 0, %number
	%r330 = zext i1 %r329 to i32
	%r331 = trunc i32 %r330 to i1
	br i1 %r331, label %L77, label %L78

L77:
	%r332 = phi i32 [1, %L75], [%r334, %L77]
	%r333 = phi i32 [%r328, %L75], [%r332, %L77]
	%r335 = phi i32 [0, %L75], [%r336, %L77]
	%r337 = phi i32 [%number, %L75], [%r337, %L77]
	%r334 = add i32 %r332, %r333
	%r336 = add i32 %r335, 1
	%r338 = icmp slt i32 %r336, %r337
	%r339 = zext i1 %r338 to i32
	%r340 = trunc i32 %r339 to i1
	br i1 %r340, label %L77, label %L78

L78:
	%r341 = phi i32 [1, %L75], [%r334, %L77]
	br label %L76
L76:
	%r342 = phi i32 [%r341, %L78]
	ret i32 %r342
}

define i32 @recursiveFibonacci(i32 %number)
{

L80:
	%r343 = icmp sle i32 %number, 0
	%r344 = zext i1 %r343 to i32
	%r345 = icmp eq i32 %number, 1
	%r346 = zext i1 %r345 to i32
	%r347 = or i32 %r344, %r346
	%r348 = trunc i32 %r347 to i1
	br i1 %r348, label %L82, label %L83

L82:
	br label %L81
L83:
	%r349 = sub i32 %number, 1
	%r350 = call i32 @recursiveFibonacci(i32 %r349 )
	%r351 = sub i32 %number, 2
	%r352 = call i32 @recursiveFibonacci(i32 %r351 )
	%r353 = add i32 %r350, %r352
	br label %L81
L81:
	%r354 = phi i32 [%number, %L82], [%r353, %L83]
	ret i32 %r354
}

define i32 @main()
{

L86:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r355 = load i32, i32* @.read_scratch
	%r356 = icmp slt i32 1, %r355
	%r357 = zext i1 %r356 to i32
	%r358 = trunc i32 %r357 to i1
	br i1 %r358, label %L88, label %L89

L88:
	%r368 = phi i32 [%r355, %L86], [%r368, %L88]
	%r377 = phi i32 [1, %L86], [%r378, %L88]
	%r359 = call i32 @constantFolding()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r359)
	%r360 = call i32 @constantPropagation()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r360)
	%r361 = call i32 @deadCodeElimination()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r361)
	%r362 = call i32 @interProceduralOptimization()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r362)
	%r363 = call i32 @commonSubexpressionElimination()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r363)
	%r364 = call i32 @hoisting()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r364)
	%r365 = call i32 @doubleIf()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r365)
	%r366 = call i32 @integerDivide()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r366)
	%r367 = call i32 @association()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r367)
	%r369 = sdiv i32 %r368, 1000
	%r370 = call i32 @tailRecursion(i32 %r369 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r370)
	%r371 = call i32 @unswitching()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r371)
	%r372 = call i32 @randomCalculation(i32 %r368 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r372)
	%r373 = sdiv i32 %r368, 5
	%r374 = call i32 @iterativeFibonacci(i32 %r373 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r374)
	%r375 = sdiv i32 %r368, 1000
	%r376 = call i32 @recursiveFibonacci(i32 %r375 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r376)
	%r378 = add i32 %r377, 1
	%r379 = icmp slt i32 %r378, %r368
	%r380 = zext i1 %r379 to i32
	%r381 = trunc i32 %r380 to i1
	br i1 %r381, label %L88, label %L89

L89:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 9999)
	br label %L87
L87:
	%r382 = phi i32 [0, %L89]
	ret i32 %r382
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8