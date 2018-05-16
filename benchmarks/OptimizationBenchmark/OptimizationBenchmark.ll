target triple="i686"

@global1 = common global i32 0, align 8
@global2 = common global i32 0, align 8
@global3 = common global i32 0, align 8

define i32 @constantFolding()
{

L1:
	%_retval_ = alloca i32
	%a = alloca i32
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
	store i32 %r13, i32* %a
	%r14 = load i32, i32* %a
	store i32 %r14, i32* %_retval_
	br label %L2
L2:
	%r15 = load i32, i32* %_retval_
	ret i32 %r15
}

define i32 @constantPropagation()
{

L4:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%l = alloca i32
	%m = alloca i32
	%n = alloca i32
	%o = alloca i32
	%p = alloca i32
	%q = alloca i32
	%r = alloca i32
	%s = alloca i32
	%t = alloca i32
	%u = alloca i32
	%v = alloca i32
	%w = alloca i32
	%x = alloca i32
	%y = alloca i32
	%z = alloca i32
	store i32 4, i32* %a
	store i32 7, i32* %b
	store i32 8, i32* %c
	store i32 5, i32* %d
	store i32 11, i32* %e
	store i32 21, i32* %f
	%r16 = load i32, i32* %a
	%r17 = load i32, i32* %b
	%r18 = add i32 %r16, %r17
	store i32 %r18, i32* %g
	%r19 = load i32, i32* %c
	%r20 = load i32, i32* %d
	%r21 = add i32 %r19, %r20
	store i32 %r21, i32* %h
	%r22 = load i32, i32* %e
	%r23 = load i32, i32* %f
	%r24 = add i32 %r22, %r23
	store i32 %r24, i32* %i
	%r25 = load i32, i32* %g
	%r26 = load i32, i32* %h
	%r27 = add i32 %r25, %r26
	store i32 %r27, i32* %j
	%r28 = load i32, i32* %i
	%r29 = load i32, i32* %j
	%r30 = mul i32 %r28, %r29
	store i32 %r30, i32* %k
	%r31 = load i32, i32* %e
	%r32 = load i32, i32* %h
	%r33 = load i32, i32* %i
	%r34 = mul i32 %r32, %r33
	%r35 = add i32 %r31, %r34
	%r36 = load i32, i32* %k
	%r37 = sub i32 %r35, %r36
	store i32 %r37, i32* %l
	%r38 = load i32, i32* %h
	%r39 = load i32, i32* %i
	%r40 = load i32, i32* %j
	%r41 = mul i32 %r39, %r40
	%r42 = sub i32 %r38, %r41
	%r43 = load i32, i32* %k
	%r44 = load i32, i32* %l
	%r45 = sdiv i32 %r43, %r44
	%r46 = add i32 %r42, %r45
	store i32 %r46, i32* %m
	%r47 = load i32, i32* %e
	%r48 = load i32, i32* %f
	%r49 = add i32 %r47, %r48
	%r50 = load i32, i32* %g
	%r51 = add i32 %r49, %r50
	%r52 = load i32, i32* %h
	%r53 = add i32 %r51, %r52
	%r54 = load i32, i32* %i
	%r55 = add i32 %r53, %r54
	%r56 = load i32, i32* %j
	%r57 = sub i32 %r55, %r56
	store i32 %r57, i32* %n
	%r58 = load i32, i32* %n
	%r59 = load i32, i32* %m
	%r60 = sub i32 %r58, %r59
	%r61 = load i32, i32* %h
	%r62 = add i32 %r60, %r61
	%r63 = load i32, i32* %a
	%r64 = sub i32 %r62, %r63
	%r65 = load i32, i32* %b
	%r66 = sub i32 %r64, %r65
	store i32 %r66, i32* %o
	%r67 = load i32, i32* %k
	%r68 = load i32, i32* %l
	%r69 = add i32 %r67, %r68
	%r70 = load i32, i32* %g
	%r71 = sub i32 %r69, %r70
	%r72 = load i32, i32* %h
	%r73 = sub i32 %r71, %r72
	store i32 %r73, i32* %p
	%r74 = load i32, i32* %b
	%r75 = load i32, i32* %a
	%r76 = sub i32 %r74, %r75
	%r77 = load i32, i32* %d
	%r78 = mul i32 %r76, %r77
	%r79 = load i32, i32* %i
	%r80 = sub i32 %r78, %r79
	store i32 %r80, i32* %q
	%r81 = load i32, i32* %l
	%r82 = load i32, i32* %c
	%r83 = mul i32 %r81, %r82
	%r84 = load i32, i32* %d
	%r85 = mul i32 %r83, %r84
	%r86 = load i32, i32* %o
	%r87 = add i32 %r85, %r86
	store i32 %r87, i32* %r
	%r88 = load i32, i32* %b
	%r89 = load i32, i32* %a
	%r90 = mul i32 %r88, %r89
	%r91 = load i32, i32* %c
	%r92 = mul i32 %r90, %r91
	%r93 = load i32, i32* %e
	%r94 = sdiv i32 %r92, %r93
	%r95 = load i32, i32* %o
	%r96 = sub i32 %r94, %r95
	store i32 %r96, i32* %s
	%r97 = load i32, i32* %i
	%r98 = load i32, i32* %k
	%r99 = add i32 %r97, %r98
	%r100 = load i32, i32* %c
	%r101 = add i32 %r99, %r100
	%r102 = load i32, i32* %p
	%r103 = sub i32 %r101, %r102
	store i32 %r103, i32* %t
	%r104 = load i32, i32* %n
	%r105 = load i32, i32* %o
	%r106 = add i32 %r104, %r105
	%r107 = load i32, i32* %f
	%r108 = load i32, i32* %a
	%r109 = mul i32 %r107, %r108
	%r110 = sub i32 %r106, %r109
	store i32 %r110, i32* %u
	%r111 = load i32, i32* %a
	%r112 = load i32, i32* %b
	%r113 = mul i32 %r111, %r112
	%r114 = load i32, i32* %k
	%r115 = sub i32 %r113, %r114
	%r116 = load i32, i32* %l
	%r117 = sub i32 %r115, %r116
	store i32 %r117, i32* %v
	%r118 = load i32, i32* %v
	%r119 = load i32, i32* %s
	%r120 = sub i32 %r118, %r119
	%r121 = load i32, i32* %r
	%r122 = load i32, i32* %d
	%r123 = mul i32 %r121, %r122
	%r124 = sub i32 %r120, %r123
	store i32 %r124, i32* %w
	%r125 = load i32, i32* %o
	%r126 = load i32, i32* %w
	%r127 = sub i32 %r125, %r126
	%r128 = load i32, i32* %v
	%r129 = sub i32 %r127, %r128
	%r130 = load i32, i32* %n
	%r131 = sub i32 %r129, %r130
	store i32 %r131, i32* %x
	%r132 = load i32, i32* %p
	%r133 = load i32, i32* %x
	%r134 = mul i32 %r132, %r133
	%r135 = load i32, i32* %t
	%r136 = add i32 %r134, %r135
	%r137 = load i32, i32* %w
	%r138 = sub i32 %r136, %r137
	store i32 %r138, i32* %y
	%r139 = load i32, i32* %w
	%r140 = load i32, i32* %x
	%r141 = sub i32 %r139, %r140
	%r142 = load i32, i32* %y
	%r143 = add i32 %r141, %r142
	%r144 = load i32, i32* %k
	%r145 = add i32 %r143, %r144
	store i32 %r145, i32* %z
	%r146 = load i32, i32* %z
	store i32 %r146, i32* %_retval_
	br label %L5
L5:
	%r147 = load i32, i32* %_retval_
	ret i32 %r147
}

define i32 @deadCodeElimination()
{

L7:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	store i32 4, i32* %a
	store i32 5, i32* %a
	store i32 7, i32* %a
	store i32 8, i32* %a
	store i32 6, i32* %b
	store i32 9, i32* %b
	store i32 12, i32* %b
	store i32 8, i32* %b
	store i32 10, i32* %c
	store i32 13, i32* %c
	store i32 9, i32* %c
	store i32 45, i32* %d
	store i32 12, i32* %d
	store i32 3, i32* %d
	store i32 23, i32* %e
	store i32 10, i32* %e
	store i32 11, i32* @global1
	store i32 5, i32* @global1
	store i32 9, i32* @global1
	%r148 = load i32, i32* %a
	%r149 = load i32, i32* %b
	%r150 = add i32 %r148, %r149
	%r151 = load i32, i32* %c
	%r152 = add i32 %r150, %r151
	%r153 = load i32, i32* %d
	%r154 = add i32 %r152, %r153
	%r155 = load i32, i32* %e
	%r156 = add i32 %r154, %r155
	store i32 %r156, i32* %_retval_
	br label %L8
L8:
	%r157 = load i32, i32* %_retval_
	ret i32 %r157
}

define i32 @sum(i32 %_P_number)
{

L10:
	%_retval_ = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	%total = alloca i32
	store i32 0, i32* %total
	%r163 = load i32, i32* %number
	%r164 = icmp sgt i32 %r163, 0
	%r165 = zext i1 %r164 to i32
	%r166 = trunc i32 %r165 to i1
	br i1 %r166, label %L12, label %L13

L12:
	%r158 = load i32, i32* %total
	%r159 = load i32, i32* %number
	%r160 = add i32 %r158, %r159
	store i32 %r160, i32* %total
	%r161 = load i32, i32* %number
	%r162 = sub i32 %r161, 1
	store i32 %r162, i32* %number
	%r167 = load i32, i32* %number
	%r168 = icmp sgt i32 %r167, 0
	%r169 = zext i1 %r168 to i32
	%r170 = trunc i32 %r169 to i1
	br i1 %r170, label %L12, label %L13

L13:
	%r171 = load i32, i32* %total
	store i32 %r171, i32* %_retval_
	br label %L11
L11:
	%r172 = load i32, i32* %_retval_
	ret i32 %r172
}

define i32 @doesntModifyGlobals()
{

L15:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	%r173 = load i32, i32* %a
	%r174 = load i32, i32* %b
	%r175 = add i32 %r173, %r174
	store i32 %r175, i32* %_retval_
	br label %L16
L16:
	%r176 = load i32, i32* %_retval_
	ret i32 %r176
}

define i32 @interProceduralOptimization()
{

L18:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 1, i32* @global1
	store i32 0, i32* @global2
	store i32 0, i32* @global3
	%r177 = call i32 @sum(i32 100 )
	store i32 %r177, i32* %a
	%r178 = load i32, i32* @global1
	%r179 = icmp eq i32 %r178, 1
	%r180 = zext i1 %r179 to i32
	%r181 = trunc i32 %r180 to i1
	br i1 %r181, label %L20, label %L21

L20:
	%r182 = call i32 @sum(i32 10000 )
	store i32 %r182, i32* %a
	br label %L22
L21:
	%r183 = load i32, i32* @global2
	%r184 = icmp eq i32 %r183, 2
	%r185 = zext i1 %r184 to i32
	%r186 = trunc i32 %r185 to i1
	br i1 %r186, label %L23, label %L24

L22:
	%r193 = load i32, i32* %a
	store i32 %r193, i32* %_retval_
	br label %L19
L23:
	%r187 = call i32 @sum(i32 20000 )
	store i32 %r187, i32* %a
	br label %L25
L24:
	br label %L25
L25:
	%r188 = load i32, i32* @global3
	%r189 = icmp eq i32 %r188, 3
	%r190 = zext i1 %r189 to i32
	%r191 = trunc i32 %r190 to i1
	br i1 %r191, label %L26, label %L27

L26:
	%r192 = call i32 @sum(i32 30000 )
	store i32 %r192, i32* %a
	br label %L28
L27:
	br label %L28
L28:
	br label %L22
L19:
	%r194 = load i32, i32* %_retval_
	ret i32 %r194
}

define i32 @commonSubexpressionElimination()
{

L30:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%l = alloca i32
	%m = alloca i32
	%n = alloca i32
	%o = alloca i32
	%p = alloca i32
	%q = alloca i32
	%r = alloca i32
	%s = alloca i32
	%t = alloca i32
	%u = alloca i32
	%v = alloca i32
	%w = alloca i32
	%x = alloca i32
	%y = alloca i32
	%z = alloca i32
	store i32 11, i32* %a
	store i32 22, i32* %b
	store i32 33, i32* %c
	store i32 44, i32* %d
	store i32 55, i32* %e
	store i32 66, i32* %f
	store i32 77, i32* %g
	%r195 = load i32, i32* %a
	%r196 = load i32, i32* %b
	%r197 = mul i32 %r195, %r196
	store i32 %r197, i32* %h
	%r198 = load i32, i32* %c
	%r199 = load i32, i32* %d
	%r200 = sdiv i32 %r198, %r199
	store i32 %r200, i32* %i
	%r201 = load i32, i32* %e
	%r202 = load i32, i32* %f
	%r203 = mul i32 %r201, %r202
	store i32 %r203, i32* %j
	%r204 = load i32, i32* %a
	%r205 = load i32, i32* %b
	%r206 = mul i32 %r204, %r205
	%r207 = load i32, i32* %c
	%r208 = load i32, i32* %d
	%r209 = sdiv i32 %r207, %r208
	%r210 = add i32 %r206, %r209
	%r211 = load i32, i32* %e
	%r212 = load i32, i32* %f
	%r213 = mul i32 %r211, %r212
	%r214 = sub i32 %r210, %r213
	%r215 = load i32, i32* %g
	%r216 = add i32 %r214, %r215
	store i32 %r216, i32* %k
	%r217 = load i32, i32* %a
	%r218 = load i32, i32* %b
	%r219 = mul i32 %r217, %r218
	%r220 = load i32, i32* %c
	%r221 = load i32, i32* %d
	%r222 = sdiv i32 %r220, %r221
	%r223 = add i32 %r219, %r222
	%r224 = load i32, i32* %e
	%r225 = load i32, i32* %f
	%r226 = mul i32 %r224, %r225
	%r227 = sub i32 %r223, %r226
	%r228 = load i32, i32* %g
	%r229 = add i32 %r227, %r228
	store i32 %r229, i32* %l
	%r230 = load i32, i32* %a
	%r231 = load i32, i32* %b
	%r232 = mul i32 %r230, %r231
	%r233 = load i32, i32* %c
	%r234 = load i32, i32* %d
	%r235 = sdiv i32 %r233, %r234
	%r236 = add i32 %r232, %r235
	%r237 = load i32, i32* %e
	%r238 = load i32, i32* %f
	%r239 = mul i32 %r237, %r238
	%r240 = sub i32 %r236, %r239
	%r241 = load i32, i32* %g
	%r242 = add i32 %r240, %r241
	store i32 %r242, i32* %m
	%r243 = load i32, i32* %a
	%r244 = load i32, i32* %b
	%r245 = mul i32 %r243, %r244
	%r246 = load i32, i32* %c
	%r247 = load i32, i32* %d
	%r248 = sdiv i32 %r246, %r247
	%r249 = add i32 %r245, %r248
	%r250 = load i32, i32* %e
	%r251 = load i32, i32* %f
	%r252 = mul i32 %r250, %r251
	%r253 = sub i32 %r249, %r252
	%r254 = load i32, i32* %g
	%r255 = add i32 %r253, %r254
	store i32 %r255, i32* %n
	%r256 = load i32, i32* %a
	%r257 = load i32, i32* %b
	%r258 = mul i32 %r256, %r257
	%r259 = load i32, i32* %c
	%r260 = load i32, i32* %d
	%r261 = sdiv i32 %r259, %r260
	%r262 = add i32 %r258, %r261
	%r263 = load i32, i32* %e
	%r264 = load i32, i32* %f
	%r265 = mul i32 %r263, %r264
	%r266 = sub i32 %r262, %r265
	%r267 = load i32, i32* %g
	%r268 = add i32 %r266, %r267
	store i32 %r268, i32* %o
	%r269 = load i32, i32* %a
	%r270 = load i32, i32* %b
	%r271 = mul i32 %r269, %r270
	%r272 = load i32, i32* %c
	%r273 = load i32, i32* %d
	%r274 = sdiv i32 %r272, %r273
	%r275 = add i32 %r271, %r274
	%r276 = load i32, i32* %e
	%r277 = load i32, i32* %f
	%r278 = mul i32 %r276, %r277
	%r279 = sub i32 %r275, %r278
	%r280 = load i32, i32* %g
	%r281 = add i32 %r279, %r280
	store i32 %r281, i32* %p
	%r282 = load i32, i32* %a
	%r283 = load i32, i32* %b
	%r284 = mul i32 %r282, %r283
	%r285 = load i32, i32* %c
	%r286 = load i32, i32* %d
	%r287 = sdiv i32 %r285, %r286
	%r288 = add i32 %r284, %r287
	%r289 = load i32, i32* %e
	%r290 = load i32, i32* %f
	%r291 = mul i32 %r289, %r290
	%r292 = sub i32 %r288, %r291
	%r293 = load i32, i32* %g
	%r294 = add i32 %r292, %r293
	store i32 %r294, i32* %q
	%r295 = load i32, i32* %a
	%r296 = load i32, i32* %b
	%r297 = mul i32 %r295, %r296
	%r298 = load i32, i32* %c
	%r299 = load i32, i32* %d
	%r300 = sdiv i32 %r298, %r299
	%r301 = add i32 %r297, %r300
	%r302 = load i32, i32* %e
	%r303 = load i32, i32* %f
	%r304 = mul i32 %r302, %r303
	%r305 = sub i32 %r301, %r304
	%r306 = load i32, i32* %g
	%r307 = add i32 %r305, %r306
	store i32 %r307, i32* %r
	%r308 = load i32, i32* %a
	%r309 = load i32, i32* %b
	%r310 = mul i32 %r308, %r309
	%r311 = load i32, i32* %c
	%r312 = load i32, i32* %d
	%r313 = sdiv i32 %r311, %r312
	%r314 = add i32 %r310, %r313
	%r315 = load i32, i32* %e
	%r316 = load i32, i32* %f
	%r317 = mul i32 %r315, %r316
	%r318 = sub i32 %r314, %r317
	%r319 = load i32, i32* %g
	%r320 = add i32 %r318, %r319
	store i32 %r320, i32* %s
	%r321 = load i32, i32* %a
	%r322 = load i32, i32* %b
	%r323 = mul i32 %r321, %r322
	%r324 = load i32, i32* %c
	%r325 = load i32, i32* %d
	%r326 = sdiv i32 %r324, %r325
	%r327 = add i32 %r323, %r326
	%r328 = load i32, i32* %e
	%r329 = load i32, i32* %f
	%r330 = mul i32 %r328, %r329
	%r331 = sub i32 %r327, %r330
	%r332 = load i32, i32* %g
	%r333 = add i32 %r331, %r332
	store i32 %r333, i32* %t
	%r334 = load i32, i32* %a
	%r335 = load i32, i32* %b
	%r336 = mul i32 %r334, %r335
	%r337 = load i32, i32* %c
	%r338 = load i32, i32* %d
	%r339 = sdiv i32 %r337, %r338
	%r340 = add i32 %r336, %r339
	%r341 = load i32, i32* %e
	%r342 = load i32, i32* %f
	%r343 = mul i32 %r341, %r342
	%r344 = sub i32 %r340, %r343
	%r345 = load i32, i32* %g
	%r346 = add i32 %r344, %r345
	store i32 %r346, i32* %u
	%r347 = load i32, i32* %b
	%r348 = load i32, i32* %a
	%r349 = mul i32 %r347, %r348
	%r350 = load i32, i32* %c
	%r351 = load i32, i32* %d
	%r352 = sdiv i32 %r350, %r351
	%r353 = add i32 %r349, %r352
	%r354 = load i32, i32* %e
	%r355 = load i32, i32* %f
	%r356 = mul i32 %r354, %r355
	%r357 = sub i32 %r353, %r356
	%r358 = load i32, i32* %g
	%r359 = add i32 %r357, %r358
	store i32 %r359, i32* %v
	%r360 = load i32, i32* %a
	%r361 = load i32, i32* %b
	%r362 = mul i32 %r360, %r361
	%r363 = load i32, i32* %c
	%r364 = load i32, i32* %d
	%r365 = sdiv i32 %r363, %r364
	%r366 = add i32 %r362, %r365
	%r367 = load i32, i32* %f
	%r368 = load i32, i32* %e
	%r369 = mul i32 %r367, %r368
	%r370 = sub i32 %r366, %r369
	%r371 = load i32, i32* %g
	%r372 = add i32 %r370, %r371
	store i32 %r372, i32* %w
	%r373 = load i32, i32* %g
	%r374 = load i32, i32* %a
	%r375 = load i32, i32* %b
	%r376 = mul i32 %r374, %r375
	%r377 = add i32 %r373, %r376
	%r378 = load i32, i32* %c
	%r379 = load i32, i32* %d
	%r380 = sdiv i32 %r378, %r379
	%r381 = add i32 %r377, %r380
	%r382 = load i32, i32* %e
	%r383 = load i32, i32* %f
	%r384 = mul i32 %r382, %r383
	%r385 = sub i32 %r381, %r384
	store i32 %r385, i32* %x
	%r386 = load i32, i32* %a
	%r387 = load i32, i32* %b
	%r388 = mul i32 %r386, %r387
	%r389 = load i32, i32* %c
	%r390 = load i32, i32* %d
	%r391 = sdiv i32 %r389, %r390
	%r392 = add i32 %r388, %r391
	%r393 = load i32, i32* %e
	%r394 = load i32, i32* %f
	%r395 = mul i32 %r393, %r394
	%r396 = sub i32 %r392, %r395
	%r397 = load i32, i32* %g
	%r398 = add i32 %r396, %r397
	store i32 %r398, i32* %y
	%r399 = load i32, i32* %c
	%r400 = load i32, i32* %d
	%r401 = sdiv i32 %r399, %r400
	%r402 = load i32, i32* %a
	%r403 = load i32, i32* %b
	%r404 = mul i32 %r402, %r403
	%r405 = add i32 %r401, %r404
	%r406 = load i32, i32* %e
	%r407 = load i32, i32* %f
	%r408 = mul i32 %r406, %r407
	%r409 = sub i32 %r405, %r408
	%r410 = load i32, i32* %g
	%r411 = add i32 %r409, %r410
	store i32 %r411, i32* %z
	%r412 = load i32, i32* %a
	%r413 = load i32, i32* %b
	%r414 = add i32 %r412, %r413
	%r415 = load i32, i32* %c
	%r416 = add i32 %r414, %r415
	%r417 = load i32, i32* %d
	%r418 = add i32 %r416, %r417
	%r419 = load i32, i32* %e
	%r420 = add i32 %r418, %r419
	%r421 = load i32, i32* %f
	%r422 = add i32 %r420, %r421
	%r423 = load i32, i32* %g
	%r424 = add i32 %r422, %r423
	%r425 = load i32, i32* %h
	%r426 = add i32 %r424, %r425
	%r427 = load i32, i32* %i
	%r428 = add i32 %r426, %r427
	%r429 = load i32, i32* %j
	%r430 = add i32 %r428, %r429
	%r431 = load i32, i32* %k
	%r432 = add i32 %r430, %r431
	%r433 = load i32, i32* %l
	%r434 = add i32 %r432, %r433
	%r435 = load i32, i32* %m
	%r436 = add i32 %r434, %r435
	%r437 = load i32, i32* %n
	%r438 = add i32 %r436, %r437
	%r439 = load i32, i32* %o
	%r440 = add i32 %r438, %r439
	%r441 = load i32, i32* %p
	%r442 = add i32 %r440, %r441
	%r443 = load i32, i32* %q
	%r444 = add i32 %r442, %r443
	%r445 = load i32, i32* %r
	%r446 = add i32 %r444, %r445
	%r447 = load i32, i32* %s
	%r448 = add i32 %r446, %r447
	%r449 = load i32, i32* %t
	%r450 = add i32 %r448, %r449
	%r451 = load i32, i32* %u
	%r452 = add i32 %r450, %r451
	%r453 = load i32, i32* %v
	%r454 = add i32 %r452, %r453
	%r455 = load i32, i32* %w
	%r456 = add i32 %r454, %r455
	%r457 = load i32, i32* %x
	%r458 = add i32 %r456, %r457
	%r459 = load i32, i32* %y
	%r460 = add i32 %r458, %r459
	%r461 = load i32, i32* %z
	%r462 = add i32 %r460, %r461
	store i32 %r462, i32* %_retval_
	br label %L31
L31:
	%r463 = load i32, i32* %_retval_
	ret i32 %r463
}

define i32 @hoisting()
{

L33:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	store i32 4, i32* %d
	store i32 0, i32* %i
	%r476 = load i32, i32* %i
	%r477 = icmp slt i32 %r476, 1000000
	%r478 = zext i1 %r477 to i32
	%r479 = trunc i32 %r478 to i1
	br i1 %r479, label %L35, label %L36

L35:
	store i32 5, i32* %e
	%r464 = load i32, i32* %a
	%r465 = load i32, i32* %b
	%r466 = add i32 %r464, %r465
	%r467 = load i32, i32* %c
	%r468 = add i32 %r466, %r467
	store i32 %r468, i32* %g
	%r469 = load i32, i32* %c
	%r470 = load i32, i32* %d
	%r471 = add i32 %r469, %r470
	%r472 = load i32, i32* %g
	%r473 = add i32 %r471, %r472
	store i32 %r473, i32* %h
	%r474 = load i32, i32* %i
	%r475 = add i32 %r474, 1
	store i32 %r475, i32* %i
	%r480 = load i32, i32* %i
	%r481 = icmp slt i32 %r480, 1000000
	%r482 = zext i1 %r481 to i32
	%r483 = trunc i32 %r482 to i1
	br i1 %r483, label %L35, label %L36

L36:
	%r484 = load i32, i32* %b
	store i32 %r484, i32* %_retval_
	br label %L34
L34:
	%r485 = load i32, i32* %_retval_
	ret i32 %r485
}

define i32 @doubleIf()
{

L38:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	store i32 0, i32* %d
	%r486 = load i32, i32* %a
	%r487 = icmp eq i32 %r486, 1
	%r488 = zext i1 %r487 to i32
	%r489 = trunc i32 %r488 to i1
	br i1 %r489, label %L40, label %L41

L40:
	store i32 20, i32* %b
	%r490 = load i32, i32* %a
	%r491 = icmp eq i32 %r490, 1
	%r492 = zext i1 %r491 to i32
	%r493 = trunc i32 %r492 to i1
	br i1 %r493, label %L43, label %L44

L41:
	br label %L42
L42:
	%r494 = load i32, i32* %d
	store i32 %r494, i32* %_retval_
	br label %L39
L43:
	store i32 200, i32* %b
	store i32 300, i32* %c
	br label %L45
L44:
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	br label %L45
L45:
	store i32 50, i32* %d
	br label %L42
L39:
	%r495 = load i32, i32* %_retval_
	ret i32 %r495
}

define i32 @integerDivide()
{

L47:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 3000, i32* %a
	%r496 = load i32, i32* %a
	%r497 = sdiv i32 %r496, 2
	store i32 %r497, i32* %a
	%r498 = load i32, i32* %a
	%r499 = mul i32 %r498, 4
	store i32 %r499, i32* %a
	%r500 = load i32, i32* %a
	%r501 = sdiv i32 %r500, 8
	store i32 %r501, i32* %a
	%r502 = load i32, i32* %a
	%r503 = sdiv i32 %r502, 16
	store i32 %r503, i32* %a
	%r504 = load i32, i32* %a
	%r505 = mul i32 %r504, 32
	store i32 %r505, i32* %a
	%r506 = load i32, i32* %a
	%r507 = sdiv i32 %r506, 64
	store i32 %r507, i32* %a
	%r508 = load i32, i32* %a
	%r509 = mul i32 %r508, 128
	store i32 %r509, i32* %a
	%r510 = load i32, i32* %a
	%r511 = sdiv i32 %r510, 4
	store i32 %r511, i32* %a
	%r512 = load i32, i32* %a
	store i32 %r512, i32* %_retval_
	br label %L48
L48:
	%r513 = load i32, i32* %_retval_
	ret i32 %r513
}

define i32 @association()
{

L50:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 10, i32* %a
	%r514 = load i32, i32* %a
	%r515 = mul i32 %r514, 2
	store i32 %r515, i32* %a
	%r516 = load i32, i32* %a
	%r517 = sdiv i32 %r516, 2
	store i32 %r517, i32* %a
	%r518 = load i32, i32* %a
	%r519 = mul i32 3, %r518
	store i32 %r519, i32* %a
	%r520 = load i32, i32* %a
	%r521 = sdiv i32 %r520, 3
	store i32 %r521, i32* %a
	%r522 = load i32, i32* %a
	%r523 = mul i32 %r522, 4
	store i32 %r523, i32* %a
	%r524 = load i32, i32* %a
	%r525 = sdiv i32 %r524, 4
	store i32 %r525, i32* %a
	%r526 = load i32, i32* %a
	%r527 = add i32 %r526, 4
	store i32 %r527, i32* %a
	%r528 = load i32, i32* %a
	%r529 = sub i32 %r528, 4
	store i32 %r529, i32* %a
	%r530 = load i32, i32* %a
	%r531 = mul i32 %r530, 50
	store i32 %r531, i32* %a
	%r532 = load i32, i32* %a
	%r533 = sdiv i32 %r532, 50
	store i32 %r533, i32* %a
	%r534 = load i32, i32* %a
	store i32 %r534, i32* %_retval_
	br label %L51
L51:
	%r535 = load i32, i32* %_retval_
	ret i32 %r535
}

define i32 @tailRecursionHelper(i32 %_P_value, i32 %_P_sum)
{

L53:
	%_retval_ = alloca i32
	%value = alloca i32
	store i32 %_P_value, i32* %value
	%sum = alloca i32
	store i32 %_P_sum, i32* %sum
	%r536 = load i32, i32* %value
	%r537 = icmp eq i32 %r536, 0
	%r538 = zext i1 %r537 to i32
	%r539 = trunc i32 %r538 to i1
	br i1 %r539, label %L55, label %L56

L55:
	%r540 = load i32, i32* %sum
	store i32 %r540, i32* %_retval_
	br label %L54
L56:
	%r542 = load i32, i32* %value
	%r543 = sub i32 %r542, 1
	%r544 = load i32, i32* %sum
	%r545 = load i32, i32* %value
	%r546 = add i32 %r544, %r545
	%r547 = call i32 @tailRecursionHelper(i32 %r543, i32 %r546 )
	store i32 %r547, i32* %_retval_
	br label %L54
L57:
	br label %L54
L54:
	%r541 = load i32, i32* %_retval_
	ret i32 %r541
}

define i32 @tailRecursion(i32 %_P_value)
{

L61:
	%_retval_ = alloca i32
	%value = alloca i32
	store i32 %_P_value, i32* %value
	%r549 = load i32, i32* %value
	%r550 = call i32 @tailRecursionHelper(i32 %r549, i32 0 )
	store i32 %r550, i32* %_retval_
	br label %L62
L62:
	%r551 = load i32, i32* %_retval_
	ret i32 %r551
}

define i32 @unswitching()
{

L64:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	%r560 = load i32, i32* %a
	%r561 = icmp slt i32 %r560, 1000000
	%r562 = zext i1 %r561 to i32
	%r563 = trunc i32 %r562 to i1
	br i1 %r563, label %L66, label %L70

L67:
	%r556 = load i32, i32* %a
	%r557 = add i32 %r556, 1
	store i32 %r557, i32* %a
	br label %L69
L68:
	%r558 = load i32, i32* %a
	%r559 = add i32 %r558, 2
	store i32 %r559, i32* %a
	br label %L69
L69:
	%r564 = load i32, i32* %a
	%r565 = icmp slt i32 %r564, 1000000
	%r566 = zext i1 %r565 to i32
	%r567 = trunc i32 %r566 to i1
	br i1 %r567, label %L66, label %L70

L66:
	%r552 = load i32, i32* %b
	%r553 = icmp eq i32 %r552, 2
	%r554 = zext i1 %r553 to i32
	%r555 = trunc i32 %r554 to i1
	br i1 %r555, label %L67, label %L68

L70:
	%r568 = load i32, i32* %a
	store i32 %r568, i32* %_retval_
	br label %L65
L65:
	%r569 = load i32, i32* %_retval_
	ret i32 %r569
}

define i32 @randomCalculation(i32 %_P_number)
{

L72:
	%_retval_ = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%i = alloca i32
	%sum = alloca i32
	store i32 0, i32* %i
	store i32 0, i32* %sum
	%r593 = load i32, i32* %i
	%r594 = load i32, i32* %number
	%r595 = icmp slt i32 %r593, %r594
	%r596 = zext i1 %r595 to i32
	%r597 = trunc i32 %r596 to i1
	br i1 %r597, label %L74, label %L75

L74:
	store i32 4, i32* %a
	store i32 7, i32* %b
	store i32 8, i32* %c
	%r570 = load i32, i32* %a
	%r571 = load i32, i32* %b
	%r572 = add i32 %r570, %r571
	store i32 %r572, i32* %d
	%r573 = load i32, i32* %d
	%r574 = load i32, i32* %c
	%r575 = add i32 %r573, %r574
	store i32 %r575, i32* %e
	%r576 = load i32, i32* %sum
	%r577 = load i32, i32* %e
	%r578 = add i32 %r576, %r577
	store i32 %r578, i32* %sum
	%r579 = load i32, i32* %i
	%r580 = mul i32 %r579, 2
	store i32 %r580, i32* %i
	%r581 = load i32, i32* %i
	%r582 = sdiv i32 %r581, 2
	store i32 %r582, i32* %i
	%r583 = load i32, i32* %i
	%r584 = mul i32 3, %r583
	store i32 %r584, i32* %i
	%r585 = load i32, i32* %i
	%r586 = sdiv i32 %r585, 3
	store i32 %r586, i32* %i
	%r587 = load i32, i32* %i
	%r588 = mul i32 %r587, 4
	store i32 %r588, i32* %i
	%r589 = load i32, i32* %i
	%r590 = sdiv i32 %r589, 4
	store i32 %r590, i32* %i
	%r591 = load i32, i32* %i
	%r592 = add i32 %r591, 1
	store i32 %r592, i32* %i
	%r598 = load i32, i32* %i
	%r599 = load i32, i32* %number
	%r600 = icmp slt i32 %r598, %r599
	%r601 = zext i1 %r600 to i32
	%r602 = trunc i32 %r601 to i1
	br i1 %r602, label %L74, label %L75

L75:
	%r603 = load i32, i32* %sum
	store i32 %r603, i32* %_retval_
	br label %L73
L73:
	%r604 = load i32, i32* %_retval_
	ret i32 %r604
}

define i32 @iterativeFibonacci(i32 %_P_number)
{

L77:
	%_retval_ = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	%previous = alloca i32
	%result = alloca i32
	%count = alloca i32
	%i = alloca i32
	%sum = alloca i32
	%r605 = sub i32 0, 1
	store i32 %r605, i32* %previous
	store i32 1, i32* %result
	store i32 0, i32* %i
	%r613 = load i32, i32* %i
	%r614 = load i32, i32* %number
	%r615 = icmp slt i32 %r613, %r614
	%r616 = zext i1 %r615 to i32
	%r617 = trunc i32 %r616 to i1
	br i1 %r617, label %L79, label %L80

L79:
	%r606 = load i32, i32* %result
	%r607 = load i32, i32* %previous
	%r608 = add i32 %r606, %r607
	store i32 %r608, i32* %sum
	%r609 = load i32, i32* %result
	store i32 %r609, i32* %previous
	%r610 = load i32, i32* %sum
	store i32 %r610, i32* %result
	%r611 = load i32, i32* %i
	%r612 = add i32 %r611, 1
	store i32 %r612, i32* %i
	%r618 = load i32, i32* %i
	%r619 = load i32, i32* %number
	%r620 = icmp slt i32 %r618, %r619
	%r621 = zext i1 %r620 to i32
	%r622 = trunc i32 %r621 to i1
	br i1 %r622, label %L79, label %L80

L80:
	%r623 = load i32, i32* %result
	store i32 %r623, i32* %_retval_
	br label %L78
L78:
	%r624 = load i32, i32* %_retval_
	ret i32 %r624
}

define i32 @recursiveFibonacci(i32 %_P_number)
{

L82:
	%_retval_ = alloca i32
	%number = alloca i32
	store i32 %_P_number, i32* %number
	%r625 = load i32, i32* %number
	%r626 = icmp sle i32 %r625, 0
	%r627 = zext i1 %r626 to i32
	%r628 = load i32, i32* %number
	%r629 = icmp eq i32 %r628, 1
	%r630 = zext i1 %r629 to i32
	%r631 = or i32 %r627, %r630
	%r632 = trunc i32 %r631 to i1
	br i1 %r632, label %L84, label %L85

L84:
	%r633 = load i32, i32* %number
	store i32 %r633, i32* %_retval_
	br label %L83
L85:
	%r635 = load i32, i32* %number
	%r636 = sub i32 %r635, 1
	%r637 = call i32 @recursiveFibonacci(i32 %r636 )
	%r638 = load i32, i32* %number
	%r639 = sub i32 %r638, 2
	%r640 = call i32 @recursiveFibonacci(i32 %r639 )
	%r641 = add i32 %r637, %r640
	store i32 %r641, i32* %_retval_
	br label %L83
L86:
	br label %L83
L83:
	%r634 = load i32, i32* %_retval_
	ret i32 %r634
}

define i32 @main()
{

L90:
	%_retval_ = alloca i32
	%input = alloca i32
	%result = alloca i32
	%i = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %input)
	store i32 1, i32* %i
	%r680 = load i32, i32* %i
	%r681 = load i32, i32* %input
	%r682 = icmp slt i32 %r680, %r681
	%r683 = zext i1 %r682 to i32
	%r684 = trunc i32 %r683 to i1
	br i1 %r684, label %L92, label %L93

L92:
	%r643 = call i32 @constantFolding()
	store i32 %r643, i32* %result
	%r644 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r644)
	%r645 = call i32 @constantPropagation()
	store i32 %r645, i32* %result
	%r646 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r646)
	%r647 = call i32 @deadCodeElimination()
	store i32 %r647, i32* %result
	%r648 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r648)
	%r649 = call i32 @interProceduralOptimization()
	store i32 %r649, i32* %result
	%r650 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r650)
	%r651 = call i32 @commonSubexpressionElimination()
	store i32 %r651, i32* %result
	%r652 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r652)
	%r653 = call i32 @hoisting()
	store i32 %r653, i32* %result
	%r654 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r654)
	%r655 = call i32 @doubleIf()
	store i32 %r655, i32* %result
	%r656 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r656)
	%r657 = call i32 @integerDivide()
	store i32 %r657, i32* %result
	%r658 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r658)
	%r659 = call i32 @association()
	store i32 %r659, i32* %result
	%r660 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r660)
	%r661 = load i32, i32* %input
	%r662 = sdiv i32 %r661, 1000
	%r663 = call i32 @tailRecursion(i32 %r662 )
	store i32 %r663, i32* %result
	%r664 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r664)
	%r665 = call i32 @unswitching()
	store i32 %r665, i32* %result
	%r666 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r666)
	%r667 = load i32, i32* %input
	%r668 = call i32 @randomCalculation(i32 %r667 )
	store i32 %r668, i32* %result
	%r669 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r669)
	%r670 = load i32, i32* %input
	%r671 = sdiv i32 %r670, 5
	%r672 = call i32 @iterativeFibonacci(i32 %r671 )
	store i32 %r672, i32* %result
	%r673 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r673)
	%r674 = load i32, i32* %input
	%r675 = sdiv i32 %r674, 1000
	%r676 = call i32 @recursiveFibonacci(i32 %r675 )
	store i32 %r676, i32* %result
	%r677 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r677)
	%r678 = load i32, i32* %i
	%r679 = add i32 %r678, 1
	store i32 %r679, i32* %i
	%r685 = load i32, i32* %i
	%r686 = load i32, i32* %input
	%r687 = icmp slt i32 %r685, %r686
	%r688 = zext i1 %r687 to i32
	%r689 = trunc i32 %r688 to i1
	br i1 %r689, label %L92, label %L93

L93:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 9999)
	store i32 0, i32* %_retval_
	br label %L91
L91:
	%r690 = load i32, i32* %_retval_
	ret i32 %r690
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8